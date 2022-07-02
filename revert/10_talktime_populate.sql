-- Revert hcp_interview:10_talktime_populate from pg

BEGIN;

TRUNCATE TABLE the_office_talktime;
COMMIT;
