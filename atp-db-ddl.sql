
CREATE TABLE players (
    player_id       varchar(10),
    player_slug     varchar(40),
    first_name      varchar(40),
    last_name       varchar(40),
    player_url      varchar(200),
    flag_code       varchar(10),
    residence       varchar(60),
    birthplace      varchar(60),
    birthdate       varchar(15),
    birth_year      integer,
    birth_month     integer,
    birth_day       integer,
    turned_pro      integer,
    weight_lbs      integer,
    weight_kg       integer,
    height_ft       varchar(10),
    height_inches   integer,
    height_cm       integer,
    handedness      varchar(15),
    backhand        varchar(20)
);



ALTER TABLE players 
ADD PRIMARY KEY (player_id);


copy players FROM 'E:\Tennis dataset\csv\5_players/player_overviews_UNINDEXED.csv' DELIMITER ',' CSV

-----------------------------------
CREATE TABLE tournaments (
    tourney_year                    integer,
    tourney_order                   integer,
    tourney_name                    varchar(60),
    tourney_id                      integer,
    tourney_slug                    varchar(30),
    tourney_location                varchar(40),
    tourney_dates                   varchar(10),
    tourney_month                   integer,
    tourney_day                     integer,
    tourney_singles_draw            integer,
    tourney_doubles_draw            integer,
    tourney_conditions              varchar(10),
    tourney_surface                 varchar(10),
    tourney_fin_commit              varchar(15),
    tourney_url_suffix              varchar(200),
    singles_winner_name             varchar(40),
    singles_winner_url              varchar(200),
    singles_winner_player_slug      varchar(40),
    singles_winner_player_id        varchar(10),
    doubles_winner_1_name           varchar(40),
    doubles_winner_1_url            varchar(200),
    doubles_winner_1_player_slug    varchar(40),
    doubles_winner_1_player_id      varchar(10),
    doubles_winner_2_name           varchar(40),
    doubles_winner_2_url            varchar(200),
    doubles_winner_2_player_slug    varchar(40),
    doubles_winner_2_player_id      varchar(10),
    tourney_year_id                 varchar(15)
);

ALTER TABLE tournaments 
ADD PRIMARY KEY (tourney_year_id);

copy tournaments FROM 'E:\Tennis dataset\csv\1_tournaments\tournaments_1877-2017.csv' DELIMITER ',' CSV;
-------------------------------------------------------------------------------------------------------------
 
CREATE TABLE match_scores (
    tourney_year_id         varchar(15),
    tourney_order           integer,
    tourney_slug            varchar(30),
    tourney_url_suffix      varchar(200),
    tourney_round_name      varchar(20),
    round_order             integer,
    match_order             integer,
    winner_name             varchar(40),
    winner_player_id        varchar(10),
    winner_slug             varchar(40),
    loser_name              varchar(40),
    loser_player_id         varchar(10),
    loser_slug              varchar(40),
    winner_seed             varchar(5),
    loser_seed              varchar(5),
    match_score_tiebreaks   varchar(40),
    winner_sets_won         integer,
    loser_sets_won          integer,
    winner_games_won        integer,
    loser_games_won         integer,
    winner_tiebreaks_won    integer,
    loser_tiebreaks_won     integer,
    match_id                varchar(40),
    match_stats_url_suffix  varchar(200)
);

ALTER TABLE match_scores
ADD CONSTRAINT constraint_fk_matchscores
FOREIGN KEY (tourney_year_id )
REFERENCES tournaments(tourney_year_id )
;

ALTER TABLE match_scores 
ADD PRIMARY KEY (match_id);


copy match_scores FROM 'E:\Tennis dataset\csv\2_match_scores\match_scores_1877-1967.csv' DELIMITER ',' CSV;


copy match_scores FROM 'E:\Tennis dataset\csv\2_match_scores\match_scores_1968-1990.csv' DELIMITER ',' CSV;

copy match_scores FROM 'E:\Tennis dataset\csv\2_match_scores\match_scores_1991-2016.csv' DELIMITER ',' CSV;

copy match_scores FROM 'E:\Tennis dataset\csv\2_match_scores\match_scores_2017.csv' DELIMITER ',' CSV;

-----------------------------------------------------------------------------------------------------------------


CREATE TABLE match_stats (
   
    tourney_order                       integer,
    match_id                            varchar(40),
    match_stats_url_suffix              varchar(200),
    match_time                          varchar(10),
    match_duration                      integer,
    winner_aces                         integer,
    winner_double_faults                integer,
    winner_first_serves_in              integer,
    winner_first_serves_total           integer,
    winner_first_serve_points_won       integer,
    winner_first_serve_points_total     integer,
    winner_second_serve_points_won      integer,
    winner_second_serve_points_total    integer,
    winner_break_points_saved           integer,
    winner_break_points_serve_total     integer,
    winner_service_points_won           integer,
    winner_service_points_total         integer,
    winner_first_serve_return_won       integer,
    winner_first_serve_return_total     integer,
    winner_second_serve_return_won      integer,
    winner_second_serve_return_total    integer,
    winner_break_points_converted       integer,
    winner_break_points_return_total    integer,
    winner_service_games_played         integer,
    winner_return_games_played          integer,
    winner_return_points_won            integer,
    winner_return_points_total          integer,
    winner_total_points_won             integer,
    winner_total_points_total           integer,
    loser_aces                          integer,
    loser_double_faults                 integer,
    loser_first_serves_in               integer,
    loser_first_serves_total            integer,
    loser_first_serve_points_won        integer,
    loser_first_serve_points_total      integer,
    loser_second_serve_points_won       integer,
    loser_second_serve_points_total     integer,
    loser_break_points_saved            integer,
    loser_break_points_serve_total      integer,
    loser_service_points_won            integer,
    loser_service_points_total          integer,
    loser_first_serve_return_won        integer,
    loser_first_serve_return_total      integer,
    loser_second_serve_return_won       integer,
    loser_second_serve_return_total     integer,
    loser_break_points_converted        integer,
    loser_break_points_return_total     integer,
    loser_service_games_played          integer,
    loser_return_games_played           integer,
    loser_return_points_won             integer,
    loser_return_points_total           integer,
    loser_total_points_won              integer,
    loser_total_points_total            integer
);

ALTER TABLE match_stats
ADD CONSTRAINT constraint_fk_matchstats
FOREIGN KEY (match_id )
REFERENCES match_scores(match_id );

copy match_stats FROM 'E:\Tennis dataset\csv\3_match_stats\match_stats_1991-2016.csv' DELIMITER ',' CSV;

copy match_stats FROM 'E:\Tennis dataset\csv\3_match_stats\match_stats_2017.csv' DELIMITER ',' CSV;


-------------------------------------------------------------------------------------------------------------
CREATE TABLE rankings (
    
    week_title          varchar(10),
    week_year           integer,
    week_month          integer,
    week_day            integer,
    rank_text           varchar(5),
    rank_number         integer,
    move_positions      integer,
    move_direction      varchar(5),
    player_age          integer,
    ranking_points      integer,
    tourneys_played     integer,
    player_url          varchar(100),
    player_slug         varchar(40),
    player_id           varchar(10)
);

ALTER TABLE rankings
ADD CONSTRAINT constraint_fk_playerid
FOREIGN KEY (player_id )
REFERENCES players(player_id );

copy rankings from 'E:\Tennis dataset\csv\4_rankings\rankings.csv' DELIMITER ',' CSV;





--------------------------------------------------------------------

pg_dump -U postgres -W -F t ATP > F:\atp

pg_dump  -U postgres -Fp -O ATP > F:/database.pgsql

psql -U postgres ATP2 < F:/database.pgsql



-------------------------------------------------------------------------------------------------------------------------
views / materilised views

	
-- player_current_rank

CREATE OR REPLACE VIEW player_current_rank_view AS
WITH current_rank_date AS (SELECT max(week_title) AS week_title FROM rankings)
SELECT player_id, rank_number AS current_rank, ranking_points AS current_rank_points
FROM rankings
WHERE week_title = (SELECT week_title FROM current_rank_date);


CREATE MATERIALIZED VIEW player_current_rank AS SELECT * FROM player_current_rank_view;

CREATE UNIQUE INDEX ON player_current_rank (player_id);


-- player_best_rank

CREATE OR REPLACE VIEW player_best_rank_view AS
WITH best_rank AS (
	SELECT player_id, min(rank_number) AS best_rank FROM rankings
	GROUP BY player_id
)
SELECT player_id, best_rank, min(week_title) FILTER (WHERE r.rank_number = b.best_rank) AS best_rank_date
FROM best_rank b
INNER JOIN rankings r USING (player_id)
GROUP BY player_id, best_rank;

CREATE MATERIALIZED VIEW player_best_rank AS SELECT * FROM player_best_rank_view;

CREATE UNIQUE INDEX ON player_best_rank (player_id);


-- player_year_end_rank

CREATE OR REPLACE VIEW player_year_end_rank_view AS
WITH year_end_rank_date AS (
	SELECT player_id, extract(YEAR FROM week_title)::INTEGER AS season, max(week_title) AS week_title
	FROM rankings
	WHERE extract(YEAR FROM week_title) < extract(YEAR FROM current_date) OR extract(MONTH FROM current_date) >= 11
	GROUP BY player_id, season
)
SELECT player_id, season, rank_number AS year_end_rank, ranking_points AS year_end_rank_points
FROM year_end_rank_date
INNER JOIN rankings USING (player_id, week_title);

CREATE MATERIALIZED VIEW player_year_end_rank AS SELECT * FROM player_year_end_rank_view;

CREATE INDEX ON player_year_end_rank (player_id);


-- year end rank of each player (season/year as a input)

select player_year_end_rank.player_id, season, year_end_rank, year_end_rank_points, first_name, last_name 
from player_year_end_rank , players 
where  player_year_end_rank.player_id=  players.player_id
and season=2017 
order by year_end_rank;


=================CLEAN UP SECTION ==========================



drop materialized view player_best_rank;

drop materialized view player_current_rank;

drop materialized view player_year_end_rank;

drop  view player_best_rank_view;
	
drop  view player_current_rank_view;
			
drop view player_year_end_rank_view;	
	
ALTER TABLE rankings ALTER COLUMN week_title TYPE date using week_title::date;


	


