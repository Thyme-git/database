-- 16) 查询持有相同基金组合的客户对，如编号为A的客户持有的基金，编号为B的客户也持有，反过来，编号为B的客户持有的基金，编号为A的客户也持有，则(A,B)即为持有相同基金组合的二元组，请列出这样的客户对。为避免过多的重复，如果(1,2)为满足条件的元组，则不必显示(2,1)，即只显示编号小者在前的那一对，这一组客户编号分别命名为c_id1,c_id2。

-- 请用一条SQL语句实现该查询：



select c1.c_id1,c2.c_id2 from
    (select pro_c_id as c_id1, group_concat(distinct pro_pif_id) as total from property where pro_type='3' group by pro_c_id)as c1,
    (select pro_c_id as c_id2, group_concat(distinct pro_pif_id) as total from property where pro_type='3' group by pro_c_id)as c2
where c1.total=c2.total and c1.c_id1<c2.c_id2;



/*  end  of  your code  */