create table board_games.maker_x_piece (
    maker_id serial
            references board_games.maker(maker_id),
    piece_id serial
            references board_games.piece(piece_id)
);

insert into board_games.maker_x_piece (maker_id, piece_id)
values (2, 4);

insert into board_games.maker_x_piece (maker_id, piece_id)
values (2, 6);

insert into board_games.maker_x_piece (maker_id, piece_id)
values (6, 7);

insert into board_games.maker_x_piece (maker_id, piece_id)
values (6, 8);

insert into board_games.maker_x_piece (maker_id, piece_id)
values (5, 7);

delete from board_games.maker_x_piece
where maker_id = 5;

insert into board_games.maker_x_piece (maker_id, piece_id)
values (7, 5);