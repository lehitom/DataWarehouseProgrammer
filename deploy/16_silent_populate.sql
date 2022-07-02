-- Deploy hcp_interview:16_silent_populate to pg

BEGIN;

INSERT INTO the_office_silent(speaker, silent_episodes)
SELECT speaker, 186-count(speaker) AS episodes 
FROM(
SELECT c.speaker, a.season, a.episode 
FROM the_office_speakers c
LEFT JOIN the_office_dialog a 
ON c.speaker = a.speaker
AND a.deleted = false
GROUP BY c.speaker, a.season, a.episode
ORDER BY a.season ASC
) k
GROUP BY k.speaker
ORDER BY episodes asc;

COMMIT;
