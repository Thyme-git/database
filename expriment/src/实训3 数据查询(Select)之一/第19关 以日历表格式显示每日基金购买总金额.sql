-- 19) 以日历表格式列出2022年2月每周每日基金购买总金额，输出格式如下：
-- week_of_trading Monday Tuesday Wednesday Thursday Friday
--               1
--               2    
--               3
--               4
--   请用一条SQL语句实现该查询：

select week_of_trading,
    (case d1 when 0 then null else d1 end) as Monday,
    (case d2 when 0 then null else d2 end) as Tuesday,
    (case d3 when 0 then null else d3 end) as Wednesday,
    (case d4 when 0 then null else d4 end) as Thursday,
    (case d5 when 0 then null else d5 end) as Friday

-- 2月开始，所以 week-5
from (
    select week(pro_purchase_time)-5 as week_of_trading,
    sum(case weekday(pro_purchase_time) when '0' then total else 0 end) as d1,
    sum(case weekday(pro_purchase_time) when '1' then total else 0 end) as d2, 
    sum(case weekday(pro_purchase_time) when '2' then total else 0 end) as d3, 
    sum(case weekday(pro_purchase_time) when '3' then total else 0 end) as d4, 
    sum(case weekday(pro_purchase_time) when '4' then total else 0 end) as d5 

    from (
        select pro_purchase_time, sum(pro_quantity*f_amount) as total
        from property join fund
        on pro_pif_id = f_id and pro_type = '3'
        where pro_purchase_time like '2022-02-%'
        group by pro_purchase_time
    ) as p

group by week_of_trading) as t;
/*  end  of  your code  */