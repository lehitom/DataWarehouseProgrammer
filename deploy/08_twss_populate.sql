-- Deploy hcp_interview:08_twss_populate to pg

BEGIN;

INSERT INTO the_office_season (season, episodes)
SELECT DISTINCT season, count(season) FROM(
SELECT DISTINCT season, episode 
FROM the_office_dialog 
GROUP BY season, episode 
ORDER BY season) k
GROUP BY season;

INSERT INTO the_office_twss(season, twss)
select s.season, count(a.id) FROM the_office_season s
LEFT JOIN the_office_dialog a 
ON s.season = a.season 
AND a.line_text similar to '%what she said%'
GROUP BY s.season
ORDER BY s.season ASC; 

COMMIT;
