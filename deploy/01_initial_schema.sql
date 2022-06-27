-- Deploy hcp_interview:01_initial_schema to pg

BEGIN;

CREATE TABLE the_office_dialog (
	id INTEGER NOT NULL,
	season INTEGER NOT NULL,
	episode INTEGER NOT NULL,
	scene INTEGER NOT NULL,
	line_text TEXT NOT NULL,
	speaker TEXT NOT NULL,
	deleted BOOLEAN NOT NULL,
    CONSTRAINT the_office_lines_pk PRIMARY KEY (id)
);

COMMENT ON TABLE the_office_dialog IS 'Dialog lines from The Office television series and metadata about the actors and episodes.';

COMMENT ON COLUMN the_office_dialog.id IS 'Unique identifier (surrogate key) of the dialog line record.';
COMMENT ON COLUMN the_office_dialog.season IS 'Season number of the episode containing the dialog line.';
COMMENT ON COLUMN the_office_dialog.episode IS 'Episode number containing the dialog line';
COMMENT ON COLUMN the_office_dialog.scene IS 'Scene number within the episode containing the dialog line.';
COMMENT ON COLUMN the_office_dialog.line_text IS 'Script text of the dialog line.';
COMMENT ON COLUMN the_office_dialog.speaker IS 'Name of the character speaking the dialog line.';
COMMENT ON COLUMN the_office_dialog.deleted IS 'TRUE = The line was deleted from the episoded, FALSE = the line was not deleted from the episode.';

COMMIT;
