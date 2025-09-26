report 50104 "Payment Confirmation Report"
{
    ApplicationArea = All;
    Caption = 'Payment Confirmation Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'SRC/Report/BankConfirmation Report.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            RequestFilterFields = "Document No.";

            column(GL_Amount; GL_Amount)
            { }
            // Payment Details 
            column(compinfo_picture; compinfo.Picture)
            {
            }
            column(compinfo_BankName; compinfo."Bank Name")
            {
            }
            column(Sendingbank; Sendingbank)
            {
            }
            column(ReceivingBank; ReceivingBank)
            {
            }
            column(MessagesenddataTime; MessagesenddataTime)
            {
            }
            column(SenderBankReference; SenderBankReference)
            {
            }
            column(CustomerReferemce; CustomerReferemce)
            {
            }
            column(UETR; UETR)
            {
            }
            column(SettelmentDate; SettelmentDate)
            {
            }
            column(SettelmentCCYAmount; SettelmentCCYAmount)
            {
            }
            column(InstructedCCYAndAmount; InstructedCCYAndAmount)
            {
            }
            column(Bank_Account_No_; "Bank Account No.")
            {
            }
            column(Amount__LCY_; "Amount (LCY)")
            {
            }
            column(compinfo_Name; compinfo.Name)
            {
            }
            column(compinfo_Add1; compinfo.Address)
            {
            }
            column(compinfo_Add2; compinfo."Address 2")
            {
            }
            column(compinfo_post_code; compinfo."Post Code")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(External_Document_No_; "External Document No.")
            {
            }
            column(compinfo_AccountNo; compinfo."Bank Account No.")
            {
            }
            column(Document_No_Ref; "Document No.")
            {
            }

            // Customer Details
            column(OrderingCustomer; OrderingCustomer)
            {
            }
            // Ordering institution
            column(OrderingIntitution; OrderingIntitution)
            {
            }
            column(IntermediaryInstitution; IntermediaryInstitution)
            {
            }
            column(AccountWithInstutition; AccountWithInstutition)
            {
            }
            column(VENBNO; VENBNO)
            { }

            column(VLE_rec_CustAcc; VLE_rec."Vendor No.")
            {
            }
            // Benefiecial Customer
            column(BeneficiaryCustomer; BeneficiaryCustomer)
            {
            }
            column(RemittanceInformation; RemittanceInformation)
            {
            }
            column(Chargecode; Chargecode)
            {
            }
            column(BankAccount_IFSCcode; BankAccount."IFSC Code")
            {
            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(VENBNO);
                VenAcc_rec.Reset();
                vec_rec.Reset();
                VLE_rec.Reset();
                VLE_rec.SetRange("Document No.", "Document No.");
                if VLE_rec.FindFirst() then begin
                    vec_rec.SetRange("No.", VLE_rec."Vendor No.");
                    if vec_rec.FindFirst() then begin
                        VenAcc_rec.SetRange(Code, vec_rec."Preferred Bank Account Code");
                        if VenAcc_rec.FindFirst() then begin
                            VENBNO := VenAcc_rec.Name;
                        end;
                    end;
                end;

                Clear(GL_Amount);
                GL_Rec.Reset();
                GL_Rec.SetRange("Document No.", "Document No.");
                if GL_Rec.FindFirst() then begin
                    GL_Amount := GL_Rec.Amount;
                end;
            end;
        }
    }
    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //             }
    //         }
    //     }
    //     actions
    //     {
    //         area(Processing)
    //         {
    //         }
    //     }
    // }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        compinfo.get();
        compinfo.CalcFields(Picture)
    end;

    var
        GL_Rec: Record "G/L Entry";
        GL_Amount: Decimal;

        VENBNO: Code[40];
        VenAcc_rec: Record "Vendor Bank Account";
        vec_rec: Record Vendor;

        VLE_rec: Record "Vendor Ledger Entry";

        compinfo: Record "Company Information";

        cust: Record Customer;
        SendingBank: Label 'Sending Bank';
        ReceivingBank: Label 'Receiving Bank';
        MessagesenddataTime: Label 'Message send Data/Time';
        SenderBankReference: Label 'Sender Bank Reference';
        CustomerReferemce: Label 'Customer Referemce';
        UETR: Label 'UETR';
        SettelmentDate: Label 'Settelment Date';
        SettelmentCCYAmount: Label 'Settelment CCY & Amount';
        InstructedCCYAndAmount: Label 'Instructed CCY & Amount';
        OrderingCustomer: Label 'Ordering Customer';
        OrderingIntitution: Label 'Ordering Intitution';
        IntermediaryInstitution: Label 'Intermediary Institution';
        AccountWithInstutition: Label 'Account With Instutition';
        BeneficiaryCustomer: Label 'Beneficiary Customer';
        RemittanceInformation: Label 'Remittance Information';
        Chargecode: Label 'Charge Code';
        BankAccount: Record "Bank Account";
}
