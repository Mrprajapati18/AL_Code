Report 50400 "Item Wise Inward & OutwardNew"
{
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = PrintLayout;
    RDLCLayout = './Layouts/ItemWiseInward&OutwardNew_1.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Item No.", "Posting Date") order(ascending) where("Entry Type" = filter(<> Transfer));
            RequestFilterFields = "Item No.", "Posting Date";

            column(HideForAll; HideForAll)
            {
            }
            column(ItemNo; "Item Ledger Entry"."Item No.")
            {
            }
            column(ItemName; Item.Description)
            {
            }
            //Column(PSI_Temp; "PSI Temp") { }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Date; Format("Item Ledger Entry"."Posting Date"))
            {
            }
            column(EntryType; "Item Ledger Entry"."Entry Type")
            {
            }
            column(VendoName; VendorName)
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(CustHandle; CustHandle)
            {
            }
            column(Station; Station)
            {
            }
            column(VchType; "Item Ledger Entry"."Entry Type")
            {
            }
            column(VchType2; "Item Ledger Entry"."Document Type")
            {
            }
            column(VchNo; "Item Ledger Entry"."External Document No.")
            {
            }
            column(Qty; "Item Ledger Entry".Quantity)
            {
            }
            column(OutwordAmnt; OutwordAmnt)
            {
            }
            column(InwordAmnt; InwordAmnt)
            {
            }
            column(RemaningQty; "Item Ledger Entry"."Remaining Quantity")
            {
            }
            column(RemaningAmnt; CostAmnt_p)
            {
                AutoCalcField = true;
            }
            column(CompanyName; Companyinfo.Name)
            {
            }
            column(CompanyAddress; Companyinfo.Address)
            {
            }
            column(CompayAddress2; Companyinfo."Address 2")
            {
            }
            column(CompanyCity; Companyinfo.City)
            {
            }
            column(Companypostcode; Companyinfo."Post Code")
            {
            }
            column(CompanyGST; Companyinfo."GST Registration No.")
            {
            }
            column(OpeningValue; OpeningValue)
            {
            }
            column(RunValue; RunValue)
            {
            }
            column(InQty; InQty)
            {
            }
            column(OutQty; OutQty)
            {
            }
            column(RunValueAmt; RunValueAmt)
            {
            }
            column(OpeningAmt; OpeningAmt)
            {
            }
            column(AllFilter; AllFilter)
            {
            }
            column(Rate; InRate)
            {
            }
            column(OutRate; OutRate)
            {
            }
            trigger OnPreDataItem();
            begin
                //     OpeningValue := 0;
                //     OpeningAmt := 0;
                //     ClosingValue := 0;
                //     ClosingAmt := 0;
                //     RunValue := 0; // Initialize running totals too
                //     RunValueAmt := 0;

                //     // Make sure StartDate and EndDate are provided by the user
                //     if (StartDate = 0D) or (EndDate = 0D) then
                //         Error('Please specify both Start Date and End Date.');

                //     // --- Start of FIX for Opening/Closing Balance calculation ---

                //     // Step 1: Capture the filters from the main DataItem (applied from Request Page)
                //     CurrentItemNoFilter := "Item Ledger Entry".GetFilter("Item No.");
                //     CurrentLocationCodeFilter := "Item Ledger Entry".GetFilter("Location Code");

                //     // --- OPENING BALANCE CALCULATION ---
                //     TempItemLedgerEntry.Reset(); // Clear any previous filters on the temporary record

                //     // Apply Item No. filter to TempItemLedgerEntry ONLY if user provided one
                //     if CurrentItemNoFilter <> '' then
                //         TempItemLedgerEntry.SetFilter("Item No.", CurrentItemNoFilter);

                //     // Apply Location Code filter to TempItemLedgerEntry ONLY if user provided one
                //     if CurrentLocationCodeFilter <> '' then
                //         TempItemLedgerEntry.SetFilter("Location Code", CurrentLocationCodeFilter);

                //     // Set date range for opening balance: from beginning of time (0D) up to StartDate - 1
                //     if StartDate > 0D then
                //         TempItemLedgerEntry.SetRange("Posting Date", 0D, StartDate - 1);

                //     // Calculate total quantity and amount for opening balance
                //     if TempItemLedgerEntry.FindSet then begin
                //         repeat
                //             TempItemLedgerEntry.CalcFields("Cost Amount (Actual)", "Sales Amount (Actual)");
                //             OpeningValue += TempItemLedgerEntry.Quantity;
                //             OpeningAmt += TempItemLedgerEntry."Cost Amount (Actual)" + TempItemLedgerEntry."Sales Amount (Actual)";
                //         until TempItemLedgerEntry.Next = 0;
                //     end;

                //     // --- CLOSING BALANCE CALCULATION ---
                //     TempItemLedgerEntry.Reset(); // Clear filters for the next calculation

                //     // Apply Item No. filter to TempItemLedgerEntry ONLY if user provided one
                //     if CurrentItemNoFilter <> '' then
                //         TempItemLedgerEntry.SetFilter("Item No.", CurrentItemNoFilter);

                //     // Apply Location Code filter to TempItemLedgerEntry ONLY if user provided one
                //     if CurrentLocationCodeFilter <> '' then
                //         TempItemLedgerEntry.SetFilter("Location Code", CurrentLocationCodeFilter);

                //     // Set date range for closing balance: from beginning of time (0D) up to EndDate
                //     if EndDate > 0D then
                //         TempItemLedgerEntry.SetRange("Posting Date", 0D, EndDate);

                //     // Calculate total quantity and amount for closing balance
                //     if TempItemLedgerEntry.FindSet then begin
                //         repeat
                //             TempItemLedgerEntry.CalcFields("Cost Amount (Actual)", "Sales Amount (Actual)");
                //             ClosingValue += TempItemLedgerEntry.Quantity;
                //             ClosingAmt += TempItemLedgerEntry."Cost Amount (Actual)" + TempItemLedgerEntry."Sales Amount (Actual)";
                //         until TempItemLedgerEntry.Next = 0;
                //     end;
                //     // --- End of FIX for Opening/Closing Balance calculation ---

                //     // --- Configure the MAIN DataItem (ItemLedgerEntry) for the report body ---
                //     // The filters from RequestFilterFields ("Item No.", "Posting Date") are already applied here.
                //     // We just need to ensure the Posting Date range is correct for the main loop.
                //     if StartDate > 0D then // Set the main dataitem to loop only within the selected date range
                //         SetRange("Posting Date", StartDate, EndDate);

                //     // Initialize running totals with the calculated opening balance for the report.
                //     // These will be updated in OnAfterGetRecord for each ledger entry.
                //     RunValue := OpeningValue;
                //     RunValueAmt := OpeningAmt;

                //     // Capture all filters applied to the main DataItem for display in the report header/footer
                //     AllFilter := "Item Ledger Entry".GetFilters;

                //     // User permissions logic (this part of your code is fine)
                //     Clear(US);
                //     if us.Get(UserId) then begin
                //         if (us."Type of User" = us."Type of User"::Admin) or (UserId = 'SUMIT') or (us."Type of User" = us."Type of User"::Purchase) then
                //             HideForAll := false
                //         else
                //             HideForAll := true;
                //     end;

                // end;

                // trigger OnAfterGetRecord();
                // begin
                //     CustomerName := '';
                //     VendorName := '';
                //     CostAmnt_p := 0;
                //     "Item Ledger Entry".CalcFields("Item Ledger Entry"."Cost Amount (Actual)", "Item Ledger Entry"."Sales Amount (Actual)");
                //     CustHandle := '';
                //     Station := '';
                //     if Item.Get("Item Ledger Entry"."Item No.") then;
                //     if Customer.Get("Item Ledger Entry"."Source No.") then begin
                //         CustomerName := Customer.Name;
                //         // CustHandle := Customer."Salesperson Code";
                //         CustHandle := Customer.CustomerHandlyByName;
                //         Station := Customer.Station;
                //     end;
                //     if Vendor.Get("Item Ledger Entry"."Source No.") then
                //         VendorName := Vendor.Name;
                //     ValueEntry_gRec.Reset;
                //     ValueEntry_gRec.SetRange("Item Ledger Entry No.", "Item Ledger Entry"."Entry No.");
                //     if ValueEntry_gRec.FindFirst then begin
                //         CostAmnt_p := ROUND(ValueEntry_gRec."Cost per Unit" * "Item Ledger Entry"."Remaining Quantity", 0.01);
                //     end;
                //     InQty := 0;
                //     OutQty := 0;
                //     InwordAmnt := 0;
                //     OutwordAmnt := 0;
                //     InRate := 0;
                //     OutRate := 0;
                //     if "Item Ledger Entry".Positive then begin
                //         InQty := "Item Ledger Entry".Quantity;
                //         InwordAmnt := "Item Ledger Entry"."Cost Amount (Actual)";
                //         RunValueAmt += "Item Ledger Entry"."Cost Amount (Actual)";
                //         if InQty <> 0 then
                //             InRate := InwordAmnt / InQty;
                //     end else begin
                //         OutQty := "Item Ledger Entry".Quantity;
                //         OutwordAmnt := "Item Ledger Entry"."Sales Amount (Actual)";
                //         RunValueAmt -= "Item Ledger Entry"."Sales Amount (Actual)";
                //         if OutQty <> 0 then
                //             OutRate := OutwordAmnt / OutQty;
                //     end;
                RunValue += "Item Ledger Entry".Quantity;
                OpeningValue := 0;
                OpeningAmt := 0;
                ClosingValue := 0;
                ClosingAmt := 0;
                RunValue := 0;
                RunValueAmt := 0;


                if (StartDate = 0D) or (EndDate = 0D) then
                    Error('Please enter the Start Date End Date ');

                CurrentItemNoFilter := "Item Ledger Entry".GetFilter("Item No.");
                CurrentLocationCodeFilter := "Item Ledger Entry".GetFilter("Location Code");

                TempItemLedgerEntry.Reset();

                if CurrentItemNoFilter <> '' then
                    TempItemLedgerEntry.SetFilter("Item No.", CurrentItemNoFilter);

                if CurrentLocationCodeFilter <> '' then
                    TempItemLedgerEntry.SetFilter("Location Code", CurrentLocationCodeFilter);

                TempItemLedgerEntry.SetRange("Posting Date", 0D, StartDate - 1);

                if TempItemLedgerEntry.FindSet() then begin
                    repeat
                        TempItemLedgerEntry.CalcFields("Cost Amount (Actual)");
                        OpeningValue += TempItemLedgerEntry.Quantity;
                        OpeningAmt += TempItemLedgerEntry."Cost Amount (Actual)";
                    until TempItemLedgerEntry.Next() = 0;
                end;


                TempItemLedgerEntry.Reset();

                if CurrentItemNoFilter <> '' then
                    TempItemLedgerEntry.SetFilter("Item No.", CurrentItemNoFilter);

                if CurrentLocationCodeFilter <> '' then
                    TempItemLedgerEntry.SetFilter("Location Code", CurrentLocationCodeFilter);


                TempItemLedgerEntry.SetRange("Posting Date", 0D, EndDate);

                if TempItemLedgerEntry.FindSet() then begin
                    repeat
                        TempItemLedgerEntry.CalcFields("Cost Amount (Actual)");
                        ClosingValue += TempItemLedgerEntry.Quantity;
                        ClosingAmt += TempItemLedgerEntry."Cost Amount (Actual)";
                    until TempItemLedgerEntry.Next() = 0;
                end;


                SetRange("Posting Date", StartDate, EndDate);


                RunValue := OpeningValue;
                RunValueAmt := OpeningAmt;

                AllFilter := GetFilters;
                Clear(UserSetup);
                if UserSetup.Get(UserId) then begin
                    HideForAll := true;
                    // if (UserSetup."Type of User" in [UserSetup."Type of User"::Admin, UserSetup."Type of User"::Purchase]) or (UserId = 'SUMIT') then
                    //     HideForAll := false;
                end;
            end;

            trigger OnAfterGetRecord();
            var
                ValueEntry_gRec: Record "Value Entry";
            begin

                CustomerName := '';
                VendorName := '';
                CostAmnt_p := 0;
                CustHandle := '';
                Station := '';
                InQty := 0;
                OutQty := 0;
                InwordAmnt := 0;
                OutwordAmnt := 0;
                InRate := 0;
                OutRate := 0;


                if Item.Get("Item No.") then;
                if Customer.Get("Source No.") then begin
                    CustomerName := Customer.Name;
                    // CustHandle := Customer.CustomerHandlyByName;
                    // Station := Customer.Station;
                end else
                    if Vendor.Get("Source No.") then
                        VendorName := Vendor.Name;


                ValueEntry_gRec.Reset();
                ValueEntry_gRec.SetRange("Item Ledger Entry No.", "Entry No.");
                if ValueEntry_gRec.FindFirst() then
                    CostAmnt_p := Round(ValueEntry_gRec."Cost per Unit" * "Remaining Quantity", 0.01);

                CalcFields("Cost Amount (Actual)", "Sales Amount (Actual)");

                if Positive then begin
                    InQty := Quantity;
                    InwordAmnt := "Cost Amount (Actual)";
                    RunValueAmt += "Cost Amount (Actual)";
                    if InQty <> 0 then
                        InRate := InwordAmnt / InQty;
                end else begin
                    OutQty := Quantity;
                    OutwordAmnt := "Sales Amount (Actual)";
                    RunValueAmt -= "Sales Amount (Actual)";
                    if OutQty <> 0 then
                        OutRate := OutwordAmnt / OutQty;
                end;


                RunValue += Quantity;


            end;
            //  end;

        }

    }

    requestpage
    {


        SaveValues = false;
        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = Basic;
                }



            }
        }

        actions
        {
        }

    }

    trigger OnInitReport()
    begin

        TodayMonth := Date2dmy(today, 2);
        if TodayMonth in [1, 2, 3] then begin
            StartDate := Dmy2date(1, 4, Date2dmy(today, 3) - 1);
        end else begin
            StartDate := Dmy2date(1, 4, Date2dmy(today, 3));
        end;

        //   StartDate := 20210401D;
        EndDate := Today;
        AllFilter := '';
        HideForAll := true;



    end;


    var
        US: Record "User Setup";
        HideForAll: Boolean;

        TodayMonth: Integer;
        Item: Record Item;
        TempItem: Record "Item";
        Customer: Record Customer;
        Vendor: Record Vendor;
        ItemLedgerEntry: Record "Item Ledger Entry";
        CustInword: Integer;
        CustQty: Decimal;
        Type: Option;
        VendOutword: Integer;
        VendQty: Decimal;
        ClosingQty: Integer;
        CloseAmnt: Decimal;
        VendorName: Text;
        CustomerName: Text;
        PurBool: Boolean;
        SaleBool: Boolean;
        ValueEntry_gRec: Record "Value Entry";
        CostAmnt_p: Decimal;
        Companyinfo: Record "Company Information";
        OpeningValue: Decimal;
        StartDate: Date;
        EndDate: Date;
        InQty: Decimal;
        OutQty: Decimal;
        RunValue: Decimal;
        RunValueAmt: Decimal;
        OpeningAmt: Decimal;
        AllFilter: Text;
        OutwordAmnt: Decimal;
        InwordAmnt: Decimal;
        InRate: Decimal;
        OutRate: Decimal;
        CustHandle: Text;
        Station: Text;
        ClosingValue: Decimal;
        ClosingAmt: Decimal; // Closing balance variable for total quantity and amount

        TempItemLedgerEntry: Record "Item Ledger Entry";
        CurrentItemNoFilter: Text;          // Item No. filter store karne ke liye
        CurrentLocationCodeFilter: Text;
        UserSetup: Record "User Setup";

}
