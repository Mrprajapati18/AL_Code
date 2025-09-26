// Report 50215 "Proforma Invoice 2"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Proforma Invoice 2.rdl';
//     PreviewMode = PrintLayout;

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             //  CalcFields = "Amount to Customer";
//             DataItemTableView = sorting("Document Type", "No.") order(ascending);
//             RequestFilterFields = "No.";
//             RequestFilterHeading = 'Proforma Invoice';

//             column(SysDate; WorkDate)
//             {
//             }
//             column(COMPNAME1; COMPNAME)
//             {
//             }
//             column(COMPNAME; COMPNAME)
//             {
//             }
//             column(Com_pic; CompanyInfo.Picture)
//             {
//             }
//             column(BankName; 'Bank Name :' + BankName)
//             {
//             }
//             column(POSTCODE; POSTCODE)
//             {
//             }
//             column(SwiftCode; 'Swift: ' + SwiftCode)
//             {
//             }
//             column(BankAccNo; 'Account No. :' + BankAccNo)
//             {
//             }
//             column(IFSCCode; 'IFSC Code : ' + IFSCCode)
//             {
//             }
//             column(BankBranch; 'Branch No. ' + BankBranch)
//             {
//             }
//             column(BankAccountType; 'Account Type : ' + Format(BankAccountType))
//             {
//             }
//             column(OrderDate_SalesHeader; "Sales Header"."Order Date")
//             {
//             }
//             column(ADD; ADDRESS)
//             {
//             }
//             column(ADD1; CITY + ' - ' + ' (' + POSTCODE + ')')
//             {
//             }
//             column(SHIPMENTDESC; SHIPMENTDESC)
//             {
//             }
//             column(CompTIN; 'T. I. N. No. ' + CompTIN)
//             {
//             }
//             column(CompECC; 'E. C. C. No. ' + CompECC)
//             {
//             }
//             column(CompCST; 'C. S. T. No. ' + CompCST)
//             {
//             }
//             column(CompCST1; CompCST)
//             {
//             }
//             column(CompTIN1; CompTIN)
//             {
//             }
//             column(CITY; CITY)
//             {
//             }
//             column(MOBNO; 'Phone No.  -  ' + MOBNO)
//             {
//             }
//             column(WEB; 'Website  - ' + WEB)
//             {
//             }
//             column(MAIL; 'E-mail  - ' + MAIL)
//             {
//             }
//             column(Pic; CompanyInfo.Picture)
//             {
//             }
//             column(No_SalesHeader; "Sales Header"."No.")
//             {
//             }
//             column(YourReference_SalesHeader; "Sales Header"."Your Reference")
//             {
//             }
//             column(ShipmentDate_SalesHeader; "Sales Header"."Shipment Date")
//             {
//             }
//             column(PostingDate_SalesHeader; "Sales Header"."Posting Date")
//             {
//             }
//             column(DocumentDate_SalesHeader; "Sales Header"."Document Date")
//             {
//             }
//             column(ExternalDocumentNo_SalesHeader; "Sales Header"."External Document No.")
//             {
//             }
//             column(SelltoCustomerName_SalesHeader; "Sales Header"."Sell-to Customer Name")
//             {
//             }
//             column(SelltoAddress_SalesHeader; "Sales Header"."Sell-to Address" + ',' + "Sales Header"."Sell-to Address 2")
//             {
//             }
//             column(SelltoAddress2_SalesHeader; "Sales Header"."Sell-to Address 2")
//             {
//             }
//             column(SelltoCity_SalesHeader; "Sales Header"."Sell-to City" + ' ( ' + "Sales Header"."Sell-to Post Code" + ' ) ')
//             {
//             }
//             column(SelltoPostCode_SalesHeader; "Sales Header"."Sell-to Post Code")
//             {
//             }
//             column(BilltoName_SalesHeader; "Sales Header"."Bill-to Name")
//             {
//             }
//             column(BilltoAddress_SalesHeader; "Sales Header"."Bill-to Address")
//             {
//             }
//             column(BilltoAddress2_SalesHeader; "Sales Header"."Bill-to Address 2")
//             {
//             }
//             column(BilltoCity_SalesHeader; "Sales Header"."Bill-to City" + '( ' + "Sales Header"."Bill-to Post Code" + ')')
//             {
//             }
//             column(BilltoPostCode_SalesHeader; "Sales Header"."Bill-to Post Code")
//             {
//             }
//             // column(AmounttoCustomer; "Sales Header"."Amount to Customer")
//             // {
//             // }
//             column(AmounttoCustomer; '')
//             {
//             }
//             column(Amount_SalesHeader; "Sales Header".Amount)
//             {
//             }
//             column(CurrencyCode; CurrencyCode)
//             {
//             }
//             column(Headr_currency_code; "Sales Header"."Currency Code")
//             {
//             }
//             column(METHODDESC; "Sales Header"."Payment Terms Code")
//             {
//             }
//             column(Amount_Caption; '(' + CurrencyCode + ')' + NumberText[1] + ' ' + NumberText[2])
//             {
//             }
//             column(PaymentTermsCode_SalesHeader; "Sales Header"."Payment Terms Code")
//             {
//             }
//             column(billtoGST; Customer."GST Registration No.")
//             {
//             }
//             column(billtostate; State12.Description)
//             {
//             }
//             column(sellgst; Customer1."GST Registration No.")
//             {
//             }
//             column(selltostatedesc; State1.Description)
//             {
//             }
//             column(CName; CName)
//             {
//             }
//             column(CAdd; CAdd)
//             {
//             }
//             column(CAdd2; CAdd2)
//             {
//             }
//             column(CCity; CCity)
//             {
//             }
//             column(CpostCode; CpostCode)
//             {
//             }
//             column(CState; CState)
//             {
//             }
//             column(CEmail; CEmail)
//             {
//             }
//             column(CphoneNo; CphoneNo)
//             {
//             }
//             column(CGSTRegNo; CGSTRegNo)
//             {
//             }
//             column(GstReg; GstReg)
//             {
//             }
//             column(ShipGSTRegNo; ShipGSTRegNo)
//             {
//             }
//             column(CustomerGSTRegNo_SalesHeader; "Sales Header"."Customer GST Reg. No.")
//             {
//             }
//             column(StateCode1; StateCode1)
//             {
//             }
//             column(StateName; StateName)
//             {
//             }
//             column(Freight; Freight)
//             {
//             }
//             column(ShiptoName_SalesHeader; "Sales Header"."Ship-to Name")
//             {
//             }
//             column(ShiptoAddress_SalesHeader; "Sales Header"."Ship-to Address")
//             {
//             }
//             column(ShiptoAddress2_SalesHeader; "Sales Header"."Ship-to Address 2")
//             {
//             }
//             column(ShiptoCity_SalesHeader; "Sales Header"."Ship-to City")
//             {
//             }
//             column(ShiptoPostCode_SalesHeader; "Sales Header"."Ship-to Post Code")
//             {
//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLink = "Document No." = field("No.");
//                 DataItemTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending);

//                 column(IGST_Amt; Abs(IGST_Amt))
//                 {
//                 }
//                 column(CGST_Amt; Abs(CGST_Amt))
//                 {
//                 }
//                 column(SGST_Amt; Abs(SGST_Amt))
//                 {
//                 }
//                 column(IGST_Perc; IGST_Perc)
//                 {
//                 }
//                 column(SGST_Perc; SGST_Perc)
//                 {
//                 }
//                 column(CGST_Perc; CGST_Perc)
//                 {
//                 }
//                 column(SLNO; SLNO)
//                 {
//                 }
//                 column(No_SalesLine; "Sales Line"."No.")
//                 {
//                 }
//                 column(LineDiscountAmount_SalesLine; "Sales Line"."Line Discount Amount")
//                 {
//                 }
//                 // column(TaxAmount; "Sales Line"."Tax Amount")
//                 // {
//                 // }
//                 column(TaxAmount; '')
//                 {
//                 }
//                 column(ExciseAmountLine; '')
//                 {
//                 }
//                 // column(ExciseAmountLine; "Sales Line"."Excise Amount")
//                 // {
//                 // }
//                 column(Description_SalesLine; "Sales Line".Description)
//                 {
//                 }
//                 column(UnitofMeasureCode_SalesLine; "Sales Line"."Unit of Measure Code")
//                 {
//                 }
//                 column(QtytoShip_SalesLine; "Sales Line"."Qty. to Ship")
//                 {
//                 }
//                 column(Quantity_SalesLine; "Sales Line".Quantity)
//                 {
//                 }
//                 column(LineDiscount_SalesLine; "Sales Line"."Line Discount %")
//                 {
//                 }
//                 column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
//                 {
//                 }
//                 column(LineAmount_SalesLine; "Sales Line"."Line Amount")
//                 {
//                 }
//                 column(Currency_Code; "Sales Line"."Currency Code")
//                 {
//                 }
//                 // column(Gstamount; "Sales Line"."Total GST Amount")
//                 // {
//                 // }
//                 // column(AmountToCustomer_SalesLine; "Amount To Customer")
//                 // {
//                 // }
//                 // column(ChargesToCustomer_SalesLine; "Sales Line"."Charges To Customer")
//                 // {
//                 // }
//                 column(Gstamount; '')
//                 {
//                 }
//                 column(AmountToCustomer_SalesLine; '')
//                 {
//                 }
//                 column(ChargesToCustomer_SalesLine; '')
//                 {
//                 }
//                 column(LineDis_sales; "Sales Line"."Line Discount %")
//                 {
//                 }
//                 column(HSNSACCode_SalesLine; "Sales Line"."HSN/SAC Code")
//                 {
//                 }
//                 column(FREIGHT_AMT; FREIGHT_AMT)
//                 {
//                 }
//                 column(TotalAmount; TotalAmount)
//                 {
//                 }
//                 column(InWords; InWords[1])
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     SLNO := SLNO + 1;


//                     TG.Reset;
//                     TG.SetRange(TG.Code, "Sales Line"."Tax Group Code");
//                     if TG.FindFirst then begin
//                         TaxDesc := TG.Description
//                     end else
//                         TaxDesc := '';

//                     // EXCPRPSETUP.Reset;
//                     // EXCPRPSETUP.SetRange(EXCPRPSETUP."Excise Prod. Posting Group", "Excise Prod. Posting Group");
//                     // if EXCPRPSETUP.FindFirst then begin
//                     //     BEDPER := EXCPRPSETUP."BED %";
//                     // end else
//                     //     BEDPER := 0;

//                     INSURANCE_AMT := 0;
//                     FREIGHT_AMT := 0;
//                     PACKING_AMT := 0;

//                     // StructureOrderLineDetails.Reset;
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Document No.", "Document No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Item No.", "No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Tax/Charge Group", 'FREIGHT');
//                     // if StructureOrderLineDetails.FindFirst then begin
//                     //     repeat
//                     //         FREIGHT_AMT += StructureOrderLineDetails.Amount;
//                     //     until StructureOrderLineDetails.Next = 0;
//                     // end;


//                     // StructureOrderLineDetails.Reset;
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Document No.", "Document No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Item No.", "No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Tax/Charge Group", 'INSURANCE');
//                     // if StructureOrderLineDetails.FindFirst then begin
//                     //     repeat
//                     //         INSURANCE_AMT := StructureOrderLineDetails.Amount;
//                     //     until StructureOrderLineDetails.Next = 0;
//                     // end;

//                     // StructureOrderLineDetails.Reset;
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Document No.", "Document No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Item No.", "No.");
//                     // StructureOrderLineDetails.SetRange(StructureOrderLineDetails."Tax/Charge Group", 'PACKING');
//                     // if StructureOrderLineDetails.FindFirst then begin
//                     //     repeat
//                     //         PACKING_AMT := StructureOrderLineDetails.Amount;
//                     //     until StructureOrderLineDetails.Next = 0;
//                     // end;

//                     /*
//                     Item_Desc :='';

//                     IF "Sales Line"."Line No." <>0 THEN BEGIN
//                       SalesCommentLine.RESET;
//                       SalesCommentLine.SETRANGE("Document Type",SalesCommentLine."Document Type"::Invoice);
//                       SalesCommentLine.SETRANGE(SalesCommentLine."No.","Document No.");
//                       SalesCommentLine.SETRANGE(SalesCommentLine."Document Line No.","Line No.");
//                       IF SalesCommentLine.FINDFIRST THEN BEGIN
//                       REPEAT
//                          Item_Desc := Item_Desc + SalesCommentLine.Comment;
//                       UNTIL SalesCommentLine.NEXT=0;
//                       END;
//                     END;
//                     */





//                     /*
//                     InitTextVariable;
//                     "Sales Header".CALCFIELDS("Sales Header"."Amount to Customer");
//                     TotalDebitAmt += "Sales Line"."Amount To Customer" ;
//                     FormatNoText(NumberText,ROUND(TotalDebitAmt,1.0,'='),'');
//                     */
//                     IGST_Perc := 0;
//                     IGST_Amt := 0;
//                     CGST_Perc := 0;
//                     CGST_Amt := 0;
//                     SGST_Perc := 0;
//                     SGST_Amt := 0;

//                     DetailedGSTEntryBuffer.Reset;
//                     DetailedGSTEntryBuffer.SetRange("Transaction Type", DetailedGSTEntryBuffer."transaction type"::Sales);
//                     DetailedGSTEntryBuffer.SetRange("Document Type", DetailedGSTEntryBuffer."Document Type"::Invoice);
//                     DetailedGSTEntryBuffer.SetRange("Document No.", "Document No.");
//                     DetailedGSTEntryBuffer.SetRange("No.", "No.");
//                     DetailedGSTEntryBuffer.SetRange("Line No.", "Line No.");
//                     if DetailedGSTEntryBuffer.FindSet then
//                         repeat
//                             if DetailedGSTEntryBuffer."GST Component Code" = 'IGST' then begin
//                                 IGST_Perc := DetailedGSTEntryBuffer."GST %";
//                                 IGST_Amt := DetailedGSTEntryBuffer."GST Amount";
//                             end;
//                             if DetailedGSTEntryBuffer."GST Component Code" = 'SGST' then begin
//                                 SGST_Perc := DetailedGSTEntryBuffer."GST %";
//                                 SGST_Amt := DetailedGSTEntryBuffer."GST Amount";
//                             end;
//                             if DetailedGSTEntryBuffer."GST Component Code" = 'CGST' then begin
//                                 CGST_Perc := DetailedGSTEntryBuffer."GST %";
//                                 CGST_Amt := DetailedGSTEntryBuffer."GST Amount";
//                             end;
//                         until DetailedGSTEntryBuffer.Next = 0;
//                     TotalFrieght += FREIGHT_AMT;
//                     TotalGstAmt += CGST_Amt + SGST_Amt + IGST_Amt;
//                     TotalLineAmount += "Sales Line"."Line Amount";
//                     //TotalAmount:= TotalGstAmt + TotalLineAmount+TotalFrieght;
//                     //MESSAGE('%1',TotalAmount);

//                     Clear(Amount_To_Customer);
//                     DetailCustomerledger.Reset();
//                     DetailCustomerledger.SetRange("Document No.", "Sales Line"."Document No.");
//                     if DetailCustomerledger.FindFirst() then
//                         Amount_To_Customer := DetailCustomerledger.Amount;


//                     CheckRep.InitTextVariable;
//                     CheckRep.FormatNoText(InWords, (Amount_To_Customer + TotalFrieght), "Sales Header"."Currency Code");

//                     // CheckRep.InitTextVariable();
//                     //  InFigs := Value;
//                     //  CheckRep.FormatNoText(InWords,("Sales Line"."Amount To Customer" + TotalFrieght),' '+"Currency Code");

//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CompanyInfo.CalcFields(CompanyInfo.Picture);
//                 //"Sales Header".CALCFIELDS("Sales Header"."Amount to Customer");
//                 CompanyInfo.Get;
//                 COMPNAME := CompanyInfo.Name;
//                 ADDRESS := CompanyInfo.Address;
//                 ADDRESS1 := CompanyInfo."Address 2";
//                 CITY := CompanyInfo.City;
//                 POSTCODE := CompanyInfo."Post Code";
//                 MOBNO := CompanyInfo."Phone No.";
//                 MAIL := CompanyInfo."E-Mail";
//                 WEB := CompanyInfo."Home Page";
//                 BankName := CompanyInfo."Bank Name";
//                 BankAccNo := CompanyInfo."Bank Account No.";
//                 //IFSCCode:=CompanyInfo."IFSC Code";
//                 BankBranch := CompanyInfo."Bank Branch No.";
//                 //SwiftCode := CompanyInfo."IFSC Code";
//                 ///BankAccountType:=CompanyInfo."Bank Account Type";
//                 CompanyInfo.CalcFields(CompanyInfo.Picture);
//                 // CompCST := CompanyInfo."C.S.T No.";
//                 // CompTIN := CompanyInfo."T.I.N. No.";
//                 // CompECC := CompanyInfo."E.C.C. No.";
//                 if "Sales Header"."Currency Code" <> '' then begin
//                     CurrencyCode := "Sales Header"."Currency Code";
//                 end else begin
//                     CurrencyCode := 'INR';
//                 end;

//                 VENDOR.Reset;
//                 VENDOR.SetRange(VENDOR."No.", "Sell-to Customer No.");
//                 if VENDOR.FindFirst then begin
//                     BUYERVATNO := VENDOR."VAT Registration No.";
//                 end;

//                 Reclocation1.Reset;
//                 Reclocation1.SetRange(Code, "Sales Header"."Location Code");
//                 if Reclocation1.FindFirst then begin
//                     CName := Reclocation1.Name;
//                     CAdd := Reclocation1.Address;
//                     CAdd2 := Reclocation1."Address 2";
//                     CCity := Reclocation1.City;
//                     CpostCode := Reclocation1."Post Code";
//                     CEmail := Reclocation1."E-Mail";
//                     CphoneNo := Reclocation1."Phone No.";
//                     CState := Reclocation1."State Code";
//                     CGSTRegNo := Reclocation1."GST Registration No."; // LOCATION GST Reg
//                 end;


//                 SHIPMENTDESC := '';
//                 SM.Reset;
//                 SM.SetRange(SM.Code, "Shipment Method Code");
//                 if SM.FindFirst then begin
//                     SHIPMENTDESC := SM.Description;
//                 end;

//                 Customer.Get("Sales Header"."Bill-to Customer No.");
//                 Customer1.Get("Sales Header"."Sell-to Customer No.");


//                 if State1.Get(Customer1."State Code") then;
//                 if State12.Get(Customer."State Code") then;

//                 ShiptoAddress.Reset;
//                 ShiptoAddress.SetRange(Code, "Sales Header"."Ship-to Code");
//                 if ShiptoAddress.FindSet then begin
//                     ShipGSTRegNo := ShiptoAddress."GST Registration No.";  // ship to gst
//                 end;

//                 if "Sales Header"."Ship-to Code" <> '' then
//                     GstReg := ShipGSTRegNo
//                 else
//                     GstReg := "Sales Header"."Customer GST Reg. No.";

//                 StateCode1 := '';
//                 RecState.Reset;
//                 RecState.SetRange(RecState.Code, "Sales Header"."GST Bill-to State Code");
//                 if RecState.FindFirst then
//                     StateCode1 := RecState."State Code (GST Reg. No.)";
//                 StateName := RecState.Description;
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

//         DetailCustomerledger: Record "Detailed Cust. Ledg. Entry";
//         CompanyInfo: Record "Company Information";
//         COMPNAME: Text[50];
//         ADDRESS: Text[50];
//         ADDRESS1: Text[50];
//         CITY: Text[50];
//         MOBNO: Text;
//         MAIL: Text[50];
//         WEB: Text[50];
//         POSTCODE: Code[10];
//         SLNO: Integer;
//         NumberText: array[2] of Text[80];
//         NumberText1: array[2] of Text[100];
//         OnesText: array[20] of Text[30];
//         TensText: array[10] of Text[30];
//         ExponentText: array[5] of Text[30];
//         Tens1: Integer;
//         Ones1: Integer;
//         TotalDebitAmt: Decimal;
//         PT: Record "Payment Terms";
//         PAYMENTDES: Text[30];
//         PM: Record "Payment Method";
//         METHODDESC: Text[30];
//         BankAccNo: Code[20];
//         BankName: Text[50];
//         SwiftCode: Code[20];
//         Boxsize: Text[50];
//         SalesComment: Record "Sales Comment Line";
//         comments: Text[30];
//         type: Code[30];
//         subtype: Code[30];
//         Desc: Text[50];
//         sl: Integer;
//         TermsGroup: Option Shipment,Delivery,"Variation Quantity vs Actual",Payment,Validity;
//         CheckList: Option Comment,"Sales CheckList",Terms;
//         TypeDesc: Option Comment,"Sales CheckList",Terms;
//         Desc1: Text[50];
//         lenght: Code[30];
//         height: Code[30];
//         width: Code[30];
//         BoxSize1: Code[50];
//         AttributeValueEntry: Record "Indent Line";
//         CurrencyCode: Code[20];
//         CompCST: Code[20];
//         CompTIN: Code[20];
//         CompECC: Code[20];
//         BankAccountType: Option Saving," Current";
//         IFSCCode: Code[20];
//         BankBranch: Code[30];
//         TG: Record "Tax Group";
//         TaxDesc: Text[30];
//         // EXCPRPSETUP: Record "Excise Posting Setup";
//         BEDPER: Decimal;
//         SM: Record "Shipment Method";
//         SHIPMENTDESC: Text;
//         BUYERVATNO: Code[20];
//         VENDOR: Record Vendor;
//         ShiptoAddress: Record "Ship-to Address";
//         SHIPTONAME: Text;
//         SHIPTOADD: Text;
//         SHIPTOADD1: Text;
//         SHIPTOCITY: Text;
//         INSURANCE_AMT: Decimal;
//         FREIGHT_AMT: Decimal;
//         PACKING_AMT: Decimal;
//         SalesCommentLine: Record "Sales Comment Line";
//         Item_Desc: Text;
//         IGST_Perc: Decimal;
//         IGST_Amt: Decimal;
//         CGST_Perc: Decimal;
//         CGST_Amt: Decimal;
//         SGST_Perc: Decimal;
//         SGST_Amt: Decimal;
//         DetailedGSTEntryBuffer: Record "Detailed GST Entry Buffer";
//         Customer: Record Customer;
//         Customer1: Record Customer;
//         State12: Record State;
//         State1: Record State;
//         CheckRep: Report Check;
//         CompanyInformation: Record "Company Information";
//         CName: Text[50];
//         CAdd: Text[50];
//         CAdd2: Text[50];
//         CCity: Text[30];
//         CpostCode: Code[10];
//         CState: Text[30];
//         CEmail: Code[50];
//         CphoneNo: Code[50];
//         CGSTRegNo: Code[50];
//         Reclocation1: Record Location;
//         ShipGSTRegNo: Code[50];
//         GstReg: Code[50];
//         RecState: Record State;
//         StateCode1: Code[20];
//         StateName: Text[50];
//         // StructureOrderLineDetails: Record "Structure Order Line Details";
//         Freight: Decimal;
//         Insurance: Decimal;
//         TotalGstAmt: Decimal;
//         TotalLineAmount: Decimal;
//         TotalAmount: Decimal;
//         InFigs: Decimal;
//         Value: Decimal;
//         InWords: array[2] of Text[90];
//         TotalFrieght: Decimal;
// }