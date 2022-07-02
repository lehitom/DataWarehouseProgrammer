-- Deploy hcp_interview:16_silent_populate to pg
-- requires: 02_import_raw_data
-- requires: 04_characters_populate
-- requires: 15_silent

BEGIN;

--There are 186 episodes in provided script
--Count actual occurences of lines and subtract for difference
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
