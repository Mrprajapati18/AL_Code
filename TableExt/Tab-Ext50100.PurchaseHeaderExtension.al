// tableextension 50403 "PurchaseHeaderExtension " extends "Purchase Header"
// {
//     fields
//     {
//         field(50100; "Commodity"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50101; "Variety"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50102; "Validity"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50103; "PartOfLoading"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50104; "Deduction"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50105; "DeliveryTerms"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50106; "PartofDischarge"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50107; "BrokerName"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50108; "Brokerage"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50109; "QuantityAndQuantityFinalAt"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50110; "OtherReferences"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50111; "Destination"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50114; Email_Id; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(50112; EMail; Text[100])
//         {
//             DataClassification = CustomerContent;
//             // TableRelation = Contact;

//             // trigger OnValidate()
//             // var
//             //     myInt: Integer;
//             //     Cont_rec: Record Contact;
//             // begin

//             //     if "EMail" <> '' then begin
//             //         if Cont_rec.Get(rec."EMail") then begin
//             //             Rec."Mobile" := Cont_rec."Phone No.";
//             //         end

//             //     end;

//             // end;
//         }

//         field(50113; Mobile; Text[20])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = Contact;

//             // trigger OnValidate()
//             // var
//             //     contact: Record Contact;
//             // begin
//             //     if "Mobile" <> '' then begin
//             //         if contact.Get("Mobile") then begin
//             //             Rec."EMail" := contact."E-Mail";
//             //         end
//             //     end;
//             // end;
//         }

//         field(50116; "Email Verified"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Email Verified';
//         }
//     }
// }
