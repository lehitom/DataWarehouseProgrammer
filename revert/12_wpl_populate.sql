-- Revert hcp_interview:12_wpl_populate from pg

BEGIN;

TRUNCATE TABLE the_office_wpl;

COMMIT;
