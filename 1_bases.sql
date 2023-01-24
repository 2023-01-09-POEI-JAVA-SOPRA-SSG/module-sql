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
-- DROP TABLE clients;


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