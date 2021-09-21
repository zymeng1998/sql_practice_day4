drop table if exists people_meng
drop table if exists city_meng 

create table city_meng (id int, cityname nvarchar(20), Primary key(id))
create table people_meng (id int, name nvarchar(40), cityid int,
						Primary key(id), Foreign key(cityid) references city_meng(id))
						;
insert into city_meng values (1, 'Seattle'), (2, 'Green Bay')
select * from city_meng
insert into people_meng values (1, 'Aaron Rodhers', 2), (2, 'Russell Wilson', 1), (3, 'Jody Nelson', 2)
select * from people_meng

update city_meng set cityname = 'Madison' where cityname = 'Seattle'

Create view Packers_Meng
as 
Select name from people_meng join city_meng on cityid = city_meng.id where cityname = 'Green Bay'

select * from Packers_Meng

drop view if exists Packers_Meng
drop table if exists people_meng
drop table if exists city_meng 