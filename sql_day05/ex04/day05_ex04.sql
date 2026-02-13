create UNIQUE index idx_menu_unique  on menu(pizzeria_id, pizza_name);
insert into menu(id, pizzeria_id, pizza_name, price)
values(101, 1, 'pepperoni pizza', 1000);