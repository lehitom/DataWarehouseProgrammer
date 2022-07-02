-- Verify hcp_interview:03_characters on pg

BEGIN;
/* Verify the table was successfully created */
SELECT 
    id,
    speaker
FROM the_office_speakers LIMIT 1;

ROLLBACK;
