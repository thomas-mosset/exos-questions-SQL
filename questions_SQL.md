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


- **À quoi sert la clause ``ON`` dans une jointure ?**


- **Que fait la clause ``USING`` ?**


- **Peut-on faire une jointure sur plusieurs colonnes ?**


- **Peut-on imbriquer plusieurs jointures dans une même requête ?**


- **Que se passe-t-il si une condition de jointure est absente ?**


## Agrégats et groupes

- **Citer quelques fonctions d’agrégation.**

``COUNT``
``SUM``
``AVG``
``MIN``
``MAX``

- **Que fait la clause ``GROUP BY`` ? Peut-on la combiner avec ``ORDER BY ?``**


- **Peut-on utiliser ``WHERE`` avec ``GROUP BY`` ?**


- **Quelle est la différence entre ``COUNT(*)`` et ``COUNT(colonne)`` ?**


- **À quoi sert ``HAVING`` ? Quelle est la différence avec ``WHERE`` ?**


## Sous-requêtes

- **Qu’est-ce qu’une sous-requête ? Où peut-on l’utiliser ?**


- **Quelle est la différence entre une sous-requête corrélée et non corrélée ?**


- **À quoi sert l’opérateur ``IN`` dans une sous-requête ?**


- **Quelle est la différence entre ``EXISTS``, ``IN`` et ``= (SELECT...)`` ?**


## Modélisation et structure

- **Qu’est-ce qu’une clé primaire ?**

- **Qu’est-ce qu’une clé étrangère ?**

- **Qu’est-ce qu’un index ? Et pourquoi en créer un ?**

- **Que fait ``AUTO_INCREMENT`` ou ``SERIAL`` ?**

- **Quelle est la différence entre ``VARCHAR`` et ``TEXT`` ?**


## Création, modification et contraintes

- **Comment créer une table avec ``CREATE TABLE`` ?**


- **Comment modifier une table avec ``ALTER TABLE`` ?**


- **Qu’est-ce qu’une ``PRIMARY KEY``, une ``FOREIGN KEY`` ?**


- **Que signifient ``UNIQUE``, ``NOT NULL``, ``DEFAULT``, ``CHECK`` ?**


- **Comment ajouter une contrainte après la création ?**


- **Que fait ``ON DELETE CASCADE`` ?**


- **Peut-on insérer plusieurs lignes avec une seule instruction ``INSERT`` ?**


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
