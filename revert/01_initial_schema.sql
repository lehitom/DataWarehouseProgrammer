-- Revert hcp_interview:01_initial_schema from pg

BEGIN;

DROP TABLE the_office_dialog;

COMMIT;
