-- Deploy hcp_interview:09_talktime to pg

BEGIN;

-- Creates lines per episode table.

CREATE TABLE the_office_episode_lines (
	id SERIAL NOT NULL,
    season INTEGER NOT NULL,
    episode INTEGER NOT NULL,
    episode_lines INTEGER NOT NULL,
    CONSTRAINT the_office_episode_lines_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_episode_lines IS 'Total number of lines per episode from the office per season';
COMMENT ON COLUMN the_office_episode_lines.id IS 'Unique identifier (surrogate key) of the episode total per season record.';
COMMENT ON COLUMN the_office_episode_lines.season IS 'Season from which the line counts are from';
COMMENT ON COLUMN the_office_episode_lines.episode IS 'Episode that the line count is for';
COMMENT ON COLUMN the_office_episode_lines.episode_lines IS 'Episode total of lines';

-- Creates average of percentage lines per speaker per episode within season

CREATE TABLE the_office_talktime (
	id SERIAL NOT NULL,
    season INTEGER NOT NULL,
    speaker TEXT NOT NULL,
    season_average NUMERIC(10,2) NOT NULL,
    CONSTRAINT the_office_talktime_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_talktime IS 'Avereage percentage of lines per person from the office per season';
COMMENT ON COLUMN the_office_talktime.id IS 'Unique identifier (surrogate key) of the percentage per person per season record.';
COMMENT ON COLUMN the_office_talktime.season IS 'Season from which the percentages are from';
COMMENT ON COLUMN the_office_talktime.speaker IS 'Name of character in the office';
COMMENT ON COLUMN the_office_talktime.season_average IS 'Avereage percentage of lines per person per season';

COMMIT;
