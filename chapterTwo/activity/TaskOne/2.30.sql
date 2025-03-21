SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
 FROM cape_codd.inventory
 WHERE  QuantityOnHand between 1 AND 10;