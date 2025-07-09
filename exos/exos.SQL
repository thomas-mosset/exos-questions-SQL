-- Requêtes de base

--- Sélectionner tous les enregistrements d'une table utilisateurs.
SELECT * FROM users;

--- Récupérer le nom et l’email des utilisateurs dont l’âge est supérieur à 30.
SELECT user_name, email FROM users WHERE age > 30;

--- Afficher uniquement les villes distinctes dans la table clients.
SELECT DISTINCT town FROM clients;

--- Trier les produits de la table produits par stock décroissant.
SELECT * FROM products ORDER BY stock DESC;


-- Filtres et conditions

--- Afficher tous les utilisateurs dont le nom commence par un "J". 
SELECT * FROM users WHERE user_name LIKE 'J%';

--- Récupérer les commandes dont la date est comprise entre le 1er janvier et le 31 mars 2024.
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31';

--- Sélectionner toutes les commandes produits dont le prix est supérieur à 100.
SELECT *
FROM products_orders
WHERE products_orders.solo_price > 100;


-- Agrégations et groupements

--- Compter le nombre total de clients.
SELECT COUNT(*) FROM clients;

--- Calculer la moyenne des salaires dans la table users.
SELECT AVG(income) FROM users;

--- Afficher le nombre de commandes par client.
SELECT client_id, COUNT(*) AS nb_orders
FROM orders
GROUP BY client_id;

--- Afficher les catégories de produits avec un total de stock supérieur à 60.
SELECT category, SUM(stock) AS total_stock
FROM products
GROUP BY category
HAVING SUM(stock) > 60;

-- Jointures

--- Récupérer les noms des clients et leurs commandes (tables clients et commandes).
SELECT clients.client_name, orders.*
FROM clients
JOIN orders ON orders.client_id = clients.id;


--- Afficher les produits commandés avec leur nom, quantité et prix unitaire (tables produits, commandes, commandes_produits).
SELECT products.product_name, products_orders.quantity, products_orders.solo_price
FROM products_orders
JOIN products ON products_orders.product_id = products.id;

--- Récupère les clients sans commande.
SELECT clients.client_name, clients.town
FROM clients
LEFT JOIN orders ON orders.client_id = clients.id
WHERE orders.id IS NULL;


-- Sous-requêtes

--- Afficher les utilisateurs dont le salaire est supérieur à la moyenne des salaires.
SELECT * FROM users
WHERE income > (
    SELECT AVG(income)
    FROM users
);

--- Affiche les noms des produits dont le stock est strictement supérieur à la moyenne des stocks de tous les produits.
SELECT product_name FROM products
WHERE stock > (
    SELECT AVG(stock)
    FROM products
);

--- Affiche les noms des clients dont l’id existe dans la table orders (donc qui ont au moins une commande).
SELECT client_name
FROM clients
WHERE id IN (
    SELECT client_id
    FROM orders
);

-- Manipulation de données

--- Insérer un nouvel employé dans la table users.
INSERT INTO users (user_name, email, age, income)
VALUES
('Thomas', 'thomas@mail.com', 30, 28000);

--- Mettre à jour le stock d’un produit donné.
UPDATE products
SET stock = 80
WHERE product_name = 'Laptop';

--- Supprimer tous les clients inactifs.
DELETE FROM clients
WHERE active = FALSE;


-- Structure de base de données

--- Créer une table vendeurs (sellers) avec une clé primaire et un champ email unique.
CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE
);

--- Ajouter une colonne vendeur_nom à la table sellers.
ALTER TABLE sellers 
ADD COLUMN seller_name VARCHAR(100);

--- Supprimer la table sellers.
DROP TABLE sellers;