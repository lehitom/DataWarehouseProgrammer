-- Revert hcp_interview:16_silent_populate from pg

BEGIN;

TRUNCATE TABLE the_office_silent;
SELECT setval(pg_get_serial_sequence('the_office_silent', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_silent;

COMMIT;
