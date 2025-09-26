// report 50113 MrReport2
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'SRC/Report/Test Report2.rdl';
//     Caption = 'Test Report2';

//     dataset
//     {
//         dataitem("Purchase Header"; "Purchase Header")
//         {
//             RequestFilterFields = "No.";

//             column(compinfo_Name; compinfo.Name) { }
//             column(compinfo_pic; compinfo.Picture) { }
//             column(compinfo_Email; compinfo."E-Mail") { }
//             column(compinfo_ph; compinfo."Phone No.") { }
//             column(compinfo_city; compinfo.City) { }
//             column(compinfo_post_Code; compinfo."Post Code") { }
//             column(compinfo_CIN; compinfo."Registration No.") { }
//             column(compinfo_add1; compinfo.Address) { }
//             column(compinfo_add2; compinfo."Address 2") { }
//             column(compinfo_website; compinfo."Home Page") { }
//             column(OtherReferences; OtherReferences) { }
//             column(Commodity; Commodity) { }
//             column(Validity; Validity) { }
//             column(Variety; Variety) { }
//             column(Deduction; Deduction) { }
//             column(PartOfLoading; PartOfLoading) { }
//             column(PartofDischarge; PartofDischarge) { }
//             column(Brokerage; Brokerage) { }
//             column(BrokerName; BrokerName) { }
//             column(QuantityAndQuantityFinalAt; QuantityAndQuantityFinalAt) { }
//             column(DeliveryTerms; DeliveryTerms) { }
//             column(Destination; Destination) { }
//             column(Posting_Date; Format("Posting Date", 0, 0)) { }
//             column(No_; "No.") { }
//             column(compinfo_Gst; compinfo."GST Registration No.") { }
//             column(State; State) { }

//             column(Ship_to_Name; "Ship-to Name") { }
//             column(ShiptoAddress_PurchaseHeader; "Ship-to Address") { }
//             column(ShiptoAddress2_PurchaseHeader; "Ship-to Address 2") { }
//             column(ShiptoCity_PurchaseHeader; "Ship-to City") { }
//             column(ShiptoPostCode_PurchaseHeader; "Ship-to Post Code") { }
//             column(ShiptoCountryRegionCode_PurchaseHeader; "Ship-to Country/Region Code") { }

//             column(Paymenters_code; Paymenters_code) { }
//             column(CGSTAmount; CGSTAmount) { }
//             column(SGSTAmount; SGSTAmount) { }
//             column(IGSTAmount; IGSTAmount) { }
//             column(Pay_to_Country_Region_Code; "Pay-to Country/Region Code") { }

//             column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name") { }
//             column(BuyfromAddress_PurchaseHeader; "Buy-from Address") { }
//             column(BuyfromAddress2_PurchaseHeader; "Buy-from Address 2") { }
//             column(BuyfromPostCode_PurchaseHeader; "Buy-from Post Code") { }
//             column(BuyfromCity_PurchaseHeader; "Buy-from City") { }
//             column(BuyfromCountryRegionCode_PurchaseHeader; "Buy-from Country/Region Code") { }

//             dataitem("Purchase Line"; "Purchase Line")
//             {
//                 DataItemLinkReference = "Purchase Header";
//                 DataItemLink = "Document No." = field("No.");

//                 column(Description; Description) { }
//                 column(Quantity; Quantity) { }
//                 column(Amount; Amount) { }
//                 column(Unit_of_Measure; "Unit of Measure") { }
//                 column(GSTGroupCode_PurchaseLine; "GST Group Code") { }
//                 column(LineAmount_PurchaseLine; "Line Amount") { }
//                 column(Unit_Price_LCY; "Unit Price (LCY)") { }
//                 column(Currency_Code; "Currency Code") { }
//                 column(SR_No; SR_No) { }
//                 column(LineCounter; "Line Amount") { }
//                 column(Amountinwords2; Amountinwords2[1]) { }
//                 column(Amount_to_usd; Amount_to_usd) { }

//                 trigger OnPreDataItem()
//                 begin
//                     Clear(SR_No);
//                     SR_No := 0;
//                 end;

//                 trigger OnAfterGetRecord()
//                 begin
//                     SR_No += 1;
//                     Amount_to_usd := Quantity * "Unit Price (LCY)";
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Clear(Paymenters_code);
//                 PaymentTerms.Reset();
//                 PaymentTerms.SetRange(Code, "Purchase Header"."Payment Terms Code");
//                 if PaymentTerms.FindFirst() then
//                     Paymenters_code := PaymentTerms.Description;

//                 Clear(CGSTAmount);
//                 Clear(SGSTAmount);
//                 Clear(IGSTAmount);
//                 Clear(TotalAmount);
//                 Clear(TotalAmount1);
//                 Clear(TotalAmount2);

//                 GSTSetup.Get();

//                 PurchaseLine.Reset();
//                 PurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
//                 if PurchaseLine.FindSet() then
//                     repeat
//                         TaxTransValue.Reset();
//                         TaxTransValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
//                         TaxTransValue.SetRange("Tax Record ID", PurchaseLine.RecordId());
//                         TaxTransValue.SetRange("Value Type", TaxTransValue."Value Type"::COMPONENT);
//                         TaxTransValue.SetFilter(Percent, '<>%1', 0);
//                         if TaxTransValue.FindSet() then
//                             repeat
//                                 TaxComponentName := TaxTransValue.GetAttributeColumName();
//                                 case TaxComponentName of
//                                     'CGST':
//                                         begin
//                                             Evaluate(CGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount += CGSTAmount;
//                                         end;
//                                     'SGST':
//                                         begin
//                                             Evaluate(SGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount1 += SGSTAmount;
//                                         end;
//                                     'IGST':
//                                         begin
//                                             Evaluate(IGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount2 += IGSTAmount;
//                                         end;
//                                 end;
//                             until TaxTransValue.Next() = 0;
//                     until PurchaseLine.Next() = 0;

//                 TotalAmountNew := 0;
//                 PurchaseLine.Reset();
//                 PurchaseLine.SetRange("Document No.", "No.");
//                 if PurchaseLine.FindFirst() then
//                     repeat
//                         TotalAmountNew += PurchaseLine."Line Amount";
//                     until PurchaseLine.Next() = 0;

//                 InitTextVariableFR();
//                 line_am_new := Round(TotalAmountNew, 0.01);

//                 if line_am_new < 100 then
//                     Amountinwords2[1] := GetFrenchNumberText(Round(line_am_new))
//                 else
//                     Amountinwords2[1] := Format(line_am_new);
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content) { }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName) { }
//             }
//         }
//     }

//     trigger OnPreReport()
//     begin
//         compinfo.Get();
//         compinfo.CalcFields(Picture);
//     end;

//     var
//         Amount_to_usd: Decimal;
//         TotalAmountNew: Decimal;
//         TaxComponentName: Text;
//         PaymentTerms: Record "Payment Terms";
//         Paymenters_code: Code[100];
//         TaxTransValue: Record "Tax Transaction Value";
//         SGSTAmount: Decimal;
//         CGSTAmount: Decimal;
//         TotalAmount: Decimal;
//         TotalAmount1: Decimal;
//         TotalAmount2: Decimal;
//         IGSTAmount: Decimal;
//         PurchaseLine: Record "Purchase Line";
//         compinfo: Record "Company Information";
//         Purchhead: Record "Purchase Header";
//         GSTSetup: Record "GST Setup";
//         RecPurchLine: Record "Purchase Line";
//         Amountinwords2: array[2] of Text[100];
//         SR_No: Integer;
//         Purchase: Record "Purchase Line";
//         line_am_new: Decimal;

//         Text16529: Label 'The text "%1" is too long to be added to the amount in words.';
//         AmountInWordsCaptionLbl: Label 'Amount (in words):';

//         Heading1: Label '"I/We hereby certify that my/our registration certificate under the Goods and Service Tax Act, 2017 ...';
//         Heading2: Label 'Declaration: We declare that this invoice shows the actual price of the goods ...';

//         TextFR_0: Label 'zéro';
//         TextFR_100: Label 'cent';
//         TextFR_And: Label 'et';
//         TextFR_1: Label 'un';
//         TextFR_2: Label 'deux';
//         TextFR_3: Label 'trois';
//         TextFR_4: Label 'quatre';
//         TextFR_5: Label 'cinq';
//         TextFR_6: Label 'six';
//         TextFR_7: Label 'sept';
//         TextFR_8: Label 'huit';
//         TextFR_9: Label 'neuf';
//         TextFR_10: Label 'dix';
//         TextFR_11: Label 'onze';
//         TextFR_12: Label 'douze';
//         TextFR_13: Label 'treize';
//         TextFR_14: Label 'quatorze';
//         TextFR_15: Label 'quinze';
//         TextFR_16: Label 'seize';
//         TextFR_17: Label 'dix-sept';
//         TextFR_18: Label 'dix-huit';
//         TextFR_19: Label 'dix-neuf';
//         TextFR_20: Label 'vingt';
//         TextFR_30: Label 'trente';
//         TextFR_40: Label 'quarante';
//         TextFR_50: Label 'cinquante';
//         TextFR_60: Label 'soixante';
//         TextFR_70: Label 'soixante-dix';
//         TextFR_80: Label 'quatre-vingt';
//         TextFR_90: Label 'quatre-vingt-dix';
//         TextFR_Thousand: Label 'mille';
//         TextFR_Million: Label 'million';
//         TextFR_Billion: Label 'milliard';
//         TextFR_Euros: Label 'EUROS';
//         TextFR_Cents: Label 'CENTIMES';

//         OnesTextFR: array[20] of Text[30];
//         TensTextFR: array[10] of Text[30];
//         ExponentTextFR: array[4] of Text[30];

//     local procedure GetFrenchNumberText(No: Integer): Text
//     begin
//         if No = 0 then
//             exit(TextFR_0);

//         if No <= 19 then
//             exit(OnesTextFR[No]);

//         if No < 100 then begin
//             if No mod 10 = 0 then
//                 exit(TensTextFR[No div 10])
//             else
//                 exit(TensTextFR[No div 10] + '-' + OnesTextFR[No mod 10]);
//         end;

//         exit(Format(No));
//     end;

//     local procedure AddToNoText(var NoText: array[2] of Text[100]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
//     begin
//         PrintExponent := TRUE;

//         while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
//             NoTextIndex += 1;
//             if NoTextIndex > ArrayLen(NoText) then
//                 Error(Text16529, AddText);
//         end;

//         NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
//     end;

//     procedure InitTextVariableFR()
//     begin
//         OnesTextFR[1] := TextFR_1;
//         OnesTextFR[2] := TextFR_2;
//         OnesTextFR[3] := TextFR_3;
//         OnesTextFR[4] := TextFR_4;
//         OnesTextFR[5] := TextFR_5;
//         OnesTextFR[6] := TextFR_6;
//         OnesTextFR[7] := TextFR_7;
//         OnesTextFR[8] := TextFR_8;
//         OnesTextFR[9] := TextFR_9;
//         OnesTextFR[10] := TextFR_10;
//         OnesTextFR[11] := TextFR_11;
//         OnesTextFR[12] := TextFR_12;
//         OnesTextFR[13] := TextFR_13;
//         OnesTextFR[14] := TextFR_14;
//         OnesTextFR[15] := TextFR_15;
//         OnesTextFR[16] := TextFR_16;
//         OnesTextFR[17] := TextFR_17;
//         OnesTextFR[18] := TextFR_18;
//         OnesTextFR[19] := TextFR_19;

//         TensTextFR[2] := TextFR_20;
//         TensTextFR[3] := TextFR_30;
//         TensTextFR[4] := TextFR_40;
//         TensTextFR[5] := TextFR_50;
//         TensTextFR[6] := TextFR_60;
//         TensTextFR[7] := TextFR_70;
//         TensTextFR[8] := TextFR_80;
//         TensTextFR[9] := TextFR_90;

//         ExponentTextFR[2] := TextFR_Thousand;
//         ExponentTextFR[3] := TextFR_Million;
//         ExponentTextFR[4] := TextFR_Billion;
//     end;
// }