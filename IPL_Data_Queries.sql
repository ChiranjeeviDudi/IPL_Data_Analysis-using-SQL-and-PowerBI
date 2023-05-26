-- Created the tables with required columns 
CREATE TABLE ipl_Data
(
    id int8 PRIMARY KEY,
    city varchar(50),
    match_date date,
    season varchar(50),
    match_number varchar(50),
    team1 varchar(50),
    team2 varchar(50),
    venue varchar(100),
    toss_winner varchar(50),
    toss_decision varchar(50),
    superover varchar(50),
    winning_team varchar(50),
    won_by varchar(50),
    margin varchar(50),
    method varchar(50),
    player_of_match varchar(50),
    umpire1 varchar(50),
    umpire2 varchar(50)
)

CREATE TABLE ipl_ball_by_ball
(
    id int8 NOT NULL,
	innings int8,
	overs int8,
	ball_number int8,
	batter varchar(50),
	bowler varchar(50),
	non_striker varchar(50),
	extra_type varchar(50),
	batsman_run int8,
	extras_run int8,
	total_run int8,
	non_boundry int8,
	iswicket_delivery int8,
	player_out varchar(50),
	dismisal_kind varchar(50),
	fielders_involved varchar(50),
	batting_team varchar(50)
)

-- using sql shell the tables data was imported
-- COPY ipl_matches_2008_2022 FROM 'D:/ipl_matches_2008_2022.csv' DELIMITER ',' CSV HEADER;

select * from ipl_Data
select * from ipl_ball_by_ball

-- finding unique_values to remove the duplicates 
select distinct toss_winner from ipl_Data

select distinct city from ipl_Data

select distinct venue from ipl_Data

select distinct winning_team from ipl_Data

-- updating the repeated values with a correct value 
UPDATE ipl_Data
SET winning_team= 'Kings XI Punjab'
WHERE winning_team= 'Punjab Kings'

select distinct winning_team from ipl_Data

UPDATE ipl_Data
SET winning_team= 'Delhi Capitals'
WHERE winning_team= 'Delhi Daredevils'

select distinct winning_team from ipl_Data


UPDATE ipl_Data
SET winning_team= 'Gujarat Titans'
WHERE winning_team= 'Gujarat Lions'

select distinct winning_team from ipl_Data

UPDATE ipl_Data
SET winning_team= 'Rising Pune SuperGaints'
WHERE winning_team= 'Pune Warriors'

select distinct winning_team from ipl_Data

UPDATE ipl_Data
SET winning_team= 'Rising Pune SuperGaints'
WHERE winning_team= 'Rising Pune Supergiant'

select distinct toss_winner from ipl_Data

UPDATE ipl_Data
SET toss_winner= 'Rising Pune SuperGaints'
WHERE toss_winner= 'Rising Pune Supergiants'

select * from ipl_Data
where 
select winning_team from ipl_Data;
select match_date from ipl_Data;

-- Latest match that is Final match that who won the title
select * from ipl_Data
order by match_date desc
limit 1;

-- Retriving the data of certain columns in the season 2022
select city,match_date,team1,team2, season, player_of_match from ipl_Data
where season like '2022';

-- Retriving required columns of Title winning match on the season 2016
select id,city,match_date,season,team1,team2,toss_winner,toss_decision,winning_team,won_by,margin,player_of_match
from IPL_Data
where season = '2016'
limit 1;

--Retriving the Data about "How many times does VIRAT KOHLI gets Player of the Match"
select count(player_of_match) from ipl_Data
where player_of_match = 'V Kohli';

--Retriving the Data about how many matches won by 45 above margin
select * from ipl_Data
where margin  > '45' and won_by = 'Runs';

-- Retriving data of where the team had won the toss and also won the match
select id,match_date, toss_winner,winning_team from ipl_Data
where toss_winner = 'Sunrisers Hyderabad'
and winning_team = 'Sunrisers Hyderabad';

-- Finding that how many matches won by Wickets and Runs
select count(winning_team) from ipl_Data
where won_by = 'Runs'

select count(winning_team) from ipl_Data
where won_by = 'Wickets'
