select * from my_table
where transaction_date >= DATE_SUB(CURDATE(), INTERVAL 10 DAY)