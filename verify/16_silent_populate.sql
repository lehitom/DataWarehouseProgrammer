-- Verify hcp_interview:16_silent_populate on pg

BEGIN;

/* Assert functionality for silent episode TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_silent;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_silent;
    ASSERT row_count=793, 'FAILED: the_office_silent table did not have 793 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_silent WHERE id = 15;
    ASSERT test_row_1.office_character = 'Toby', 'FAILED: ASSERT test_row_1.office_character';
    ASSERT test_row_1.silent_episodes = 67, 'FAILED: ASSERT test_row_1.silent_episodes';
END
$$;
ROLLBACK;
