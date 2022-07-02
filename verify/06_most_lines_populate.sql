-- Verify hcp_interview:06_most_lines_populate on pg

BEGIN;

/* Assert functionality */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_count;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_count;
    ASSERT row_count=1167, 'FAILED: the_office_count table did not have 1167 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_count WHERE id = 157;
    ASSERT test_row_1.season = 3, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.lines = 1990, 'FAILED: ASSERT test_row_1.lines';
    ASSERT test_row_1.speaker = 'Michael', 'FAILED: ASSERT test_row_1.speaker';
END
$$;

ROLLBACK;
