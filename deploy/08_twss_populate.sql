-- Deploy hcp_interview:08_twss_populate to pg
-- requires: 02_import_raw_data
-- requires: 07_twss

BEGIN;

--Adds a season and episode count reference table by counting unique instances of episodes from each season
INSERT INTO the_office_season (season, episodes)
SELECT DISTINCT season, count(season) FROM(
SELECT DISTINCT season, episode 
FROM the_office_dialog 
GROUP BY season, episode 
ORDER BY season) k
GROUP BY season;

--Takes the season table and forces even 0 counts into twss table
INSERT INTO the_office_twss(season, twss)
SELECT s.season, count(a.id) FROM the_office_season s
LEFT JOIN the_office_dialog a 
ON s.season = a.season 
AND a.line_text similar TO '%what she said%'
GROUP BY s.season
ORDER BY s.season ASC; 

COMMIT;
