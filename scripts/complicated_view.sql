drop view if exists v_seller_prices;

create view v_seller_prices as (
select seller_nm, address,
       min(price) over (partition by (seller_nm, address)) as "min price",
       max(price) over (partition by (seller_nm, address)) as "max price"
       from (
           select seller_nm, address, price from board_games.seller
           join board_games.seller_x_game sxg on seller.seller_id = sxg.seller_id
           where available_flg
           union
           select seller_nm, address, price from board_games.seller
           join board_games.seller_x_piece sxp on seller.seller_id = sxp.seller_id
           where available_flg
           ) a
                               );

select * from v_seller_prices;

create view v_seller_with_store_chain as (
select dense_rank() over (order by seller_nm) as "chain index", seller_nm, address, phone
from board_games.seller
                                         );

select * from v_seller_with_store_chain;
