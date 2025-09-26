report 50101 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SRC/Report/Test ReportSale line.rdl';
    Caption = 'Test Report';



    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {

            column(No_; "No.")
            {

            }
            column(Description_SalesInvoiceLine; Description)
            {
            }
            column(Quantity_SalesInvoiceLine; Quantity)
            {
            }

            trigger OnPreDataItem()
            begin
                if "Posting Date" <> 0D then
                    SetRange("Posting Date", StartDate, EndDate);
            end;
        }

    }
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(DateFilterGroup)
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }

                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }



    var
        myInt: Integer;
        StartDate: Date;
        EndDate: Date;
}