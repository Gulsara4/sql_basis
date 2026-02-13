alter table person_discounts

ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),

add CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL) ,
add CONSTRAINT ch_nn_discount CHECK(discount is NOT NULL ),
alter discount set DEFAULT 0,
ADD CONSTRAINT  ch_range_discount check (discount >= 0 and discount<=100)
