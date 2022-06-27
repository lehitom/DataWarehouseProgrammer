-- Revert hcp_interview:02_import_raw_data from pg

BEGIN;

TRUNCATE TABLE the_office_dialog;

COMMIT;
