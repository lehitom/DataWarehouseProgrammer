-- Revert hcp_interview:06_most_lines_populate from pg

BEGIN;

TRUNCATE TABLE the_office_count;
SELECT setval(pg_get_serial_sequence('the_office_count', 'id'), coalesce(max(id),0) + 1, false) FROM the_office_count;


COMMIT;
