-- Revert hcp_interview:14_frequency_populate from pg

BEGIN;

TRUNCATE TABLE the_office_frequency;
SELECT setval(pg_get_serial_sequence('the_office_frequency', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_frequency;

COMMIT;
