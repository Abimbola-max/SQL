SELECT SKU, SKU_Description, WarehouseID
 FROM cape_codd.inventory
 WHERE QuantityOnHand > 0 OR QuantityOnOrder = 0
 order by WarehouseID desc, SKU asc;