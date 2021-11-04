/****** Script for SelectTopNRows command from SSMS  ******/

-- select the database 
use HouseData;

-- select the table
select top 100 * from SydneyHouse;

select distinct propertyType from SydneyHouse;


-- Populate Property Address data

select address from SydneyHouse where address is not null;


-- find address without street data and leave the proper address

-- use temp table
Create Table #temp_address
(
address nvarchar(255),
suburb nvarchar(255),
propertyType nvarchar(255)
);

-- drop table #temp_address;


with CTE (address, suburb, propertyType, start_index) 
as
(
SELECT
	address,
	suburb,
	propertyType,
	CHARINDEX(',', address)-1 as start_index
FROM SydneyHouse
)
insert into #temp_address
select address, suburb,  propertyType from CTE where start_index > 0;


select top 10 * from #temp_address;

-- split the street number and street name

select
SUBSTRING(address, 1, CHARINDEX(' ', address)-1) as street_number
from #temp_address;

ALTER TABLE #temp_address
add street_number nvarchar(255);

UPDATE #temp_address
set street_number = SUBSTRING(address, 1, CHARINDEX(' ', address)-1);


ALTER TABLE #temp_address
add street_name nvarchar(255);


select
SUBSTRING(SUBSTRING(address, 1, CHARINDEX(',', address)-1), CHARINDEX(' ', address), len(SUBSTRING(address, 1, CHARINDEX(',', address)-1))) as street_name
from #temp_address;

UPDATE #temp_address
set street_name = SUBSTRING(SUBSTRING(address, 1, CHARINDEX(',', address)-1), CHARINDEX(' ', address), len(SUBSTRING(address, 1, CHARINDEX(',', address)-1)))

select * from #temp_address


-- most popular street and its suburb
select Distinct street_name, suburb, count(street_name) as count_num
from #temp_address
group by street_name, suburb
order by count_num desc;


-- most popular property type
select distinct propertyType, count(propertyType) as type_number
from SydneyHouse
group by propertyType
order by type_number desc;



