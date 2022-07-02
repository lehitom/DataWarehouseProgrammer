-- Verify hcp_interview:04_characters_populate on pg

BEGIN;

/* Assert functionality */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_speakers;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_speakers;
    ASSERT row_count=786, 'FAILED: the_office_speakers table did not have 59909 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_speakers WHERE id = 481;
    ASSERT test_row_1.speaker = 'Mikela', 'FAILED: ASSERT test_row_1.speaker';
END
$$;

ROLLBACK;
