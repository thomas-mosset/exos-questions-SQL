# Questions SQL

## Requêtes de base

- **Comment filtrer des données avec ``WHERE`` ?**

La clause ``WHERE`` permet de filtrer les lignes d'une table avec une condition. Cette clause peut être également utilisée avec ``UPDATE``, ``DELETE``, etc. Pas uniquement ``SELECT``.

```SQL

-- Sélectionne tous les utilisateurs de France
SELECT * FROM users
WHERE Country='France';

```

- **Quelle est la différence entre ``WHERE`` et ``HAVING`` ?**

La clause ``HAVING`` est utilisée dans une requête d'agrégation, ce qui n'est pas possible via ``WHERE``. Elle sert à filtrer les groupes créés par ``GROUP BY``.

```SQL

-- Sélectionne tous les pays ayant plus de 5 clients
SELECT COUNT(CustomerID), Country 
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

```

- **Que retourne une clause ``SELECT *`` ?**

La clause ``SELECT *`` retourne toutes les valeurs de toutes les colonnes d'une table.

```SQL

-- Sélectionne toutes les valeurs de la table users
SELECT * FROM users;

```

- **Quelle est la fonction de ``DISTINCT`` ? Comment l'utiliser ?**

``DISTINCT`` permet de renvoyer seulement les valeurs différentes lorsqu'il y a plusieurs valeurs identiques. (Évite les doublons.)

```SQL

SELECT DISTINCT user_name FROM users;

-- Renverrait par exemple "Agathe", "Thomas", "Gilbert", "Gertrude" au lieu de "Agathe", "Thomas", "Gilbert", "Gertrude", "Thomas" (2nd occurance du prénom)

```

- **Que fait l’opérateur ``LIKE`` ?**

L’opérateur ``LIKE`` s'utilise avec la clause ``WHERE`` et permet de faire une recherche basées sur un *pattern*.

```SQL

-- Sélectionne toutes les valeurs de la table users où le terme "Thomas" apparait.
SELECT * FROM users
WHERE user_name = "Thomas";

-- Retourne tous les utilisateur avec le nom "Thomas".
```

- **Comment utiliser ``%`` et ``_`` ?**

``_`` représente un unique caractère (lettre, chiffre, caractère spécial).

```SQL

SELECT * FROM users
WHERE city LIKE 'L_nd__';

-- Pourrait retourner des villes comme "London", "Lander" dedans par exemple.
```

``%`` représente zéro, un ou plusieurs caractères.

```SQL

-- Sélectionne toutes les valeurs de la table users où le terme "da" apparait.
SELECT * FROM users
WHERE user_name LIKE '%da%';

-- Pourrait retourner "David", "Mathilda", "Damien", etc. par exemple.

-- Sélectionne toutes les valeurs de la table users dont le nom commence par 'a'
SELECT * FROM users
WHERE user_name LIKE 'a%';

-- Pourrait retourner "Agathe", "Angel", "Albert", etc. par exemple.

-- Sélectionne toutes les valeurs de la table users dont le nom termine par 'n'
SELECT * FROM users
WHERE user_name LIKE '%n';

-- Pourrait retourner "Kevin", "Augustin", etc. par exemple.

```

- **Quelle est la différence entre ``NULL``, ``0`` et ``''`` ?**

``NULL`` représente l'absence de valeur (valeur non définie).

``0`` est un nombre, une valeur numérique.

``''`` est une chaîne de caractères vide (``string`` vide).

- **Comment trier des résultats dans l’ordre alphabétique ?**

On utilise ``ORDER BY``. Il peut s'accompagner de ``ASC`` (ordre croissant, par défaut) ou ``DESC`` (ordre décroissant).

```SQL

SELECT * FROM products
ORDER BY price DESC ;

-- Renvoie tous les produits triés par prix du plus élevé au plus bas.

```

- **Quelle est la différence entre ``LIMIT``, ``OFFSET`` et ``FETCH FIRST`` ?**

``LIMIT`` permet de limiter le nombre de lignes retournées.

``OFFSET`` permet de sauter un nombre de lignes avant de commencer à retourner les résultats.

``FETCH FIRST`` est une autre syntaxe SQL standard pour limiter le nombre de résultats (parfois utilisée avec ``OFFSET``).

```SQL

SELECT * FROM products
LIMIT 10 OFFSET 5;

-- Retourne 10 lignes de la table products après avoir ignoré les 5 premières.

```

- **Que signifie ``BETWEEN`` ?**

``BETWEEN`` permet de sélectionner des valeurs dans une plage de données. Ces données peuvent être des chiffres, du texte ou des dates. Les valeurs de départ et de fin sont incluses dans l'opérateur.

```SQL

SELECT * FROM products
WHERE price BETWEEN 10 AND 20 ;

-- Renvoie tous les produits dont le prix est compris entre 10 (inclus) et 20 (inclus).
```

- **Quand utiliser ``BETWEEN``, ``IN``, ou ``NOT IN`` ?**

``BETWEEN`` s'utilise pour sélectionner une plage de valeurs.

``IN`` sert à filtrer selon une liste de valeurs précises.

``NOT IN`` sert à exclure une liste de valeurs.

```SQL

SELECT * FROM products
WHERE price BETWEEN 10 AND 20 ;
-- Renvoie tous les produits dont le prix se trouve entre 10 (compris) et 20 (compris).

SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');
-- Renvoie tous les clients dont le pays est l'Allemagne, la France ou le Royaume-Uni.

SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');
-- Renvoie tous les clients dont le pays n'est pas l'Allemagne, la France ou le Royaume-Uni.

```

- **Quelle est la différence entre ``=`` et ``IS NULL`` ?**

``IS NULL`` est une valeur nulle pour un champ sans valeur. Si un champ d'une table est facultatif, il est possible d'insérer un nouvel enregistrement ou de le mettre à jour sans ajouter de valeur à ce champ. Le champ sera alors enregistré avec une valeur nulle. ⚠ Une valeur ``NULL`` est différente de zéro ou d'un champs contenant un espace.

``=`` est un opérateur de comparaison pour tester l'égalité avec une valeur donnée.

```SQL

SELECT * FROM customers
WHERE country IS NULL;
-- Renvoie tous les clients dont le pays a une valeur null.

SELECT * FROM products
WHERE price = 20 ;
-- Renvoie tous les produits dont le prix est strictement égal à 20.

```

## Jointures

- **Quelle est la différence entre ``INNER JOIN``, ``LEFT JOIN``, ``RIGHT JOIN`` et ``FULL OUTER JOIN`` ?**

``INNER JOIN`` renvoie uniquement les enregistrements ayant des correspondances dans les deux tables.

``LEFT JOIN`` renvoie tous les enregistrements de la table de gauche, et les enregistrements correspondants de la table de droite. Si aucune correspondance n’est trouvée, les colonnes de la table de droite auront la valeur NULL.

``RIGHT JOIN`` renvoie tous les enregistrements de la table de droite, et ceux correspondants de la table de gauche. Si aucune correspondance n’est trouvée, les colonnes de la table de gauche auront la valeur NULL.

``FULL OUTER JOIN`` renvoie tous les enregistrements des deux tables. Si une correspondance existe, elle est affichée. Sinon, les colonnes de la table sans correspondance sont NULL.

```SQL

-- INNER JOIN : Produits associés à une catégorie
SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- LEFT JOIN : Tous les clients, même ceux sans commande
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

-- RIGHT JOIN : Tous les employés, même ceux sans commande attribuée
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

-- FULL OUTER JOIN : Tous les clients et toutes les commandes, même sans correspondance
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

```

- **À quoi sert la clause ``ON`` dans une jointure ?**

La clause ``ON`` permet de définir la condition de jointure, c’est-à-dire la ou les colonnes sur lesquelles les deux tables doivent être liées. Elle est obligatoire dans une jointure explicite.

```SQL

SELECT * 
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

```

- **Que fait la clause ``USING`` ?**

La clause ``USING`` permet de simplifier l’écriture d’une condition de jointure lorsque les colonnes ont le même nom dans les deux tables.

*Remarque : ``USING`` ne fonctionne que si le nom de la colonne est identique dans les deux tables.*

```SQL

SELECT * 
FROM Orders
JOIN Customers USING (CustomerID);

```

- **Peut-on faire une jointure sur plusieurs colonnes ?**

Oui. Il est possible d’utiliser plusieurs colonnes pour effectuer une jointure.

```SQL

SELECT * FROM TableA
JOIN TableB
ON TableA.col1 = TableB.col1 AND TableA.col2 = TableB.col2;

```

- **Peut-on imbriquer plusieurs jointures dans une même requête ?**

Oui, on peut chaîner plusieurs jointures pour relier plusieurs tables.

```SQL

SELECT Orders.OrderID, Customers.CustomerName, Employees.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;

```

- **Que se passe-t-il si une condition de jointure est absente ?**

Si tu oublies la condition ``ON``, le SGBD (Système de gestion de base de données) effectue un produit cartésien. C'est-à-dire que chaque ligne de la première table est combinée avec chaque ligne de la seconde. (Si la première table contient ``m`` lignes et la deuxième ``n`` lignes, alors le résultat contiendra ``m × n`` lignes.) Cela peut produire un très grand nombre de lignes, souvent de manière involontaire.

## Agrégats et groupes

- **Citer quelques fonctions d’agrégation.**

``COUNT`` : compte toutes les valeurs de toutes les colonnes d'une table.

``SUM`` : renvoie la somme totale d'une colonne numérique.

``AVG`` : renvoie la valeur moyenne d'une colonne numérique.

``MIN`` : renvoie la valeur minimale d'une colonne numérique.

``MAX`` : renvoie la valeur maximale d'une colonne numérique.

```SQL

SELECT COUNT(Price) FROM Products; -- renvoie le nombre de lignes où Price n'est pas NULL

SELECT SUM(Price) FROM Products; -- renvoie la somme des prix

SELECT AVG(Price) FROM Products; -- renvoie la moyenne des prix

SELECT MIN(Price) FROM Products; -- renvoie le prix minimum

SELECT MAX(Price) FROM Products; -- renvoie le prix maximum

```

- **Que fait la clause ``GROUP BY`` ?**

La clause ``GROUP BY`` regroupe les lignes selon une ou plusieurs colonnes, ce qui permet d’agréger les données par groupe.

```SQL

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

-- Renvoie le nombre de clients par pays, trié par nombre de clients décroissant

```

- **Quelle est la différence entre ``COUNT(*)`` et ``COUNT(colonne)`` ?**

``COUNT(*)`` compte toutes les lignes (y compris celles avec des valeurs NULL dans les colonnes).

``COUNT(colonne)`` compte uniquement les lignes où la colonne spécifiée n’est pas NULL.

```SQL

SELECT COUNT(*) FROM products;
-- Renvoie le nombre total de colonnes de la table produits

SELECT COUNT(product_name) FROM products;
-- Renvoie le nombre total de produits où product_name n'est pas NULL.

```

## Sous-requêtes

- **Qu’est-ce qu’une sous-requête ? Où peut-on l’utiliser ?**

Une sous-requête (ou requête imbriquée) est une requête SQL insérée à l'intérieur d'une autre requête, généralement dans les clauses ``WHERE``, ``FROM`` ou ``SELECT``.

Elle est souvent utilisée pour comparer une valeur à un résultat calculé (``WHERE`` / ``HAVING``), filtrer selon un ensemble (``IN``) ou ajouter des colonnes calculées (``SELECT``).

```SQL

SELECT * FROM employee
WHERE salary > (
    SELECT avg(salary)
    FROM employee
);
-- Renvoie les employé·es gagnant plus que le salaire moyen

```

- **Quelle est la différence entre une sous-requête corrélée et non corrélée ?**

Une sous-requête non corrélée s'exécute indépendamment de la requête principale et est évaluée 1 seule fois.

Une sous-requête corrélée dépend de la requête principale et est réévaluée à chaque ligne de la requête externe. Elle contient une référence à une colonne de la requête principale.

```SQL

SELECT 
  e1.firstname,
  e1.lastname,
  e1.salary,
  (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.dep_id = e1.dep_id
  ) AS avg_dept_salary
FROM employee e1;
-- Renvoie la moyenne des salaires par département
-- Ici, la sous-requête dépend du département de chaque employé. La moyenne est recalculée pour chaque département.

```

- **À quoi sert l’opérateur ``IN`` dans une sous-requête ?**

L'opérateur ``IN`` permet de filtrer les lignes dont une valeur correspond à l'une des valeurs retournées dans une sous-requête.

```SQL

SELECT product_name
FROM products
WHERE category_id IN (
    SELECT category_id
    FROM categories
    WHERE category_name IN ('Electronics', 'Books')
);
-- Renvoie tous les produits dont la catégorie est parmi celles ayant pour nom "Electronics" ou "Books".

```

- **Quelle est la différence entre ``EXISTS``, ``IN`` et ``= (SELECT...)`` ?**

``EXISTS`` vérifie si la sous-requête retourne au moins une ligne. Ne regarde pas le contenu, juste la présence.

``IN`` vérifie si une valeur est dans une liste de résultats. C'est utile avec une sous-requête qui retourne plusieurs lignes, une colonne.

``= (SELECT...)`` est utilisé si la sous-requête retourne une seule valeur (une seule ligne, une seule colonne). On est sur une comparaison directe.

```SQL

SELECT * 
FROM employee 
WHERE dep_id IN (
  SELECT dep_id 
  FROM department 
  WHERE location = 'Paris'
);
-- Renvoie tous les employés dans un département précis de Paris

SELECT * 
FROM customer
WHERE EXISTS (
  SELECT 1
  FROM orders
  WHERE orders.customer_id = customer.customer_id
);
-- Renvoie tous les clients ayant passé au moins une commande

SELECT * 
FROM employee 
WHERE salary = (
  SELECT AVG(salary) 
  FROM employee
);
-- Renvoie tous les employés gagnant exactement le salaire moyen

```

## Modélisation et structure

- **Qu’est-ce qu’une clé primaire ?**

Une clé primaire (``pk`` pour ``primary key``) est un identifiant unique pour chaque ligne d'une table. Elle est obligatoire, unique (pas de doublon) et ne peut avoir pour valeur ``NULL``. Elle permet d’identifier de manière fiable une ligne dans une table

```SQL

CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50),
    `email` VARCHAR(50),
    `date_inscription` DATE,
    PRIMARY KEY (`user_id`)
);

```

- **Qu’est-ce qu’une clé étrangère ?**

Une clé étrangère (``fk`` pour ``foreign key``) est un champ (ou groupe de champs) dans une table qui référence la clé primaire ``pk`` d'une autre table. Elle établit une relation entre deux tables.

```SQL

CREATE TABLE Orders (
    order_id INT NOT NULL,
    order_number INT NOT NULL,
    user_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

```

- **Qu’est-ce qu’un index ? Et pourquoi en créer un ?**

Un index est une structure de données qui accélère les recherches dans une table (de manière similaire à l’index d’un livre).

```SQL

CREATE INDEX idx_email ON users(email);

```

- **Que fait ``AUTO_INCREMENT`` ou ``SERIAL`` ?**
  
``AUTO_INCREMENT`` (avec MySQL) ou ``SERIAL`` (avec PostgreSQL) permet de générer automatiquement des identifiants uniques en incrémentant une valeur à chaque nouvelle ligne. Cela garantit des valeurs croissantes sans saisie manuelle.

```SQL

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    ...
);

```

- **Quelle est la différence entre ``VARCHAR`` et ``TEXT`` ?**
  
``VARCHAR`` et ``TEXT`` sont deux types de données utilisés pour stocker du texte en BDD.

``VARCHAR(n)`` est utilisé pour stocker des chaînes de caractères dont la longueur maximale est connue et/ou limitée. On doit spécifier une taille maximale ``(n)`` (ex: ``VARCHAR(100)``) pour une chaîne de 100 caractères maximum. Ce type est très courant pour les noms, titres, etc. Le contenu est stocké directement dans la ligne de la table, ce qui rend les accès rapides. ``VARCHAR`` peut également être indexé, ce qui permet d’optimiser les recherches sur cette colonne.

``TEXT`` est destiné, quant à lui, à des contenus textuels beaucoup plus longs comme des descriptions, des commentaires ou des articles par exemple. Il comporte des variantes selon le nombre de caractères nécessaires (``MEDIUMTEXT``, ``LONGTEXT``). Contrairement à ``VARCHAR``, les champs de type ``TEXT`` sont souvent stockés à part de la ligne principale de la table, ce qui peut ralentir légèrement l'accès. De plus, ``TEXT`` ne peut pas être entièrement indexé, ce qui peut limiter certaines opérations (comme les tris ou recherches complexes).

## Création, modification et contraintes

- **Comment créer une table avec ``CREATE TABLE`` ?**

Pour créer une table, on utilise  ``CREATE TABLE`` suivi du nom de la table, puis on définit les colonnes et leurs types. On peut aussi ajouter des contraintes comme une clé primaire (``PRIMARY KEY``) ou une clé étrangère (``FOREIGN KEY``).

```SQL

CREATE TABLE Orders (
    order_id INT NOT NULL,
    order_number INT NOT NULL,
    user_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- Ici, user_id fait référence à la colonne user_id de la table users.

```

- **Comment modifier une table avec ``ALTER TABLE`` ?**

L'instruction ``ALTER TABLE`` permet d'ajouter, de supprimer ou de modifier une colonne dans une table existante. Elle permet également d'ajouter et de supprimer une contrainte sur une table existante.

```SQL

ALTER TABLE Customers
ADD email VARCHAR(255);

ALTER TABLE Customers
DROP COLUMN age;

ALTER TABLE Customers
RENAME COLUMN firstname TO user_name;

```

- **Que signifient ``UNIQUE``, ``NOT NULL``, ``DEFAULT``, ``CHECK`` ?**

``UNIQUE`` signifie que la colonne doit avoir une donnée obligatoirement unique (pas de doublon).

``NOT NULL`` signifie que la colonne ne peut pas contenir une valeur ``NULL``.

``DEFAULT`` signifie qu'une valeur par défaut est utilisée si aucune n’est fournie lors de l’insertion.

``CHECK`` est une contrainte. Elle impose une condition logique à respecter pour insérer une valeur dans une colonne.

```SQL

CREATE TABLE Persons (
    ID INT UNIQUE NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT CHECK (Age >= 18),
    City VARCHAR(255) DEFAULT 'Aix-les-Bains'
);

-- Cette table impose que chaque personne ait au moins 18 ans et que la ville par défaut soit "Aix-les-Bains".

```

- **Comment ajouter une contrainte ?**

Les contraintes peuvent être spécifiées lors de la création d'une table avec l'instruction ``CREATE TABLE`` ou après la création de la table avec l'instruction ``ALTER TABLE``.

```SQL

-- Exemple lors de la création
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10, 2) CHECK (price > 0)
);

-- Exemple après création
ALTER TABLE Products
ADD CONSTRAINT price_positive CHECK (price > 0);

```

- **Que fait ``ON DELETE CASCADE`` ?**

La clause ``ON DELETE CASCADE`` indique que si une ligne référencée dans la table principale est supprimée, toutes les lignes associées dans les tables dépendantes le seront aussi automatiquement. Par exemple si un utilisateur supprime son compte sur un forum, ses publications seront également supprimées.

```SQL

FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE

```

- **Peut-on insérer plusieurs lignes avec une seule instruction ``INSERT`` ?**

Oui, il est possible d'insérer plusieurs lignes avec une seule instruction ``INSERT``.

```SQL

INSERT INTO users (user_id, nom, email)
VALUES 
  (1, 'Alice', 'alice@example.com'),
  (2, 'Bob', 'bob@example.com'),
  (3, 'Charlie', 'charlie@example.com');

```

## Sécurité SQL & Injections

- **Qu’est-ce qu’une injection SQL ?**


- **Donne un exemple simple d’injection SQL sur une requête ``SELECT``.**


- **Pourquoi la concaténation directe de chaînes dans une requête SQL est-elle dangereuse ?**


- **Quelle différence entre une requête SQL classique et une requête préparée ?**


- **Comment les requêtes paramétrées préviennent-elles les injections SQL ?**


- **Citer des bonnes pratiques pour sécuriser une base de données contre les injections.**


- **Que faut-il éviter dans la gestion des privilèges utilisateur en base de données ?**


- **Quelle est la différence entre l'échappement manuel et l'utilisation de paramètres liés dans une requête ?**


- **Quels types de commandes malveillantes peut-on injecter si une requête n’est pas sécurisée ?**


- **Qu’est-ce que le SQL ``tautology-based attack`` (attaque basée sur les tautologies) ?**


- **Peut-on faire une injection SQL même sans champ de formulaire texte ? Comment ?**


## Autres notions utiles

- **Comment supprimer une table sans erreur si elle n’existe pas ?**

- **Quelle est la différence entre ``DELETE``, ``TRUNCATE`` et ``DROP`` ?**

- **Que signifie ``UNION`` ? Quelle est la différence avec ``UNION ALL`` ?**

- **Que fait une ``VIEW`` ?**

- **À quoi servent ``BEGIN``, ``COMMIT``, ``ROLLBACK`` ?**
