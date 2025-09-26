report 50112 DocumentNoFilter
{
    ApplicationArea = All;
    Caption = 'DocumentNoFilter';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'SRC/Report/DocumentFilter.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            // RequestFilterFields = "Document No.";

            column(No_; "No.")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Description; Description)
            {

            }
            column(Amount; Amount)
            {

            }
            column(Inv__Discount_Amount; "Inv. Discount Amount")
            {

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                if "Posting Date" <> 0D then
                    SetRange("Posting Date", StartDate, Enddate);
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(Enddate; Enddate)
                    {
                        ApplicationArea = All;
                        Caption = 'End date';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        StartDate: Date;
        Enddate: Date;
}
