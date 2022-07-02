-- Deploy hcp_interview:04_characters_populate to pg

BEGIN;

INSERT INTO the_office_speakers (speaker) select distinct speaker from the_office_dialog order by speaker asc;

COMMIT;
