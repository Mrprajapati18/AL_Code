// report 50103 MrReport
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'SRC/Report/Test Report.rdl';
//     Caption = 'Test Report';

//     dataset
//     {
//         dataitem("Purchase Header"; "Purchase Header")

//         {
//             RequestFilterFields = "No.";

//             column(compinfo_Name; compinfo.Name)
//             { }
//             column(compinfo_pic; compinfo.Picture)
//             { }
//             column(compinfo_Email; compinfo."E-Mail")
//             { }

//             column(compinfo_ph; compinfo."Phone No.")
//             {
//             }
//             column(compinfo_city; compinfo.City)
//             {

//             }
//             column(compinfo_post_Code; compinfo."Post Code")
//             { }


//             column(compinfo_CIN; compinfo."Registration No.")
//             { }

//             column(compinfo_add1; compinfo.Address)
//             { }
//             column(compinfo_add2; compinfo."Address 2")
//             { }

//             column(compinfo_website; compinfo."Home Page")
//             { }

//             // Using the Page Extension
//             column(OtherReferences; OtherReferences)
//             {
//             }
//             column(Commodity; Commodity)
//             {
//             }
//             column(Validity; Validity)
//             {
//             }

//             column(Variety; Variety)
//             {

//             }
//             column(Deduction; Deduction)
//             {
//             }
//             column(PartOfLoading; PartOfLoading)
//             { }
//             column(PartofDischarge; PartofDischarge)
//             { }
//             column(Brokerage; Brokerage)
//             {
//             }
//             column(BrokerName; BrokerName)
//             { }
//             column(QuantityAndQuantityFinalAt; QuantityAndQuantityFinalAt)
//             { }
//             column(DeliveryTerms; DeliveryTerms)
//             { }
//             column(Destination; Destination)
//             { }
//             // Remove the time from date
//             column(Posting_Date; Format("Posting Date", 0, 0))
//             { }
//             column(No_; "No.")
//             { }

//             column(compinfo_Gst; compinfo."GST Registration No.")
//             { }
//             column(State; State)
//             { }
//             column(Ship_to_Name; "Ship-to Name")
//             {

//             }
//             column(ShiptoAddress_PurchaseHeader; "Ship-to Address")
//             {
//             }
//             column(ShiptoAddress2_PurchaseHeader; "Ship-to Address 2")
//             {
//             }
//             column(ShiptoCity_PurchaseHeader; "Ship-to City")
//             {
//             }
//             column(ShiptoPostCode_PurchaseHeader; "Ship-to Post Code")
//             {
//             }
//             column(ShiptoCountryRegionCode_PurchaseHeader; "Ship-to Country/Region Code")
//             {
//             }
//             column(Paymenters_code; Paymenters_code)
//             {
//             }
//             column(CGSTAmount; CGSTAmount)
//             {

//             }
//             column(SGSTAmount; SGSTAmount)
//             {

//             }
//             column(IGSTAmount; IGSTAmount)
//             {

//             }

//             column(Pay_to_Country_Region_Code; "Pay-to Country/Region Code")
//             {

//             }

//             // Supplier  Bill from

//             column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
//             {
//             }
//             column(BuyfromAddress_PurchaseHeader; "Buy-from Address")
//             {
//             }
//             column(BuyfromAddress2_PurchaseHeader; "Buy-from Address 2")
//             {
//             }

//             column(BuyfromPostCode_PurchaseHeader; "Buy-from Post Code")
//             {
//             }
//             column(BuyfromCity_PurchaseHeader; "Buy-from City")
//             {
//             }
//             column(BuyfromCountryRegionCode_PurchaseHeader; "Buy-from Country/Region Code")
//             {
//             }

//             dataitem("Purchase Line"; "Purchase Line")
//             {
//                 DataItemLinkReference = "Purchase Header";
//                 DataItemLink = "Document No." = field("No.");

//                 column(Description; Description)
//                 {
//                 }
//                 column(Quantity; Quantity)
//                 {
//                 }
//                 column(Amount; Amount)
//                 {
//                 }

//                 column(Unit_of_Measure; "Unit of Measure")
//                 {
//                 }
//                 // column(LineDiscount_PurchaseLine; "Line Discount %")
//                 // {
//                 // }
//                 column(GSTGroupCode_PurchaseLine; "GST Group Code")
//                 {
//                 }
//                 column(LineAmount_PurchaseLine; "Line Amount")
//                 {
//                 }
//                 column(Unit_Price_LCY; "Unit Price (LCY)")
//                 {
//                 }

//                 column(Currency_Code; "Currency Code")
//                 {
//                 }
//                 column(SR_No; SR_No)
//                 {
//                 }
//                 column(LineCounter; "Line Amount")
//                 { }

//                 column(Amountinwords2; Amountinwords2[1])
//                 { }
//                 column(Amount_to_usd; Amount_to_usd)
//                 {
//                 }

//                 trigger OnPreDataItem()
//                 var
//                     myInt: Integer;
//                 begin
//                     Clear(SR_No);
//                     SR_No := 0;


//                 end;

//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     SR_No += 1;
//                     Amount_to_usd := Quantity * "Unit Price (LCY)";
//                 end;

//             }
//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 Clear(Paymenters_code);
//                 PaymentTerms.Reset();
//                 PaymentTerms.SetRange(Code, "Purchase Header"."Payment Terms Code");
//                 if PaymentTerms.FindFirst() then begin
//                     Paymenters_code := PaymentTerms.Description;
//                 end;

//                 Clear(CGSTAmount);
//                 Clear(SGSTAmount);
//                 Clear(IGSTAmount);
//                 Clear(TotalAmount);
//                 Clear(TotalAmount1);
//                 Clear(TotalAmount2);
//                 PurchaseLine.Reset();
//                 PurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
//                 IF PurchaseLine.FindSet() then
//                     repeat
//                         GSTSetup.Get();
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
//                                             evaluate(CGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount += CGSTAmount;
//                                         end;
//                                     'SGST':
//                                         begin
//                                             evaluate(SGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount1 += SGSTAmount;
//                                         end;
//                                     'IGST':
//                                         begin
//                                             evaluate(IGSTAmount, TaxTransValue."Column Value");
//                                             TotalAmount2 += IGSTAmount;
//                                         end;
//                                 end;
//                             until TaxTransValue.Next() = 0;
//                     UNTIL PurchaseLine.Next() = 0;

//                 Clear("AmountinWords2");
//                 PurchaseLine.Reset();
//                 PurchaseLine.SetRange("Document No.", "No.");
//                 if PurchaseLine.FindFirst() then begin
//                     repeat
//                         TotalAmountNew += "Purchase Line"."Line Amount";
//                     until

//                     PurchaseLine.Next() = 0;
//                 end;

//                 CLEAR(AmountinWords2);
//                 InitTextVariable;
//                 line_am_new := round(line_am_new, 0.01);
//                 FormatNoText(Notext2, line_am_new, "Purchase Header"."Currency Code");
//                 Amountinwords2[1] := Notext2[1];
//             end;


//         }

//     }

//     requestpage
//     {
//         AboutTitle = 'Teaching tip title';
//         AboutText = 'Teaching tip content';
//         layout
//         {
//             area(Content)
//             {
//                 // group(GroupName)
//                 // {
//                 //     field(Name; SourceExpression)
//                 //     {

//                 //     }
//                 // }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName)
//                 {


//                 }
//             }
//         }
//     }

//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         compinfo.get();
//         compinfo.CalcFields(Picture)
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

//         //Amount in words 

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
