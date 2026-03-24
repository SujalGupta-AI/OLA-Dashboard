/*
===================================================================================================
RIDE-HAILING OPERATIONS & FLEET PERFORMANCE ANALYSIS
===================================================================================================
Description: 
    This script analyzes a comprehensive dataset of ride bookings to extract insights 
    into fleet utilization, customer retention, driver performance, and financial metrics.
Business Value:
    Provides operational teams with actionable data to reduce cancellation rates, 
    optimize vehicle dispatching, and track Gross Merchandise Value (GMV).
===================================================================================================
*/


/* ---------------------------------------------------------------------------------------------------
PHASE 1: CORE OPERATIONS & FLEET UTILIZATION
Objective: Track baseline success rates and how different vehicle types are being utilized.
---------------------------------------------------------------------------------------------------
*/

-- 1. Conversion Tracking: Retrieve all successfully completed rides.
select * from bookings
where booking_status = 'Success';

-- 2. Dispatch Optimization: Find the average ride distance for each vehicle type.
-- This helps determine if certain car types (e.g., Micro vs. SUV) are preferred for long or short trips.
select
    Vehicle_Type,
    avg(Ride_Distance) AVG_Ride_Distance
from bookings
group by vehicle_type;


/* ---------------------------------------------------------------------------------------------------
PHASE 2: CHURN & CANCELLATION ANALYSIS
Objective: Identify operational bottlenecks and reasons behind lost revenue.
---------------------------------------------------------------------------------------------------
*/

-- 3. Customer Churn: Count the total number of rides canceled by the customer.
select
    count(customer_id) Total_Cancelled_Rides_By_Customers
from bookings
where booking_status = 'canceled by customer';

-- 5. Driver Reliability: Track rides canceled by drivers specifically due to personal or vehicle issues.
-- Note: Reviewing raw data first to ensure pattern matching is accurate.
select * from Bookings;

select
    count(booking_id) Total_Cancelled_Rides_by_Driver_Due_To_Personal_or_Car_related_Issues
from bookings
where canceled_rides_by_driver like 'personal%' 
   or canceled_rides_by_driver like 'car%';

-- 10. Operational Failure Audit: List all incomplete rides and isolate the documented reasons.
select
    Booking_ID,
    Incomplete_Rides_Reason
from bookings
where incomplete_rides_reason != 'null';


/* ---------------------------------------------------------------------------------------------------
PHASE 3: CUSTOMER LOYALTY & EXPERIENCE
Objective: Identify "power users" and monitor quality control through ratings.
---------------------------------------------------------------------------------------------------
*/

-- 4. VIP Identification: Isolate the top 5 customers with the highest volume of booked rides.
select top 5
    Customer_ID,
    count(booking_id) Total_Rides
from bookings
group by customer_id
order by Total_Rides desc;

-- 6. Premium Tier Quality Control: Check the extreme highs and lows of driver ratings for 'Prime Sedan'.
select
    Vehicle_Type,
    max(driver_ratings) MAX,
    min(driver_ratings) MIN
from bookings
where vehicle_type = 'Prime Sedan'
group by vehicle_type;

-- 8. Product Tier Satisfaction: Calculate the average customer rating across all vehicle types.
select
    Vehicle_Type,
    avg(customer_rating) AVG_Rating_by_Customer
from bookings
group by Vehicle_Type;


/* ---------------------------------------------------------------------------------------------------
PHASE 4: FINANCIALS & TRUE PERFORMANCE
Objective: Track realized revenue and successful trip metrics.
---------------------------------------------------------------------------------------------------
*/

-- 7. Payment Gateway Adoption: Retrieve all rides paid specifically via UPI.
select *
from bookings
where payment_method = 'UPI';

-- 9. Gross Merchandise Value (GMV): Calculate total realized revenue from successful bookings only.
select * from Bookings;

select
    Booking_Status,
    sum(booking_value) Total_Value
from bookings
where booking_status = 'Success'
group by Booking_status;

-- 11. Revenue by Product Line: Rank vehicle types by their total monetary contribution.
select * from bookings;

select
    Vehicle_Type,
    sum(booking_value) Booking_Value,
    rank() over(order by sum(booking_value) desc) Rank
from bookings
where booking_status = 'Success'
group by vehicle_type
order by sum(booking_value) desc;

-- 12. True Operational Distance: Calculate the average travel distance per vehicle, filtering out canceled/failed rides.
select
    Vehicle_Type,
    avg(ride_distance)
from bookings
where booking_status = 'Success'
group by Vehicle_Type;