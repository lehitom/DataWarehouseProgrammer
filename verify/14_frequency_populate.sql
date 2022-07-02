-- Verify hcp_interview:14_frequency_populate on pg

BEGIN;

/* Assert functionality for frequency TABLE */
DO $$
DECLARE
    row_count int8;
    test_row_1 the_office_frequency;
BEGIN
    /* Verify row count. */
    SELECT COUNT(*) INTO row_count FROM the_office_frequency;
    ASSERT row_count=101094, 'FAILED: the_office_frequency table did not have 101094 inserted rows.';

    /* Spot check a record and verify it has the correct values. */
    SELECT * INTO test_row_1 FROM the_office_frequency WHERE id = 72;
    ASSERT test_row_1.speaker = 'Dwight', 'FAILED: ASSERT test_row_1.speaker';
    ASSERT test_row_1.word = 'this', 'FAILED: ASSERT test_row_1.word';
    ASSERT test_row_1.word_count = 724, 'FAILED: ASSERT test_row_1.word_count';
END
$$;

ROLLBACK;
