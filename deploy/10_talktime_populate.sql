-- Deploy hcp_interview:10_talktime_populate to pg
-- requires: 02_import_raw_data
-- requires: 09_talktime

BEGIN;

--Counts how many lines are per person, and then combines for per episode
INSERT INTO the_office_episode_lines(season, episode, episode_lines)
SELECT DISTINCT season, episode, SUM(lines) as episode_lines
FROM (
SELECT DISTINCT season, episode, speaker, count(*) as lines 
FROM the_office_dialog
GROUP BY season, episode, speaker
ORDER BY season, episode, lines DESC
)k
GROUP BY season, episode
ORDER BY season, episode, episode_lines;

--Pulls previous table to have reference for how many lines are in the episode and then makes percentage per episode
--Then averages the results
INSERT INTO the_office_talktime(season, speaker, season_average)
SELECT DISTINCT k.season, k.speaker, AVG(episode_percentage)::NUMERIC(10,2) AS season_average
FROM (
SELECT DISTINCT d.season, d.episode, d.speaker, count(d.*) as lines, l.episode_lines, 
    (count(d.*)::NUMERIC(10,2)*100/l.episode_lines)::NUMERIC(10,2) AS episode_percentage
FROM the_office_dialog d
JOIN the_office_episode_lines l
ON d.season = l.season
AND d.episode = l.episode
GROUP BY d.season, d.episode, d.speaker, l.episode_lines
ORDER BY d.season, d.episode, lines DESC
)k
GROUP BY k.season, k.speaker
ORDER BY k.season, season_average DESC;

COMMIT;
