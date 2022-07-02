-- Verify hcp_interview:15_silent on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id,
    speaker,
    silent_episodes
FROM the_office_silent LIMIT 1;

ROLLBACK;
