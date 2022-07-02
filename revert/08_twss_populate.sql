-- Revert hcp_interview:08_twss_populate from pg

BEGIN;

TRUNCATE TABLE the_office_season;
SELECT setval(pg_get_serial_sequence('the_office_season', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_season;

TRUNCATE TABLE the_office_twss;
SELECT setval(pg_get_serial_sequence('the_office_twss', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_twss;

COMMIT;
