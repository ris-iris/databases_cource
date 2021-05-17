alter table board_games.maker rename column address to email;

insert into board_games.maker (maker_nm, email, phone)
values ('Магеллан', 'info@mglan.ru', '+79265234074');

insert into board_games.maker (maker_nm, email, phone)
values ('Hobby World', 'sales@hobbyworld.ru', '+74959845383');

insert into board_games.maker (maker_nm, email, phone)
values ('Hasbro', null, null);

insert into board_games.maker (maker_nm, email, phone)
values ('Crowd games', 'sale@crowdgames.ru', '+74994442842');

insert into board_games.maker (maker_nm, email, phone)
values ('Wizards of the Coast', null, null);

alter table board_games.maker alter column phone type varchar(13);

insert into board_games.maker (maker_nm, email, phone)
values ('Blackfire', 'info@blackfire.eu ', '+492102305920');

insert into board_games.maker (maker_nm, email, phone)
values ('Q-workshop', 'Shop@Q-workshop.com', '+48723010001');

