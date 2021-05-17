set search_path = board_games, public;


-- Хочу найти серии, в которых больше 2х игр.
select series_nm from series
join ( select series_id from board_game
       group by series_id
       having count(*) > 2
    ) bg on series.series_id = bg.series_id;


-- Хочу найти игры или дополнения, для которых цены в разных магазинах различны
select game_nm, min(price) as min_price, max(price) as max_price from board_game
join seller_x_game sxg on board_game.game_id = sxg.game_id
group by game_nm
having min(price) <> max(price)
union
select piece_nm, min(price) as min_price, max(price) as max_price from piece
join seller_x_piece sxg on piece.piece_id = sxg.piece_id
group by piece_nm
having min(price) <> max(price);


-- Хочу найти игры, которые сейчас есть в наличии в сети магазинов Мосигра
select distinct game_nm, price from board_game
join seller_x_game sxg on board_game.game_id = sxg.game_id
join seller s on s.seller_id = sxg.seller_id
where seller_nm = 'Мосигра';


-- Хочу найти авторов DnD
select author_nm from author
join author_x_game axg on author.author_id = axg.author_id
join board_game bg on bg.game_id = axg.game_id
join series s on s.series_id = bg.series_id and series_nm = 'Dungeons and Dragons';


-- Хочу найти производителя кубиков
select * from maker
where maker_id in ( select maker_id from maker_x_piece
join piece p on p.piece_id = maker_x_piece.piece_id and p.type like '%кубики%');