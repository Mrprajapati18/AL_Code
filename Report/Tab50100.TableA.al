// table 50100 PageATable
// {
//     Caption = 'PageA';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "UserName"; Text[50])
//         {
//             Caption = 'Name';
//         }
//         field(2; "Department"; Text[50])
//         {
//             Caption = 'ATE';
//         }
//         field(3; "Address"; Text[20])
//         {
//             Caption = 'Address';
//         }
//         field(4; "CurLoc"; Text[40])
//         {
//             Caption = 'Current Location';
//         }
//         field(5; "Pin No"; Integer)
//         {
//             Caption = 'Pin Code';
//         }
//     }

//     keys
//     {
//         key(PK; "UserName")
//         {
//             Clustered = true;
//         }
//     }

//     procedure InsertData(): Text
//     var
//         SourceRec: Record PageATable;
//         TargetRec: Record PageBTable;
//         SaveNo: Text;
//     begin
//         SaveNo := '';
//         SourceRec.Reset();
//         if SourceRec.FindFirst() then
//             repeat
//                 TargetRec.Init();
//                 TargetRec."UserName" := SourceRec."UserName";
//                 TargetRec."Department" := SourceRec."Department";
//                 TargetRec."Address" := SourceRec."Address";
//                 TargetRec."CurLoc" := SourceRec."CurLoc";
//                 TargetRec."Pin No" := SourceRec."Pin No";
//                 TargetRec.Insert();

//                 if SaveNo = '' then
//                     SaveNo := SourceRec."UserName"
//                 else
//                     SaveNo += ' , ' + SourceRec."UserName";

//             until SourceRec.Next() = 0;

//         exit(SaveNo);
//     end;
// }

