// page 50100 MyRoleCenter
// {
//     ApplicationArea = All;
//     Caption = 'MyRoleCenter';
//     PageType = RoleCenter;

//     layout
//     {
//         area(RoleCenter)
//         {
//             part(SalesOrder; "Sales Order Subform")
//             {
//                 ApplicationArea = All;
//             }
//         }
//     }
//     actions
//     {
//         area(Sections)
//         {
//             group(SaleRoleCenter)
//             {
//                 action("&Saleorder")
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Order Planning";
//                 }
//             }
//             group("&Customer")
//             {
//                 action("Customer")
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Customer Disc. Groups";
//                 }
//             }

//             group("&vender")
//             {
//                 action(vender)
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Vendor Entry Statistics";
//                 }
//             }

//             group("&Item")
//             {
//                 action(Item)
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Item Application Entries";
//                 }
//             }

//             group("&Purchase Order")
//             {
//                 action("Purchase Order")
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Purchase Order";
//                 }
//             }
//         }
//     }

// }
