SELECT SKU, SKU_Description
 FROM cape_codd.inventory
 WHERE QuantityOnHand = 0
 order by WarehouseID ASC;