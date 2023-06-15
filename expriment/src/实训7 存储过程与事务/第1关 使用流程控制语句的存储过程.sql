-- Active: 1684152277168@@127.0.0.1@3306@homework
use fib;

-- 创建存储过程`sp_fibonacci(in m int)`，向表fibonacci插入斐波拉契数列的前m项，及其对应的斐波拉契数。fibonacci表初始值为一张空表。请保证你的存储过程可以多次运行而不出错。

drop procedure if exists sp_fibonacci;
delimiter $
create procedure sp_fibonacci(in m int)
begin
######## 请补充代码完成存储过程体 ########
    if m = 1 then
        insert into fibonacci values(0, 0);
    else
        insert into fibonacci values(0, 0), (1, 1);
        set @n = 2;
        while @n < m do
            select fibn into @a from fibonacci where n = @n - 1;
            select fibn into @b from fibonacci where n = @n - 2;
            insert into fibonacci values(@n, @a + @b);
            set @n = @n + 1;
        end while;
    end if;
end $

delimiter ;