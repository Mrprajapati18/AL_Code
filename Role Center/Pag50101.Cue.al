page 50101 Cue
{
    ApplicationArea = All;
    Caption = 'Cue';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {

        area(content)
        {
            cuegroup("For Release")
            {
                Caption = 'Cue Data Information Of Particular Company';

                field("CustomerNo."; Rec."No.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                    Caption = 'Customer No';
                }
                field("SalesOrder"; Rec."Sell-to No. Of Archived Doc.")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                    Caption = 'Sales Order';
                }
                field("CustomerType"; Rec."GST Customer Type")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                    Caption = 'Customer Type';
                }


                field("SalesAmount"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
                    Caption = 'Sales Amount';
                }

                field("PurchaseOrder"; Rec."Price Calculation Method")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Invoice";
                    Caption = 'Purchase Order';
                }

            }
        }
    }
    var
        // NEWCustomer: Text[50];
        a: page 9060;
        CustomerNo: Text[100];
        CustomerType: Text[50];
        SalesAmount: Integer;
        PurchaseOrder: Integer;
        SalesOrder: Integer;
}
