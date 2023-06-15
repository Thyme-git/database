select c_name, c_id_card, ifnull(sum(amount), 0) as total_amount
from client left outer join (
    select pro_c_id, pro_type, pro_quantity * p_amount as amount
    from property join finances_product
    on pro_pif_id = p_id
    where pro_type = 1

    union all

    select pro_c_id, pro_type, pro_quantity * i_amount as amount
    from property join insurance
    on pro_pif_id = i_id
    where pro_type = 2

    union all

    select pro_c_id, pro_type, pro_quantity * f_amount as amount
    from property join fund
    on pro_pif_id = f_id
    where pro_type = 3

) as P on (c_id = pro_c_id)
group by c_id
order by total_amount desc;