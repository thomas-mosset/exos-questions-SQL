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