-- Revert hcp_interview:13_frequency from pg

BEGIN;

DROP TABLE the_office_frequency;

COMMIT;
