-- 8) 查询持有两张(含）以上信用卡的用户的名称、身份证号、手机号。
--    请用一条SQL语句实现该查询：


select c_name, c_id_card, c_phone from client
where (
    select count(*) as cnt from(
        select * from bank_card
        where c_id = b_c_id and b_type = "信用卡"
    ) as card_cnt
) >= 2;



/*  end  of  your code  */