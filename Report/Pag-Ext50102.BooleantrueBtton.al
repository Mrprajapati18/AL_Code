// pageextension 50107 "PurchaseOrderExt" extends "Purchase Order"
// {
//     actions
//     {
//         addafter("P&osting")
//         {
//             action(SetEmailVerifiedTrue)
//             {
//                 Caption = 'EmailVerified';
//                 ApplicationArea = All;
//                 Image = Check;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Rec."Email Verified" := true;
//                     Rec.Modify(true);
//                     Message('Email marked as verified.');
//                 end;
//             }

//             action(SetEmailVerifiedFalse)
//             {
//                 Caption = 'EmailNotVerified';
//                 ApplicationArea = All;
//                 Image = "8ball";
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Rec."Email Verified" := false;
//                     Rec.Modify(true);
//                     Message('Email marked as not verified.');
//                 end;
//             }
//         }
//     }
// }
