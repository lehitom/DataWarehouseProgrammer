-- Verify hcp_interview:09_talktime_populate on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id,
    season,
    office_character,
    percent
FROM the_office_talktime LIMIT 1;
ROLLBACK;
