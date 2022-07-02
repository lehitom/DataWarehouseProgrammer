-- Deploy hcp_interview:16_silent_populate to pg

BEGIN;

INSERT INTO the_office_silent(office_character, silent_episodes)
select office_character, 186-count(office_character) AS episodes from(
select c.office_character, a.season, a.episode FROM the_office_characters c
LEFT JOIN the_office_dialog a 
ON c.office_character = a.speaker
GROUP BY c.office_character, a.season, a.episode
ORDER BY a.season ASC) k
GROUP BY k.office_character
ORDER BY episodes asc;

COMMIT;
