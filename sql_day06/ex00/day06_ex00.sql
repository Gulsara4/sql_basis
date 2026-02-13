CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT,
    pizzeria_id BIGINT,
    discount NUMERIC(5, 2) DEFAULT 0.00,
    CONSTRAINT fk_person_discount_person_id 
        FOREIGN KEY (person_id) REFERENCES person(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_person_discount_pizzeria_id
        FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);