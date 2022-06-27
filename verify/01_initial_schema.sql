-- Verify hcp_interview:01_initial_schema on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id,
    season,
    episode,
    scene,
    line_text,
    speaker,
    deleted
FROM the_office_dialog LIMIT 1;

ROLLBACK;
