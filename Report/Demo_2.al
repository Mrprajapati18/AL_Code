// /// Report Tax Invoice Sales (ID 50000).

// report 50000 "Tax Invoice Sales"
// {
//     DefaultLayout = RDLC;
//     ApplicationArea = All;
//     Caption = 'Tax Invoice ';
//     UsageCategory = ReportsAndAnalysis;
//     RDLCLayout = 'SRC\RLayout\50000.TaxInvoice.rdl';

//     dataset
//     {
//         dataitem(salesInvoiceHeader; "Sales Invoice Header")
//         {
//             RequestFilterFields = "No.";
//             column(Special_Remarks; "Special Remarks")
//             {

//             }
//             column(Heading1; Heading1) { }
//             column(Mode_of_Transport; "Mode of Transport") { }
//             column(Heading2; Heading2) { }
//             column(Vehicle_No_; "Vehicle No.") { }
//             column(Payment_Terms_Code; "Payment Terms Code") { }
//             column(CompName; compInfo.Name) { }
//             column(Picture; compInfo.Picture) { }
//             column(CompAddrss1; compInfo.Address) { }
//             column(Salesperson_Code; "Salesperson Code") { }
//             column(CompPincode; locpostcode) { }
//             column(compAddress2; compInfo."Address 2") { }
//             column(CompCity; loccity) { }
//             column(CompStatecodegst; locstatecodegst) { }
//             column(CompCountrycode; loccountrycode) { }
//             column(CompCountry; loccountry) { }
//             column(Locadd; Locadd) { }
//             column(locadd2; locadd2) { }
//             column(CompCin; compInfo."Registration No.") { }
//             column(StateName; locstate) { }
//             column(CompFassai_No; locfssai) { }
//             column(PanNo; compInfo."P.A.N. No.") { }
//             column(GST_No; locgst) { }
//             column(Email; compInfo."E-Mail") { }
//             column(InNO; "No.") { }
//             column(InvDate; "Posting Date") { }
//             column(Comment_1; Comment_1) { }
//             column(Shiptoname; Shiptoname) { }
//             column(ShiptoAdd; ShiptoAdd) { }
//             column(ShiptoAdd2; ShiptoAdd2) { }
//             column(ShiptoCity; ShiptoCity) { }
//             column(ShiptoPostcode; ShiptoPostcode) { }
//             column(ShiptoStatecode; ShiptoStatecode) { }
//             column(ShiptoStatecodeGst; ShiptoStatecodeGst) { }//vk
//             column(ShiptoEmail; ShiptoEmail) { }
//             column(ShiptoCountrycode; ShiptoCountrycode) { }
//             column(ShiptoGSTIN; ShiptoGSTIN) { }
//             column(ShiptoPAN; ShiptoPAN) { }
//             column(ShiptoCountry; ShiptoCountry) { }
//             column(ShiptoState; ShiptoState) { }
//             column(ShiptoFSSAI; ShiptoFSSAI) { }
//             column(Ship_to_Code; "Ship-to Code") { }
//             column(Bill_to_Name; "Bill-to Name") { }
//             column(Bill_to_Address; "Bill-to Address") { }
//             column(Bill_to_Address_2; "Bill-to Address 2") { }
//             column(Bill_to_City; "Bill-to City") { }
//             column(Bill_to_Post_Code; "Bill-to Post Code") { }
//             column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }
//             column(BilltoCountry; BilltoCountry) { }
//             column(billToPAN; BillToPAN) { }
//             column(BilltoState; BilltoState) { }
//             column(Billtostatecode; Billtostatecode) { }
//             column(BilltostatecodeGst; BilltostatecodeGst) { }
//             column(BilltoGst; BilltoGst) { }
//             column(BilltoFssai; BilltoFssai) { }
//             column(Bill_to_Contact; BilltoContact) { }
//             column(Bill_to_Contact_No_; BilltoContact) { }
//             column(BilltoEmail; BilltoEmail) { }
//             column(No; "No.") { }
//             column(Order_No_; "Order No.") { }
//             column(Order_Date; "Order Date") { }
//             column(Posting_Date; "Posting Date") { }
//             column(Payment_Method_Code; "Payment Terms Code") { }
//             column(PhoneNO; compInfo."Phone No.") { }
//             column(TCSAmount; TCSAmount) { }
//             column(totalgst; totalgst) { }
//             column(Acknowledgement_No_; "Acknowledgement No.") { }
//             column(IRNNo; EInvHead."IRN No.") { }
//             column(E_Way_Bill_No_; EInvHead."Eway Bill No.") { }
//             column(E_Way_Valid; EInvHead."Eway Bill Valid Upto") { }
//             column(EInvHead_VehicleNo; EInvHead."Vehicle No") { }
//             column(AckNo; EInvHead."ACK No.") { }
//             column(QRcode; EInvHead."QR Code URL Image") { }
//             column(AckDate; Ackdate) { }

//             column(TotalAmount; TotalAmount) { }
//             column(Amountinwords2; Amountinwords2[1]) { }
//             column(AmountinWord; AmountinWord[1]) { }
//             column(Comment2; Comment2) { }
//             column(DeliveryNoteNo; DeliveryNoteNo) { }
//             column(Heading; Heading) { }
//             column(External_Document_No_; "External Document No.") { }
//             column(compInfo_BAnkAccountNo; compInfo."Bank Account No.") { }
//             column(compInfo_BankName; compInfo."Bank Name") { }
//             column(compInfo_IfscCode; compInfo."Bank Branch No.") { }
//             column(BankAccount_BranchAddress; compInfo."Bank Name") { }
//             column(ModeTermsOfPayment; ModeTermsOfPayment) { }
//             dataitem(CopyLoop; Integer)


//             {
//                 DataItemLinkReference = salesInvoiceHeader;
//                 DataItemTableView = SORTING(Number);
//                 dataitem(Pageloop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
//                     column(OutputNo; OutputNo) { }
//                     column(CopyText; CopyText) { }
//                     dataitem(SalesInvoiceLine; "Sales Invoice Line")
//                     {
//                         DataItemLinkReference = salesInvoiceHeader;
//                         DataItemLink = "Document No." = FIELD("No.");
//                         DataItemTableView = where(Quantity = filter(<> 0), "No." = filter(<> 47011008));

//                         column(LineDesc; Description) { }
//                         column(Sno; Sno) { }
//                         column(Item_Reference_No_; "Item Reference No.") { }
//                         column(PartNo; PartNo) { }
//                         column(Total; Total) { }
//                         column(LineTotal; LineTotal) { }
//                         column(total2; total2) { }
//                         column(RoundOff; RoundOff) { }
//                         column(DocNo; "No.") { }
//                         column(HSn; "HSN/SAC Code") { }
//                         column(GSTRate; GSTRate) { }
//                         column(ItemGSTRate; ItemGSTRate) { }
//                         column(GstAmount; ABS(GstAmount)) { }
//                         column(Qty; Quantity) { }
//                         column(Rate; "Unit Price") { }
//                         column(Line_Amount; "Line Amount") { }
//                         column(Per; UnitMeasure) { }
//                         column(discount; "Line Discount %") { }
//                         column(Discount1; Discount1) { }
//                         column(Amount; Amount) { }
//                         column(UnitMeasure; UnitMeasure) { }
//                         column(Line_Discount__; "Line Discount Amount") { }
//                         column(BatchNo; BatchNo) { }
//                         column(BatchUOM; BatchUOM) { }
//                         column(BatchQty; BatchQty) { }
//                         column(LotNo; batchtext) { }
//                         column(batch; batchtext) { }
//                         column(BUOM; BUOM) { }
//                         column(Bqty; Bqty) { }
//                         column(exp; exp) { }
//                         column(Expiry_Date; "Expiry Date") { }
//                         column(MfgDatecap; MfgDatecap) { }
//                         column(mfg; mfg) { }
//                         column(SGST; SGST) { }
//                         column(CGST; CGST) { }
//                         column(IGST; IGST) { }
//                         column(CGSTper; CGSTper) { }
//                         column(SGSTper; SGSTper) { }
//                         column(IGSTper; IGSTper) { }
//                         column(AlternetUnit; AlternetUnit) { }
//                         column(AlternetUnit3; AlternetUnit3) { }
//                         column(UnitText; UnitText) { }
//                         column(Comment1; Comment1) { }
//                         column(ItemDesc; ItemDesc) { }
//                         column(RefInvNo; RefInvNo) { }
//                         column(Box_Quantity; "Box Quantity") { }

//                         trigger OnPreDataItem()
//                         var
//                             myInt: Integer;
//                         begin
//                             CLEAR(SNo);
//                         end;

//                         trigger OnAfterGetRecord()
//                         var
//                             myInt: Integer;
//                             ItemRec: Record Item;
//                         begin
//                             SNo += 1;
//                             Clear(PartNo);
//                             ItemRec.Reset();
//                             if ItemRec.Get(SalesInvoiceLine."No.") then
//                                 PartNo := ItemRec."Vendor Item No.";

//                             Clear(UnitMeasure);

//                             UOM.Reset();
//                             UOM.SetRange(Description, SalesInvoiceLine."Unit of Measure");
//                             if UOM.FindFirst() then
//                                 UnitMeasure := UOM.Code;

//                             Clear(BatchNo);
//                             Clear(batchtext);
//                             Clear(prevlot);

//                             Clear(BatchUOM);
//                             Clear(BatchQty);
//                             Clear(Expirydate);
//                             Clear(MfgDate);
//                             Clear(LotQty);
//                             ValueEntrRec.Reset();
//                             ValueEntrRec.SetRange("Document No.", SalesInvoiceLine."Document No.");
//                             ValueEntrRec.SetRange(Adjustment, false);
//                             ValueEntrRec.SetRange("Item No.", SalesInvoiceLine."No.");
//                             ValueEntrRec.SetRange("Document Type", ValueEntrRec."Document Type"::"Sales Invoice");
//                             if ValueEntrRec.FindFirst() then begin
//                                 FirstEntry := false;
//                                 repeat
//                                     Rec_ILE.Reset();
//                                     Rec_ILE.SetRange("Entry No.", ValueEntrRec."Item Ledger Entry No.");
//                                     Rec_ILE.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
//                                     Rec_ILE.SetRange("Item No.", ValueEntrRec."Item No.");
//                                     if Rec_ILE.FindFirst() then begin
//                                         repeat

//                                             LotPrint := CopyStr(Rec_ILE."Lot No.", 1, 8);
//                                             if prevlot <> LotPrint then begin
//                                                 FirstEntry := true;
//                                                 if LotQty <> 0 then
//                                                     batchtext += Format(LotQty);
//                                                 ExpiryDate := Rec_ILE."Expiration Date";
//                                                 MfgDate := Rec_ILE."Warranty Date";
//                                                 LotQty := Rec_ILE.Quantity;
//                                                 if batchtext = '' then
//                                                     batchtext := ' Batch No. :  ' + LotPrint + ',               QTY :'
//                                                 else
//                                                     batchtext += ',   Batch No. : ' + LotPrint + ',               QTY :';
//                                                 prevlot := LotPrint;
//                                             end;
//                                             if not FirstEntry then begin
//                                                 LotQty += Rec_ILE.Quantity;
//                                             end;
//                                             FirstEntry := false;
//                                         until Rec_ILE.Next = 0;
//                                     end;
//                                 until ValueEntrRec.Next = 0;
//                                 batchtext += Format(LotQty);

//                             end;


//                             ItemRec.Reset();
//                             ItemUnitOfMeasureRec.Reset();
//                             Clear(AlternetUnit);
//                             Clear(AlternetUnit1);
//                             Clear(UnitText);
//                             ItemRec.SetRange("No.", SalesInvoiceLine."No.");
//                             if ItemRec.FindFirst() then begin
//                                 ItemUnitOfMeasureRec.SetRange("item No.", ItemRec."No.");
//                                 ItemUnitOfMeasureRec.SetRange(code, 'BOX');

//                                 if ItemUnitOfMeasureRec.FindFirst() then begin
//                                     AlternetUnit1 := ItemUnitOfMeasureRec."Qty. per Unit of Measure";
//                                     AlternetUnit := SalesInvoiceLine.Quantity / AlternetUnit1;
//                                     UnitText := 'Boxes';
//                                 end;

//                             end;


//                             ItemRec.Reset();
//                             ItemUnitOfMeasureRec.Reset();
//                             Clear(AlternetUnit2);
//                             Clear(AlternetUnit3);
//                             ItemRec.SetRange("No.", SalesInvoiceLine."No.");
//                             if ItemRec.FindFirst() then begin
//                                 ItemUnitOfMeasureRec.SetRange("item No.", ItemRec."No.");
//                                 ItemUnitOfMeasureRec.SetRange(code, 'BAG');

//                                 if ItemUnitOfMeasureRec.FindFirst() then begin
//                                     AlternetUnit2 := ItemUnitOfMeasureRec."Qty. per Unit of Measure";
//                                     AlternetUnit3 := SalesInvoiceLine.Quantity / AlternetUnit2;
//                                     UnitText := 'Bags';
//                                 end;

//                             end;

//                             Clear(CGST);
//                             Clear(IGST);
//                             Clear(SGST);
//                             Clear(CGSTper);
//                             Clear(SGSTper);
//                             Clear(IGSTper);
//                             Clear(totalgst);
//                             Clear(total2);
//                             DetailedGSTLedgerEntry.Reset();
//                             DetailedGSTLedgerEntry.SetRange("Document No.", "Document No.");
//                             DetailedGSTLedgerEntry.SetRange("Document Line No.", "Line No.");
//                             DetailedGSTLedgerEntry.SetRange("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
//                             DetailedGSTLedgerEntry.CALCSUMS(DetailedGSTLedgerEntry."GST Amount");
//                             if DetailedGSTLedgerEntry.FindFirst then begin
//                                 repeat
//                                     if DetailedGSTLedgerEntry."GST Component Code" = 'CGST' then begin
//                                         CGST := Abs(DetailedGSTLedgerEntry."GST Amount");
//                                         CGSTPer := DetailedGSTLedgerEntry."GST %";
//                                         GstAmount := DetailedGSTLedgerEntry."GST Base Amount";
//                                     end;
//                                     if DetailedGSTLedgerEntry."GST Component Code" = 'SGST' then begin
//                                         SGST := Abs(DetailedGSTLedgerEntry."GST Amount");
//                                         SGSTPer := DetailedGSTLedgerEntry."GST %";
//                                         GstAmount := DetailedGSTLedgerEntry."GST Base Amount";
//                                     end;
//                                     if DetailedGSTLedgerEntry."GST Component Code" = 'IGST' then begin
//                                         IGST := Abs(DetailedGSTLedgerEntry."GST Amount");
//                                         IGSTPer := DetailedGSTLedgerEntry."GST %";
//                                         GstAmount := DetailedGSTLedgerEntry."GST Base Amount";
//                                     end;
//                                     ItemGSTRate := CGSTper + SGSTper + IGSTper;
//                                 until DetailedGSTLedgerEntry.Next = 0;

//                             end;

//                             total2 := ABS(CGST + IGST + SGST);


//                             Comment1 := '';
//                             Sales_Comnt.RESET;
//                             Sales_Comnt.SETRANGE("Document Type", Sales_Comnt."Document Type"::"Posted Invoice");
//                             Sales_Comnt.SETRANGE("No.", SalesinvoiceLine."Document No.");
//                             Sales_Comnt.SetRange("Document Line No.", SalesinvoiceLine."Line No.");
//                             IF Sales_Comnt.FINDFIRST THEN
//                                 repeat
//                                     if Comment1 <> '' then
//                                         Comment1 := Comment1 + ' , ' + Sales_Comnt.Comment
//                                     else
//                                         Comment1 := Sales_Comnt.Comment;
//                                 until Sales_Comnt.Next() = 0;

//                             Clear(ItemDesc);
//                             Clear(ChargeItemNo);
//                             Clear(RefInvNo);
//                             ValueEntryRec.Reset();
//                             ValueEntryRec.SetRange("Document No.", SalesInvoiceLine."Document No.");
//                             ValueEntryRec.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
//                             if ValueEntryRec.FindFirst() then begin
//                                 ChargeItemNo := ValueEntryRec."Item No.";
//                             end;

//                             if Type = SalesInvoiceLine.Type::"Charge (Item)" then begin
//                                 Clear(ChargeItemDesc);

//                                 ItemRec.Reset();
//                                 ItemRec.SetRange("No.", ChargeItemNo);
//                                 if ItemRec.FindFirst() then
//                                     ChargeItemDesc := ItemRec.Description;
//                                 ItemDesc := ' of ' + ChargeItemDesc;

//                                 Clear(ILENO);
//                                 ValueEntryRec.Reset();
//                                 ValueEntryRec.SetRange("Document No.", SalesInvoiceLine."Document No.");
//                                 ValueEntryRec.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
//                                 if ValueEntryRec.Findfirst() then
//                                     repeat
//                                         ILENO := ValueEntryRec."Item Ledger Entry No.";
//                                         ChargeAmt := ValueEntryRec."Sales Amount (Actual)";

//                                         ItemLedRec.Reset();
//                                         ItemLedRec.SetRange("Entry No.", ILENO);
//                                         if ItemLedRec.FindFirst() then
//                                             ILEOrderNo := ItemLedRec."Document No.";

//                                         Clear(RefOrdNo);
//                                         SlesShipRec.Reset();
//                                         SlesShipRec.SetRange("No.", ILEOrderNo);
//                                         if SlesShipRec.FindFirst() then
//                                             RefOrdNo := SlesShipRec."Order No.";


//                                         SalesInvHdr.Reset();
//                                         SalesInvHdr.SetRange("Order No.", RefOrdNo);
//                                         if SalesInvHdr.FindFirst() then
//                                             repeat
//                                                 if RefInvNo <> '' then
//                                                     RefInvNo := 'Ref : ' + RefInvNo + ' , ' + SalesInvHdr."No." + ' (' + Format(ChargeAmt) + ') '
//                                                 else
//                                                     RefInvNo := SalesInvHdr."No." + ' (' + Format(ChargeAmt) + ') ';
//                                             until SalesInvHdr.Next() = 0;

//                                     until ValueEntryRec.Next() = 0;
//                             end

//                         end;
//                     }
//                     dataitem(Integer; Integer)
//                     {
//                         Column(AA; 'AA') { }
//                         trigger OnPreDataItem()
//                         begin
//                             MaxNo := 1;
//                             IF P_LineCount >= MaxNo THEN
//                                 CurrReport.BREAK
//                             else BEGIN
//                                 NeedNo := MaxNo - P_LineCount;
//                                 SETRANGE(Number, 1, NeedNo);
//                             END;
//                         end;
//                     }


//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     // CurrReport.PAGENO := 1;
//                     IF Number = 1 THEN
//                         CopyText := 'ORIGINAL FOR RECIPIENT';
//                     IF Number = 2 THEN
//                         CopyText := 'DUPLICATE-FOR TRANSPORTER';
//                     IF Number = 3 THEN
//                         CopyText := 'TRIPLICATE-FOR SUPPLIER';
//                     IF Number > 3 THEN
//                         CopyText := 'EXTRA COPY';
//                     OutputNo += 1;
//                     IF Number > 1 THEN BEGIN
//                         OutputNo += 1;
//                     END;


//                 end;


//                 trigger OnPreDataItem()
//                 var
//                     myInt: Integer;
//                 begin

//                     NoofLoops := ABS(NoofCopies);
//                     IF NoofLoops <= 0 THEN
//                         NoofLoops := 1;
//                     CopyText := '';
//                     SETRANGE(Number, 1, NoofLoops);
//                     OutputNo := 0;

//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;

//             begin

//                 Clear(ShiptoPAN_New);
//                 customerREC.Reset();
//                 //  customerREC.SetRange("Ship-to Code", salesInvoiceHeader."Ship-to Code");
//                 customerREC.SetRange("No.", salesInvoiceHeader."Bill-to Customer No.");
//                 if customerREC.FindFirst() then begin
//                     ShiptoPAN_New := CustRec."P.A.N. No.";
//                     Message('%1 Pan No', CustRec."P.A.N. No.");
//                 end;


//                 Clear(DeliveryNoteNo);
//                 SalesShipmentHeader.Reset();
//                 SalesShipmentHeader.SetRange("Order No.", salesInvoiceHeader."Order No.");
//                 if SalesShipmentHeader.FindFirst() then
//                     DeliveryNoteNo := SalesShipmentHeader."No.";

//                 //Rounded off>>>

//                 CLEAR(RoundOff);
//                 RecSalesLine.RESET;
//                 RecSalesLine.SETRANGE(Type, RecSalesLine.Type::"G/L Account");
//                 RecSalesLine.SetRange("Document No.", SalesInvoiceLine."Document No.");
//                 RecSalesLine.SETRANGE("No.", '47011008'); ////put gl account number 
//                 IF RecSalesLine.FINDSET THEN
//                     REPEAT
//                         RoundOff += RecSalesLine."Line Amount";
//                     UNTIL RecSalesLine.NEXT = 0;
//                 //<<<rounded off

//                 //TCS>>
//                 TCSAmount := 0;
//                 TCSENtry.Reset();
//                 TCSENtry.SetRange("Document No.", salesInvoiceHeader."No.");
//                 TCSENtry.SetRange(TCSENtry."Document Type", TCSENtry."Document Type"::Invoice);
//                 if TCSENtry.FindFirst() then
//                     repeat
//                         TCSAmount += TCSENtry."TCS Amount";
//                     until TCSENtry.Next() = 0;
//                 //TCS <<

//                 Clear(totalgst);
//                 DetailedGSTLedgerEntry.Reset();
//                 DetailedGSTLedgerEntry.SetRange("Document No.", salesInvoiceHeader."No.");
//                 DetailedGSTLedgerEntry.SetRange("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
//                 if DetailedGSTLedgerEntry.FindFirst() then
//                     repeat
//                         totalgst += Abs(DetailedGSTLedgerEntry."GST Amount");
//                     until DetailedGSTLedgerEntry.Next = 0;


//                 CLEAR(AmountinWords2);
//                 InitTextVariable;
//                 totalgst := round(totalgst, 0.01);
//                 FormatNoText(Notext2, totalgst, salesInvoiceHeader."Currency Code");
//                 Amountinwords2[1] := Notext2[1];


//                 //TotalAmt Amounts in Words>>
//                 Clear(LineTotal);
//                 CLEAR(TotalAmount);
//                 CLEAR(Total);
//                 SalesINvLine.RESET;
//                 SalesINvLine.SETRANGE("Document No.", salesInvoiceHeader."No.");
//                 IF SalesINvLine.FINDFIRST THEN
//                     REPEAT
//                         LineTotal += SalesINvLine."Line Amount";
//                     UNTIL SalesINvLine.NEXT = 0;

//                 TotalAmount := (LineTotal + totalgst + TCSAmount);

//                 // Message('Amouunt Santosh:- %1'+ Format( TotalAmount));

//                 //  Message('Amount %1', TotalAmount);

//                 CLEAR(AmountinWord);
//                 InitTextVariable;
//                 TotalAmount := round(TotalAmount, 0.01);
//                 FormatNoText(Notext1, TotalAmount, salesInvoiceHeader."Currency Code");
//                 AmountinWord[1] := Notext1[1];

//                 Comment2 := '';
//                 Sales_Comnt.RESET;
//                 Sales_Comnt.SETRANGE("Document Type", Sales_Comnt."Document Type"::"Posted Invoice");
//                 Sales_Comnt.SETRANGE("No.", salesInvoiceHeader."No.");
//                 Sales_Comnt.SetRange("Document Line No.", 0);
//                 IF Sales_Comnt.FINDFIRST THEN
//                     repeat
//                         if comment2 <> '' then
//                             comment2 := comment2 + '  ,  ' + Sales_Comnt.Comment
//                         else
//                             Comment2 := Sales_Comnt.Comment;
//                     until Sales_Comnt.Next = 0;

//                 Clear(Locadd);
//                 Clear(locadd2);
//                 Clear(loccity);
//                 Clear(locpostcode);
//                 Clear(locstate);
//                 Clear(locstatecode);
//                 Clear(loccountrycode);
//                 Clear(loccountry);
//                 Clear(locemail);
//                 Clear(locfssai);
//                 Clear(locgst);
//                 Location.Reset();
//                 Location.SetRange(Code, salesInvoiceHeader."Location Code");
//                 if Location.FindFirst() then begin
//                     Locadd := Location.Address;
//                     locadd2 := Location."Address 2";
//                     loccity := Location.City;
//                     locpostcode := Location."Post Code";
//                     locstatecode := Location."State Code";
//                     loccountrycode := Location."Country/Region Code";
//                     locemail := Location."E-Mail";
//                     locgst := Location."GST Registration No.";

//                     StateRec.Reset();
//                     StateRec.SetRange(Code, locstatecode);
//                     if StateRec.FindFirst then begin
//                         locstate := StateRec.Description;
//                         locstatecodegst := StateRec."State Code (GST Reg. No.)";
//                     end;

//                     CountryRec.Reset();
//                     CountryRec.SetRange(Code, loccountrycode);
//                     if CountryRec.FindFirst then
//                         loccountry := CountryRec.Name;
//                 end else begin
//                     Locadd := compInfo.Address;
//                     locadd2 := compInfo."Address 2";
//                     loccity := compInfo.City;
//                     locpostcode := compInfo."Post Code";
//                     locstatecode := compInfo."State Code";
//                     loccountrycode := compInfo."Country/Region Code";
//                     locemail := compInfo."E-Mail";
//                     locgst := compInfo."GST Registration No.";

//                     StateRec.Reset();
//                     StateRec.SetRange(Code, compInfo."State Code");
//                     if StateRec.FindFirst then begin
//                         locstate := StateRec.Description;
//                         locstatecodegst := StateRec."State Code (GST Reg. No.)";
//                     end;

//                     CountryRec.Reset();
//                     CountryRec.SetRange(Code, compInfo."Country/Region Code");
//                     if CountryRec.FindFirst then
//                         loccountry := CountryRec.Name;

//                 end;


//                 //>>BilltoDetails
//                 Clear(BillToPAN);
//                 Clear(BilltoState);
//                 Clear(Billtostatecode);
//                 Clear(BilltostatecodeGst);
//                 Clear(BilltoGst);
//                 Clear(BilltoFssai);
//                 Clear(BilltoContact);
//                 Cust.Reset();
//                 Cust.SetRange("No.", salesInvoiceHeader."Bill-to Customer No.");
//                 if Cust.FindFirst() then begin
//                     BillToPAN := Cust."P.A.N. No.";
//                     Billtostatecode := Cust."State Code";
//                     BilltoGst := Cust."GST Registration No.";
//                     BilltoEmail := Cust."E-Mail";
//                     BilltoContact := Cust.Contact + ' - ' + Cust."Mobile Phone No.";

//                     StateRec.Reset;
//                     StateRec.SetRange(Code, Billtostatecode);
//                     if StateRec.FindFirst then begin
//                         BilltoState := StateRec.Description;
//                         BilltostatecodeGst := StateRec."State Code (GST Reg. No.)";
//                     end;
//                 end;

//                 Clear(BilltoCountry);
//                 CountryRec.Reset;
//                 CountryRec.SetRange(Code, "Bill-to Country/Region Code");
//                 if CountryRec.FindFirst then
//                     BilltoCountry := CountryRec.Name;
//                 //<<BilltoDetails

//                 //>>ShipToDetails
//                 Clear(Shiptoname);
//                 Clear(ShiptoAdd);
//                 Clear(ShiptoAdd2);
//                 Clear(ShiptoCity);
//                 Clear(ShiptoPostcode);
//                 Clear(ShiptoCountrycode);
//                 Clear(ShiptoGSTIN);
//                 Clear(ShiptoCountry);
//                 Clear(ShiptoState);
//                 Clear(ShiptoStatecode);
//                 Clear(ShiptoStatecodeGst);
//                 Clear(ShiptoEmail);
//                 Clear(ShiptoPAN);
//                 Clear(ShiptoFSSAI);
//                 if salesInvoiceHeader."Ship-to Code" <> '' then begin
//                     Shiptoname := salesInvoiceHeader."Ship-to Name";
//                     ShiptoAdd := salesInvoiceHeader."Ship-to Address";
//                     ShiptoAdd2 := salesInvoiceHeader."Ship-to Address 2";
//                     ShiptoCity := salesInvoiceHeader."Ship-to City";
//                     ShiptoPostcode := salesInvoiceHeader."Ship-to Post Code";
//                     ShiptoCountrycode := salesInvoiceHeader."Ship-to Country/Region Code";
//                     ShiptoGSTIN := salesInvoiceHeader."Ship-to GST Reg. No.";
//                     if StateRec.Get(salesInvoiceHeader."GST Ship-to State Code") then begin
//                         ShiptoStatecodeGst := StateRec."State Code (GST Reg. No.)";
//                         ShiptoState := StateRec.Description;
//                     end;
//                     if CountryRec.Get(salesInvoiceHeader."Ship-to Country/Region Code") then
//                         ShiptoCountry := CountryRec.Name;
//                     if ShiptoAddress_Rec.Get(salesInvoiceHeader."Ship-to Code") then begin
//                         ShiptoEmail := ShiptoAddress_Rec."E-Mail";
//                     end;
//                 end else begin
//                     Shiptoname := salesInvoiceHeader."Bill-to Name";
//                     ShiptoAdd := salesInvoiceHeader."Bill-to Address";
//                     ShiptoAdd2 := salesInvoiceHeader."Bill-to Address 2";
//                     ShiptoCity := salesInvoiceHeader."Bill-to City";
//                     ShiptoPostcode := salesInvoiceHeader."Bill-to Post Code";
//                     ShiptoCountrycode := salesInvoiceHeader."Bill-to Country/Region Code";
//                     ShiptoGSTIN := BilltoGst;
//                     ShiptoEmail := BilltoEmail;
//                     ShiptoPAN := BillToPAN;
//                     ShiptoFSSAI := BilltoFssai;
//                     if StateRec.Get(salesInvoiceHeader."GST Bill-to State Code") then begin
//                         ShiptoStatecodeGst := StateRec."State Code (GST Reg. No.)";
//                         ShiptoState := StateRec.Description;
//                     end;
//                     if CountryRec.Get(salesInvoiceHeader."Bill-to Country/Region Code") then
//                         ShiptoCountry := CountryRec.Name;
//                 end;
//                 //<<ShipToDetails


//                 EInvHead.Reset();
//                 EInvHead.SetRange("Document No.", salesInvoiceHeader."No.");
//                 EInvHead.SetRange("Document Type", EInvHead."Document Type"::Invoice);
//                 EInvHead.SetRange("Entry Type", EInvHead."Entry Type"::"Sales Invoice");
//                 if EInvHead.FindFirst then begin
//                     EInvHead.CalcFields("QR Code URL Image");
//                     if EInvHead."ACK Date" <> '' then
//                         ACKDate := EInvHead."ACK Date".Substring(1, 10)
//                     else
//                         ACKDate := '';
//                 end;

//                 // if ItemCharge = true then
//                 //     Heading := 'DEBIT NOTE'
//                 // else
//                 Heading := 'TAX INVOICE';


//                 BankAccount.Reset();
//                 BankAccount.SetRange("No.", salesInvoiceHeader."No.");
//                 if BankAccount.FindFirst() then
//                     BankAccount_BranchAddress := BankAccount.Address;



//                 PaymentTerms.Reset();
//                 PaymentTerms.SetRange(Code, salesInvoiceHeader."Payment Terms Code");
//                 if PaymentTerms.FindFirst() then
//                     ModeTermsOfPayment := PaymentTerms.Description;

//             end;


//         }


//     }
//     requestpage
//     {
//         SaveValues = true;
//         layout
//         {

//             area(content)
//             {

//                 field(NoofCopies; NoofCopies)
//                 {
//                     ApplicationArea = all;
//                 }
//                 // field(ItemCharge; ItemCharge)
//                 // {
//                 //     ApplicationArea = all;

//                 // }

//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
//     trigger OnInitReport()
//     var
//         myInt: Integer;
//     begin
//         compInfo.get();
//         compInfo.CalcFields(Picture);
//         NoOfCopies := 1;
//         BatchB := true;
//     end;

//     var
//         PartNo: Code[30];
//         ShiptoPAN_New: code[30];
//         customerREC: Record Customer;

//         ShipPanNo: Code[40];

//         //PPInvoiceHeader:Record 50120;
//         EInvHead: Record 50030;

//         Purchasepayble: Record "Purchases & Payables Setup";
//         Lo: Record Location;
//         FirstEntry: Boolean;
//         PaymentTerms: Record "Payment Terms";
//         ModeTermsOfPayment: code[30];
//         ACKDate: Text;
//         BankAccount: Record "Bank Account";
//         BankAccount_BranchAddress: Code[20];
//         SalesCommentLine: Record "Sales Comment Line";
//         SalesShipmentHeader: Record "Sales Shipment Header";
//         DeliveryNoteNo: Code[20];
//         P_LineCount: Integer;
//         RecSalesLine: Record 113;
//         RoundOff: Decimal;
//         CompStatecodegst: Code[10];
//         StateRec: Record State;
//         CountryRec: Record "Country/Region";
//         CompCountry: Text;
//         MaxNo: Integer;
//         TCSENtry: Record "TCS Entry";
//         TCSAmount: Decimal;
//         Comment_1: text;
//         Sales_Comnt: Record 44;
//         Comment1: Text;
//         Comment2: text;
//         compInfo: Record 79;
//         Rec_ILE: Record 32;
//         ValueEntrRec: Record 5802;
//         ILEInvNo: Code[20];
//         BatchNo: code[20];
//         BatchUOM: code[10];
//         BatchQty: Decimal;
//         BatchB: Boolean;
//         LotNo: Code[30];
//         NeedNo: Integer;
//         batch: Text;
//         Bqty: Decimal;
//         BUOM: Code[30];
//         mfg: Date;
//         exp: Date;
//         MfgDate: Date;
//         MfgDatecap: Text;
//         "Expiry Date": Text;
//         Expirydate: Date;
//         location: Record 14;
//         Locadd: Text;
//         locadd2: Text;
//         loccity: Text;
//         locstate: Text;
//         locpostcode: Text;
//         locstatecode: Code[10];
//         locstatecodegst: Code[10];
//         loccountrycode: Code[10];
//         loccountrycodegst: Code[10];
//         loccountry: Code[10];
//         locgst: Code[20];
//         locfssai: Code[20];
//         locemail: Text[30];

//         Shiptoname: Text;
//         ShiptoAdd: Text;
//         ShiptoAdd2: Text;
//         ShiptoCity: Text;
//         ShiptoEmail: Text;
//         ShiptoStatecode: Code[10];
//         ShiptoStatecodeGst: Code[10];
//         ShiptoPostcode: Code[10];
//         ShiptoGSTIN: Text;
//         ShiptoPAN: Text;
//         ShiptoFSSAI: Code[20];
//         ShiptoCountry: Text;
//         ShiptoCountrycode: Code[10];
//         ShiptoState: Text;
//         BilltoState: Text;
//         Billtostatecode: Code[10];
//         BilltostatecodeGst: Code[10];
//         BilltoGst: Code[20];
//         BilltoEmail: Text;
//         BilltoCountry: Text;
//         BilltoFssai: Code[20];
//         BilltoContact: Code[50];
//         Gstamt: Decimal;
//         LineTotal: Decimal;
//         Amountinwords2: array[2] of Text[100];
//         AmountinWord: array[2] of Text[100];
//         CustRec: Record Customer;
//         BillToPAN: Code[20];
//         UOM: Record 204;
//         UnitMeasure: Code[10];
//         Discount1: Decimal;
//         GSTRate: Decimal;
//         SalesInvoiceLine22: Record 113;
//         ShiptoAddress_Rec: Record 222;
//         ShipToStateName: Text;
//         GstAmount: Decimal;
//         ShipToCode_DP: code[10];
//         ShipTogstnumber: Code[30];
//         State_code: Record State;
//         NoOfLoops: Integer;
//         NoOfCopies: Integer;
//         CopyText: Text;
//         OutputNo: Integer;
//         Sno: Integer;
//         StateName: text;
//         ItemGSTRate: Decimal;
//         total2: Decimal;
//         totalgst: Decimal;
//         Cust: record 18;
//         AmountinWords: array[2] of Text[100];
//         SGST: Decimal;
//         CGST: Decimal;
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
//         IGST: Decimal;
//         CGSTper: Decimal;
//         SGSTper: Decimal;
//         IGSTper: Decimal;
//         cgst1: Decimal;
//         sgst1: Decimal;
//         igst1: Decimal;
//         Freight_: Decimal;
//         TotalAmount: Decimal;
//         Total: Decimal;
//         SalesINvLine: Record "Sales Invoice Line";
//         SalesINvHeader: Record 112;
//         Sale_Amount: Decimal;
//         ItemUnitOfMeasureRec: Record "Item Unit of Measure";
//         AlternetUnit: Decimal;
//         AlternetUnit1: Decimal;
//         AlternetUnit2: Decimal;
//         AlternetUnit3: Decimal;
//         UnitText: Text;
//         ItemRec: Record Item;
//         LotPrint: Text[100];
//         prevlot: text;
//         batchtext: text;
//         LotQty: Decimal;
//         ItemCharge: Boolean;
//         ValueEntryRec: Record "Value Entry";
//         ChargeItemNo: code[20];
//         ChargeItemDesc: Text;
//         ItemDesc: Text;
//         ILENO: Integer;
//         ItemLedRec: Record "Item Ledger Entry";
//         ILEOrderNo: Code[20];
//         SlesShipRec: Record "Sales Shipment Header";
//         RefOrdNo: Code[20];
//         SalesInvHdr: Record "Sales Invoice Header";
//         RefInvNo: Text;
//         ChargeAmt: Decimal;
//         Heading: text;





//         Notext1: array[2] of Text[100];
//         Notext2: array[2] of Text[100];
//         Text16526: Label 'ZERO';
//         Text16527: Label 'HUNDRED';
//         Text16528: Label 'AND';
//         Text16529: Label '%1 results in a written number that is too long.';
//         Text16532: Label 'ONE';
//         Text16533: Label 'TWO';
//         Text16534: Label 'THREE';
//         Text16535: Label 'FOUR';
//         Text16536: Label 'FIVE';
//         Text16537: Label 'SIX';
//         Text16538: Label 'SEVEN';
//         Text16539: Label 'EIGHT';
//         Text16540: Label 'NINE';
//         Text16541: Label 'TEN';
//         Text16542: Label 'ELEVEN';
//         Text16543: Label 'TWELVE';
//         Text16544: Label 'THIRTEEN';
//         Text16545: Label 'FOURTEEN';
//         Text16546: Label 'FIFTEEN';
//         Text16547: Label 'SIXTEEN';
//         Text16548: Label 'SEVENTEEN';
//         Text16549: Label 'EIGHTEEN';
//         Text16550: Label 'NINETEEN';
//         Text16551: Label 'TWENTY';
//         Text16552: Label 'THIRTY';
//         Text16553: Label 'FORTY';
//         Text16554: Label 'FIFTY';
//         Text16555: Label 'SIXTY';
//         Text16556: Label 'SEVENTY';
//         Text16557: Label 'EIGHTY';
//         Text16558: Label 'NINETY';
//         Text16559: Label 'THOUSAND';
//         Text16560: Label 'MILLION';
//         Text16561: Label 'BILLION';
//         Text16562: Label 'LAKH';
//         Text16563: Label 'CRORE';
//         OnesText: array[20] of Text[30];
//         TensText: array[10] of Text[30];
//         ExponentText: array[5] of Text[30];
//         AmountInWordsCaptionLbl: Label 'Amount (in words):';

//         Heading1: Label '"I/We hereby certify that my/our registration certificate under the Goods and Service Tax Act, 2017 is in force on the date on which the sale of the goods specified in this tax invoice is made by me/us and that the transaction of sale covered by this tax invoice has been effected by me/us and it shall be accounted for the turnover of sales while filing of return and the tax, if any, payable on the sale has been paid or shali be paid"';

//         Heading2: Label 'Declaration: We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct. The above mentioned products may be subject to U.S. Law. Re-export or transfer to restricted countries or denied parties contrary to U.S. or Local Law is strictly prohibited without the prior consent in writing of Avery Dennisons Law Department.';

//     procedure FormatNoText(var NoText: array[2] of Text[100]; No: Decimal; CurrencyCode: Code[10])
//     var
//         PrintExponent: Boolean;
//         Ones: Integer;
//         Tens: Integer;
//         Hundreds: Integer;
//         Exponent: Integer;
//         NoTextIndex: Integer;
//         Currency: Record 4;
//         TensDec: Integer;
//         OnesDec: Integer;
//     begin
//         CLEAR(NoText);
//         NoTextIndex := 1;
//         NoText[1] := '';

//         IF No < 1 THEN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526)
//         ELSE BEGIN
//             FOR Exponent := 4 DOWNTO 1 DO BEGIN
//                 PrintExponent := FALSE;
//                 IF No > 99999 THEN BEGIN
//                     Ones := No DIV (POWER(100, Exponent - 1) * 10);
//                     Hundreds := 0;
//                 END ELSE BEGIN
//                     Ones := No DIV POWER(1000, Exponent - 1);
//                     Hundreds := Ones DIV 100;
//                 END;
//                 Tens := (Ones MOD 100) DIV 10;
//                 Ones := Ones MOD 10;
//                 IF Hundreds > 0 THEN BEGIN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, Text16527);
//                 END;
//                 IF Tens >= 2 THEN BEGIN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
//                     IF Ones > 0 THEN
//                         AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
//                 END ELSE
//                     IF (Tens * 10 + Ones) > 0 THEN
//                         AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
//                 IF PrintExponent AND (Exponent > 1) THEN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
//                 IF No > 99999 THEN
//                     No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(100, Exponent - 1) * 10
//                 ELSE
//                     No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
//             END;
//         END;

//         IF CurrencyCode <> '' THEN BEGIN
//             Currency.GET(CurrencyCode);
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' ');
//         END ELSE
//             AddToNoText(NoText, NoTextIndex, PrintExponent, 'RUPEES');

//         AddToNoText(NoText, NoTextIndex, PrintExponent, Text16528);

//         TensDec := ((No * 100) MOD 100) DIV 10;
//         OnesDec := (No * 100) MOD 10;
//         IF TensDec >= 2 THEN BEGIN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
//             IF OnesDec > 0 THEN
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
//         END ELSE
//             IF (TensDec * 10 + OnesDec) > 0 THEN
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
//             ELSE
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526);
//         IF (CurrencyCode <> '') THEN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + '' + ' ONLY')
//         ELSE
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' PAISA ONLY');
//     end;

//     local procedure AddToNoText(var NoText: array[2] of Text[100]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
//     begin
//         PrintExponent := TRUE;

//         WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
//             NoTextIndex := NoTextIndex + 1;
//             IF NoTextIndex > ARRAYLEN(NoText) THEN
//                 ERROR(Text16529, AddText);
//         END;

//         NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
//     end;

//     procedure InitTextVariable()
//     begin
//         OnesText[1] := Text16532;
//         OnesText[2] := Text16533;
//         OnesText[3] := Text16534;
//         OnesText[4] := Text16535;
//         OnesText[5] := Text16536;
//         OnesText[6] := Text16537;
//         OnesText[7] := Text16538;
//         OnesText[8] := Text16539;
//         OnesText[9] := Text16540;
//         OnesText[10] := Text16541;
//         OnesText[11] := Text16542;
//         OnesText[12] := Text16543;
//         OnesText[13] := Text16544;
//         OnesText[14] := Text16545;
//         OnesText[15] := Text16546;
//         OnesText[16] := Text16547;
//         OnesText[17] := Text16548;
//         OnesText[18] := Text16549;
//         OnesText[19] := Text16550;

//         TensText[1] := '';
//         TensText[2] := Text16551;
//         TensText[3] := Text16552;
//         TensText[4] := Text16553;
//         TensText[5] := Text16554;
//         TensText[6] := Text16555;
//         TensText[7] := Text16556;
//         TensText[8] := Text16557;
//         TensText[9] := Text16558;

//         ExponentText[1] := '';
//         ExponentText[2] := Text16559;
//         ExponentText[3] := Text16562;
//         ExponentText[4] := Text16563;
//     end;
// }