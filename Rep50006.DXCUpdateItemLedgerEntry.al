report 50006 "DXC Update Item Ledger Entry"
{
    // version AMC-122

    // AMC-122 AC 10-21-19  Purchasing: Item Ledger Entry: Show total quantity on hand as column before transaction occurred

    ProcessingOnly = true;
    Permissions = TableData "Item Ledger Entry"=rm;

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        // ItemLedgerEntry.MODIFYALL(Inventory,0);
        // EXIT;
        ProgressWindow.OPEN('Processing Entry No. #1#######');
        ItemLedgerEntry.SetCurrentKey("Entry No.");
        //ItemLedgerEntry.Ascending(true);
        //ItemLedgerEntry.SETFILTER("Entry No.",'<%1',100);
        if ItemLedgerEntry.FINDFIRST then
          repeat
            Total := 0;
            //SLEEP(1000);
            
            OldItemLedgerEntry.SETRANGE("Item No.",ItemLedgerEntry."Item No.");
            OldItemLedgerEntry.SETRANGE("Location Code",ItemLedgerEntry."Location Code");
            OldItemLedgerEntry.SETFILTER("Entry No.",'<%1',ItemLedgerEntry."Entry No.");
            if OldItemLedgerEntry.FINDFIRST then begin
              repeat
                // ItemLedgerEntry.Inventory := 0;
                // ItemLedgerEntry.Modify;
                // commit;
                Total := Total + OldItemLedgerEntry.Quantity;
                ItemLedgerEntry.Inventory := Total;
                ItemLedgerEntry.Inventory := ItemLedgerEntry.Inventory + ItemLedgerEntry.Quantity;
                ItemLedgerEntry.Modify;
              until OldItemLedgerEntry.NEXT = 0;
            end else begin
                ItemLedgerEntry.Inventory := ItemLedgerEntry.Quantity;
                ItemLedgerEntry.Modify;
            end;            


            ProgressWindow.UPDATE(1,ItemLedgerEntry."Entry No."); 
            //ItemLedgerEntry.NEXT := 0;
          until ItemLedgerEntry.NEXT = 0;
          ProgressWindow.CLOSE;

          Message('Completed!!!');
    end;

    var
        ItemLedgerEntry : Record "Item Ledger Entry";
        Item : Record Item;
        OldItemLedgerEntry : Record "Item Ledger Entry";
        Total : Decimal;
        ProgressWindow : Dialog;
}

