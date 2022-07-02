-- Revert hcp_interview:05_most_lines from pg

BEGIN;

DROP TABLE the_office_count;

COMMIT;
