-- Verify hcp_interview:08_twss_populate on pg

BEGIN;

/* Assert functionality for season table*/
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_season;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_season;
    ASSERT row_count=9, 'FAILED: the_office_season table did not have 9 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_season WHERE id = 8;
    ASSERT test_row_1.season = 8, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.episodes = 24, 'FAILED: ASSERT test_row_1.episodes';
    
END
$$;
/* Assert functionality for TWSS TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_twss;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_twss;
    ASSERT row_count=9, 'FAILED: the_office_twss table did not have 9 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_twss WHERE id = 8;
    ASSERT test_row_1.season = 8, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.twss = 0, 'FAILED: ASSERT test_row_1.twss';
END
$$;
ROLLBACK;
