-- Revert hcp_interview:04_characters_populate from pg

BEGIN;

TRUNCATE TABLE the_office_speakers;
SELECT setval(pg_get_serial_sequence('the_office_speakers', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_speakers;

COMMIT;
