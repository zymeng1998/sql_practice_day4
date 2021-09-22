create table assignment4_q14 ([First Name] nvarchar(20), [Last Name] nvarchar(20), [Middle Name] nvarchar(20));

insert into assignment4_q14 values ('John', 'Green', null), ('Mike', 'White', 'M');

select * from assignment4_q14;

select CONCAT(a.[First Name], ' ', a.[Last Name], ' ', a.[Middle Name])
from assignment4_q14 a
;