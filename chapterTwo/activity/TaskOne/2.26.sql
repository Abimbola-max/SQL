SELECT SKU, SKU_Description, WarehouseID
 FROM cape_codd.inventory
 WHERE QuantityOnOrder > 0
 order by WarehouseID desc, SKU ASC;