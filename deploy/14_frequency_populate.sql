-- Deploy hcp_interview:14_frequency_populate to pg

BEGIN;

INSERT INTO the_office_frequency(speaker, word, word_count)
SELECT speaker, word, count(*) wordcount
FROM ( 
  SELECT speaker, regexp_split_to_table(lower(regexp_replace(regexp_replace(line_text, '[\,\.\?\!]', '', 'g'), '(\[).*?(\])', '', 'g')), '\s') AS word
  FROM the_office_dialog
  WHERE deleted = false 
) t
WHERE word != ''
GROUP BY speaker, word 
ORDER BY wordcount desc;

COMMIT;
