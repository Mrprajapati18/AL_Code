page 50097 "Sales analysis SNS"
{
    Caption = 'Sales Analysis SNS';
    PageType = CardPart;


    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                Caption = 'Sales Activities';

                field(TotalSaleAmt; TotalSaleAmtYTD)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'YTD Sales Amt';

                    trigger OnDrillDown()
                    var
                        CLEPage: page "Customer Ledger Entries";
                        CLERec: Record "Cust. Ledger Entry";
                    begin
                        Clear(CLEPage);
                        CLERec.Reset();
                        CLERec.SetRange("Posting Date", 20250401D, 20260331D);
                        CLERec.Setfilter("Document Type", '%1|%2', CLERec."Document Type"::Invoice, CLERec."Document Type"::"Credit Memo");
                        CLERec.SetRange("Business Type", CLE."Business Type"::SNS);
                        CLEPage.SetTableView(CLERec);
                        CLEPage.Run();
                    end;
                }


                field(TotalSaleAmtToday; TotalSaleAmtToday)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Today Sales Amt';

                    trigger OnDrillDown()
                    var
                        CLEPage: page "Customer Ledger Entries";
                        CLERec: Record "Cust. Ledger Entry";
                    begin
                        Clear(CLEPage);
                        CLERec.Reset();
                        CLERec.SetRange("Posting Date", Today);
                        CLERec.Setfilter("Document Type", '%1|%2', CLERec."Document Type"::Invoice, CLERec."Document Type"::"Credit Memo");
                        CLERec.SetRange("Business Type", CLE."Business Type"::SNS);
                        CLEPage.SetTableView(CLERec);
                        CLEPage.Run();
                    end;
                }

                field(TotalSaleAmtMonth; TotalSaleAmtMonth)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Month Sales Amt';

                    trigger OnDrillDown()
                    var
                        CLEPage: page "Customer Ledger Entries";
                        CLERec: Record "Cust. Ledger Entry";
                    begin
                        Clear(CLEPage);
                        CLERec.Reset();
                        CLERec.SetRange("Posting Date", StartDate, EndDate);
                        CLERec.Setfilter("Document Type", '%1|%2', CLERec."Document Type"::Invoice, CLERec."Document Type"::"Credit Memo");
                        CLERec.SetRange("Business Type", CLE."Business Type"::SNS);
                        CLEPage.SetTableView(CLERec);
                        CLEPage.Run();
                    end;

                }
                field(StockValue; StockValue)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stock Value';
                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
                field(GrossProfitt; GrossProfitt)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Gross Profit';
                    trigger OnDrillDown()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
                // field(YTDResult; YTDResult)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'YTD Growth %';
                //     Style = Favorable;
                //     StyleExpr = true;

                // }


            }

        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

        Clear(StartDate);
        Clear(EndDate);
        StartDate := CALCDATE('<-CM>', today);
        EndDate := CALCDATE('<CM>', StartDate);

        Clear(StartDateY);
        Clear(EndDateY);
        StartDateY := CALCDATE('<-CY>', today);
        EndDateY := CALCDATE('<CY>', StartDateY);

        TotalSaleAmtYTD := 0;
        CLEAR(CLE);
        CLE.Setfilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
        CLE.SetRange("Posting Date", 20250401D, 20260331D);
        CLE.SetRange("Business Type", CLE."Business Type"::SNS);
        CLE.CalcSums("Sales (LCY)");
        TotalSaleAmtYTD := CLE."Sales (LCY)";

        GrossProfitt := 0;
        CLEAR(CLE);
        CLE.Setfilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
        CLE.SetRange("Posting Date", 20250401D, 20260331D);
        CLE.SetRange("Business Type", CLE."Business Type"::SNS);
        if CLE.FindFirst() then
            repeat
                CLE.CALCFIELDS("Actual Cost ", "Charge Cost");
                GrossProfitt += CLE."Sales (LCY)" - CLE."Actual Cost " - ABS(CLE."Charge Cost");
            until CLE.Next() = 0;

        TotalSaleAmtToday := 0;
        CLEAR(CLE);
        CLE.Setfilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
        CLE.SetRange("Posting Date", Today);
        CLE.SetRange("Business Type", CLE."Business Type"::SNS);
        CLE.CalcSums("Sales (LCY)");
        TotalSaleAmtToday := CLE."Sales (LCY)";

        TotalSaleAmtMonth := 0;
        CLEAR(CLE);
        CLE.Setfilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
        CLE.SetRange("Posting Date", StartDate, EndDate);
        CLE.SetRange("Business Type", CLE."Business Type"::SNS);
        CLE.CalcSums("Sales (LCY)");
        TotalSaleAmtMonth := CLE."Sales (LCY)";

        StockValue := 0;
        ItemLedEntry.Reset();
        ItemLedEntry.SetRange(Open, true);
        ItemLedEntry.SetFilter("Purchase Type", '<>%1', ItemLedEntry."Purchase Type"::B2B);
        if ItemLedEntry.FindFirst() then
            repeat
                ItemLedEntry.CalcFields("Cost Amount (Actual)");
                StockValue += (ItemLedEntry."Cost Amount (Actual)" / ItemLedEntry.Quantity) * ItemLedEntry."Remaining Quantity";
            until ItemLedEntry.Next() = 0;



        // TotalSaleAmtYTDLastYear := 0;
        // CLEAR(CLEOld);
        // CLEOld.Setfilter("Document Type", '%1|%2', CLEOld."Document Type"::Invoice, CLEOld."Document Type"::"Credit Memo");
        // CLEOld.SetRange("Posting Date", 20220401D, Today - 365);
        // IF CLEOld.FINDFIRST THEN
        //     REPEAT
        //         TotalSaleAmtYTDLastYear += CLEOld."Sales (LCY)";
        //     UNTIL CLEOld.NEXT = 0;

        // Clear(YTDResult);
        // YTDResult := (((TotalSaleAmtYTD - TotalSaleAmtYTDLastYear) / TotalSaleAmtYTDLastYear) * 100) + 100;
    end;



    var
        ItemLedEntry: Record "Item Ledger Entry";
        TotalSaleAmtYTD: decimal;
        CLE: Record "Cust. Ledger Entry";
        CLEOld: Record "Cust. Ledger Entry";
        TotalSaleAmtToday: decimal;
        TotalSaleAmtMonth: decimal;
        StockValue: Decimal;
        ValueEntry: Record "Value Entry";
        GrossProfitt: Decimal;
        GLAcc: Record "G/L Account";
        StartDate: Date;
        EndDate: date;
        StartDateY: Date;
        EndDateY: date;
        TotalSaleAmtYTDLastYear: Decimal;
        YTDResult: Decimal;


}
