// pageextension 50103 Purchase extends "Purchase Order"
// {
//     layout
//     {
//         addafter("Due Date")
//         {
//             field(Variety; Rec.Variety)
//             {
//                 ApplicationArea = all;
//             }
//             field("Commodity"; Rec."Commodity")
//             {
//                 ApplicationArea = All;
//             }
//             field("Validity"; Rec."Validity")
//             {
//                 ApplicationArea = All;
//             }

//             field("PartOfLoading"; Rec."PartOfLoading")
//             {
//                 ApplicationArea = All;
//             }

//             field("Deduction"; Rec."Deduction")
//             {
//                 ApplicationArea = All;
//             }
//             field("Delivery Terms"; Rec."DeliveryTerms")
//             {
//                 ApplicationArea = All;
//             }
//             field("Part of Discharge"; Rec."PartofDischarge")
//             {
//                 ApplicationArea = All;
//             }
//             field("Broker Name"; Rec."BrokerName")
//             {
//                 ApplicationArea = All;
//             }
//             field("Brokerage"; Rec."Brokerage")
//             {
//                 ApplicationArea = All;
//             }
//             field("Quantity And Quantity Final At"; Rec."QuantityAndQuantityFinalAt")
//             {
//                 ApplicationArea = All;
//             }
//             field("Other References"; Rec."OtherReferences")
//             {
//                 ApplicationArea = All;
//             }
//             field("Destination"; Rec."Destination")
//             {
//                 ApplicationArea = All;
//             }
//             field(Email; Rec.EMail)
//             {
//                 ApplicationArea = All;

//             }
//             field(Email_Id;Rec.Email_Id)
//             {
//                 ApplicationArea=all;

//                  trigger OnValidate()
//                 var
//                     myInt: Integer;
//                 begin
//                     if Rec.Email_Id =true then
//                      if StrPos(Rec.EMail, '@') <> 0 then
//                      Error('wrong');
//                 end;
        

//             }
//             field(Mobile; Rec.Mobile)
//             {
//                 ApplicationArea = All;
//             }          

//         }
//     }

//     actions
//     {
//         addafter("P&osting")
//         {
//             action(PrintSelectedLayout)
//             {
//                 Caption = 'Print Selected Layout';
//                 ApplicationArea = ALL;
//                 // Ellipsis = true;
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;


//                 trigger OnAction()
//                 var
//                     //Rec_report: Report 50103;
//                     Rec_: Record "Purchase Header";
//                 begin
//                     Rec_.Reset();
//                     Rec_.SetRange("No.", REC."No.");
//                    // Rec_report.SetTableView(Rec_);
//                     //Rec_report.Run();
//                 end;

//             }

//             // Action to verify Mobile Number
//             action(VarifyMobileNo)
//             {
//                 Caption = 'Click Mobile Btn';
//                 ApplicationArea = ALL;
//                 // Ellipsis = true;
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;


//                 trigger OnAction()
//                 var
//                     PurchaseHeader: Record "Purchase Header";
//                 begin

//                     if StrLen(Rec.Mobile) <> 10 then
//                         Error('Mobile number is not valid. It must be exactly 10 digits.')
//                     else
//                         Error('Mobile number has been successfully verified.', Rec.Mobile);
//                 end;
//             }

           
//             action(VerifyEmailID)
//             {
//                 Caption = 'Verify Email Address';
//                 ApplicationArea = ALL;
//                 Image = "1099Form";
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     PurchaseHeader: Record "Purchase Header";
//                 begin
//                     if rec.Email_Id =false then
//                     // Check if the email is valid: check for '@' character
//                     if StrPos(Rec.EMail, '@') = 0 then
//                         Message('Email Id Not Valid.')
//                     else
//                         Message('Email address has been successfully verified.');
//                 end;
//             }
//         }
//     }
// }  


        
    

