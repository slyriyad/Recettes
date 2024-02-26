-- 1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante sur la durée de réalisation
SELECT * 
FROM recette
ORDER BY tempsPreparation DESC 


-- 2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
SELECT contenir.Id_Recette, COUNT(contenir.Id_Recette) AS nombre 
FROM contenir
GROUP BY contenir.Id_Recette;


-- 3- Afficher les recettes qui nécessitent au moins 30 min de préparation
SELECT *
FROM recette 
WHERE tempsPreparation >30


-- 4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en
SELECT *
FROM recette 
WHERE nom = '%Salade%'


-- 6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre convenance)
UPDATE recette
SET nom = 'raclette'
WHERE Id_Recette = 3


-- 7- Supprimer la recette n°2 de la base de données
DELETE FROM recette
WHERE id_recette = 2


-- 8- Afficher le prix total de la recette n°5
SELECT
recette.Id_Recette,
MAX(recette.nom) AS nom_recette,
    MAX(ingredient.nom) AS nom_ingredient,
    SUM(ingredient.prix) AS prix
FROM recette
JOIN contenir
ON recette.id_recette = contenir.Id_Recette
JOIN ingredient 
ON ingredient.Id_ingredient = contenir.id_ingredient
GROUP BY 
recette.Id_Recette


-- 9-A fficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)
SELECT
recette.Id_Recette,
recette.nom AS nom_recette,
ingredient.nom AS nom_ingredient,
    SUM(ingredient.prix) AS prix
FROM recette
JOIN contenir
ON recette.id_recette = contenir.Id_Recette
JOIN ingredient 
ON ingredient.Id_ingredient = contenir.id_ingredient
WHERE
recette.Id_Recette = 5
GROUP BY 
recette.Id_recette,recette.nom, ingredient.nom;


-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €)
INSERT INTO  ingredient
VALUES  (40,'Curry','cuillère à café',2.5)


-- 11-Modifier le prix de l’ingrédient n°12 (prix à votre convenance)
UPDATE ingredient
SET prix = 5
WHERE Id_Ingredient = 5


-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts
SELECT categorie.id_Categorie, COUNT(categorie.id_Categorie) AS nombre,  categorie.nom
FROM categorie
INNER JOIN recette ON recette.id_Categorie = categorie.id_Categorie
GROUP BY 
categorie.id_Categorie


-- 