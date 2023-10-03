select name from country where name like "z%" limit 2;

select name, population from country where name like "a%" and continent ='Europe';

select name, population from country order by population desc limit 10;

select country.name, countrylanguage.language from country, countrylanguage where country.code = countrylanguage.countrycode and countrylanguage.language='Italian';

select country.name, countrylanguage.language from country, countrylanguage where country.code = countrylanguage.countrycode 
and countrylanguage.language='German' and IsOfficial = 'T';

select name, population from city where countrycode = 'CHN' and population > 3000000;

select continent, count(*) as numOfCountries from country group by continent;

select language from countrylanguage inner join country on (code=countrycode) where country.name="China" 
and language in (select language from countrylanguage inner join country on (code=countrycode) where country.name="Malaysia");

select language from countrylanguage cl, country where code = countrycode and country.name = "China" and exists 
(select language from countrylanguage, country)

select language from countrylanguage inner join country on (code=countrycode) where country.name="Singapore" and language not in 
(select language from countrylanguage inner join country on (code=countrycode) where country.name="China");

