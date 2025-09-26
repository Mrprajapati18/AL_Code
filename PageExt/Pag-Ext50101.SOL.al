pageextension 50108 SOL_1 extends 9305
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Post)
        {
            action("Count Total Cust ")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    CL: page "Customer card";
                    savecust: Integer;
                begin
                    savecust := cl.CountRecord();
                    Message('Total Customer is - ' + format(savecust));
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}