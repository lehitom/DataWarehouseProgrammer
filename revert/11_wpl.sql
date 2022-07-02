-- Revert hcp_interview:11_wpl from pg

BEGIN;

DROP TABLE the_office_wpl;

COMMIT;
