/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon', '2018-11-15', 2, true, 8.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, true, 11);

/* Update table Milestone 2*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Plantmon', '2022-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon', '2005-06-12', 1 , true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon', '2005-06-07', 7, true, 20.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom', '1998-10-13', 3, true, 17);

/* Query multiple tables */

INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

/* joint table - visits */

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id) VALUES (4, 2);

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, 'May 24, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 3, 'Jul 22, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (2, 4, 'Feb 2, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'Jan 5, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'Mar 8, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'May 14, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 3, 'May 4, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 4, 'Feb 24, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, 'Dec 21, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 1, 'Aug 10, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, 'Apr 7, 2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 3, 'Sep 29, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, 'Oct 3, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, 'Nov 4, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Jan 24, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'May 15, 2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Feb 27, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Aug 3, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 3, 'May 24, 2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 1, 'Jan 11, 2021');

/* Audit */

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

