pageextension 50056 "DXCItemLedgerEntriesExt" extends "Item Ledger Entries" //38
{
    layout
    {
        addlast(Control1)
        {
            field(Inventory;Inventory)
            {
                ApplicationArea = All; 
                DecimalPlaces = 0:5; 
            }
        }
    }
    
    actions
    {
        addafter("Order &Tracking")
        {
            action(DXCUpdateQuantityOnHand)
            {
                ApplicationArea = All;
                Caption = 'Update Quantity on Hand';
                Image = "UpdateDescription";

                    trigger OnAction();
                        var 
                            DXCUpdateItemLedgerEntry: Report "DXC Update Item Ledger Entry";
                    begin
                        DXCUpdateItemLedgerEntry.Run;
                    end;
            }
        }
    }
}