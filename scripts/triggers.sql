create table board_games.price_changes (
  seller_id serial
            references board_games.seller(seller_id),
  game_id serial
            references board_games.board_game(game_id),
  price integer,
  date date
);

create or replace function update_price_changes() returns trigger as $$
    begin
        if tg_op = 'INSERT' or new.price <> old.price then
        insert into board_games.price_changes (seller_id, game_id, price, date)
        values (new.seller_id, new.game_id, new.price, current_date);
        end if;
        return null;
    end;
    $$ language 'plpgsql';

create trigger price_changes_trigger
    after update or insert on board_games.seller_x_game
    for each row execute procedure update_price_changes();

-- проверка
insert into board_games.seller_x_game (seller_id, game_id, price, available_flg)
values (7, 13, 100, false);

update board_games.seller_x_game
set available_flg = true
where seller_id = 7 and game_id = 13;

update board_games.seller_x_game
set price = 5990
where seller_id = 7 and game_id = 13;
-- конец проверки


create or replace function auto_insert_on_mtg() returns trigger as $$
    begin
        if new.series_id = 8 then
        insert into board_games.maker_x_game (maker_id, game_id)
        values (5, new.game_id);
        end if;
        return null;
    end;
    $$ language 'plpgsql';

create trigger mgt_insert_trigger
    after insert on board_games.board_game
    for each row execute procedure auto_insert_on_mtg();

-- проверка
insert into board_games.board_game(game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('MTG. Core Set 2021 - Arena Starter Kit', 2, 2, 13, 'кки', 8);

insert into board_games.board_game(game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
values ('Взрывные котята', 2, 5, 10, 'вечериночная', null);
-- конец проверки