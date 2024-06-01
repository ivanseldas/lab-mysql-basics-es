USE bank;

SHOW TABLES FROM bank;
SHOW COLUMNS FROM client;


-- CONSULTA 1
-- Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.
SELECT client_id FROM client
WHERE district_id = 1
LIMIT 5;

-- CONSULTA 2
-- En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.
SELECT client_id FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

-- CONSULTA 3
-- Obtén las 3 cantidades más bajas en la tabla loan.
SHOW COLUMNS FROM loan;
SELECT amount FROM loan
ORDER BY amount
LIMIT 3;

-- CONSULTA 4
-- ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
SHOW COLUMNS FROM loan;
SELECT DISTINCT status FROM loan
ORDER BY status;

-- CONSULTA 5
-- ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?
SELECT loan_id FROM loan
WHERE payments = (SELECT MAX(payments) FROM loan);

-- CONSULTA 6
-- ¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.
SELECT account_id, amount FROM loan
ORDER BY account_id
LIMIT 5;

-- CONSULTA 7
-- ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?
SHOW COLUMNS FROM loan;
SELECT account_id FROM loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;

-- CONSULTA 8
-- ¿Cuáles son los valores únicos de k_symbol en la tabla order?
SHOW COLUMNS FROM `order`;
SELECT DISTINCT k_symbol FROM `order`
WHERE k_symbol != ''
ORDER BY k_symbol;

-- CONSULTA 9
-- En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?
SELECT order_id FROM `order`
WHERE account_id = 34;

-- CONSULTA 10
-- En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?
SHOW COLUMNS FROM `order`;
SELECT DISTINCT account_id FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

-- CONSULTA 11
-- En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?
DESCRIBE TABLE `order`;
SHOW COLUMNS FROM `order`;
SELECT amount FROM `order`
WHERE account_to = 30067122;

-- CONSULTA 12
-- En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, 
-- de las más recientes a las más antiguas.
SHOW COLUMNS FROM trans;
SELECT trans_id, date, type, amount FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

-- CONSULTA 13
-- En la tabla client, de todos los distritos con un district_id menor que 10, 
-- ¿cuántos clientes hay de cada district_id? Muestra los resultados ordenados por district_id en orden ascendente.
SHOW COLUMNS FROM client;
SELECT district_id, COUNT(*) AS num_clients FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

-- CONSULTA 14
-- En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.
SHOW COLUMNS FROM card;
SELECT type, COUNT(*) AS num_card FROM card
GROUP BY type
ORDER BY num_card DESC;

-- CONSULTA 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SHOW COLUMNS FROM loan;
SELECT account_id, SUM(amount) AS total FROM loan
GROUP BY account_id
ORDER BY total DESC
LIMIT 10;

-- CONSULTA 16
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
SHOW COLUMNS FROM loan;
SELECT date, COUNT(loan_id) AS total FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

-- CONSULTA 17
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, 
-- ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
SHOW COLUMNS FROM loan;
SELECT date, duration, COUNT(*) AS total_loans 
FROM loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date, duration ASC;

-- CONSULTA 18
-- In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). 
-- Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
SHOW COLUMNS FROM trans;
SELECT account_id, type, SUM(amount) AS total_amount FROM trans
WHERE account_id = 396 AND type IN ('VYDAJ', 'PRIJEM')
GROUP BY type
ORDER BY type ASC;









