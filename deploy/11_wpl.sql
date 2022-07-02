-- Deploy hcp_interview:11_wpl to pg

BEGIN;

-- Creates word count per line per speaker table.
CREATE TABLE the_office_wpl (
	id SERIAL NOT NULL,
	speaker TEXT NOT NULL,
    wpl INTEGER NOT NULL,
    CONSTRAINT the_office_wpl_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_wpl IS 'Words per line per person';

COMMENT ON COLUMN the_office_wpl.id IS 'Unique identifier (surrogate key) of the words per line record.';
COMMENT ON COLUMN the_office_wpl.speaker IS 'Name of character in the office';
COMMENT ON COLUMN the_office_wpl.wpl IS 'Average words per line per character per season';

COMMIT;
