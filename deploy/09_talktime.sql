-- Deploy hcp_interview:09_talktime to pg

BEGIN;

CREATE TABLE the_office_talktime (
	id SERIAL NOT NULL,
    season INTEGER NOT NULL,
    office_character TEXT NOT NULL,
    percent NUMERIC(10,2) NOT NULL,
    CONSTRAINT the_office_talktime_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_talktime IS 'Percentage of lines per person from the office per season';
COMMENT ON COLUMN the_office_talktime.id IS 'Unique identifier (surrogate key) of the percentage per person per season record.';
COMMENT ON COLUMN the_office_talktime.season IS 'Season from which the percentages are from';
COMMENT ON COLUMN the_office_talktime.office_character IS 'Name of character in the office';
COMMENT ON COLUMN the_office_talktime.percent IS 'Percentage of lines per person per season';
COMMIT;
