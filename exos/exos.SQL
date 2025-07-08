-- Requêtes de base

--- Sélectionner tous les enregistrements d'une table utilisateurs.
SELECT * FROM users;

--- Récupérer le nom et l’email des utilisateurs dont l’âge est supérieur à 30.
SELECT user_name, email FROM users WHERE age > 30;

--- Afficher uniquement les villes distinctes dans la table clients.
SELECT DISTINCT town FROM clients;

--- Trier les produits de la table produits par stock décroissant.
SELECT * FROM products ORDER BY stock DESC;