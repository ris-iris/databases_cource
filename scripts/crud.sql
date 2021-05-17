set search_path = board_games, public;

insert into board_game (game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Взрывные котята', 2, 5, 10, 'карточная', null);

select * from board_game
where game_nm = 'Взрывные котята';

update board_game
set genre = 'вечериночная'
where game_nm = 'Взрывные котята';

delete from board_game
where game_nm = 'Взрывные котята';


insert into seller (seller_nm, address, phone)
values ('Hobby Games', '24-й км МКАД, ТРК VEGAS', '+79651899988');

select * from seller
where seller_nm = 'Hobby Games' and address = '24-й км МКАД, ТРК VEGAS';

update seller
set phone = null
where seller_nm = 'Hobby Games' and address = '24-й км МКАД, ТРК VEGAS';

delete from seller
where seller_nm = 'Hobby Games' and address = '24-й км МКАД, ТРК VEGAS';