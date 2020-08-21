SELECT SUM(sales.qty.cell.value) AS num_sold
FROM ch04.logs
WHERE sales.itemid.cell.value = '12345'
