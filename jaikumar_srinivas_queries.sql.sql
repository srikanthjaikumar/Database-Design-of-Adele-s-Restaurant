#FINAL LIST OF QUERIES 

#1 Query Provides a list of employees who have requested for leave
SELECT e.employee_id AS 'Employee ID', e.employee_first_name AS 'Employee First Name', 
e.employee_last_name AS 'Employee Last Name', e.contact_no AS 'Contact No', el.leave_day AS 'Day Leave Requested',
t.start_time AS 'Start Time', t.end_time AS 'End Time'
FROM employee e, employee_leave el, time t 
WHERE e.employee_id=el.employee_id
AND el.leave_slot_name=t.slot_name
ORDER BY e.employee_ID,t.start_time,t.end_time;

#2 Check on particular items in the Inventory that have fallen below a given level as set by the user
/*The following query considers the below mentioned items in the inventory
1) STBK TEA TAZO ORANGE
2) STBK TEA TAZO ZEN
3) STBK TEA TAZO REFRESH
*/
SELECT item_id AS 'Item ID', item_name AS 'Item Name', item_quantity AS 'Item Quantity'
FROM inventory
WHERE item_name IN('STBK TEA TAZO ORANGE','STBK TEA TAZO ZEN','STBK TEA TAZO REFRESH')
AND item_quantity < 30
ORDER BY item_id;

#3 Query to check the value of existing stock in the Inventory
SELECT SUM(item_price*item_quantity) AS 'Price of Stock'
FROM inventory;

#4 Query to check who the immediate supervisor of employees is
SELECT a.employee_id AS 'Employee ID', a.employee_first_name AS 'Employee First Name', 
a.employee_last_name AS 'Employee Last Name',b.employee_first_name AS 'Supervisor First Name',
b.employee_last_name AS 'Supervisor Last Name'
FROM employee a JOIN employee b
ON b.employee_id=a.employee_supervisor
ORDER BY a.employee_id;

#5 Query to check the total number of items that were sold belonging to a particular category
#  and a particular date
SELECT pc.product_category AS 'Product Category',count(*) AS 'Total Number of Items Sold', DATE(time_stamp) AS 'Date Sold'
FROM ordered_items oi,menu_items mi, product_categories pc
WHERE oi.product_ID=mi.product_ID
AND mi.category_ID=pc.category_ID
AND DATE(time_stamp) = '2016-04-18'
GROUP BY mi.category_ID;

#6 Query that lists the total number of items that have been sold so far belonging to a particular category 
SELECT pc.product_category AS 'Product Category',count(*) AS 'Total Number of Items Sold'
FROM ordered_items oi,menu_items mi, product_categories pc
WHERE oi.product_ID=mi.product_ID
AND mi.category_ID=pc.category_ID
GROUP BY mi.category_ID;

#7 Query that lists the menu items that are being sold in High Frequency with level set by user
SELECT oi.product_id AS 'Product ID',mi.product_name AS 'Product name',SUM(frequency_count) AS Frequency_Count
FROM ordered_items oi,menu_items mi
WHERE oi.product_id=mi.product_id
GROUP BY oi.product_id
HAVING Frequency_Count >= 6
ORDER BY Frequency_count DESC;

#8 Query that provides breakdown of the amount that has been generated by the cafe on a day-to-day basis
SELECT SUM(product_cost*frequency_count) AS 'Revenue Generated',DATE(time_stamp) AS 'Date'
FROM ordered_items oi, menu_items mi
WHERE oi.product_id=mi.product_id
GROUP BY DATE(time_stamp)
ORDER BY DATE(time_stamp) ASC;

#9 Query to generate the Date and Amount in the week the cafe earnt the highest revenue in terms of sales
SELECT MAX(cost_of_items) AS 'Total Revenue Generated', time_stamp AS 'Date'
FROM
(
SELECT SUM(product_cost*frequency_count) Cost_of_items,DATE(time_stamp) time_stamp
FROM ordered_items oi, menu_items mi
WHERE oi.product_id=mi.product_id
GROUP BY DATE(time_stamp)
) temp;

#10 Query that shows the revenue that was generated by the cafe on a particular Day as set by the User
SELECT SUM(product_cost*frequency_count) AS 'Total Amount', oi.time_stamp AS 'Date_Of_Collection' 
FROM ordered_items oi, menu_items mi
WHERE oi.product_id=mi.product_id
AND DATE(oi.time_stamp) = '2016-04-18';

#11 Query that provides the list of employees who are available to work along with time slots. It also takes
#  into account the Date set by user in order to avoid stale entries from the employee_leave table
#  interfering with current data.
SELECT ea.employee_ID AS 'Employee ID',ea.day AS 'Day',ea.slot_name AS 'Slot Name'
FROM employee_availability ea
LEFT JOIN employee_leave el
ON ea.employee_ID=el.employee_ID AND
   ea.day=el.leave_day AND
   ea.slot_name=el.leave_slot_name
   AND DATE(time_stamp) >= '2016-04-01'
WHERE 
leave_id IS NULL
ORDER BY ea.employee_ID

#12 Trigger - Inventory Update Log
/*
DELIMITER //
CREATE TRIGGER inventory_update
AFTER UPDATE
ON inventory
FOR EACH ROW
BEGIN
INSERT INTO update_inventory_log(update_log_ID,item_ID,old_quantity,new_quantity,time_stamp) VALUES(update_log_ID,old.item_ID,old.item_quantity,new.item_quantity,now());
END;//
/*

This is an update trigger that will be fired every time an update on the Inventory Table is performed.
The data is recorded in the 'update_inventory_log' table as shown below
*/

SELECT update_log_ID AS 'Update Log ID', item_ID AS 'Item ID', old_quantity AS 'Old Quantity',
new_quantity AS 'New Quantity', time_stamp AS 'Time Stamp of Update'
FROM update_inventory_log
