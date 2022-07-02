-- Revert hcp_interview:10_talktime_populate from pg

BEGIN;
TRUNCATE TABLE the_office_episode_lines;
SELECT setval(pg_get_serial_sequence('the_office_episode_lines', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_episode_lines;
TRUNCATE TABLE the_office_talktime;
SELECT setval(pg_get_serial_sequence('the_office_talktime', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_talktime;
COMMIT;
