-- Verify hcp_interview:09_talktime_populate on pg

BEGIN;

/* Verify the tables were successfully created */
SELECT 
    id,
    season,
    episode,
    episode_lines
FROM the_office_episode_lines LIMIT 1;

SELECT 
    id,
    season,
    speaker,
    season_average
FROM the_office_talktime LIMIT 1;
ROLLBACK;
