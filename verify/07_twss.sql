-- Verify hcp_interview:07_twss on pg

BEGIN;
/* Verify the tables were successfully created */
SELECT 
    id,
    season,
    episodes
FROM the_office_season LIMIT 1;

SELECT 
    id,
    season,
    twss
FROM the_office_twss LIMIT 1;

ROLLBACK;
