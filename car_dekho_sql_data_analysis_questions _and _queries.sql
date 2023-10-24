create schema cars;

use cars;

select * from car_dekho limit 20;

-- total cars: to get count of total records

select count(name) from car_dekho;

-- how many cars will be available in 2023?

select count(name) from car_dekho
where year = 2023;

-- how many cars will be available in 2020, 2021,2022?
select year,count(*) from car_dekho
where year in (2020,2021,2022) group by year;

-- print total of cars by year without any info?

select year,count(*) from car_dekho
group by year;

-- how many diesel cars will be in 2020?
select * from car_dekho limit 10;
select year,count(*) from car_dekho
where year = 2020 and fuel = 'Diesel';

-- how many diesel cars will be in 2020?

select year,count(*) from car_dekho
where year = 2020 and fuel = 'Petrol';

-- print all cars that has fuel type(petrol,deisel,cng) that come by all year
select year,count(*) from car_dekho
where fuel = 'Petrol'
group by year;

select year,count(*) from car_dekho
where fuel = 'Diesel'
group by year;

select year,count(*) from car_dekho
where fuel = 'CNG'
group by year;


-- which year had more than 100 cars?

select * from car_dekho limit 3;

select year, count(*) from car_dekho group by year having count(*) > 100;

-- all cars count details between 2015 to 2023?

select * from car_dekho
where year between 2015 and 2023;

-- What is the average selling price of all entries?

select avg(selling_price) as ave_selling_price from car_dekho;

-- How many entries are there for each type of seller in the "seller_type" column?
select distinct seller_type from car_dekho;

-- What is the total number of cars for each transmission type?
select * from car_dekho limit 3;

select transmission,count(*) from car_dekho
group by transmission; 

-- What is the highest and lowest selling price for each fuel type?
select * from car_dekho limit 3;
select min(selling_price),fuel,max(selling_price) from car_dekho
group by fuel;

-- What is the average mileage of cars grouped by the number of owners?

select owner,avg(mileage) from car_dekho
group by owner;

-- What is the average engine size for cars with more than 5 seats?
select * from car_dekho limit 3;
select engine from car_dekho
where seats =5;

-- How many cars have a mileage greater than 20 km/liter?
desc car_dekho;
select count(*) from car_dekho
where mileage>20;
-- <<<<<<<<<<>>>>>>updating the table or cleaning table data
UPDATE car_dekho
SET mileage = REPLACE(REPLACE(mileage, ' kmpl', ''), ' kmpl', '')
where mileage like '%km%';

UPDATE car_dekho
SET mileage = REGEXP_REPLACE(mileage, ' km/kg', '');

ALTER TABLE car_dekho
MODIFY COLUMN mileage DOUBLE;

select * from car_dekho;

-- What is the distribution of cars based on the number of seats?

select seats,count(*) from car_dekho
group by seats;

-- Which fuel type has the highest average selling price?
select fuel,avg(selling_price) as avg_selling_price from car_dekho
group by fuel
order by avg_selling_price;


-- What is the most common transmission type for cars with more than 3 owners?
select * from car_dekho;
select transmission,count(*) as count from car_dekho
 WHERE owner = 'Third Owner' GROUP BY transmission ORDER BY count DESC -- LIMIT 1;