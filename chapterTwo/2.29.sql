SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
 FROM cape_codd.inventory
 WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;