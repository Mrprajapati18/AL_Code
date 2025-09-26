
report 50277 GSTRegistation
{
    ApplicationArea = All;
    Caption = 'GSTRegistationDk';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/GSTRegistrationReport.rdl';
    DefaultLayout = RDLC;
    dataset
    {

        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Posting Date") where("Entry Type" = const(Purchase));
            RequestFilterFields = "Source No.";
            //column(PSI_Temp; "PSI Temp") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_No_; "Document No.") { }
            column(Source_No_; "Source No.") { }
            column(VendorName; VendorName) { }
            column(PANNo; PANNo) { }
            column(CITY; CITY) { }
            column(VedAddress; VedAddress) { }
            column(VenGST; VenGST) { }
            column(Item_No_; "Item No.") { }
            column(Item_Name; Item_Name) { }
            column(Quantity; Quantity) { }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)") { }
            column(purchaseDate; purchaseDate) { }
            column(vehicleNo; vehicleNo) { }
            column(AmountPaid; AmountPaid) { }
            column(InvoiceDate; InvoiceDate) { }
            column(InvoiceNo; InvoiceNo) { }
            column(Weight; Weight) { }
            column(payment_Amount; payment_Amount) { }
            column(payment_Doc_No; payment_Doc_No) { }
            column(payment_Date; payment_Date) { }

            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                //DataItemLink = "Document No." = field("PSI Temp");
                dataitem("Vendor Ledger Entry 2"; "Vendor Ledger Entry")
                {
                    DataItemLinkReference = "Vendor Ledger Entry";

                    DataItemLink = "Closed by Entry No." = field("Entry No.");

                    column(Posting_Date_2; "Posting Date")
                    {
                    }
                    column(Document_No_2; "Document No.")
                    {
                    }
                    column(Closed_by_Amount_2; "Closed by Amount")
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        Message('yes');

                    end;
                }

                dataitem("Vendor Ledger Entry 3"; "Vendor Ledger Entry")
                {
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemLink = "Entry No." = field("Closed by Entry No.");
                    column(Posting_Date_3; "Posting Date")
                    {
                    }
                    column(Document_No_3; "Document No.")
                    {
                    }
                    column(Closed_by_Amount_3; "Closed by Amount")
                    {
                    }
                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        Message('NO');

                    end;
                }

            }


            trigger OnPreDataItem()
            var

                myInt: Integer;
            begin
                SetRange("Posting Date", 20250101D, 20250131D);

                // SetRange("Posting Date", startD, EndDate);
                // SetRange("Entry Type", "Entry Type"::Purchase);

                //SetRange("PSI Temp", 'AR/PPI/24/06162');
            end;

            trigger OnAfterGetRecord()
            var
                VLE: Record "Vendor Ledger Entry";
                VLE2: Record "Vendor Ledger Entry";
                VEN: Record VEndor;
                Stockitem: Record Item;
                EntNo1: Integer;
                CEntNo1: Integer;
            begin
                Clear(VendorName);
                Clear(VenGST);
                Clear(VedAddress);
                Clear(PANNo);
                Clear(purchaseDate);
                Clear(AmountPaid);
                Clear(TDSDEbitated);
                Clear(vehicleNo);
                Clear(PostingDate);
                Clear(AmountPaid);
                Clear(Weight);

                VEN.Reset();
                VEN.setrange("No.", "Item Ledger Entry"."Source No.");
                if ven.FindFirst() then begin
                    VendorName := VEN.Name;
                    VedAddress := VEN.Address;
                    VenGST := VEN."GST Registration No.";
                    CITY := VEN.City;
                    PANNo := VEN."P.A.N. No.";
                end;

                Stockitem.Reset();
                Stockitem.SetRange("No.", "Item Ledger Entry"."Item No.");
                if Stockitem.FindFirst() then begin
                    Item_Name := Stockitem.Description;
                End;

                VLE.Reset();
               // VLE.SetRange("Document No.", "Item Ledger Entry"."PSI Temp");
                if VLE.FindFirst() Then begin
                    EntNo1 := VLE."Entry No.";
                end;

            end;
        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(startD; startD)
                    {
                        Caption = 'Start Data';
                        ApplicationArea = All;
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = All;
                    }
                }

            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        payment_Date: Date;
        payment_Amount: Integer;
        payment_Doc_No: text[20];

        CITY: Text[50];
        PSI: Record "Purch. Inv. Header";
        PSIRecLine: Record "Purch. Inv. Line";
        Item_Name: Text[100];
        // For vendor
        // PSI1: Record "Vendor";
        PSI1: Record "Purch. Rcpt. Header";
        PSIRecLine1: Record "Purch. Rcpt. Line";
        VendorDetails: Record Vendor;
        startD: Date;
        EndDate: Date;
        // PSI: Record "Purch. Inv. Header";
        VendorName: Text[100];
        VedAddress: Text[100];
        VenGST: Code[20];
        PANNo: Code[20];
        vehicleNo: Code[20];
        PostingDate: Date;
        AmountPaid: Decimal;
        TDSDEbitated: Decimal;
        VendLedger: Record "Vendor Ledger Entry";
        Vendor: Text;
        purchaseDate: Date;
        Weight: Decimal;
        InvoiceNo: Text;
        InvoiceDate: Date;
}
