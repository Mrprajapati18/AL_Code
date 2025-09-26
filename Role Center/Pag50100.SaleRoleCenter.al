page 50112 "Sales Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Sales Role Center';

    layout
    {
        area(RoleCenter)
        {

            part(cue; Cue)
            {
                ApplicationArea = All;

            }


        }
    }

    actions
    {
        area(Sections)
        {
            group("Sales")
            {
                action("Sales Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Orders';
                    RunObject = page "Order Planning";

                }
            }
            group("Customer")
            {
                action("Customer Groups")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Discount Groups';
                    RunObject = page "Customer Disc. Groups";

                }
            }
            group("Vendor")
            {
                action("Vendor Statistics")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Statistics';
                    RunObject = page "Vendor Entry Statistics";

                }
            }
            group("Item")
            {
                action("Item Application")
                {
                    ApplicationArea = All;
                    Caption = 'Item Application Entries';
                    RunObject = page "Item Application Entries";

                }
            }
            group("Purchase")
            {
                action("Purchase Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Orders';
                    RunObject = page "Purchase Order";

                }
            }
        }
    }
    var
        page: page 9080;
}

