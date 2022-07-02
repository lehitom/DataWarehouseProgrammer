-- Verify hcp_interview:10_talktime_populate on pg

BEGIN;

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
    SELECT * INTO test_row_1 FROM the_office_talktime WHERE id = 231;
    ASSERT test_row_1.season = 3, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.office_character = 'Marcy', 'FAILED: ASSERT test_row_1.office_character';
    ASSERT test_row_1.percent = 0.04, 'FAILED: ASSERT test_row_1.percent';
END
$$;
ROLLBACK;
