-- Verify hcp_interview:13_frequency on pg

BEGIN;

/* Verify the table was successfully created */
SELECT 
    id,
    office_character,
    word,
    word_count
FROM the_office_frequency LIMIT 1;

ROLLBACK;
