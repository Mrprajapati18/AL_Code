page 50082 "Item Inv Details"
{
    Caption = 'Item Inv Details';
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    ApplicationArea = Basic, Suite, Assembly, Service;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what you are selling.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category that the item belongs to. Item categories also contain any assigned item attributes.';
                }
                field("Prod Segment"; Rec."Prod Segment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prod Segment field.';
                }
                field("Inv Below 45 Days"; Rec."Inv Below 45 Days")
                {
                    Visible = InvenVisibilty1;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Below 45 Days field.';
                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                        ILE: Record "Item Ledger Entry";
                        InvBelow45days: Page "Selling Price Information <45";
                    begin
                        Clear(InvBelow45days);
                        ILE.Reset();
                        ILE.SetRange("Item No.", Rec."No.");
                        ILE.SetRange(Open, true);
                        ILE.SetFilter("Inventory Days", '<%1', 45);
                        InvBelow45days.SetTableView(ILE);
                        InvBelow45days.Run();
                    end;
                }
                field("Inv 45-90 Days"; Rec."Inv 45-90 Days")
                {
                    Visible = InvenVisibilty2;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv 45-90 Days field.';

                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                        ILE: Record "Item Ledger Entry";
                        InvBelow45days: Page "Selling Price Info 45-90";
                    begin
                        Clear(InvBelow45days);
                        ILE.Reset();
                        ILE.SetRange("Item No.", Rec."No.");
                        ILE.SetRange(Open, true);
                        ILE.SetFilter("Inventory Days", '%1..%2', 45, 90);
                        InvBelow45days.SetTableView(ILE);
                        InvBelow45days.Run();
                    end;
                }
                field("Inv Below 91-180 Days"; Rec."Inv Below 91-180 Days")
                {
                    Visible = InvenVisibilty3;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Below 91-180 Days field.';

                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                        ILE: Record "Item Ledger Entry";
                        InvBelow45days: Page "Selling Price Info 91-180";
                    begin
                        Clear(InvBelow45days);
                        ILE.Reset();
                        ILE.SetRange("Item No.", Rec."No.");
                        ILE.SetRange(Open, true);
                        ILE.SetFilter("Inventory Days", '%1..%2', 91, 180);
                        InvBelow45days.SetTableView(ILE);
                        InvBelow45days.Run();
                    end;
                }
                field("Inv Below 181-360 Days"; Rec."Inv Below 181-360 Days")
                {
                    Visible = InvenVisibilty4;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Below 181-360 Days field.';

                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                        ILE: Record "Item Ledger Entry";
                        InvBelow45days: Page "Selling Price Info 181-360";
                    begin
                        Clear(InvBelow45days);
                        ILE.Reset();
                        ILE.SetRange("Item No.", Rec."No.");
                        ILE.SetRange(Open, true);
                        ILE.SetFilter("Inventory Days", '%1..%2', 181, 360);
                        InvBelow45days.SetTableView(ILE);
                        InvBelow45days.Run();
                    end;
                }
                field("Inv Above 360 Days"; Rec."Inv Above 360 Days")
                {
                    Visible = InvenVisibilty5;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Above 360 Days field.';

                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                        ILE: Record "Item Ledger Entry";
                        InvBelow45days: Page "Selling Price Information >360";
                    begin
                        Clear(InvBelow45days);
                        ILE.Reset();
                        ILE.SetRange("Item No.", Rec."No.");
                        ILE.SetRange(Open, true);
                        ILE.SetFilter("Inventory Days", '>%1', 360);
                        InvBelow45days.SetTableView(ILE);
                        InvBelow45days.Run();
                    end;
                }
                field("Reorder Point"; Rec."Reorder Point")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1900383208; "Sale Quantity")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                              "Location Filter" = FIELD("Location Filter"),
                              "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                              "Bin Filter" = FIELD("Bin Filter"),
                              "Variant Filter" = FIELD("Variant Filter"),
                              "Lot No. Filter" = FIELD("Lot No. Filter"),
                              "Serial No. Filter" = FIELD("Serial No. Filter");
            }

        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if InventAgeDaysvar = 1 then
            InvenVisibilty1 := true
        else
            if InventAgeDaysvar = 2 then
                InvenVisibilty2 := true
            else
                if InventAgeDaysvar = 3 then
                    InvenVisibilty3 := true
                else
                    if InventAgeDaysvar = 4 then
                        InvenVisibilty4 := true
                    else
                        if InventAgeDaysvar = 5 then
                            InvenVisibilty5 := true;
    end;

    procedure SetPageFilter(InventAgeDays: Integer)
    begin
        InventAgeDaysvar := InventAgeDays;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        ILE: Record "Item Ledger Entry";
    begin
        ILE.Reset();
        ILE.SetRange("Item No.", Rec."No.");
        ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
        ILE.SetRange("Posting Date", Today - 30, Today);
        ILE.CalcSums(Quantity);
        rec.last30Days := ABS(ILE.Quantity);

        ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
        ILE.SetRange("Posting Date", Today - 60, Today - 31);
        ILE.CalcSums(Quantity);
        rec.last60Days := ABS(ILE.Quantity);

        ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
        ILE.SetRange("Posting Date", Today - 90, Today - 61);
        ILE.CalcSums(Quantity);
        rec.last90Days := ABS(ILE.Quantity);

        ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
        ILE.SetRange("Posting Date", Today - 120, Today - 91);
        ILE.CalcSums(Quantity);
        rec.last120Days := ABS(ILE.Quantity);

        ILE.SetRange("Entry Type", ILE."Entry Type"::Sale);
        ILE.SetRange("Posting Date", Today - 180, Today - 121);
        ILE.CalcSums(Quantity);
        rec.last180Days := ABS(ILE.Quantity);

        Rec.Modify();
    end;

    var
        InventAgeDaysvar: Integer;
        InvenVisibilty1: Boolean;
        InvenVisibilty2: Boolean;
        InvenVisibilty3: Boolean;
        InvenVisibilty4: Boolean;
        InvenVisibilty5: Boolean;
}
