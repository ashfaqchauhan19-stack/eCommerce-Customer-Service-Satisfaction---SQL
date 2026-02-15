use customer_support_data;
alter table customer_support
change column `ï»¿Unique id` unique_id varchar(50);


-- 1. Display all records from the customer support table.

select * from customer_support;

-- 2. Show only Unique id, channel_name, and category columns.

select unique_id, channel_name, category
from customer_support;

-- 3. Find all records where channel_name = 'Inbound'.

select *
from customer_support
where channel_name = 'Inbound';

-- 4. List all distinct categories available.

select distinct category
from customer_support;

-- 5. Find customers whose CSAT Score = 5.

select * 
from customer_support
where csat_score = 5;

-- 6. Count how many cases are handled per channel_name.

select channel_name, count(*) as total_cases
from customer_support
group by channel_name;

-- 7. Find the average CSAT Score for each Agent Shift.

select agent_shift, avg(csat_score) as avg_csat_score
from customer_support
group by agent_shift;

-- 8. Show the number of tickets handled by each agent.

select agent_name, count(*)
from customer_support
group by agent_name;

-- 9. Find the top 5 agents with the highest number of tickets.
select agent_name, count(*) as total_tickets
from customer_support 
group by agent_name
order by total_tickets desc
limit 5;

-- 10. Display all records where: category = 'Product Queries' AND channel_name = 'Outcall'

select *
from customer_support 
where category = 'Product Queries' and channel_name = 'Outcall';

-- 11. Find the average response time (difference between issue_reported_at and issue_responded) for each agent.

SELECT agent_name,
       AVG(TIMESTAMPDIFF(MINUTE, issue_reported_at, issue_responded)) AS avg_response_minutes
FROM customer_support
GROUP BY agent_name;

-- 12.  Identify the agent with the highest average CSAT Score.

select agent_name, avg(csat_score) as highest_avg_csat_score
from customer_support 
group by agent_name
order by highest_avg_csat_score desc
limit 1;

-- 13. Find the daily number of issues reported (group by date).

select date(issue_reported_at)as report_date, count(*) as total_issues
from customer_support
group by date(issue_reported_at)
order by report_date;

-- 14. Find categories where average CSAT Score is less than 4.

select category, avg(csat_score) as avg_csat
from customer_support
group by category
having avg_csat < 4;

-- 15. Show the supervisor-wise count of agents.

select supervisor, count(distinct agent_name) as agent_count
from customer_support 
group by supervisor;


-- Thank you:)