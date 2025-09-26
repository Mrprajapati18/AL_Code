page 50087 "Inventory Analysis ISG 2"
{
    Caption = 'Inventory Analysis ISG';
    PageType = CardPart;


    layout
    {
        area(content)
        {
            cuegroup(control2)
            {
                Caption = 'Inventory Aging Details ISG';

                field(InvBlow45ISG; InvBlow45ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv Blow 45 Days';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 45 Days ISG", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(6);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv45to90ISG; Inv45to90ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 45 to 90 Days';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv 45-90 Days ISG", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(7);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv91to180ISG; Inv91to180ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 91 to 180 Days';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 91-180 Days ISG", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(8);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv181to360ISG; Inv181to360ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 181 to 360 Days';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 181-360 Days ISG", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(9);
                        ITEMDetails.Run();
                    end;
                }
                field(InvAbove360ISG; InvAbove360ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv above 360 Days';

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Above 360 Days ISG", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(10);
                        ITEMDetails.Run();
                    end;
                }
            }

        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        //For ISG
        Clear(InvBlow45ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '<%1', 45);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvBlow45ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv45to90ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 45, 90);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv45to90ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv91to180ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 91, 180);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv91to180ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv181to360ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 181, 360);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv181to360ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(InvAbove360ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '>%1', 360);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvAbove360ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

    end;

    var
        ILE: Record "Item Ledger Entry";
        InvBlow45ISG: Decimal;
        Inv45to90ISG: Decimal;
        Inv91to180ISG: Decimal;
        Inv181to360ISG: Decimal;
        InvAbove360ISG: Decimal;
        ITEMDetails: Page "Brand Inv Details";
        ItemCatRec: Record "Item Category";
}