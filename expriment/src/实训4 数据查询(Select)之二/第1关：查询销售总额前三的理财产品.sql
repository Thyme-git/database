 -- 1) 查询销售总额前三的理财产品
--   请用一条SQL语句实现该查询：
select * from(
    select 
        year(pro_purchase_time) as pyear,
        rank() over(partition by year(pro_purchase_time) order by pro_quantity*p_amount desc) as rk,
        p_id,
        pro_quantity*p_amount as sumamount
    from property join finances_product on pro_pif_id = p_id
    where pro_type = 1 and year(pro_purchase_time) in (2010, 2011)
    order by pyear, rk, p_id
) as part
where rk <= 3;
/*  end  of  your code  */