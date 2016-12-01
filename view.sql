connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit

drop view v1;
drop view v2;
drop view v3;
drop view v4;
drop view v5;
drop view v6;
drop view v7;
drop view v8;
drop view v9;
drop view v10;
drop view v11;
drop view v12;
drop view v13;
drop view v14;
drop view v15;
drop view v16;
drop view v17;
drop view v18;
drop view v19;
drop view v20;

drop procedure insert_value_in_car;
drop procedure up_bonus;
 
drop procedure del_unused_parts;

CREATE VIEW v1 as SELECT * FROM Car;
CREATE VIEW v2 as SELECT * FROM Client;
CREATE VIEW v3 as SELECT * FROM Bonus;
CREATE VIEW v4 as SELECT * FROM Ser_info;
CREATE VIEW v5 as SELECT * FROM Work_Parts;
CREATE VIEW v6 as SELECT * FROM Offer;
CREATE VIEW v7 as SELECT * FROM Id_Works;
CREATE VIEW v8 as SELECT * FROM Id_Part;
CREATE VIEW v9 as SELECT * FROM Works;
CREATE VIEW v10 as SELECT * FROM Parts;


CREATE VIEW v11 AS SELECT VIN FROM car where odo between 200000 and 500000;
CREATE VIEW v12 AS SELECT name FROM client where surname like 'Smirnov' or BID = 3;
CREATE VIEW v13 AS SELECT phone FROM client where surname in ('Kalugina','Evseev') or surname like 'G%';
CREATE VIEW v14 AS SELECT  SUM(Price) as summa FROM Ser_Info where DATE_CRAFT between '02.09.2013' and '02.09.2015';
CREATE VIEW v15 AS SELECT * FROM ser_info order by date_in,price;
CREATE VIEW v16 AS SELECT client.name, car.vin from client,car where client.surname in ('Smirnov','Goremykina','Evseev') and car.odo<500000 and client.clientid = car.clientid;
CREATE VIEW v17 AS SELECT client.name, bonus.discount FROM bonus,client where bonus.summ < 5000 and clientid<3 and client.bid = bonus.bid;
CREATE VIEW v18 AS SELECT min(clientid) as minid,max(odo) as maxKm from car;
CREATE VIEW v19 AS SELECT clientid,count(clientid) as numofcars, avg(odo) as avg_odo from car group by clientid having clientid<4;
CREATE VIEW v20 AS SELECT name FROM client where bid in ( select bid from bonus where discount>3);


SET TERM ^ ;
CREATE PROCEDURE insert_value_in_car ( n1 INT, n2 DECIMAL(15), n3 DECIMAL(6), n4 INT)
AS 
BEGIN
	INSERT INTO Car VALUES( :n1, :n2, :n3, :n4 );
END
^

CREATE PROCEDURE up_bonus(summ int)
AS BEGIN
    UPDATE Bonus 
    SET discount = discount + 1 
    WHERE summ > :summ;
END
^
--execute up_bonus(5000)
CREATE PROCEDURE rem_Offer(price INT)
AS BEGIN
    DELETE FROM offer 
    WHERE price > 
        (select avg(:price) 
        from Offer);
END
^

CREATE PROCEDURE del_unused_parts
AS BEGIN
	DELETE FROM Parts
	WHERE PartID 
	NOT IN
		(SELECT PartID 
		FROM Id_Part);
END
^

SET TERM ; ^


SELECT * FROM v2;