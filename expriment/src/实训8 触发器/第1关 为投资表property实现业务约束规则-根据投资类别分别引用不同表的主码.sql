use finance1;

drop trigger if exists before_property_inserted;
-- 请在适当的地方补充代码，完成任务要求：
delimiter $$
CREATE TRIGGER before_property_inserted BEFORE INSERT ON property
FOR EACH ROW 
BEGIN
    declare msg char(128);
    
    if new.pro_type not in (1, 2, 3) then
        set msg = concat('type ',new.pro_type,' is illegal!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    
    elseif new.pro_type = 1 and not exists(select * from finances_product where new.pro_pif_id = p_id) then
        set msg = concat('finances product #',new.pro_pif_id,' not found!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;

    elseif new.pro_type = 2 and not exists(select * from insurance where new.pro_pif_id = i_id) then
        set msg = concat('insurance #',new.pro_pif_id,' not found!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;

    elseif new.pro_type = 3 and not exists(select * from fund where new.pro_pif_id = f_id) then
        set msg = concat('fund #',new.pro_pif_id,' not found!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;

    end if;

END$$
 
delimiter ;
