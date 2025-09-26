/// <summary>
/// Page TV RoleCenter (ID 50130).
/// </summary>
page 50021 "HR RoleCenter"
{
    // ApplicationArea = All;
    Caption = 'HR RoleCenter';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(Headlines; "Headline RC Business Manager")
                {
                    Caption = 'Headlines';
                    ApplicationArea = Basic, Suite;
                }
                part("Approvals Activities"; "Approvals Activities")
                {
                    ApplicationArea = Basic, Suite;
                }

            }

        }
    }
    actions
    {
        area(Embedding)
        {
            action("Incentive Working List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Incentive Working List';
                RunObject = page "Incentive Working Lists";
            }
        }
    }
}
