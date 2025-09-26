// Report 50006 "Purchase Order_Aquagri"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Purchase Order_Aquagri.rdl';
//     PreviewMode = PrintLayout;
//     Caption = 'purchase Order1';
//     ApplicationArea = all;
//     UsageCategory = ReportsAndAnalysis;

//     dataset
//     {
//         dataitem("Purchase Header"; "Purchase Header")
//         {
//             DataItemTableView = sorting("Document Type", "No.") order(ascending) where("Document Type" = const(Order));
//             RequestFilterFields = "No.", "Document Type", "Buy-from Vendor No.";
//             column(ven_State_code; ven_State_code)
//             { }
//             column(Loc_Name; Loc_Name)
//             { }
//             column(Loc_Add1; Loc_Add1)
//             { }
//             column(Loc_Add2; Loc_Add2)
//             { }
//             column(loc_city; loc_city)
//             { }
//             column(loc_Postcode; loc_Postcode)
//             { }
//             column(Loc_telp; Loc_telp)
//             { }
//             column(Loc_Email; Loc_Email)
//             { }
//             column(Loc_GSTIN; Loc_GSTIN)
//             { }

//             column(Payment_Terms_Code; "Payment Terms Code")
//             { }

//             column(StateName; RecState.Description)
//             { }
//             column(AmountinWord; AmountinWord[1])
//             { }
//             column(TotalAmountrec; TotalAmountrec)
//             {
//             }
//             column(CompInfo; CompInfo."Company Registration  No.")
//             { }
//             column(PONo; "Purchase Header"."No.")
//             {
//             }
//             column(BuyFromVendorNo; "Purchase Header"."Buy-from Vendor No.")
//             {
//             }
//             column(BuyFromVendorName; "Purchase Header"."Buy-from Vendor Name")
//             {
//             }
//             column(BuyFromVendorAddress; "Purchase Header"."Buy-from Address")
//             {
//             }
//             column(BuyFromVendorName2; "Purchase Header"."Buy-from Vendor Name 2")
//             {
//             }
//             column(BuyFromVendorAddress2; "Purchase Header"."Buy-from Address 2")
//             {
//             }
//             column(BuyFromCity; "Purchase Header"."Buy-from City")
//             {
//             }
//             column(BuyFromPostCode; "Purchase Header"."Buy-from Post Code")
//             {
//             }
//             column(OrderDate; "Purchase Header"."Order Date")
//             {
//             }
//             column(YourRefrence; "Purchase Header"."Your Reference")
//             {
//             }
//             column(DocumentDate; "Purchase Header"."Document Date")
//             {
//             }
//             column(PromisedReceiptDate; "Purchase Header"."Promised Receipt Date")
//             {
//             }
//             column(CompInfoGstRegNo; CompInfo."GST Registration No.")
//             {
//             }
//             column(CompInfoPicture; CompInfo.Picture)
//             {
//             }
//             column(CompInfoName; CompInfo.Name)
//             {
//             }
//             column(Amend; amend)
//             {
//             }
//             column(DataArchived; PurchaseHeaderArchive."Date Archived")
//             {
//             }
//             column(InWords; InWords[1])
//             {
//             }
//             column(PaymentTermCodes; "Purchase Header"."Payment Terms Code")
//             {
//             }
//             column(Shipdesc; Shipdesc)
//             {
//             }
//             column(CName; RecLocations.Name)
//             {
//             }
//             column(CAdd; CompInfo.Address)
//             {
//             }
//             column(CAdd2; CompInfo."Address 2")
//             {
//             }
//             column(CCity; CompInfo.City)
//             {
//             }
//             column(Cpostcode; CompInfo."Post Code")
//             {
//             }
//             column(Cstate; CompInfo."State Code")
//             {
//             }
//             column(CGSTRegNo; CompInfo."GST Registration No.")
//             {
//             }
//             column(CEmail; CompInfo."E-Mail")
//             {
//             }
//             column(CphoneNo; CompInfo."Phone No.")
//             {
//             }
//             column(ShipmentMethodCode_PurchaseHeader; "Purchase Header"."Shipment Method Code")
//             {
//             }
//             // column(CINNo; CompInfo."Company Registration  No.")
//             // {
//             // }
//             column(CINNo; '')
//             {
//             }

//             column(AmounttoVendor_PurchaseHeader; '')
//             {
//             }
//             // column(AmounttoVendor_PurchaseHeader; "Purchase Header"."Amount to Vendor")
//             // {
//             // }
//             column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
//             {
//             }
//             column(State2; State2)
//             {
//             }
//             column(VendorGSTRegNo_PurchaseHeader; "Purchase Header"."Vendor GST Reg. No.")
//             {
//             }
//             column(StateCode; CompInfo."State Code")
//             {
//             }
//             column(SpecialInstructions_PurchaseHeader; "Purchase Header"."Special Instructions")
//             {
//             }
//             column(Freight; Freight)
//             {
//             }
//             column(PaymentDesc; PaymentDesc)
//             {
//             }
//             column(DeliveryAddress_PurchaseHeader; "Purchase Header"."Delivery Address1")
//             {
//             }
//             column(CurrencyCode_PurchaseHeader; "Purchase Header"."Currency Code")
//             {
//             }
//             column(DeliveryAddress2_PurchaseHeader; "Purchase Header"."Delivery Address2")
//             {
//             }
//             dataitem("Purchase Line"; "Purchase Line")
//             {
//                 DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

//                 column(No; "Purchase Line"."No.")
//                 {
//                 }
//                 column(Description; "Purchase Line".Description)
//                 {
//                 }
//                 column(UnitOfMeasureCode; "Purchase Line"."Unit of Measure Code")
//                 {
//                 }
//                 column(Qty; "Purchase Line".Quantity)
//                 {
//                 }
//                 column(PlanReceiptDate; Format("Purchase Line"."Planned Receipt Date"))
//                 {
//                 }
//                 column(LineDiscount; "Purchase Line"."Line Discount %")
//                 {
//                 }
//                 column(DirectUnitCost; "Purchase Line"."Direct Unit Cost")
//                 {
//                 }
//                 // column(GST; ROUND("Purchase Line"."GST %", 0.01, '='))
//                 // {
//                 // }
//                 column(GST; '')
//                 {
//                 }
//                 column(HSNSAC; "Purchase Line"."HSN/SAC Code")
//                 {
//                 }
//                 // column(TotalGSTamount; "Purchase Line"."Total GST Amount")
//                 // {
//                 // }
//                 column(TotalGSTamount; '')
//                 {
//                 }
//                 column(AmounttoVendor; '')
//                 {
//                 }
//                 // column(AmounttoVendor; "Purchase Line"."Amount To Vendor")
//                 // {
//                 // }
//                 column(SNo; SNo)
//                 {
//                 }
//                 column(DrawingNo; drawingno)
//                 {
//                 }
//                 column(value; Value)
//                 {
//                 }
//                 column(GSTAmt; GSTAmt)
//                 {
//                 }
//                 column(GstPerc; GstPerc)
//                 {
//                 }
//                 column(CGSTAmt; CGSTAmt)
//                 {
//                 }
//                 column(CgstPerc; CgstPerc)
//                 {
//                 }
//                 column(SGSTAmt; SGSTAmt)
//                 {
//                 }
//                 column(SgstPerc; SgstPerc)
//                 {
//                 }
//                 column(IGSTAmt; IGSTAmt)
//                 {
//                 }
//                 column(IGSTperc; IGSTperc)
//                 {
//                 }
//                 column(Total_perc; Total_perc)
//                 {

//                 }
//                 column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
//                 {
//                 }
//                 column(TotalAmount; TotalAmount)
//                 {
//                 }
//                 column(Currency; GeneralLedgerSetup."LCY Code")
//                 {
//                 }
//                 column(TotalGstAmt; TotalGstAmt)
//                 { }
//                 column(SaveTotalAmt; SaveTotalAmt)
//                 { }
//                 column(IGSTAmount_2; IGSTAmount_2)
//                 {

//                 }
//                 column(SGSTAMOUNT_2; SGSTAMOUNT_2)
//                 {

//                 }
//                 column(CGSTAMOUNT_2; CGSTAMOUNT_2)
//                 {

//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     SNo := SNo + 1;


//                     CGSTAMOUNT_2 := 0;
//                     IGSTAmount_2 := 0;
//                     SGSTAMOUNT_2 := 0;

//                     SalesLine_2.Reset();
//                     SalesLine_2.SetRange("Document No.", "Purchase Line"."Document No.");
//                     SalesLine_2.SetRange("Line No.", "Purchase Line"."Line No.");

//                     if SalesLine_2.FindFirst() then
//                         repeat

//                             TaxInfomation.Reset();
//                             TaxInfomation.SetFilter("Tax Record ID", '%1', SalesLine_2.RecordId);
//                             TaxInfomation.SetFilter("Value Type", '%1', TaxInfomation."Value Type"::COMPONENT);

//                             // TaxInfomation.SetFilter("Value Type", '%1|%2', TaxInfomation."Value Type"::COMPONENT, TaxInfomation."Value Type"::COLUMN);
//                             TaxInfomation.SetRange("Visible on Interface", true);

//                             if TaxInfomation.FindFirst() then
//                                 repeat
//                                     ComponentAmt := TaxTypeObjHelper.GetComponentAmountFrmTransValue(TaxInfomation);
//                                     if TaxInfomation.GetAttributeColumName = 'CGST' then begin
//                                         CGSTAMOUNT_2 += ComponentAmt;
//                                         //CGSTRate := TaxInfomation.Percent;
//                                     end;
//                                     if TaxInfomation.GetAttributeColumName = 'SGST' then begin
//                                         SGSTAMOUNT_2 += ComponentAmt;
//                                         // SGSTRate := TaxInfomation.Percent;
//                                     end;
//                                     if TaxInfomation.GetAttributeColumName = 'IGST' then begin
//                                         IGSTAmount_2 += ComponentAmt;
//                                         //  IGSTRate := TaxInfomation.Percent;
//                                     end;
//                                 until TaxInfomation.Next() = 0;
//                         until SalesLine_2.Next() = 0;



//                 end;

//                 trigger OnPostDataItem()
//                 begin
//                     //SNo:=0;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     // CurrReport.CreateTotals(Value);
//                     // CurrReport.CreateTotals("Purchase Line"."Amount To Vendor");


//                     ShipmentMethod.Reset;
//                     ShipmentMethod.SetRange(ShipmentMethod.Code, "Purchase Header"."Shipment Method Code");
//                     if ShipmentMethod.Find('-') then
//                         repeat
//                             Shipdesc := ShipmentMethod.Description;
//                         until ShipmentMethod.Next = 0;
//                     if "Purchase Line"."Currency Code" = '' then
//                         ccode := 'INR'
//                     else begin
//                         PurchaseLine.Reset;
//                         PurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
//                         if PurchaseLine.Find('-') then
//                             repeat
//                                 ccode := PurchaseLine."Currency Code";
//                             until PurchaseLine.Next = 0;
//                     end;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//                 SalesLine: Record "Purchase Line";
//             begin
//                 IGSTAmt := 0;
//                 IGSTperc := 0;
//                 SGSTAmt := 0;
//                 SgstPerc := 0;
//                 CGSTAmt := 0;
//                 CgstPerc := 0;
//                 TotalGstAmt := 0;
//                 TotalAmountrec := 0;
//                 Total_perc := 0;
//                 TotalLineAmount := 0;


//                 Clear(GSTBaseAmount);
//                 SalesLine.Reset;
//                 SalesLine.SetRange("Document No.", "No.");
//                 if SalesLine.FindSet then
//                     repeat
//                         TaxInfomation.Reset();
//                         TaxInfomation.SetFilter("Tax Record ID", '%1', SalesLine.RecordId);

//                         TaxInfomation.SetFilter("Value Type", '%1', TaxInfomation."Value Type"::COMPONENT);
//                         TaxInfomation.SetRange("Visible on Interface", true);

//                         if TaxInfomation.FindSet() then
//                             repeat
//                                 ComponentAmt := TaxTypeObjHelper.GetComponentAmountFrmTransValue(TaxInfomation);
//                                 if TaxInfomation.GetAttributeColumName = 'CGST' then begin
//                                     CGSTAmt += ComponentAmt;
//                                     CgstPerc := TaxInfomation.Percent;

//                                 end;
//                                 if TaxInfomation.GetAttributeColumName = 'SGST' then begin
//                                     SGSTAmt += ComponentAmt;
//                                     SgstPerc := TaxInfomation.Percent;

//                                 end;
//                                 if TaxInfomation.GetAttributeColumName = 'IGST' then begin
//                                     IGSTAmt += ComponentAmt;
//                                     IGSTperc := TaxInfomation.Percent;

//                                 end;
//                                 if TaxInfomation.GetAttributeColumName = 'GST Base Amount' then begin
//                                     GSTBaseAmount := ComponentAmt;
//                                 end;
//                             until TaxInfomation.Next() = 0;

//                     until SalesLine.Next() = 0;

//                 PurChseLine_Rec.Reset();
//                 PurChseLine_Rec.SetRange("Document No.", "No.");
//                 if PurChseLine_Rec.FindFirst() then
//                     repeat
//                         TotalLineAmount += PurChseLine_Rec."Line Amount";
//                     until PurChseLine_Rec.Next() = 0;

//                 Total_perc := IGSTperc + SgstPerc + CgstPerc;
//                 TotalGstAmt := (IGSTAmt + SGSTAmt + CGSTAmt);
//                 TotalAmountrec := TotalLineAmount + IGSTAmt + SGSTAmt + CGSTAmt;
//                 // Message('total gst %1', TotalGstAmt);


//                 CLEAR(AmountinWord);
//                 InitTextVariable;
//                 TotalAmountrec := round(TotalAmountrec, 0.01);
//                 FormatNoText(Notext1, TotalAmountrec, "Purchase Header"."Currency Code");
//                 AmountinWord[1] := Notext1[1];


//                 Clear(Loc_Name);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_Name := rec_LOc.Name;
//                     until rec_LOc.Next() = 0;



//                 Clear(Loc_Add1);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_Add1 := rec_LOc.Address;
//                     until rec_LOc.Next() = 0;



//                 Clear(Loc_Add2);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_Add2 := rec_LOc."Address 2";
//                     until rec_LOc.Next() = 0;

//                 Clear(Loc_telp);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_telp := rec_LOc."Phone No."
//                     until rec_LOc.Next() = 0;



//                 Clear(Loc_Email);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_Email := rec_LOc."E-Mail";
//                     until rec_LOc.Next() = 0;



//                 Clear(Loc_GSTIN);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         Loc_GSTIN := rec_LOc."GST Registration No.";
//                     until rec_LOc.Next() = 0;

//                 Clear(loc_city);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         loc_city := rec_LOc.City;
//                     until rec_LOc.Next() = 0;


//                 Clear(loc_Postcode);
//                 rec_LOc.Reset();
//                 rec_LOc.SetRange(code, "Purchase Header"."Location Code");
//                 if rec_LOc.FindFirst() then
//                     repeat
//                         loc_Postcode := rec_LOc."Post Code";
//                     until rec_LOc.Next() = 0;



//                 Clear(ven_State_code);
//                 rec_ven.Reset();
//                 rec_ven.SetRange("No.", "Purchase Header"."Buy-from Vendor No.");
//                 if rec_ven.FindFirst() then
//                     repeat
//                         ven_State_code := rec_ven."State Code";
//                     until rec_ven.Next() = 0;


//             end;



//             trigger OnPreDataItem()
//             begin


//                 amend := 0;
//                 PurchaseHeaderArchive.Reset;

//                 PurchaseHeaderArchive.SetRange("No.", "Purchase Header"."No.");
//                 if PurchaseHeaderArchive.FindFirst then
//                     repeat
//                         if PurchaseHeaderArchive."Version No." > 0 then
//                             amend := PurchaseHeaderArchive."Version No."
//                         else
//                             amend := 0
//                     until PurchaseHeaderArchive.Next = 0;
//                 State1.SetFilter(State1.Code, CompInfo."State Code");
//                 if State1.Find('-') then
//                     State2 := State1.Description;
//                 //SNo := 0;    //swap
//                 CompInfo.Get();
//                 CompInfo.CalcFields(Picture);
//                 if Vndr.Get("Purchase Header"."Buy-from Vendor No.") then begin
//                     // "TINNo." := Vndr."T.I.N. No.";
//                     // "ECCNo." := Vndr."E.C.C. No.";
//                     // Range := Vndr.Range;
//                     // Collectorate := Vndr.Collectorate;
//                     "PANNo." := Vndr."P.A.N. No.";

//                 end;

//                 if amend > 0 then
//                     Labeltxt := 'PURCHASE ORDER AMENDMENT'
//                 else
//                     Labeltxt := 'PURCHASE ORDER';
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         IGSTAmount_2: Decimal;
//         CGSTAMOUNT_2: Decimal;
//         SGSTAMOUNT_2: Decimal;
//         SalesLine_2: Record "Purchase Line";


//         rec_ven: Record Vendor;
//         ven_State_code: Code[50];
//         rec_LOc: Record Location;
//         Loc_Name: Text[50];
//         Loc_Add1: Code[50];
//         Loc_Add2: Code[50];
//         loc_city: Code[50];
//         loc_Postcode: Code[50];
//         Loc_telp: Code[50];
//         Loc_Email: Code[50];
//         Loc_GSTIN: Code[50];
//         TotalAmountrec: Decimal;
//         PurChseLine_Rec: Record "Purchase Line";
//         DetailTaxPer: Decimal;
//         TaxAmount: Decimal;
//         DetailVendorLedger: Record "Detailed Vendor Ledg. Entry";
//         CompInfo: Record "Company Information";
//         State1: Record State;
//         State2: Text[30];
//         SNo: Integer;
//         InWords: array[1] of Text[250];
//         InFigs: Decimal;
//         ShpMthDesc: Text[30];
//         Vndr: Record Vendor;
//         ShpMthCode: Code[10];
//         ShipMthd: Record "Shipment Method";
//         "TINNo.": Code[20];
//         "ECCNo.": Code[20];
//         Range: Code[20];
//         Collectorate: Code[20];
//         "PANNo.": Code[20];
//         Vend: Record Vendor;
//         "CSTNo.": Code[20];
//         ccode: Code[20];
//         stno: Code[20];
//         qty: Text[30];
//         Value: Decimal;
//         check: Codeunit "Report Helpers";
//         choice: Option ,"purchase order","purchase order amendment";
//         amdate: Date;
//         Labeltxt: Text[30];
//         ShipmentMethod: Record "Shipment Method";
//         Shipdesc: Text[150];
//         num: Integer;
//         itemrec: Record Item;
//         drawingno: Code[30];
//         PurchaseHeaderArchive: Record "Purchase Header Archive";
//         PurchaseLine: Record "Purchase Line";
//         LineNo: Code[20];
//         Comment: Text[250];
//         Comment2: Text[250];
//         Comment3: Text[250];
//         Comment4: Text[250];
//         RecLocations: Record Location;
//         amend: Integer;
//         CName: Text;
//         CAdd: Text;
//         CAdd2: Text;
//         CCity: Text;
//         Cpostcode: Code[10];
//         Cstate: Text;
//         CphoneNo: Code[50];
//         CEmail: Text;
//         CGSTRegNo: Code[20];
//         // DetailedGSTLedgerBuffer: Record "Detailed GST Entry Buffer";
//         GSTAmt: Decimal;
//         GstPerc: Decimal;
//         CGSTAmt: Decimal;
//         CgstPerc: Decimal;
//         SGSTAmt: Decimal;
//         SgstPerc: Decimal;
//         IGSTAmt: Decimal;
//         IGSTperc: Decimal;
//         TotalGstAmt: Decimal;
//         TaxInfomation: Record "Tax Transaction Value";
//         // totalgst: Decimal;
//         // SGST: Decimal;
//         // CGST: Decimal;
//         // SGSTper: Decimal;
//         GSTBaseAmount: Decimal;
//         ComponentAmt: Decimal;
//         TaxTypeObjHelper: Codeunit "Tax Type Object Helper";
//         TotalAmount: Decimal;
//         TotalLineAmount: Decimal;
//         RecState: Record State;
//         StateName: Text;
//         StateCode: Code[10];
//         // StructureOrderLineDetails: Record "Structure Order Line Details";
//         Freight: Decimal;
//         Insurance: Decimal;
//         // Str_Order_Dtl: Record "Structure Order Details";
//         PaymentTerms: Record "Payment Terms";
//         PaymentDesc: Text[20];
//         DeliveryAdd: Text[250];
//         RecDeliveryAddress: Record "Look up Table";
//         GeneralLedgerSetup: Record "General Ledger Setup";
//         Total_perc: Decimal;
//         SaveTotalAmt: Decimal;
//         RepCheck: codeunit 50001;
//         saveInword: Decimal;
//         AmountinWord: array[2] of Text[100];
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