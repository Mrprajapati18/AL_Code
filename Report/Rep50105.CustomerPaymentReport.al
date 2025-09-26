report 50100 "Customer Report"
{
    ApplicationArea = All;
    Caption = 'Payment Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'SRC/Report/PaymentConfirmation Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(BankLedger; "Bank Account Ledger Entry")
        {
            column(DocumentNo; BankLedger."Document No.")
            { }

            column(Bank_Account_No_; BankLedger."Bank Account No.")
            { }

            column(PostingDate; BankLedger."Posting Date")
            { }
            column(External_Document_No_; BankLedger."External Document No.")
            { }

            column(SenderBankName; SenderBank.Name)
            { }

            column(SenderBankIFSCCode; SenderBank."IFSC Code")
            { }

            column(Amount__LCY_Settelment; "Amount (LCY)")
            { }
            column(Amount__LCY_Instructed; "Amount (LCY)")
            { }

            column(CompanyName; CompanyInfo.Name)
            { }
            column(CompanyAddress; CompanyInfo.Address)
            { }
            column(CompanyAddress2; CompanyInfo."Address 2")
            { }
            column(CompanyCity; CompanyInfo.City)
            { }
            column(CompanyPostCode; CompanyInfo."Post Code")
            { }
            column(CompanyCountry; CompanyInfo."Country/Region Code")
            { }
            column(CompanyPhone; CompanyInfo."Phone No.")
            { }
            column(CompanyPic; CompanyInfo.Picture)
            { }

            column(CompanyInfo_OrdCust; CompanyInfo."Bank Account No.")
            { }

            column(Document_No_; "Document No.")
            { }
            column(VLE_rec_CustAccount; VLE_rec."Vendor No.")
            { }

            column(Narr_rec_Narration; Narr_rec.Narration)
            { }

            column(venpre_bankCode; venpre)
            { }
            column(venadd1; venadd1)
            { }
            column(venadd2; venadd2)
            { }
            column(ven_city; ven_city)
            { }
            column(ven_state; ven_state)
            { }
            column(venpost; venpost)
            { }

            trigger OnPreDataItem()
            begin
                BankLedger.SetRange("Document No.", FilterDocumentNo);
            end;

            trigger OnAfterGetRecord()
            begin
                if SenderBank.Get(BankLedger."Bank Account No.") then;
                if ReceiverBank.Get(BankLedger."Bal. Account No.") then;
                if Customer.Get(BankLedger."Bal. Account No.") then;
                Clear(venpre);
                Clear(venadd1);
                Clear(venadd2);
                Clear(ven_crd);
                Clear(ven_state);
                Clear(ven_city);
                Clear(venpost);
                vec_rec.Reset();
                VLE_rec.Reset();
                VLE_rec.SetRange("Document No.", "Document No.");
                if VLE_rec.FindFirst() then begin
                    vec_rec.SetRange("No.", VLE_rec."Vendor No.");
                    if vec_rec.FindFirst() then begin
                        venpre := vec_rec."Preferred Bank Account Code";
                        venadd1 := vec_rec.Address;
                        venadd2 := vec_rec."Address 2";
                        ven_crd := vec_rec."Country/Region Code";
                        ven_state := vec_rec."State Code";
                        ven_city := vec_rec.City;
                        venpost := vec_rec."Post Code";
                    end;
                end
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filter)
                {
                    field(FilterDocumentNo; FilterDocumentNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Document No. Filter';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        ven_crd: Text[100];
        venadd2: Text[100];
        venadd1: Text[100];
        venpre: code[50];
        ven_state: Code[100];
        ven_city: Code[100];
        venpost: Code[50];
        vec_rec: Record Vendor;
        FilterDocumentNo: Code[20];
        SenderBank: Record "Bank Account";
        ReceiverBank: Record "Bank Account";
        Customer: Record Customer;
        CompanyInfo: Record "Company Information";
        VLE_rec: Record "Vendor Ledger Entry";
        Narr_rec: Record "Gen. Journal Narration";
}