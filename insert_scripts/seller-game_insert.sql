alter table board_games.seller_x_game alter column price type decimal(6, 2);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (4, 17, 3990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (1, 17, 3990, false);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (1, 6, 990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (2, 7, 3990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (3, 8, 2990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (1, 13, 5990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (5, 13, 5990, true);

insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (6, 13, 5990, true);