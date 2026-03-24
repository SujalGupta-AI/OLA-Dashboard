# OLA Ride Analytics & Performance Dashboard

![Main Dashboard Snapshot](Snapshot%20of%20the%20Dashboard.png)

## Executive Summary
This project features an interactive Power BI dashboard designed to analyze OLA ride booking data. By visualizing key performance indicators (KPIs) such as booking status, cancellation rates, vehicle performance, and revenue distribution, this dashboard provides actionable insights into operational efficiency and customer behavior. The goal of this analysis is to empower stakeholders to make data-driven decisions that improve ride completion rates and maximize revenue.

## Business Problem
Ride-hailing services like OLA operate in a highly dynamic environment where efficiency directly impacts profitability and customer satisfaction. The primary business challenges addressed in this project include:
* **High Cancellation Rates:** Understanding the volume and reasons behind rides cancelled by customers versus those cancelled by drivers.
* **Revenue Leakage:** Identifying incomplete rides and optimizing vehicle utilization to maximize daily revenue.
* **Operational Bottlenecks:** Determining peak booking trends and vehicle category preferences (Mini, Prime Sedan, Bike) to better allocate the fleet and reduce customer wait times.

## Methodology
1. **Data Ingestion & Cleaning:** Imported raw ride data into Power BI. Handled missing values, formatted dates/times, and categorized booking statuses to ensure accurate reporting.
2. **Data Modeling:** Established relationships between primary data tables (ride details, vehicle types, customer demographics) to allow for seamless cross-filtering.
3. **Calculations & DAX:** Created custom DAX measures to calculate critical KPIs, including Total Bookings, Overall Cancellation Rate, Successful Ride Value, and Average Ride Distance.
4. **Dashboard Design:** Developed an interactive, user-friendly interface using Power BI. Utilized bar charts, donut charts, line graphs, and KPI cards to visualize the data. Applied slicers for dynamic filtering by date, vehicle type, and booking status.


## Skills
* **Data Visualization & Business Intelligence:** Power BI (`.pbit` implementation)
* **Data Transformation:** Power Query
* **Data Analysis Expressions:** DAX (Measures, Calculated Columns)
* **Analytical Thinking:** KPI tracking, trend analysis, and performance tracking

## Results & Business Recommendation

### Key Results
* **Booking Success:** Out of total bookings, only **65%** were successfully completed, highlighting a significant drop-off in the ride lifecycle.
* **Cancellation Insights:** Customer cancellations accounted for **36%**, while driver cancellations accounted for **64%**. The most common reason for driver cancellation was **Personal & Car Related Issue, Customer Related Isuue**.


* **Vehicle Performance:** The **Prime Sedan** category generated the highest revenue, while **Auto** saw the highest volume of bookings.


* **Payment Methods:** **Cash, UPI** was the preferred payment method for successful rides.


### Business Recommendations
1. **Reduce Driver Cancellations:** Implement a tiered incentive program that rewards drivers for maintaining a high ride acceptance and completion rate, particularly during peak hours or in high-demand zones.
2. **Optimize Fleet Distribution:** Since **Prime Sedan** shows the highest demand, focus onboarding and promotional efforts on expanding this specific fleet segment.
3. **Customer Retention:** Introduce a dynamic pricing or discount model to re-engage customers who frequently cancel rides due to high wait times. 
4. **Investigate Incomplete Rides:** Conduct a deeper dive into the specific geographic zones or times of day where "Driver not found" statuses spike to optimize driver positioning.

## Next Step
* **Predictive Analytics:** Integrate Python or R scripts to forecast future ride volumes and predict high-surge areas based on historical weather and traffic data.
* **Geospatial Analysis:** Incorporate detailed map visuals to identify specific city zones with the highest rates of unfulfilled bookings.
* **Live Data Integration:** Transition the dashboard from static datasets to a live SQL database or API feed for real-time monitoring.
