-- Deploy hcp_interview:10_talktime_populate to pg

BEGIN;

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
