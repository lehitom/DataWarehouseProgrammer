-- Deploy hcp_interview:06_most_lines_populate to pg
-- requires: 02_import_raw_data
-- requires: 05_most_lines

BEGIN;

--Looks for how many lines each speaker has per episode
INSERT INTO the_office_count (speaker, season, lines) 
SELECT speaker, season, count(*) AS lines 
FROM the_office_dialog
WHERE deleted = false
GROUP BY season, speaker 
ORDER BY season, lines DESC;

COMMIT;
