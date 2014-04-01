ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number TEXT;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;
ALTER TABLE pet ADD COLUMN parent INTEGER;

UPDATE person SET dead = 0;
UPDATE person_pet SET purchased_on = date('now');
UPDATE pet SET parent = 0;

INSERT INTO person (id, first_name, last_name, dead, phone_number, salary, dob) VALUES (10, 'Dave', 'Lewis', 0, '610-999-1234', 43000.00, '03/09/87');
INSERT INTO person (id, first_name, last_name, dead, phone_number, salary, dob) VALUES (11, 'Dove', 'Lowis', 0, '610-888-4321', 33000.00, '12/09/87');
INSERT INTO person (id, first_name, last_name, dead, phone_number, salary, dob) VALUES (12, 'Dive', 'Luwis', 0, '610-777-1111', 3000.00, '10/09/87');
INSERT INTO person (id, first_name, last_name, dead, phone_number, salary, dob) VALUES (13, 'Duve', 'Lawis', 0, '610-666-2222', 63000.00, '04/09/87');

INSERT INTO pet VALUES (10, 'DNA', 'Beagle', 7, 0, '02/14/95', 10); 
INSERT INTO pet VALUES (11, 'Mr. Bigglesworth', 'Terrier', 14, 0, '02/14/90', 11); 
INSERT INTO pet VALUES (12, 'Hockey Animal', 'Danish (Cheese)', 7, 0, '03/14/96', 12); 
INSERT INTO pet VALUES (13, 'Babycakes', 'Turle', 7, 1, '04/04/94', 13); 
INSERT INTO pet VALUES (14, 'HAL', 'HAL', 7, 1, '05/24/93', 13);

INSERT INTO person_pet VALUES (10, 10, date('now'));
INSERT INTO person_pet VALUES (11, 11, date('now'));
INSERT INTO person_pet VALUES (12, 12, date('now'));
INSERT INTO person_pet VALUES (13, 13, date('now'));
INSERT INTO person_pet VALUES (13, 14, date('now'));

SELECT pet.name, person.first_name, person.last_name
FROM pet, person, person_pet
WHERE person_pet.purchased_on > '12/31/2004'
	AND person_pet.pet_id = pet.id
	AND person_pet.person_id = person.id;

SELECT * 
FROM pet 
WHERE pet.id IN(
	SELECT pet_id 
	FROM person_pet
	WHERE parent <> 0
);

