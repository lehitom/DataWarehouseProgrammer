-- Deploy hcp_interview:12_wpl_populate to pg

BEGIN;

INSERT INTO the_office_wpl(office_character, wpl)
SELECT speaker, 
(SUM(length(regexp_replace(line_text, '(\[).*?(\])', '', 'g'))
-length(replace(regexp_replace(line_text, '(\[).*?(\])', '', 'g'),' ',''))+1) 
/ count(line_text)::NUMERIC(10,2))::NUMERIC(10,0) as lines 
from the_office_dialog 
group by speaker 
order by lines desc;

COMMIT;
