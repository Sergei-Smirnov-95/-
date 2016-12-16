connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit

drop view Max_diff;
drop view Work_diff;
drop view Part_diff;

create VIEW Work_diff AS 
	SELECT WID as w_pid,sum(Works.Price*Id_Works.NumWorks) as Works_Coast from
	Id_Works,works 
	where Id_Works.ID in(
	SELECT Id_works.Id from Id_Works,Ser_Info where Id_Works.WID=WPID )
	and 
	works.workId=id_works.workid
	group by WID		;

create VIEW Part_diff AS 
	SELECT PID as w_pid,sum(Parts.Price*Id_Part.NumParts) as Parts_Coast from
	Id_Part,parts 
	where Id_Part.ID in(
	SELECT Id_Part.Id from Id_Part,Ser_Info where Id_Part.PID=WPID )
	and 
	parts.partId=id_part.partid
	group by PID		;
	
create VIEW Max_diff AS 
	select Work_diff.w_pid as WPID,(Works_Coast-Parts_Coast) as DIFF from 
	Work_diff inner join Part_diff on(Work_diff.w_pid=Part_diff.w_pid)
	order by DIFF desc;
	
commit
	
	

