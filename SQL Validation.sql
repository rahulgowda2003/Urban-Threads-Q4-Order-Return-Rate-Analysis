use demo1;
SELECT * FROM demo1.urbanthreads_q4_cleaned;

#Data validation

#All order_id values follow the format UT-XXXXXX 
select `ï»¿Order ID`
from urbanthreads_q4_cleaned
where `ï»¿Order ID` not like "UT%";

#customer_type contains only "New" or "Returning"
select Type
from urbanthreads_q4_cleaned
where Type not in ("New","Returning");

#quantity is a positive integer
select Qty
from urbanthreads_q4_cleaned
where Qty  <= 0
or Qty is null
or Qty <> floor(Qty);

#discount_percent Between 0 and 100
select `Disc %`
from urbanthreads_q4_cleaned
where `Disc %` < 0
or `Disc %` > 100
or `Disc %` is null;

#order_date Within Q4 2024
select `Order Date`
from urbanthreads_q4_cleaned
where `Order Date` not between "01-10-2024" and "31-12-2024";

#payment_method Matches 5 Defined Options
select distinct(Payment)
from urbanthreads_q4_cleaned
where Payment not in (
select Payment
from urbanthreads_q4_cleaned
);

#If delivery_status = "Delivered", then delivery_date must exist
select `Delivery Date`
from urbanthreads_q4_cleaned
where Status = "Delivered"
and `Delivery Date` is null;

#If return_initiated = "No", then return_reason must be blank
select Reason
from urbanthreads_q4_cleaned
where `Return?` = "No"
and Reason is not null
and Reason <> "";

#warehouse_origin Only 3 Locations
select Warehouse
from urbanthreads_q4_cleaned
where Warehouse not in(
select Warehouse
from urbanthreads_q4_cleaned
);

#refund_status = "Not Applicable" when return_initiated = "No"
select Refund
from urbanthreads_q4_cleaned
where `Return?` = "No"
and Refund <> "Not Applicable";

#For orders with delivery_status = "RTO," verify that return_initiated should logically be "No"
#(RTO means shipment never reached customer)
select Status,
`Return?`
from urbanthreads_q4_cleaned
where Status = "RTO"
and `Return?`= "Yes";

#For customer_type = "New," confirm the customer_id doesn't appear in earlier orders (you
#won't have historical data, but flag if same customer_id appears multiple times with "New"
#status in this dataset)
select `Customer ID`
from urbanthreads_q4_cleaned
where `Customer ID` = "New"
group by `Customer ID`
having count(*) > 1;

#Calculate average delivery time (delivery_date - order_date). Flag any negative values or
#values > 30 days
select DATEDIFF(`Delivery Date`, `Order Date`) delivery_days
from urbanthreads_q4_cleaned
where `Delivery Date` is not null
and (DATEDIFF(`Delivery Date`, `Order Date`) < 0
or DATEDIFF(`Delivery Date`, `Order Date`) > 30);

#Verify return window: If return_received - delivery_date > 30 days, flag as exception
select DATEDIFF(`Return Received`, `Delivery Date`) return_days
from urbanthreads_q4_cleaned
where `Return Received` is not null
and DATEDIFF(`Return Received`, `Delivery Date`) > 30;