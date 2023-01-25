CREATE TABLE telephones (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    price INT NOT NULL CHECK (price > 0),
    units_sold INT NOT NULL CHECK (units_sold >= 0)
);

-- 1.Ecrire une requête pour liste tous les modèles de téléphones
SELECT name FROM telephones;

-- 2. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphone dont le prix est supérieur à 200€
SELECT name,manufacturer,price FROM telephones WHERE price>200;

-- 3. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphone dont le prix est varie entre 150 et 200€
SELECT name, manufacturer FROM telephones WHERE price>=150 AND price<=200;
SELECT name, manufacturer FROM telephones WHERE price BETWEEN 150 AND 200;

--4. Lister tous les téléphones de marque samsung et Apple
SELECT name,manufacturer FROM telephones WHERE manufacturer='Samsung' OR manufacturer='Apple';
SELECT name,manufacturer FROM telephones WHERE LOWER(manufacturer)=LOWER('Samsung') OR LOWER(manufacturer)=LOWER('Apple');
SELECT name,manufacturer FROM telephones WHERE LOWER(manufacturer) IN (LOWER('Apple'),LOWER('Samsung'));

-- 5. Afficher le revenu total pour les téléphones vendues.Pour chaque téléphone, vous avez le prix et la quantité vendu
SELECT name,price*units_sold FROM telephones;
SELECT name AS modele,price*units_sold AS ca FROM telephones;

-- 6. Afficher le nombre des téléphones Apple
SELECT COUNT(*) FROM telephones WHERE LOWER(manufacturer)=LOWER('Apple');

--7. Afficher toutes les données de la table téléphone en renommant les champs de la manière suivante : 
-- name=>modèle, 
-- manufacturer => fabricant, 
-- price => prix, 
-- units_sold => quantité vendue
SELECT name AS modele, manufacturer AS fabricant, price AS prix, units_sold AS 'quantité vendu' FROM telephones;


-- 
