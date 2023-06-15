  -- 2) 投资积极且偏好理财类产品的客户
--   请用一条SQL语句实现该查询：

select f.pro_c_id
from
(
    select pro_c_id, count(*) as p_cnt
    from property
    where pro_type = 1
    group by pro_c_id
) as p
join
(
    select pro_c_id, count(*) as f_cnt
    from property
    where pro_type = 3
    group by pro_c_id
) as f
on p.pro_c_id = f.pro_c_id
where p_cnt > f_cnt;

/*  end  of  your code  */