report 50105 "Cost Bifurcation Report"
{
    ApplicationArea = All;
    Caption = 'Cost Bifurcation Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'SRC/Report/CostBifurcationReport.rdl';
    DefaultLayout = RDLC;


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(Posting_Date; "Posting Date")
            { }
            column(Entry_Type; "Entry Type")
            { }
            column(Document_No_; "Document No.")
            { }
            column(Lot_No_; "Lot No.")
            { }
            column(Item_No_; "Item No.")
            { }
            column(Description; Description)
            { }
            column(Invoiced_Quantity; "Invoiced Quantity")
            { }
            column(Sales_Amount__Actual_; "Sales Amount (Actual)")
            { }
            column(Item_No_1; "Item No.")
            { }
            column(Quantity_1; Quantity)
            { }
            column(Cost_Amount__Actual_1; "Cost Amount (Actual)")
            { }
            column(Item_No_2; "Item No.")
            { }
            column(Quantity_2; Quantity)
            { }
            column(Cost_Amount__Actual_2; "Cost Amount (Actual)")
            { }
            column(Item_No_3; "Item No.")
            { }
            column(Quantity_3; Quantity)
            { }
            column(Cost_Amount__Actual_3; "Cost Amount (Actual)")
            { }
            // column(PM_Cost_Actual; "PM Cost (Actual)")
            // { }
            // column(Total; Total)
            // { }

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
                        Caption = 'Document Filter No.';
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
        ItemLE_Rec: Record "Item Ledger Entry";
        FilterDocumentNo: Code[50];

}
