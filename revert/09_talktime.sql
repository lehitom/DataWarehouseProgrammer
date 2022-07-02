-- Revert hcp_interview:09_talktime from pg

BEGIN;

DROP TABLE the_office_talktime;
COMMIT;
