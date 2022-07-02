-- Deploy hcp_interview:06_most_lines_populate to pg

BEGIN;

INSERT INTO the_office_count (speaker, season, lines) 
select speaker, season, count(*) as lines 
from the_office_dialog
where deleted = false
group by season, speaker 
order by season, lines desc;

COMMIT;
