-- Revert hcp_interview:07_twss from pg

BEGIN;

DROP TABLE the_office_season;
DROP TABLE the_office_twss;

COMMIT;
