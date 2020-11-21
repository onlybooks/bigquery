SELECT * FROM my_table
WHERE transaction_date >= DATE_SUB(CURDATE(), INTERVAL 10 DAY)