report 50408 "COST BIFURCATION EXCEL REPORT "
{
    ApplicationArea = All;
    Caption = 'Cost Bifurcation Report_1';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            //RequestFilterFields = "Document No.";
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filter)
                {
                    field(FilterDocumentNo; FilterDocumentNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Document No. Filter';
                    }
                }
            }
        }
    }

    var
        ExcelBuffer: Record "Excel Buffer";
        ItemLedgerEntry: Record "Item Ledger Entry";
        FilterDocumentNo: Code[20];

    trigger OnPostReport()
    var
        RowNo: Integer;
    begin
        ExcelBuffer.DeleteAll();

        // Create new Excel Book
        ExcelBuffer.CreateNewBook('Cost Bifurcation Report');

        // Add Column Headers
        ExcelBuffer.AddColumn('Posting Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn('Entry Type', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Document No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Lot No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Item No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Item Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Invoiced Quantity', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Sales Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Item No. 1', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Quantity', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Cost Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Item No. 2', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Quantity', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Cost Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Item No. 3', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Quantity', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Cost Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('PM Cost Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Total Cost', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);


        ExcelBuffer.NewRow();


        if ItemLedgerEntry.FindSet() then begin
            repeat
                ExcelBuffer.AddColumn(ItemLedgerEntry."Posting Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                ExcelBuffer.AddColumn(Format(ItemLedgerEntry."Entry Type"), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Document No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Lot No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Item No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ItemLedgerEntry.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Invoiced Quantity", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Sales Amount (Actual)", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Item No.", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Quantity", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Cost Amount (Actual)", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Item No.", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Quantity", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Cost Amount (Actual)", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Item No.", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Quantity", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ItemLedgerEntry."Cost Amount (Actual)", false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('PM Cost Amount (Actual)', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('Total Cost', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Number);

                ExcelBuffer.NewRow();
            until ItemLedgerEntry.Next() = 0;
        end;

        // Write data to Excel sheet and show
        ExcelBuffer.WriteSheet('Cost Bifurcation', CompanyName, UserId);
        ExcelBuffer.CloseBook();
        ExcelBuffer.OpenExcel();
    end;
}
