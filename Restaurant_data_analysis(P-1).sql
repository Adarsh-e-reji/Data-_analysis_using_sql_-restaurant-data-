#-------------------------------------------------------------------------
#[DATA ANALYSIS ON RESTAURANT DATA]
#-------------------------------------------------------------------------
use adarsh; #activating my DB
#-------------------------------------------------------------------------

#1. Financial Performance KPIs
#1.1 Average Total Bill Per Customer
select round(avg(total_bill)) as Avg_Bill from tips; 

#1.2 Total Revenue Per Day
select day as Day,round(sum(total_bill)) as Revenue from tips group by day order by field(day, 'Thu', 'Fri', 'Sat', 'Sun');

#1.3 Average Tip Percentage
select avg(tip/total_bill) as 'Average tip given by customer' from tips;

#1.4 Highest Revenue-Generating Day
select day as Day,round(sum(total_bill)) as 'Revenue Generated' from tips group by Day order by sum(total_bill) desc limit 1 ;

#----------------------

#2. Customer Behavior KPIs
#2.1 Average Group Size
select avg(size) as "Average group size"from tips;

#2.2 Peak Dining Time (Lunch vs. Dinner)
select time as Time,count(*) as "Number of customers" from tips group by time ; 

#2.3 Percentage of Customers Who Dine Alone 
select (select count(*) from tips where size=1)/(select count(*) from tips)*100 as "Percentage of customers who dine alone" from tips limit 1;

#2.4 Smoking vs. Non-Smoking Customers
select smoker,count(*) as "Number of customers" from tips group by smoker order by field(smoker,'yes','no');

#----------------------

#3. Marketing & Customer Segmentation KPIs
#3.1 Most Frequent Customer Gender
select gender,count(*) as "Number of customers" from tips group by gender order by count(*) desc limit 1;

#3.2 Highest Spending Customer Segment (Gender & Smoking Status)
select gender,smoker,avg(total_bill) as "Money spent" from tips group by gender,smoker order by avg(total_bill) desc limit 1;

#3.3 Best Day for High Tips
select day, avg(tip/total_bill) as "Tip received" from tips group by day order by avg(tip/total_bill) desc limit 1;

#3.4 Most Popular Group Size
select size,count(*) as "Group size" from tips group by size order by count(*) desc limit 1;

#----------------------

#4. Operational Efficiency KPIs
#4.1 Total Number of Customers Per Day
select day,sum(size) as customers from tips group by day order by field(day,"thur","fri","sat","sun");

#4.2 Average Spending Per Table
select size,round(avg(total_bill)) as "Average spending per table" from tips group by size;

#4.3 Total Revenue During Lunch vs. Dinner
select time,round(sum(total_bill)) as "Total revenue" from tips group by time;

#4.4 Best Day for Promotions
select day,count(*) from tips group by day order by count(*) desc ;

#----------------------

#5. Customer Experience & Loyalty KPIs
#5.1 Customer Satisfaction Score (Based on Tips)
select avg(tip/total_bill)*100 from tips;

#5.2 Repeat Customer Analysis
select gender,size,count(*) as "customers" from tips group by gender,size order by gender desc,count(*) desc  ;

#----------------------

#6. Advanced Insights & Predictive Analysis KPIs
#6.1 Seasonal Trends in Revenue
select day,round(sum(total_bill)) as "Total bill"from tips group by day order by sum(total_bill) desc;

#6.2 Impact of Group Size on Tip Percentage
select size,avg(tip/total_bill)*100 as "Average tip" from tips group by size order by size;

#6.3 Time-Based Spending Pattern (Hourly Analysis)
select time,avg(total_bill) from tips group by time;

#6.4 Tip Amount Based on Day of the Week
select day,avg(tip) from tips group by day ;

#----------------------

#7. Profitability & Cost Optimization KPIs
#7.1 Average Revenue Per Seat
select round(sum(total_bill)/sum(size))as "Avg revenue per seat" from tips;

#7.2 Most Profitable Customer Type
select gender,smoker,round(avg(total_bill),2) as "Average bill" from tips group by gender,smoker order by avg(total_bill) desc;

#----------------------
