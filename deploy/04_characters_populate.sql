-- Deploy hcp_interview:04_characters_populate to pg

BEGIN;

INSERT INTO the_office_speakers (speaker) 
SELECT DISTINCT speaker 
FROM the_office_dialog 
WHERE deleted = false
ORDER BY speaker ASC;

COMMIT;
