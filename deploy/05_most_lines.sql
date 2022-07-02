-- Deploy hcp_interview:05_most_lines to pg

BEGIN;

-- Creating line count per character per season table.
CREATE TABLE the_office_count (
	id SERIAL NOT NULL,
	speaker TEXT NOT NULL,
    season INTEGER NOT NULL,
    lines INTEGER NOT NULL,
    CONSTRAINT the_office_count_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_count IS 'Line count from the office per season per person';

COMMENT ON COLUMN the_office_count.id IS 'Unique identifier (surrogate key) of the character lines record.';
COMMENT ON COLUMN the_office_count.speaker IS 'Name of character in the office';
COMMENT ON COLUMN the_office_count.season IS 'Season from which the lines are from';
COMMENT ON COLUMN the_office_count.lines IS 'Total number of lines per character per season';

COMMIT;
