with total_User as(
select
    date_trunc('MONTH',s.ORDERDATE),
    p.PRODUCTNAME ,
    sum(REVENUE) RevenueSum,
from 
    Subscriptions s
join 
    Products p
on
    p.productid = s.productid
where 
    s.ORDERDATE between '2022-01-01'and '2022-12-31'
group by
    date_trunc('MONTH',s.ORDERDATE),
    p.PRODUCTNAME      
 )
select
    PRODUCTNAME,
    min(RevenueSum) as MIN_REV,
    max(RevenueSum) as MAX_REV,
    avg(RevenueSum) as AVG_REV,
    stddev(RevenueSum) as STD_DEV_REV 
from
    total_User
group by 
    PRODUCTNAME;
