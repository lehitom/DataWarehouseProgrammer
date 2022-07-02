-- Deploy hcp_interview:13_frequency to pg

BEGIN;

-- Creates frequency per word per character table.
CREATE TABLE the_office_frequency (
	id SERIAL NOT NULL,
	speaker TEXT NOT NULL,
    word TEXT NOT NULL,
    word_count INTEGER NOT NULL,
    CONSTRAINT the_office_frequency_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_frequency IS 'Frequency per word per person';

COMMENT ON COLUMN the_office_frequency.id IS 'Unique identifier (surrogate key) of the frequency word record.';
COMMENT ON COLUMN the_office_frequency.speaker IS 'Name of character in the office';
COMMENT ON COLUMN the_office_frequency.word IS 'Word which is counted';
COMMENT ON COLUMN the_office_frequency.word_count IS 'Total number of occurences per word per character';

COMMIT;
