-- REPORT QUERIES
-- The following questions are addressed by the queries in this file:

-- 1. What is the total population by continent?
use world;
select *from country;
select continent,sum(population) from country group by Continent;
-- 2. What are the top 10 cities in the world by population?
select name, population
from city order by population desc limit 10;

-- 3. What is the total GNP for each continent?

select continent,sum(gnp) from country group by Continent;
-- 4. Which countries have a GNP per capita greater than $30,000, and what are their GNP and population details?
select name ,population ,gnp from country having gnp>30000;
-- 5. What are the official languages spoken on each continent, and how many countries speak each language?

select ci.language,c.continent ,count(c.name) as no_of_country from country c join countrylanguage ci on ci.countrycode=c.Code 
where ci.IsOfficial='t' group by ci.Language,c.continent ;  

-- 6. What percentage of the world’s population resides in each continent?
 select continent,sum(percentage) from country group by Continent;
-- 7. Which countries have more than 50% of their population living in urban areas?
select c.name as country,(sum(ci.Population) / sum(c.Population))*100 as pop from country c join city ci on ci.countrycode=c.code 
group by c.name having (sum(ci.Population) / sum(c.Population))*100>50;
-- 8. Which countries have the highest number of official languages?

select c.name ,count(c.name) as no_of_lang from country c join countrylanguage ci on ci.countrycode=c.Code 
where ci.IsOfficial='t' group by c.name order by count(c.name) desc ; 

-- 9. What are the total population and GNP by region?

select region,sum(population) ,sum(gnp) from country group by Region;

-- 10. Which countries have missing GNP data, and what are their population details?

select population from country where gnp is null or gnp like '';
