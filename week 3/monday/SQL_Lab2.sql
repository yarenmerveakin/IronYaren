USE bank;

#Get the id values of the first 5 clients from district_id with a value equal to 1.
SELECT client_id FROM bank.client
WHERE district_id  = 1
Limit 5;

#In the client table, get an id value of the last client where the district_id is equal to 72.
SELECT client_id FROM bank.client
WHERE district_id = 72
ORDER BY client_id desc
Limit 1;

# Get the 3 lowest amounts in the loan table
SELECT amount FROM bank.loan
ORDER BY amount
limit 3;

# What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT distinct status FROM bank.loan
ORDER BY status;

#What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM bank.loan
WHERE payments = (SELECT MAX(payments));


#What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT distinct account_id , amount FROM bank.loan
ORDER BY account_id
Limit 5;


#What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?$
select distinct account_id from bank.loan
where duration = 60
group by 1 
order by min(amount)
limit 5;

#What are the unique values of k_symbol in the order table?
SELECT distinct k_symbol FROM bank.order
ORDER BY 1;


#In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id FROM bank.order
WHERE account_id = 34;

#In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT distinct account_id FROM bank.order
WHERE order_id between 29540 AND 29560;

#In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT amount FROM bank.order
WHERE account_id is 30067122;

#In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
SELECT distinct trans_id, date, type, amount FROM bank.trans
where account_id  = 793
order by date desc
Limit 10; 








