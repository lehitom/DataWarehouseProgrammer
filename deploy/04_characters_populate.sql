-- Deploy hcp_interview:04_characters_populate to pg
-- requires: 02_import_raw_data
-- requires: 03_characters

BEGIN;

--Looks for unique speaker tags
INSERT INTO the_office_speakers (speaker) 
SELECT DISTINCT speaker 
FROM the_office_dialog 
WHERE deleted = false
ORDER BY speaker ASC;

COMMIT;
