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
    }
}