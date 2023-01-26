-- One to Many
CREATE TABLE IF NOT EXISTS manufacturers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS phones(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    -- manufacturer VARCHAR(20) NOT NULL,
    price INT NOT NULL CHECK (price > 0),
    units_sold INT NOT NULL CHECK (units_sold >= 0),
    -- ON DELETE SET NULL : EN supprimant la marque, la colonne marque_id devient null
    -- ON DELETE RESTRICT : Interdire la suppression
    -- ON DELETE CASCADE : Supprimer toutes les lignes enfants
    manufacturer_id INT,
    FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(id) ON DELETE SET NULL
);

-- ALTER TABLE phones DROP COLUMN manufacturer;

INSERT INTO manufacturers(name) VALUES('Apple'),('Samsung'),('Huawei');
SELECT * FROM manufacturers;

INSERT INTO phones(name,price,units_sold, manufacturer_id) 
    VALUES
        ('Iphone 13 Pro Max',1500,1233,1),
          ('Iphone 14 Pro Max',2000,433,1),
          ('Iphone 12 ',900,3432,1),
          ('Galaxy Note 20',690,2732,2),
           ('Galaxy Note 5',100,23832,2),
             ('Galaxy s9',500,6383,2),
           ('Mate 20',150,3535425,3),
            ('Honor 40',400,7535425,3);


-- Requêtes de jointure
SELECT * FROM phones JOIN manufacturers ON manufacturers.id=phones.manufacturer_id;
SELECT phones.id, phones.name AS modele,manufacturers.name AS fabricant  FROM 
    phones JOIN manufacturers 
        ON manufacturers.id=phones.manufacturer_id;