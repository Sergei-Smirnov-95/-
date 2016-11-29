connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit;

CREATE TABLE Offer (
	OffID int PRIMARY KEY,
	Price int,
	WPID int
);


CREATE TABLE Id_Works ( 
	WID int, 
	WorkID int,
	NumWorks int,	
	id int PRIMARY KEY
);
ALTER TABLE Work_Parts ADD PID INT;
ALTER TABLE Work_Parts ADD WID INT;
ALTER TABLE Work_Parts DROP SID;
ALTER TABLE Work_Parts DROP WorkID;

ALTER TABLE Offer ADD CONSTRAINT Offer_fk0 FOREIGN KEY (WPID) REFERENCES Work_Parts(WPID);
ALTER TABLE Ser_info ADD WPID INT REFERENCES Work_Parts(WPID);

ALTER TABLE Id_Works ADD CONSTRAINT Id_Works_fk0 FOREIGN KEY (WID) REFERENCES Work_Parts(WID);
ALTER TABLE Id_Works ADD CONSTRAINT Id_Works_fk1 FOREIGN KEY (WorkID) REFERENCES Works(WorkID);
commit;

ALTER TABLE Id_Part ADD NumParts INT;
ALTER TABLE Id_Part DROP WPID;
ALTER TABLE Id_Part ADD PID INT REFERENCES Work_Parts(PID);
commit;

show tables;