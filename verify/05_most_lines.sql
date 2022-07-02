-- Verify hcp_interview:05_most_lines on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id, 
	speaker,
    season,
    lines
FROM the_office_count LIMIT 1;

ROLLBACK;
