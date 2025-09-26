report 50108 "Posted Sale Invoice"
{
    ApplicationArea = All;
    Caption = 'Posted Sale Invoice Excel Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                // DataItemLink = "Document No." = field("No.");
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Filter Options")
                {
                    // Add filters if needed
                }
            }
        }
    }

    var
        TaxableValue: Decimal;
        IGST: Decimal;
        CGST: Decimal;
        SGST: Decimal;
        CGSTper: Decimal;
        SGSTper: Decimal;
        IGSTper: Decimal;
        totalgst: Decimal;
        total2: Decimal;
        GstAmount: Decimal;
        ItemGSTRate: Decimal;
        InvoiceValue: Decimal;
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        GSTEntry: Record "Detailed GST Ledger Entry";
        ExcelBuffer: Record "Excel Buffer";

    trigger OnPostReport()
    begin
        ExcelBuffer.DeleteAll();

        // Add headers
        ExcelBuffer.AddColumn('Posting Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn('System Document No', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('SO NO', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Invoice Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn('Invoice No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text); // Will now show External Document No.
        ExcelBuffer.AddColumn('GSTIN', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Party Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('HSN Code', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Branch', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Product Code', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Qty', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('UQC', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Rate', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Amount', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Taxable Value', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('IGST', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('CGST', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('SGST', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Invoice Value', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.NewRow();

        if SalesInvHeader.FindSet() then
            repeat
                SalesInvLine.Reset();
                SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
                if SalesInvLine.FindSet() then
                    repeat
                        Clear(IGST);
                        Clear(CGST);
                        Clear(SGST);
                        Clear(IGSTper);
                        Clear(CGSTper);
                        Clear(SGSTper);

                        // Get GST Entries
                        GSTEntry.Reset();
                        GSTEntry.SetRange("Document No.", SalesInvLine."Document No.");
                        GSTEntry.SetRange("Document Line No.", SalesInvLine."Line No.");
                        GSTEntry.SetRange("Transaction Type", GSTEntry."Transaction Type"::Sales);

                        if GSTEntry.FindSet() then
                            repeat
                                case GSTEntry."GST Component Code" of
                                    'IGST':
                                        begin
                                            IGST := Abs(GSTEntry."GST Amount");
                                            IGSTper := GSTEntry."GST %";
                                        end;
                                    'CGST':
                                        begin
                                            CGST := Abs(GSTEntry."GST Amount");
                                            CGSTper := GSTEntry."GST %";
                                        end;
                                    'SGST':
                                        begin
                                            SGST := Abs(GSTEntry."GST Amount");
                                            SGSTper := GSTEntry."GST %";
                                        end;
                                end;
                            until GSTEntry.Next() = 0;

                        TaxableValue := SalesInvLine."Line Amount";
                        InvoiceValue := TaxableValue + CGST + SGST + IGST;

                        // Write data to Excel
                        ExcelBuffer.AddColumn(SalesInvHeader."Posting Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                        ExcelBuffer.AddColumn(SalesInvHeader."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // System Doc No
                        ExcelBuffer.AddColumn(SalesInvHeader."Order No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // PO No
                        ExcelBuffer.AddColumn(SalesInvHeader."Posting Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date); // Invoice Date
                        ExcelBuffer.AddColumn(SalesInvHeader."External Document No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // Invoice No.
                        ExcelBuffer.AddColumn(SalesInvHeader."Customer GST Reg. No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn(SalesInvHeader."Sell-to Customer Name", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn(SalesInvLine."HSN/SAC Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn(SalesInvLine."Shortcut Dimension 2 Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // Branch
                        ExcelBuffer.AddColumn(SalesInvLine."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // Product Code
                        ExcelBuffer.AddColumn(SalesInvLine."Quantity (Base)", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn(SalesInvLine."Unit of Measure", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // UQC
                        ExcelBuffer.AddColumn(SalesInvLine."Unit Cost", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text); // Rate
                        ExcelBuffer.AddColumn(SalesInvLine."Line Amount", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                        ExcelBuffer.AddColumn(TaxableValue, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                        ExcelBuffer.AddColumn(IGST, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                        ExcelBuffer.AddColumn(CGST, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                        ExcelBuffer.AddColumn(SGST, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                        ExcelBuffer.AddColumn(InvoiceValue, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);

                        ExcelBuffer.NewRow();
                    until SalesInvLine.Next() = 0;
            until SalesInvHeader.Next() = 0;

        ExcelBuffer.CreateNewBook('Posted Sales Invoice Report');
        ExcelBuffer.WriteSheet('SalesInvoices', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();
    end;
}