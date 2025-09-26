pageextension 50100 CC extends "Customer Card"
{
    layout
    {
        addafter("IC Partner Code")
        {
            // field("Durgest Intro"; Rec."Durgest Intro")
            // {
            //     ApplicationArea = All;
            //     Editable = rec."Give Permission";
            // }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter(ApplyTemplate)
        {
            action("Apply Durgesh")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Image = Apply;
                trigger OnAction()
                var
                    us: Record "User Setup";
                begin
                    Clear(us);
                    us.get(UserId);
                    // if not us."Customer Permission" then
                    //     Error('you don''t have permission.');

                    // if rec."Give Permission" then
                    //     rec."Give Permission" := false
                    // else
                    //     rec."Give Permission" := true;
                    // rec.Modify();
                    // CurrPage.Update(false);
                end;
            }
        }

        // Add changes to page actions here
    }

    procedure CountRecord(): Integer
    var
        Cust_rec: Record Customer;
        SaveCount: Integer;
    begin

        SaveCount := 0;
        Cust_rec.Reset();
        if Cust_rec.FindFirst() then
            repeat
                SaveCount += 1;

            until Cust_rec.Next() = 0;
        exit(SaveCount);
    end;

    var
        myInt: Integer;
}