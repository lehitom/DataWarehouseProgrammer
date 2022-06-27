-- Verify hcp_interview:02_import_raw_data on pg

BEGIN;

/* Assert functionality */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_dialog;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_dialog;
    ASSERT row_count=59909, 'FAILED: the_office_dialog table did not have 59909 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_dialog WHERE id = 19;
    ASSERT test_row_1.season = 1, 'FAILED: ASSERT test_row_1.season';
    ASSERT test_row_1.episode = 1, 'FAILED: ASSERT test_row_1.episode';
    ASSERT test_row_1.scene = 7, 'FAILED: ASSERT test_row_1.scene';
    ASSERT test_row_1.line_text = 'Whassup!', 'FAILED: ASSERT test_row_1.line_text';
    ASSERT test_row_1.speaker = 'Michael', 'FAILED: ASSERT test_row_1.speaker';
    ASSERT test_row_1.deleted = FALSE, 'FAILED: ASSERT test_row_1.deleted';
END
$$;

ROLLBACK;
