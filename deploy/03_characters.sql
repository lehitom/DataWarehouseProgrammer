-- Deploy hcp_interview:03_characters to pg

BEGIN;

-- Creates unique character table.
CREATE TABLE the_office_speakers (
	id SERIAL NOT NULL,
	speaker TEXT NOT NULL,
    CONSTRAINT the_office_speakers_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_speakers IS 'All characters from the office in any season or episode';

COMMENT ON COLUMN the_office_speakers.id IS 'Unique identifier (surrogate key) of the character record.';
COMMENT ON COLUMN the_office_speakers.speaker IS 'Name of character in the office';

COMMIT;
