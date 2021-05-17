create schema board_games;

set search_path to board_games;

create table series (
    series_id serial primary key,
    series_nm varchar(50),
    series_genre varchar(50)
);

create table board_game (
    game_id serial primary key,
    game_nm varchar(50),
    min_player_cnt integer,
    max_player_cnt integer,
    age_limit integer,
    genre varchar(50),
    series_id serial
            references series(series_id)
            on delete set null
);

create table piece (
    piece_id serial primary key,
    piece_nm varchar(50),
    type varchar(50),
    material varchar(50),
    game_id serial
            references board_game(game_id)
            on delete cascade
);

create table author (
    author_id serial primary key,
    author_nm varchar(50),
    comment_txt varchar(250)
);

create table maker (
    maker_id serial primary key,
    maker_nm varchar(50),
    address varchar(150),
    phone varchar(12)
);

create table seller (
    seller_id serial primary key,
    seller_nm varchar(50),
    address varchar(150),
    phone varchar(12)
);

create table seller_x_game (
    seller_id serial
            references seller(seller_id),
    game_id serial
            references board_game(game_id),
    price decimal(2),
    available_flg boolean
);

create table seller_x_piece (
    seller_id serial
            references seller(seller_id),
    piece_id serial
            references piece(piece_id),
    price decimal(2),
    available_flg boolean
);


create table maker_x_game (
    maker_id serial
            references maker(maker_id),
    game_id serial
            references board_game(game_id)
);

create table author_x_game (
    author_id serial
            references author(author_id),
    game_id serial
            references board_game(game_id)
);

alter table series drop series_genre;
alter table series add comment_txt varchar(250);