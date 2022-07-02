-- Verify hcp_interview:11_wpl on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id,
    office_character,
    wpl
FROM the_office_wpl LIMIT 1;

ROLLBACK;
