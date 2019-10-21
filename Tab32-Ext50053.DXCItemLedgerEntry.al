tableextension 50053 "DXCItemLedgerEntry" extends "Item Ledger Entry" //32
{
    fields
    {
        field(50000;Inventory;Decimal)
        {             
            CaptionML = ENU='Quantity on Hand',
                        ESM='Inventario',
                        FRC='Inventaire',
                        ENC='Quantity on Hand';
            DecimalPlaces = 0:5;
            Editable = false;            
        }
        
    }
    
}