# Exercices SQL (niveau junior)

## 1. Requêtes de base

- Sélectionner tous les enregistrements d'une table `utilisateurs`.  
- Récupérer le nom et l’email des utilisateurs dont l’âge est supérieur à 30.  
- Afficher uniquement les villes distinctes dans la table `clients`.  
- Trier les produits de la table `produits` par stock décroissant.

## 2. Filtres et conditions

- Afficher tous les utilisateurs dont le nom commence par un "J".  
- Récupérer les commandes dont la date est comprise entre le 1er janvier et le 31 mars 2024.  
- Sélectionner toutes les commandes produits dont le prix est supérieur à 100.

## 3. Agrégations et groupements

- Compter le nombre total de clients.  
- Calculer la moyenne des salaires dans la table `users`.  
- Afficher le nombre de commandes par client.  
- Afficher les catégories de produits avec un total de stock supérieur à 60.

## 4. Jointures

- Récupérer les noms des clients et leurs commandes (tables `clients` et `commandes`).  
- Afficher les produits commandés avec leur nom, quantité et prix unitaire (tables `produits`, `commandes`, `commandes_produits`).  
- Récupère les utilisateurs sans commande.

## 5. Sous-requêtes

- Afficher les utilisateurs dont le salaire est supérieur à la moyenne des salaires.  
- Récupérer les produits les plus chers de chaque catégorie.  
- Sélectionner les clients qui ont passé plus de 3 commandes.

## 6. Manipulation de données

- Insérer un nouvel employé dans la table `users`.  
- Mettre à jour le stock d’un produit donné.  
- Supprimer tous les clients inactifs depuis 2 ans.

## 7. Structure de base de données

- Créer une table `utilisateurs` avec une clé primaire et un champ email unique.  
- Ajouter une colonne `date_naissance` à la table `clients`.  
- Supprimer la table `temp_logs`.

## 8. Transactions et vues

- Écrire une transaction qui retire un montant d’un compte et l’ajoute à un autre.  
- Créer une vue `ventes_mensuelles` affichant les ventes par mois.  
- Créer un index sur la colonne `email` de la table `utilisateurs`.
