/*create table REGION (
	REGION_ID INTEGER,
	REGION_NAME VARCHAR(256),
	POPULATION INTEGER
)*/
--select 
--	r.region_id,
--	r.region_name,
--	r.population
--from region r
--where lower(region_name) like '%край%'

--select 
--	sum(r.population)
--from 
--	region r

select
	S.reg_type,
	sum(S.population)
from
	(
	select 
		r.region_id,
		r.region_name,
		r.population,
		case
			when lower(r.region_name) like '%край%' then 'край'
			when lower(r.region_name) like '%область%' then 'область'
			when lower(r.region_name) like '%республика%' then 'республика'
			when lower(r.region_name) like '%округ%' then 'автономный округ'
			when lower(r.region_name) like '%москва%' then 'город'
			when lower(r.region_name) like '%петербург%' then 'город'
			when lower(r.region_name) like '%севастополь%' then 'город'
			else 'другое'
		end reg_type
	from region r
	) S
group by 
	S.reg_type
order by 
	sum(S.population) desc




	