// report 50105 TestNew
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'NewTest.rdl';
//     Caption = 'Test Report';

//     dataset

//     {
//         dataitem("Sales Header"; "Sales Header")
//         {

//             RequestFilterFields = "No.";
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = sorting(Number);
//                 dataitem(pageloop; Integer)
//                 {
//                     DataItemTableView = sorting(Number) where(Number = const(1));
//                     // column(OutputNoNo; OutputNoNo) { }
//                     // column(ReportTitleCopyText; StrSubstNo(Text004, CopyText)) { }

//                 }



//                 column(ColorChange; ColorChange)
//                 { }

//                 column(Totalshow; Totalshow)
//                 { }
//                 column(conpinfo_Name; conpinfo.Name)
//                 { }
//                 column(conpinfo_PAN; conpinfo."P.A.N. No.")
//                 { }
//                 column(conpinfo_pic; conpinfo.Picture)
//                 { }
//                 column(Sell_to_Customer_Name; "Sales Header"."Sell-to Customer Name")
//                 { }
//                 column(Bill_to_Customer_No_; "Sales Header"."Bill-to Customer No.")
//                 { }
//                 column(Ship_to_Name; "Sales Header"."Ship-to Name")
//                 { }
//                 column(Sell_to_Address; "Sales Header"."Sell-to Address")
//                 { }
//                 column(Registration_Number; "Sales Header"."Registration Number")
//                 { }
//                 column(Location_Code; "Sales Header"."Location Code")
//                 { }
//                 column(Bill_to_Contact; "Sales Header"."Bill-to Contact")
//                 { }
//                 column(Sell_to_Contact_No_; "Sales Header"."Sell-to Contact No.")
//                 { }
//                 column(Document_Date; "Sales Header"."Document Date")
//                 { }
//                 column(VAT_Reporting_Date; "VAT Reporting Date")
//                 { }
//                 column(Shipment_Date; "Sales Header"."Shipment Date")
//                 { }
//                 column(Assigned_User_ID; "Sales Header"."Assigned User ID")
//                 { }

//                 dataitem("Sales Line"; "Sales Line")
//                 {
//                     DataItemLinkReference = "Sales Header";
//                     DataItemLink = "Document No." = field("No.");

//                     column(Description; Description)
//                     { }
//                     column(Quantity; Quantity)
//                     { }
//                     column(Unit_of_Measure; "Unit of Measure")
//                     { }
//                     column(Line_Discount__; "Line Discount %")
//                     { }
//                     column(LineCounter; "Line Amount")
//                     { }
//                     column(SR_No; SR_No)
//                     { }
//                     column(Amountinwords2; Amountinwords2[1]) { }

//                     trigger OnPreDataItem()
//                     var
//                         myInt: Integer;
//                     begin
//                         Clear(SR_No);
//                         SR_No := 0;

//                     end;

//                     trigger OnAfterGetRecord()
//                     var
//                         myInt: Integer;
//                     begin

//                         SR_No += 1;
//                         if Quantity = 6 then
//                             CurrReport.Skip();
//                     end;


//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     if Number > 1 then begin
//                         CopyText := FormatDocument.GetCOPYText;
//                         OutputNo += 1;
//                     end;
//                 end;

//                 trigger OnPreDataItem();
//                 begin
//                     NoOfLoops := ABS(NoOfCopies) + 1;
//                     CopyText := '';
//                     SETRANGE(Number, 1, NoOfLoops);
//                     OutputNo := 1;
//                 end;


//             }


//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 if "Sales Line".Quantity > 10 then
//                     ColorChange := 'unfavorable'
//                 else
//                     ColorChange := 'favorable';

//                 Clear(line_am_new);
//                 saleline.Reset();
//                 saleline.SetRange("Document No.", "Sales Header"."No.");
//                 if saleline.FindFirst() then begin
//                     repeat
//                         line_am_new += saleline."Line Amount";
//                     until

//                     saleline.Next() = 0;

//                 end;

//                 CLEAR(AmountinWords2);
//                 InitTextVariable;
//                 line_am_new := round(line_am_new, 0.01);
//                 FormatNoText(Notext2, line_am_new, "Sales Header"."Currency Code");
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
//                 group(GroupName)
//                 {
//                     field(Totalshow; Totalshow)
//                     {
//                         ApplicationArea = all;

//                     }
//                     field(NoOfCopies; NoOfCopies)
//                     {
//                         ApplicationArea = all;
//                     }
//                 }
//             }
//         }
//     }
//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         conpinfo.get();

//         conpinfo.CalcFields(Picture)

//     end;



//     var

//         NoOfCopies: Integer;
//         NoOfLoops: Integer;
//         CopyText: Text[30];
//         OutputNo: Integer;
//         FormatDocument: Codeunit "Format Document";

//         ColorChange: Text;
//         Totalshow: Boolean;

//         line_am_new: Decimal;
//         saleline: Record "Sales Line";

//         Amountinwords2: array[2] of Text[100];
//         AmountinWord: array[2] of Text[100];
//         myInt: Integer;

//         LineCounter: Integer;
//         SR_No: Integer;
//         conpinfo: Record "Company Information";



//         //Amount



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