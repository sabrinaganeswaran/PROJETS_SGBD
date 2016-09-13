-- ETAPE 5
SELECT * FROM Utilisateurs

-- ETAPE 6
SELECT ID, Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification FROM Produits
UNION
SELECT ID, Libelle, Description, NULL, NULL, NULL, Date_creation, Date_modification FROM Categories;

-- ETAPE 7
SELECT DISTINCT Nom, Prenom, Date_de_naissance FROM Utilisateurs ORDER BY Date_de_naissance DESC;
SELECT DISTINCT Nom, Prenom, Date_de_naissance FROM Utilisateurs ORDER BY Nom ASC;

-- ETAPE 8
SELECT Produits.Libelle FROM Produits LIMIT 0, 5;

-- ETAPE 9
SELECT COUNT(ID) FROM Utilisateurs;

-- ETAPE 10
SELECT SUM(Prix_vente) FROM Produits;

-- ETAPE 11
SELECT * FROM Produits WHERE ID NOT IN (SELECT ID_produit FROM Categorie_Produit);
SELECT * FROM Produits WHERE ID IN (SELECT ID_produit FROM Categorie_Produit);

-- ETAPE 12
SELECT * FROM Produits WHERE ID BETWEEN 1 AND 5;

-- ETAPE 13
SELECT * FROM Categories WHERE ID = 1 OR ID = 3;

-- ETAPE 14
SELECT * FROM Utilisateurs WHERE ID=2 AND ID=7;

-- ETAPE 15
SELECT * FROM Produits WHERE Prix_vente > 0.50;

-- ETAPE 16
UPDATE Utilisateurs SET Nom="Peresse", Prenom="Theo", Date_de_naissance="1971-10-16", Ville="LA COURNEUVE", Adresse="36 rue Galleni", Code_postal="93120", Pays="BELGIQUE", Sexe="0" WHERE ID=5;

-- ETAPE 17
SELECT * FROM Utilisateurs INNER JOIN Role ON Utilisateurs.Role=Role.ID;

-- ETAPE 18
SELECT Produits.Libelle, Categories.* FROM Categorie_Produit, Produits, Categories WHERE Produits.ID = Categorie_Produit.ID_Produit
AND Categories.ID = Categorie_Produit.ID_Categorie 
UNION
SELECT Produits.Libelle,"EMPTY","EMPTY","EMPTY","EMPTY","EMPTY" FROM Produits WHERE ID NOT IN (SELECT ID_produit FROM Categorie_Produit)

-- ETAPE 19
SELECT Produits.Libelle, Categories.* FROM Categorie_Produit, Produits, Categories WHERE Produits.ID = Categorie_Produit.ID_Produit
AND Categories.ID = Categorie_Produit.ID_Categorie GROUP BY ID_Produit
UNION
SELECT Produits.Libelle,"","","","","" FROM Categorie_Produit, Produits, Categories AS ID_Categorie WHERE ID_Categorie NOT IN (SELECT ID_produit FROM Categorie_Produit)

-- ETAPE 20
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Utilisateurs 
WHERE ID = '5';
SET FOREIGN_KEY_CHECKS=1;

-- ETAPE 21
CREATE TABLE IF NOT EXISTS backup_produit (
    ID int KEY NOT NULL AUTO_INCREMENT,
    Libelle varchar(10) NOT NULL,
    Description varchar(50) NOT NULL,
    Prix_achat float(5) NOT NULL,
    Prix_vente float(5) NOT NULL,
    Nombre_Produit int(3) NOT NULL,
    Date_creation DATE,
    Date_modification DATE
    );
CREATE TRIGGER trigger_supp 
BEFORE DELETE ON Produits
FOR EACH ROW 
INSERT INTO backup_produit (ID, Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES (OLD.ID, OLD.Libelle, OLD.Description, OLD.Prix_achat, OLD.Prix_vente, OLD.Nombre_produit, OLD.Date_creation, OLD.Date_modification);

-- ETAPE 22
CREATE TRIGGER trigger_categorie BEFORE UPDATE
On Categories FOR EACH ROW
SET NEW.Date_modification = NOW();

-- ETAPE 23
DELIMITER |
CREATE TRIGGER trigger_insertion BEFORE INSERT
On Produits FOR          EACH ROW
IF NEW.Prix_vente > 1.50 THEN
SET NEW.Prix_vente  = 1.50;
END IF; |
DELIMITER ;

DELIMITER |
CREATE TRIGGER trigger_modif BEFORE UPDATE
On Produits FOR          EACH ROW
IF NEW.Prix_vente > 1.50 THEN
SET NEW.Prix_vente  = 1.50;
END IF;|
DELIMITER ;

-- ETAPE 24
DROP TRIGGER IF EXISTS trigger_supp;
DROP TRIGGER IF EXISTS trigger_categorie;
DROP TRIGGER IF EXISTS trigger_modif;
DROP TRIGGER IF EXISTS trigger_insertion;

-- ETAPE 25 
DELIMITER $$
CREATE PROCEDURE buy_user(a INT)
BEGIN
SELECT Utilisateurs.*, Produits.Libelle, Produits.Description FROM Produits
INNER JOIN Produit_Utilisateur ON Produits.ID = Produit_Utilisateur.Id_Produits
INNER JOIN Utilisateurs ON Utilisateurs.ID = Produit_Utilisateur.ID_Utilisateurs
Where ID_Utilisateurs = a;
END ;
$$
DELIMITER ;



-- ETAPE 26
DELIMITER |
CREATE PROCEDURE procedure_pro_categ()
BEGIN
SELECT Produits.*, ID_categorie FROM Produits, Categorie_Produit, Categories WHERE Produits.ID = Categorie_Produit.ID_produit GROUP BY ID_produit;
END;|
DELIMITER ;