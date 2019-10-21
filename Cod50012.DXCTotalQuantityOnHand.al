codeunit 50012 "DXCTotalQuantityOnHand"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure HandleBeforeInsertItemLedgEntryOnItemJnlPostLine(var ItemLedgerEntry : Record "Item Ledger Entry"; ItemJournalLine : Record "Item Journal Line")
        var
            Item: Record Item;
    begin
        Item.SetRange("No.",ItemLedgerEntry."Item No.");
        Item.SetRange("Location Filter",ItemLedgerEntry."Location Code");
        if Item.FindFirst then
            Item.CalcFields(Inventory);
        ItemLedgerEntry.Inventory := Item.Inventory;    
    end;
    
}