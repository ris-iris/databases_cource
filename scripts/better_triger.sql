alter table board_games.seller_x_game add column valid_from_dt date default '2021-01-01';
alter table board_games.seller_x_game add column valid_to_dt date default '5999-01-01';

select * from board_games.seller_x_game;

drop table board_games.price_changes;

drop trigger price_changes_trigger on board_games.seller_x_game;

create or replace function update_price_changes() returns trigger as $$
    begin
        if tg_op = 'UPDATE' then
            update board_games.seller_x_game
            set valid_to_dt = current_date - INTERVAL '1 day'
            where game_id = new.game_id and seller_id = new.seller_id and seller_x_game.valid_to_dt = '5999-01-01';
        end if;

        insert into board_games.seller_x_game (seller_id, game_id, price, available_flg, valid_from_dt)
        values (new.seller_id, new.game_id, new.price, new.available_flg, current_date);

        return null;
    end;
    $$ language 'plpgsql';


drop view  board_games.v_seller_x_game;

create view board_games.v_seller_x_game as (
select seller_id, game_id, price, available_flg from board_games.seller_x_game
where valid_to_dt = '5999-01-01'
                                           );

select * from board_games.v_seller_x_game;
select * from board_games.seller_x_game;

create trigger price_changes_trigger
    instead of update or insert on board_games.v_seller_x_game
    for each row execute procedure update_price_changes();

insert into board_games.v_seller_x_game(seller_id, game_id, price, available_flg)
values (1, 21, 100, true);

update board_games.v_seller_x_game
set price = 990
where seller_id = 1 and game_id = 21;

