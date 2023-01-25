-- One to Many
CREATE TABLE IF NOT EXISTS manufacturers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS phones(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    price INT NOT NULL CHECK (price > 0),
    units_sold INT NOT NULL CHECK (units_sold >= 0),
    -- ON DELETE SET NULL : EN supprimant la marque, la colonne marque_id devient null
    -- ON DELETE RESTRICT : Interdire la suppression
    -- ON DELETE CASCADE : Supprimer toutes les lignes enfants
    manufacturer_id INT,
    FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(id) ON DELETE SET NULL
);