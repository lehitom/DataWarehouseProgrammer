-- Revert hcp_interview:03_characters from pg

BEGIN;

DROP TABLE the_office_speakers;

COMMIT;
