connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit

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

SELECT * FROM v2;

