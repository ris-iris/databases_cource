set search_path = board_games, public;

create view v_author as (
select author_nm,
       case when comment_txt is null
        then 'Просто хороший человек'
        else comment_txt
        end as comment
from author
                        );

select * from v_author;

create view v_maker as (
select maker_nm, email, phone from maker
);

select * from v_maker;

create view v_seller as (
select seller_nm, address, phone from seller
);

select * from v_seller;

create view v_piece as (
select piece_nm, type,  min(price), max(price) from piece
join seller_x_piece sxp on piece.piece_id = sxp.piece_id
group by (piece_nm, type)
                       );

select * from v_piece
where type like '%книга%';

create view v_series as (
select series_nm, substring(comment_txt, 0, 30)||'...' from series
                        );

select * from v_series;

create view v_game as (
select game_nm, 'от ' || cast(min_player_cnt as varchar) || ' до ' || cast(max_player_cnt as varchar) || ' игроков' as player_cnt,
       cast(age_limit as varchar) || '+' as age_limit from board_game
                      );

select * from v_game;

create view v_author_x_game as (
select author_nm, game_nm from author
join author_x_game axg on author.author_id = axg.author_id
join board_game bg on bg.game_id = axg.game_id
order by game_nm
                               );

select * from v_author_x_game;

create view v_maker_x_game as (
select maker_nm, game_nm from maker
join maker_x_game mxg on maker.maker_id = mxg.maker_id
join board_game bg on bg.game_id = mxg.game_id
                              );

create view v_maker_x_piece as (
select maker_nm, piece_nm from maker
join maker_x_piece mxp on maker.maker_id = mxp.maker_id
join piece p on p.piece_id = mxp.piece_id
                              );

create view v_seller_x_game as (
select distinct seller_nm, game_nm from seller
join seller_x_game sxg on seller.seller_id = sxg.seller_id
join board_game bg on bg.game_id = sxg.game_id
                              );

create view v_seller_x_piece as (
select distinct seller_nm, piece_nm from seller
join seller_x_piece sxp on seller.seller_id = sxp.seller_id
join piece p on p.piece_id = sxp.piece_id
                              );

select * from v_seller_x_game;

