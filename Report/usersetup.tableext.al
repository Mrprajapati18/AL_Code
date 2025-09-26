tableextension 50102 TT extends "User Setup"
{
    fields
    {
        field(50100; "Customer Permission"; Boolean)
        {

        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}




pageextension 50102 US extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Customer Permission"; Rec."Customer Permission")
            {
                ApplicationArea = All;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}