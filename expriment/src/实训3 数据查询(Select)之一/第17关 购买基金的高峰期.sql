-- 17 查询2022年2月购买基金的高峰期。至少连续三个交易日，所有投资者购买基金的总金额超过100万(含)，则称这段连续交易日为投资者购买基金的高峰期。只有交易日才能购买基金,但不能保证每个交易日都有投资者购买基金。2022年春节假期之后的第1个交易日为2月7日,周六和周日是非交易日，其余均为交易日。请列出高峰时段的日期和当日基金的总购买金额，按日期顺序排序。总购买金额命名为total_amount。
--    请用一条SQL语句实现该查询：

select distinct pro_purchase_time,total_amount from 
(select p1.pro_purchase_time as pro_purchase_time,p1.total as total_amount from
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p1,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p2,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p3
where 
((p2.pro_purchase_time-p1.pro_purchase_time=1)or(weekday(p1.pro_purchase_time)='4' and weekday(p2.pro_purchase_time)='0')) 
and 
((p3.pro_purchase_time-p2.pro_purchase_time=1)or(weekday(p3.pro_purchase_time)='0' and weekday(p2.pro_purchase_time)='4')) 
and p1.total>=1000000 and p2.total>=1000000 and p3.total>=1000000
union
select p2.pro_purchase_time as pro_purchase_time,p2.total as total_amount from
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p1,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p2,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p3
where 
((p2.pro_purchase_time-p1.pro_purchase_time=1)or(weekday(p1.pro_purchase_time)='4' and weekday(p2.pro_purchase_time)='0')) 
and 
((p3.pro_purchase_time-p2.pro_purchase_time=1)or(weekday(p3.pro_purchase_time)='0' and weekday(p2.pro_purchase_time)='4')) 
and p1.total>=1000000 and p2.total>=1000000 and p3.total>=1000000
union
select p3.pro_purchase_time as pro_purchase_time,p3.total as total_amount from
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p1,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p2,
(select pro_purchase_time,sum(pro_quantity*f_amount)as total from property,fund where pro_type='3' and pro_pif_id=f_id and pro_purchase_time like '2022-02-%' group by pro_purchase_time)as p3
where 
((p2.pro_purchase_time-p1.pro_purchase_time=1)or(weekday(p1.pro_purchase_time)='4' and weekday(p2.pro_purchase_time)='0')) 
and 
((p3.pro_purchase_time-p2.pro_purchase_time=1)or(weekday(p3.pro_purchase_time)='0' and weekday(p2.pro_purchase_time)='4')) 
and p1.total>=1000000 and p2.total>=1000000 and p3.total>=1000000)as s3;





/*  end  of  your code  */