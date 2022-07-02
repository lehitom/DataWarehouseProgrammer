-- Deploy hcp_interview:07_twss to pg

BEGIN;

-- Creates season table.

CREATE TABLE the_office_season (
	id SERIAL NOT NULL,
    season INTEGER NOT NULL,
    episodes INTEGER NOT NULL,
    CONSTRAINT the_office_season_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_season IS 'Season count from the office';

COMMENT ON COLUMN the_office_season.id IS 'Unique identifier (surrogate key) of the joke count record.';
COMMENT ON COLUMN the_office_season.season IS 'Seasons from the office';
COMMENT ON COLUMN the_office_season.episodes IS 'Episode count per season from the office';

-- Creates that what she said count per season table.
CREATE TABLE the_office_twss (
	id SERIAL NOT NULL,
    season INTEGER NOT NULL,
    twss INTEGER NOT NULL,
    CONSTRAINT the_office_twss_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_twss IS 'Joke count from the office per season';

COMMENT ON COLUMN the_office_twss.id IS 'Unique identifier (surrogate key) of the joke count record.';
COMMENT ON COLUMN the_office_twss.season IS 'Season from which the jokes are from';
COMMENT ON COLUMN the_office_twss.twss IS 'Total number of Thats what she said per season';
COMMIT;
