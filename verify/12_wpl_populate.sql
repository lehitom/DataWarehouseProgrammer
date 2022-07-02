-- Verify hcp_interview:12_wpl_populate on pg

BEGIN;

/* Assert functionality for WPL TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_wpl;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_wpl;
    ASSERT row_count=786, 'FAILED: the_office_wpl table did not have 786 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_wpl WHERE id = 23;
    ASSERT test_row_1.speaker = 'Mark', 'FAILED: ASSERT test_row_1.speaker';
    ASSERT test_row_1.wpl = 28, 'FAILED: ASSERT test_row_1.wpl';
END
$$;

ROLLBACK;
