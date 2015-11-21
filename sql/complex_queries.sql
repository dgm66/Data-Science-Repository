select t_pop.country_name, npop, n_airports, n_airports/npop as pc

from

    (select country_name, sum(population) as npop
    from optd_por_public
    where population is not null
    group by country_name) as t_pop,

    (select country_name, count(*) as n_airports
    from optd_por_public
    where location_type = 'A' or location_type = 'CA'
    group by country_name) as t_airports

where t_pop.country_name = t_airports.country_name and npop > 0

order by pc desc limit 10;

---------------------------------------------------------------- x1000

select t_pop.country_name, npop, n_airports, cast(n_airports as float)/npop*1000 as pc

from

    (select country_name, sum(population) as npop
    from optd_por_public
    where population is not null
    group by country_name) as t_pop,

    (select country_name, count(*) as n_airports
    from optd_por_public
    where location_type = 'A' or location_type = 'CA'
    group by country_name) as t_airports

where t_pop.country_name = t_airports.country_name and npop > 0

order by pc desc limit 10;


---------------------------------------------------------------- VISTAS


select population.country_name, npop, n_airports
from population, airports
where population.country_name = airports.country_name and npop > 0
order by npop desc limit 10;



select population.country_name, npop, n_airports
from population
inner join airports
on population.country_name = airports.country_name and npop > 0
order by npop desc limit 10;


---------------------------------------------------------------- JOIN


select airline_code_2c, name, flight_freq
from ref_airline_nb_of_flights as r
left join  optd_airlines as o
on o."2char_code" = r.airline_code_2c
order by flight_freq desc
limit 10;

select airline_code_2c, name, flight_freq
from optd_airlines as r
left join  ref_airline_nb_of_flights as o
on r."2char_code" = o.airline_code_2c
order by flight_freq desc
limit 10;

select airline_code_2c, name, flight_freq
from ref_airline_nb_of_flights as o
right join  optd_airlines as r
on r."2char_code" = o.airline_code_2c
order by flight_freq desc
limit 10;

select airline_code_2c, name, flight_freq
from optd_airlines as r
right join  ref_airline_nb_of_flights as o
on r."2char_code" = o.airline_code_2c
order by flight_freq desc;

select name, country_name, elevation
from optd_por_public
where elevation > (select avg(elevation)
                    from optd_por_public
                    where elevation is not null and location_type ='C') and location_type ='C'
                    limit 10
;

select country_name, count(*)
from optd_por_public
where elevation > (select avg(elevation)
                    from optd_por_public
                    where elevation is not null and location_type ='C') and location_type ='C'
group by country_name
having count(*)>=10
;
-- ¿Todas las ciudades con elevacion por encima de la media del pais? Para todos los paises. COntar número.
 
----------------------------------------------------------------------------------------------



 
