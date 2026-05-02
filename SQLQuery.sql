

create database banking_case;
use banking_case;
--- What is the age distribution of customers
select age,count(*) as total_customers from customers 
group by age order by count(*) desc;

--- Which loyalty segment has the highest number of customers?
select `loyalty Classification` as loyalty_segment,
    count(*) as total_customers 
    from customers
group by `loyalty Classification`
order by count(*) desc;

--- Which occupation group has the highest average income?
select Occupation,
round(avg(`Estimated Income`),2) as avg_income
from customers 
group by Occupation 
order by avg(`Estimated Income`) desc;

--- What is the average deposit amount by loyalty segment?
select `loyalty classification`,
round(avg(`Bank Deposits`),2) as bank_deposit
from customers
group by `loyalty classification`
order by avg(`Bank Deposits`);

--- Do high-income customers have higher deposits?

select Nationality,
round(sum(`Estimated Income`),2) as Income,
round(sum(`Bank Deposits`),2)  as Deposits 
from customers
group By Nationality
order by sum(`Estimated Income`) desc;

--- What is the distribution of credit card balances?
select `Amount of Credit Cards` as No_Of_Credit_Cards,
round(sum(`Credit Card Balance`),2) as Balance
 from customers
 group by `Amount of Credit Cards`
 order by sum(`Credit Card Balance`) desc;
 
 --- Which segment takes the highest loans?
 select `Loyalty Classification`,
 round(sum(`Bank Loans`),2) as Loan
 from customers
 group by `Loyalty Classification`
 order by  sum(`Bank Loans`) desc;
 --- What is the relationship between income and loans?
 select Nationality,
round(sum(`Estimated Income`),2) as Income,
round(sum(`Bank Loans`),2)  as Loan 
from customers
group By Nationality
order by sum(`Estimated Income`) desc;
 
 --- Are customers with business lending taking higher loans?
  select Nationality,
round(sum(`Bank Loans`),2) as Bank_Loans,
round(sum(`Business Lending`),2)  as Business_Lending
from customers
group By Nationality
Order By Business_Lending desc;
--- Which risk category has the highest loan exposure?
select `Risk Weighting` as risk_Category,
round(sum(`Bank Loans`),2) as Loans
 from customers
 group by `Risk Weighting`
 order by sum(`Bank Loans`) desc;
 
 select * from customers;
 --- Do high-risk customers have lower deposits?
 select `Risk Weighting` as risk_category,
 round(sum(`Bank Deposits`),2) as deposit
 from customers
 group by `Risk Weighting`
 order by sum(`Bank Deposits`) asc limit 1;
 
 --- Which customers are high income but low loan (opportunity segment)?
 select `Banking Contact`,
 round(sum(`Estimated Income`),2) as Income,
 round(sum(`Bank Loans`),2) as Loan
 from customers
 group by `Banking Contact`
 having Income > Loan;
 
