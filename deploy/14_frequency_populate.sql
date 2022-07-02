-- Deploy hcp_interview:14_frequency_populate to pg
-- requires: 02_import_raw_data
-- requires: 13_frequency

BEGIN;

--Regex removes any stage cues from the line_text to get better results
--Regex removes any punctuation and sets all words to lowercase before adding them to table
--Imports and seperates to table based off of whitespace
INSERT INTO the_office_frequency(speaker, word, word_count)
SELECT speaker, word, count(*) wordcount
FROM ( 
  SELECT speaker, regexp_split_to_table(lower(regexp_replace(regexp_replace(line_text, '[\,\.\?\!]', '', 'g'), '(\[).*?(\])', '', 'g')), '\s') AS word
  FROM the_office_dialog
  WHERE deleted = false 
) t
WHERE word != ''
GROUP BY speaker, word 
ORDER BY wordcount DESC;

COMMIT;
