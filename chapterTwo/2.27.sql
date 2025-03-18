SELECT SKU, SKU_Description, WarehouseID
 FROM cape_codd.inventory
 WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
 order by WarehouseID desc, SKU ASC;