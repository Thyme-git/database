use finance1;
-- 请用一条update语句将手机号码为“13686431238”的这位客户的投资资产(理财、保险与基金)的状态置为“冻结”。：
update property as p inner join client as c
set pro_status = '冻结' where p.pro_c_id=c.c_id and c_phone='13686431238';


/* the end of your code */