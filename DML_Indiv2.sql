connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit
drop view Coast_summ;
create VIEW Coast_summ AS 
	select sum(Works_Coast+Parts_Coast-Ser_Info.Price) as Losses from 
	Ser_info
	join Work_diff on (Ser_info.wpid=Work_diff.w_pid)
	join Part_diff on (Ser_info.wpid=Part_diff.w_pid)
	where
	Ser_info.Date_Craft between '2014.01.01' and '2014.12.31';
