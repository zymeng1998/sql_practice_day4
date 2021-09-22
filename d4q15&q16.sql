create table assignment4_q15 (Student nvarchar(20), Marks int, Sex nvarchar(10));

insert into assignment4_q15 values ('Ci', 70, 'F'), ('Bob', 80, 'M'), ('Li', 90, 'F'), ('Mi', 95, 'M');

select *, RANK() OVER (partition by Sex order by Marks DESC) as 'rank' from assignment4_q15;

--q15

select top 1 *
from (select *, RANK() OVER (partition by Sex order by Marks DESC) as 'rank' from assignment4_q15) tmp where tmp.Sex = 'F'
;

--q16
select tmp.Student, tmp.Marks, tmp.Sex
from (select *, RANK() OVER (partition by Sex order by Marks DESC) as 'rank' from assignment4_q15) tmp
;