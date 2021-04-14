SELECT AddGeometryColumn ('volusia','parcel','geom',2236,'MULTIPOLYGON',2);
update volusia.parcel a set geom = p.geom from volusia.gis_parcels p where a.parid=p.altkey;

select * from volusia.gis_facility;

select * from volusia.gis_facility where theme ilike 'FIRE STATION';

select geom from volusia.gis_facility where theme ilike 'FIRE STATION';

select p.parid, p.geom from volusia.parcel p join volusia.gis_facility f on ST_Within(f.geom,p.geom) where f.theme ilike 'FIRE STATION';

select p.parid, p.luc, p.luc_desc, ST_Distance(p.geom, (select p2.geom from volusia.parcel p2 where parid=3565215))/5280 as distance
from volusia.parcel p
where p.parid in (select p.parid from volusia.parcel p join volusia.gis_facility f on ST_Within(f.geom,p.geom) where f.theme ilike 'FIRE STATION')
order by p.geom <-> (select p2.geom from volusia.parcel p2 where parid=3565215) 
limit 5;

create index idx_parcel on volusia.parcel(parid);
create index parcel_geom_idx on volusia.parcel
using gist(geom);

alter table volusia.parcel add column fsdistance double precision;

--Run Script here

select fsdistance, count(*) from volusia.parcel where fsdistance is not null group by fsdistance order by fsdistance desc; --limit 100


