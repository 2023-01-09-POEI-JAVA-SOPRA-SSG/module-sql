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



-- 8. Calculer la somme
SELECT SUM(units_sold) FROM telephones; -- total de ventes
SELECT SUM(price*units_sold) FROM telephones;  -- le ca réalisé pour toutes les ventes

-- 9. Cacluler la moyenne
SELECT AVG(units_sold) FROM telephones;

-- 10. CA par fabricant
SELECT manufacturer,SUM(price*units_sold) FROM telephones GROUP BY manufacturer;


-- 11. Tous toutes les marques dont le CA > 10000000
        SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire
            FROM telephones 
            GROUP BY manufacturer 
            HAVING SUM(price*units_sold)>10000000;

-- 12. Trier dans l'ordre croissant des noms
SELECT name,manufacturer FROM telephones ORDER BY name;
SELECT name,manufacturer FROM telephones ORDER BY name ASC;

-- 13. Trier dans l'ordre decroissant des noms
SELECT name,manufacturer FROM telephones ORDER BY name DESC;

-- 14. filter par ordre croissant des fabricant, ensuite par ordre croissant des noms
SELECT manufacturer,name FROM telephones ORDER BY manufacturer ASC, name ASC;

-- 15. Filter par plusieurs critères et limiter les résultats à 5
SELECT * FROM telephones ORDER BY price DESC, units_sold DESC LIMIT 5;

-- 16. Limiter les resultats à 5
SELECT * FROM telephones ORDER BY id LIMIT 5 OFFSET 10;

-- 17. Tous toutes les marques dont le CA > 10000000 dans l'ordre décroissant de CA
SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire
    FROM telephones 
    GROUP BY manufacturer 
    HAVING SUM(price*units_sold)>10000000 ORDER BY chiffre_affaire DESC;

-- 18. Subqueries : Tous les téléphone qui sont plus chers que la moyenne
SELECT * FROM telephones WHERE price>(SELECT AVG(price) FROM telephones);

-- 19. Many to many
CREATE TABLE IF NOT EXISTS customers(
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products(
 id SERIAL PRIMARY KEY,
 name VARCHAR(50) NOT NULL,
 description TEXT NOT NULL,
 price INT NOT NULL,
 quantity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS orders(
 id SERIAL PRIMARY KEY,
 customer_id INT REFERENCES customers(id) ON DELETE SET NULL,-- Ajouter comme clé étrangère
 product_id INT,
 FOREIGN KEY(product_id) REFERENCES products(id)-- 2ème approche pour ajouter une clé étrangère
);

insert into customers(name,email)
values ('chris','chris@gmail.com'),
('jean','jean@yahoo.fr'),
('alexandre','alexandre@gmail.com');
select * from products;

insert into products(name,description,price,quantity)
values('Ps5','Pos',500,34),
('ps6','ppp',800,78),
('Macbook Pro 16','Apple things',3400,463),
('Iphone 13 Pro Max','Truc de Apple',1800,432);

insert into orders(customer_id, product_id)
values(1,1),
(1,4),
(2,4),
(2,2),
(1,3),
(3,2),
(3,1),
(2,2),
(3,4);

-- 20. Requêtes multi-tables
-- [customers] <- [orders] -> [products]


SELECT * FROM customers 
    JOIN orders ON customers.id=orders.customer_id
    JOIN products ON orders.product_id=products.id;
    

SELECT 
customers.name AS customer_name,
customers.email AS customer_email,
products.name AS product_name, 
products.price AS product_price
    FROM customers 
        JOIN orders ON customers.id=orders.customer_id
        JOIN products ON orders.product_id=products.id;

