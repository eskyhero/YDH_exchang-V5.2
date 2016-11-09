if (exists (select * from sys.objects where name = 'Gte_YDHOrder_MaxID'))
    drop proc Gte_YDHOrder_MaxID
go

create procedure Gte_YDHOrder_MaxID  
/*
	更新ERP订单ID表最大ID，by Aiwei 2016-10-11
*/ 

as    
	declare 
	@FInterID  int
	exec @FInterID = GetICMaxNum 'SEOrder',1,16398;
	delete from YDH_Max_OrderID;
	insert into YDH_Max_OrderID (TableName, MaxOrderID, LastUpdateTime) values ('SEOrder', @FInterID, GETDATE ());
	
	
	--------------------
	
	create table YDH_Max_OrderID(
		id int IDENTITY(1,1) primary key NOT NULL,
		TableName varchar(50),
		MaxOrderID int,
		LastUpdateTime datetime
	)

 