-- Deploy hcp_interview:10_talktime_populate to pg

BEGIN;

INSERT INTO the_office_talktime(season, office_character, percent)
select a.season, a.speaker, 
(count(a.*)::NUMERIC(10,2) * 100 / 
(select count(b.*) from the_office_dialog b 
where b.season = a.season))::NUMERIC(10,2) as percentage 
from the_office_dialog a 
group by a.season, a.speaker 
order by a.season, percentage desc;

COMMIT;
