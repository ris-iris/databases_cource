alter table board_games.piece drop column material;
alter table board_games.piece alter column piece_nm type varchar(100);

insert into board_games.piece(piece_nm, type, game_id)
values ('Dungeons & Dragons. Энциклопедия чудовищ', 'книга правил', 9);

insert into board_games.piece(piece_nm, type, game_id)
values ('The Witcher Dice Set: Yennefer – Sorceress Supreme, 7 шт', 'игральные кубики', 9);

insert into board_games.piece(piece_nm, type, game_id)
values ('Dungeons & Dragons. Ширма мастера подземелий. Реинкарнация', 'ширма', 9);

insert into board_games.piece(piece_nm, type, game_id)
values ('Пластиковая коробочка Blackfire вертикальная - Чёрная (100+ карт)', 'бокс для карт', 8);

insert into board_games.piece(piece_nm, type, game_id)
values ('Протекторы Blackfire Exact Fit Side load (100шт, 64x89 мм)', 'протекторы', 8);

alter table board_games.piece drop constraint piece_game_id_fkey;

alter table board_games.piece rename column game_id to series_id;

alter table board_games.piece add foreign key (series_id) references board_games.series(series_id);