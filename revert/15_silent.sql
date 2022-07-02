-- Revert hcp_interview:15_silent from pg

BEGIN;

DROP TABLE the_office_silent;

COMMIT;
