insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Бэнг!', 4, 7, 12, 'карточная', 1);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Бэнг! Меч самурая', 3, 7, 8, 'карточная', 1);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Бэнг! Дуэль', 2, 2, 12, 'дуэльная карточная', 1);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Данетки. Страсти-мордасти', 2, 1000, 12, 'детективная', 2);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Данетки. Случаи из жизни', 2, 1000, 12, 'детективная', 2);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Манчкин', 3, 6, 12, 'карточная', 3);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Манчкин: Подземелье', 2, 5, 14, 'карточная', 3);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Манчкин Квест', 2, 4, 12, 'приключенческая', 3);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Монополия с банковскими картами', 2, 4, 8, 'экономическая', 4);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Свинтус', 2, 10, 5, 'вечериночная', 5);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Свинтус: Злоключения', 2, 10, 6, 'вечериночная', 5);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Серп', 1, 5, 14, 'стратегическая', 6);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Catan', 3, 4, 10, 'стратегическая', 7);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('MTG. Core Set 2021 - Arena Starter Kit', 2, 2, 13, 'кки', 8);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('MTG. Secret Lair: Ultimate Edition', 2, 1000, 13, 'кки', 8);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Dungeons & Dragons. Стартовый набор', 2, 6, 12, 'нри', 9);

insert into board_games.board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre)
values ('Root', 2, 4, 10, 'стратегическася');

alter table board_games.board_game
drop constraint board_game_series_id_fkey;

alter table board_games.board_game
add constraint fk_series
foreign key (series_id) references board_games.series(series_id);

alter table board_games.board_game alter series_id type integer;

alter table board_games.board_game alter column series_id drop not null ;

update board_games.board_game
set series_id = null
where game_nm = 'Root'