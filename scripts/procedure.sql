create procedure insert_lots_of_values(game varchar, players varchar, age_lim integer, game_genre varchar, series_name varchar, author_name varchar)
language plpgsql
as $$
    begin
    insert into board_games.board_game(game_nm, min_player_cnt, max_player_cnt, age_limit, genre, series_id)
    values (game,
            cast(substring(players from 'от #"[0-9]#" до%' for '#') as integer),
            cast(substring(players from '%до #"[0-9]#" %' for '#') as integer),
            age_lim,
            game_genre,
            case
                when series_name is null
                then null
                else
            (select min(series_id) from board_games.series where series.series_nm = series_name)
            end
            );

    if author_name not in (select author_nm from board_games.author)
        then insert into board_games.author(author_nm)
        values (author_name);
        end if;

    insert into board_games.author_x_game(author_id, game_id)
    values (
            (select min(author_id) from board_games.author where author_nm = author_name),
            (select min(game_id) from board_games.board_game where board_game.game_nm = game)
           );
    end;
    $$;

call insert_lots_of_values('Замес', 'от 2 до 4 игроков', 12, 'сратегическая', null, 'Пол Питерсен');

alter table board_games.author_x_game drop constraint author_x_game_game_id_fkey;

alter table board_games.author_x_game add constraint author_x_game_game_id_fkey
foreign key (game_id) references board_games.board_game(game_id)
on delete cascade ;

delete from board_games.board_game
where game_id = 23;