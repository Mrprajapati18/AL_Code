page 50077 "Inventory Analysis By Seg SNS"
{
    Caption = 'Inventory Analysis By Segment';
    PageType = CardPart;


    layout
    {
        area(content)
        {
            cuegroup(control1)
            {
                Caption = 'Inventory Aging Details CSG';
                Visible = IsVisible = true;

                field(InvBlow45;
                InvBlow45CSG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv Blow 45 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 45 Days CSG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(1);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv45to90; Inv45to90CSG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 45 to 90 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv 45-90 Days CSG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(2);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv91to180; Inv91to180CSG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 91 to 180 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 91-180 Days CSG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(3);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv181to360; Inv181to360CSG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 181 to 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 181-360 Days CSG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(4);
                        ITEMDetails.Run();
                    end;
                }
                field(InvAbove360; InvAbove360CSG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv above 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Above 360 Days CSG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(5);
                        ITEMDetails.Run();
                    end;
                }
            }
            cuegroup(control2)
            {
                Caption = 'Inventory Aging Details ISG';

                field(InvBlow45ISG; InvBlow45ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv Blow 45 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 45 Days ISG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(6);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv45to90ISG; Inv45to90ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 45 to 90 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv 45-90 Days ISG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(7);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv91to180ISG; Inv91to180ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 91 to 180 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 91-180 Days ISG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(8);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv181to360ISG; Inv181to360ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 181 to 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 181-360 Days ISG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(9);
                        ITEMDetails.Run();
                    end;
                }
                field(InvAbove360ISG; InvAbove360ISG)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv above 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Above 360 Days ISG SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(10);
                        ITEMDetails.Run();
                    end;
                }
            }
            cuegroup(control3)
            {
                Caption = 'Inventory Aging Details Blank';
                Visible = false;

                field(InvBlow45Blank; InvBlow45Blank)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv Blow 45 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 45 Days Blank SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(11);
                        ITEMDetails.Run();
                    end;

                }
                field(Inv45to90Blank; Inv45to90Blank)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 45 to 90 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv 45-90 Days Blank SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(12);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv91to180Blank; Inv91to180Blank)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 91 to 180 Days';
                    Style = Favorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 91-180 Days Blk SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(13);
                        ITEMDetails.Run();
                    end;
                }
                field(Inv181to360Blank; Inv181to360Blank)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv 181 to 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Below 181-360 Days Blk SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(14);
                        ITEMDetails.Run();
                    end;
                }
                field(InvAbove360Blank; InvAbove360Blank)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Inv above 360 Days';
                    Style = Unfavorable;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Clear(ITEMDetails);
                        ItemCatRec.Reset();
                        ItemCatRec.SetFilter("Inv Above 360 Days Blank SNS", '<>%1', 0);
                        ITEMDetails.SetTableView(ItemCatRec);
                        ITEMDetails.SetPageFilter(15);
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
        Clear(IsVisible);
        if UserId = 'ITEKLOGICS\GULSHAN' then
            IsVisible := false
        else
            IsVisible := true;

        //For CSG
        Clear(InvBlow45CSG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '<%1', 45);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::CSG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvBlow45CSG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv45to90CSG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 45, 90);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::CSG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv45to90CSG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv91to180CSG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 91, 180);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::CSG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv91to180CSG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv181to360CSG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 181, 360);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::CSG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv181to360CSG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(InvAbove360CSG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '>%1', 360);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::CSG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvAbove360CSG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        //For ISG
        Clear(InvBlow45ISG);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '<%1', 45);
        ILE.SetRange("Prod Segment", ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
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
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
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
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
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
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
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
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvAbove360ISG += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        //For Blank
        Clear(InvBlow45Blank);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '<%1', 45);
        ILE.SetFilter("Prod Segment", '<>%1 & <>%2', ILE."Prod Segment"::CSG, ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvBlow45Blank += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv45to90Blank);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 45, 90);
        ILE.SetFilter("Prod Segment", '<>%1 & <>%2', ILE."Prod Segment"::CSG, ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv45to90Blank += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv91to180Blank);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 91, 180);
        ILE.SetFilter("Prod Segment", '<>%1 & <>%2', ILE."Prod Segment"::CSG, ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv91to180Blank += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(Inv181to360Blank);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '%1..%2', 181, 360);
        ILE.SetFilter("Prod Segment", '<>%1 & <>%2', ILE."Prod Segment"::CSG, ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                Inv181to360Blank += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

        Clear(InvAbove360Blank);
        ILE.Reset();
        ILE.SetRange(Open, true);
        ILE.SetFilter("Inventory Days", '>%1', 360);
        ILE.SetFilter("Prod Segment", '<>%1 & <>%2', ILE."Prod Segment"::CSG, ILE."Prod Segment"::ISG);
        ILE.SetFilter("Purchase Type", '<>%1', ILE."Purchase Type"::B2B);
        if ILE.FindFirst() then
            repeat
                ILE.CalcFields("Cost Amount (Actual)");
                InvAbove360Blank += (ILE."Cost Amount (Actual)" / ILE.Quantity) * ILE."Remaining Quantity";
            until ILE.Next() = 0;

    end;

    var
        ILE: Record "Item Ledger Entry";
        InvBlow45CSG: Decimal;
        Inv45to90CSG: Decimal;
        Inv91to180CSG: Decimal;
        Inv181to360CSG: Decimal;
        InvAbove360CSG: Decimal;
        InvBlow45ISG: Decimal;
        Inv45to90ISG: Decimal;
        Inv91to180ISG: Decimal;
        Inv181to360ISG: Decimal;
        InvAbove360ISG: Decimal;
        InvBlow45Blank: Decimal;
        Inv45to90Blank: Decimal;
        Inv91to180Blank: Decimal;
        Inv181to360Blank: Decimal;
        InvAbove360Blank: Decimal;
        ITEMDetails: Page "Brand Inv Details SNS";
        ItemCatRec: Record "Item Category";
        IsVisible: Boolean;
}