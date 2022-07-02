-- Deploy hcp_interview:15_silent to pg

BEGIN;

-- Creating silent character table.
CREATE TABLE the_office_silent (
	id SERIAL NOT NULL,
	office_character TEXT NOT NULL,
    silent_episodes INTEGER NOT NULL,
    CONSTRAINT the_office_silent_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_silent IS 'Episodes in which the person is silent';

COMMENT ON COLUMN the_office_silent.id IS 'Unique identifier (surrogate key) of the silent episode record.';
COMMENT ON COLUMN the_office_silent.office_character IS 'Name of character in the office';
COMMENT ON COLUMN the_office_silent.silent_episodes IS 'Total number silent episodes per character';

COMMIT;
