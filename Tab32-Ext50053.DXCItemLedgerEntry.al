tableextension 50053 "DXCItemLedgerEntry" extends "Item Ledger Entry" //32
{
    fields
    {
        field(50000;Inventory;Decimal)
        {            
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE ("Item No."=FIELD("Item No.")));
            CaptionML = ENU='Quantity on Hand',
                        ESM='Inventario',
                        FRC='Inventaire',
                        ENC='Quantity on Hand';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        
    }
    
}