connect 'D:\7_sem\carservice.fdb' user 'SYSDBA' password 'masterkey';
commit

drop view TOP_5_Client;
drop view Max_diff;

CREATE VIEW TOP_5_Client(Name,Summary) AS 
	SELECT  first 5 Client.Name,sum(Ser_Info.Price) as sum_pr 
		from Ser_info,client,car 
			where Ser_Info.CarId=Car.CarId and
				client.clientId = car.clientId
			group by client.Name  
			
	order by sum_pr desc;
	
commit

