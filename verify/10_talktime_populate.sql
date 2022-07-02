-- Verify hcp_interview:10_talktime_populate on pg

BEGIN;

/* Assert functionality for talk time TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_episode_lines;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_episode_lines;
    ASSERT row_count=186, 'FAILED: the_office_episode_lines table did not have 186 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_episode_lines WHERE id = 22;
    ASSERT test_row_1.season = 2, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.episode = 16, 'FAILED: ASSERT test_row_1.episode';
    ASSERT test_row_1.episode_lines = 250, 'FAILED: ASSERT test_row_1.episode_lines';
END
$$;

/* Assert functionality for talk time TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_talktime;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_talktime;
    ASSERT row_count=1179, 'FAILED: the_office_talktime table did not have 1179 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_talktime WHERE id = 170;
    ASSERT test_row_1.season = 3, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.speaker = 'Dwight', 'FAILED: ASSERT test_row_1.speaker';
    ASSERT test_row_1.season_average = 12.31, 'FAILED: ASSERT test_row_1.season_average';
END
$$;
ROLLBACK;
