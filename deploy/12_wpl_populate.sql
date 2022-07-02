-- Deploy hcp_interview:12_wpl_populate to pg

BEGIN;

--Regex removes any stage cues from the line_text to get better results
INSERT INTO the_office_wpl(speaker, wpl)
SELECT speaker, 
(SUM(LENGTH(regexp_replace(line_text, '(\[).*?(\])', '', 'g'))
-LENGTH(replace(regexp_replace(line_text, '(\[).*?(\])', '', 'g'),' ',''))+1) 
/ count(line_text)::NUMERIC(10,2))::NUMERIC(10,0) as lines 
FROM the_office_dialog
WHERE deleted = false 
GROUP BY speaker 
ORDER BY lines DESC;

COMMIT;
