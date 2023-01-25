-- 1. Créer une table
-- IF NOT EXISTS : Ne créer la table que si elle n'existe pas.
CREATE TABLE IF NOT EXISTS clients(
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(15)
);

-- 2. Créer une table et appliquer des contraintes
CREATE TABLE clients(
--    nombre, qui s'inctement automatiquement, unique
  id SERIAL PRIMARY KEY,
    
 -- NOT NULL : La valeur doit toujours être renseignée
 --  UNIQUE : Appliquer une constrainte d'unicité   
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number VARCHAR(15) UNIQUE
);

-- 3. Supprimer une table
DROP TABLE clients;


-- Table véhicules
CREATE TABLE vehicules(
    matricule VARCHAR(12) PRIMARY KEY,
    marque VARCHAR(20) NOT NULL,
    modele VARCHAR(20) UNIQUE NOT NULL,
    anne_fabrication INT NOT NULL
);


-- 4. Insérer une seul enregistrement
INSERT INTO clients(first_name,last_name,email,phone_number) 
VALUES('Irène','Charles','irene.charles@gmail.com','0666646464');

-- 5. Insérer plusieurs enregistrements
INSERT INTO clients(first_name,last_name,email,phone_number) 
VALUES
    ('Lorenzo','Biscaino','lorenzo.bis@gmail.com','06677764'),
    ('Marina','Garin','marina.garin@gmail.com','077446374'),
    ('Hamdi','Dalaa','hamdi.dalaa@gmail.com','064666444');

INSERT INTO clients(first_name,last_name,email,phone_number) 
VALUES('André','Toto','andre.toto@yahoo.fr','0606646464'),
('Luc','Dada','luc.dada@yahoo.com','0699646464'),
('Rudy','Tata','rudy.tata@hotmail.fr','0299646464'),
('Chris','Lislis','chr.lis@orange.fr','0799646464');

-- 6. Limiter les résultats avec la cluse `WHERE`
-- SELECT * FROM clients WHERE first_name='Christian';
-- SELECT * FROM clients WHERE last_name='Charles';

-- 7. Trouver tous les clients dont les noms commencent par "Chris"
SELECT * FROM clients WHERE first_name LIKE 'Chris%';

-- 8. Trouver tous les clients dont les email se terminent par "yahoo.fr"
SELECT * FROM clients WHERE email LIKE '%yahoo.fr';

-- 9. Trouver tous les client dont les prenom sont 'Luc' et qui possèdent des
-- adresse yahoo
SELECT * FROM clients WHERE first_name='Luc' AND email LIKE '%yahoo.%';



-- 10. Supprimer un client
DELETE FROM clients; -- Si vous voulez aller en prison
DELETE FROM clients WHERE id=14;
DELETE FROM clients WHERE email LIKE '%@toto.fr' OR phone_number LIKE '+299';

-- 11. Mettre à jour une ligne
UPDATE clients SET last_name='Zoto',phone_number='074747474' WHERE id=10;

-- 12. Ajouter une ligne(middle_name)
ALTER table clients
    ADD COLUMN middle_name VARCHAR(50);

-- 13. Renommer une colonne
ALTER TABLE clients
    RENAME COLUMN phone_number TO phone;

-- 14. Supprimer une clonne colonne
ALTER TABLE clients
    DROP COLUMN abc;

-- 15. Ajouter une contrainte de non nullité
ALTER TABLE clients
    ALTER COLUMN abc SET NOT NULL;

-- 16. Oder by

-- 17. Associations

-- 18. SQL jointure