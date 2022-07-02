-- Revert hcp_interview:12_wpl_populate from pg

BEGIN;

TRUNCATE TABLE the_office_wpl;
SELECT setval(pg_get_serial_sequence('the_office_wpl', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_wpl;


COMMIT;
