--Etape 1
CREATE USER PHPMyAdmin@localhost ;
GRANT ALL PRIVILEGES *.* TO PHPMyAdmin@localhost;

--Etape2
CREATE DATABASE usg_ganesw_s CHARACTER SET "utf8";

--ETAPE 3 

CREATE TABLE IF NOT  EXISTS Role (
    ID int NOT NULL AUTO_INCREMENT,
    Libelle varchar(50),
    Description varchar(100),
    Date_creation DATE,
    Date_modification DATE,
    PRIMARY KEY (ID)
    );

CREATE TABLE IF NOT EXISTS Utilisateurs (
    ID int NOT NULL AUTO_INCREMENT,
    Nom varchar(30),
    Prenom varchar(30),
    Date_de_naissance DATE,
    Ville varchar(25),
    Adresse varchar(100),
    Code_postal varchar(6),
    Pays varchar(25),
    Sexe INT(1),
    Role INT,   
    Date_creation DATE,
    Date_modification DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (Role) REFERENCES usg_ganesw_s.Role(ID)
    );

CREATE TABLE IF NOT EXISTS Produits (
    ID int NOT NULL AUTO_INCREMENT,
    Libelle varchar(50),
    Description varchar(50),
    Prix_achat float,
    Prix_vente float,
    Nombre_Produit int,
    Date_creation DATE,
    Date_modification DATE,
    PRIMARY KEY (ID)
    );

CREATE TABLE IF NOT EXISTS Categories (
    ID int NOT NULL AUTO_INCREMENT,
    Libelle varchar(50),
    Description varchar(50),
    Date_creation DATE,
    Date_modification DATE,
    PRIMARY KEY (ID)
    );

CREATE TABLE IF NOT EXISTS Categorie_Produit (
    ID_categorie int NOT NULL,
    ID_produit int NOT NULL,
    FOREIGN KEY (ID_categorie) REFERENCES usg_ganesw_s.Categories(ID),
    FOREIGN KEY (ID_produit) REFERENCES usg_ganesw_s.Produits(ID)
    );

CREATE TABLE IF NOT EXISTS Produit_Utilisateur (
    ID_produit int NOT NULL,
    ID_utilisateur int NOT NULL,
    FOREIGN KEY (ID_produit) REFERENCES usg_ganesw_s.Produits(ID),
    FOREIGN KEY (ID_utilisateur) REFERENCES usg_ganesw_s.Utilisateurs(ID)
    );

-- ETAPE 4
INSERT INTO Role (Libelle, Description, Date_creation, Date_modification)
VALUES("President", "Personne detenant le pouvoir executif et ayant le pouvoir absolu", "2015-11-16", "2015-11-17");
INSERT INTO Role (Libelle, Description, Date_creation, Date_modification)
VALUES("Vice-President", "Personne etant le 2nd boss quand le President est occupe", "2015-11-16", "2015-11-17");
INSERT INTO Role (Libelle, Description, Date_creation, Date_modification)
VALUES("Premier Ministre", "Bras droit du President", "2015-11-16", "2015-11-17");
INSERT INTO Role (Libelle, Description, Date_creation, Date_modification)
VALUES("Etudiant", "Personne travaillant durement pour finir ses etudes", "2015-11-16", "2015-11-17");

INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Uthayakumar", "Sophika", "1991-11-16", "PARIS", "16 bis rue de Sopika", "75018", "AUSTRALIE", "1", "1", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Dupont", "Julien", "1990-11-17", "PARIS", "46 rue de Ladelarue", "75001", "ALLEMAGNE", "0",  "2", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Ganeswaran", "Sabrina", "1981-11-18", "PARIS", "18 avenue Foch", "75016", "FRANCE", "1", "1", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Chen", "Jason", "1989-11-15", "PARIS", "12 boulevard de la Paix", "75020", "SUISSE", "0", "4", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Moreno", "Sophia", "1970-10-16", "PARIS", "23 rue Clovis", "75002", "BELGIQUE", "1", "3", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Smith", "Jaden", "1955-11-16", "PARIS", "105 bis avenue Henri Barbusse", "75010", "ITALIE", "0", "4", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Van der Kampf", "Annaliese", "1978-02-16", "PARIS", "16 rue de la Liberte", "75006", "ECOSSE", "1", "3", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("OBrian", "William", "1991-08-16", "PARIS", "45 rue Maurice Grandcoing", "75008", "ROYAUME-UNI", "0", "3", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Johnson", "Elisabeth", "1910-12-16", "PARIS", "16 avenue Jules Cesar", "75015", "SLOVAQUIE", "1", "4", "2015-11-16", "2015-11-17");
INSERT INTO Utilisateurs (Nom, Prenom, Date_de_naissance, Ville, Adresse, Code_postal, Pays, Sexe, Role, Date_creation, Date_modification)
VALUES("Alejandro", "Charles", "1925-11-16", "PARIS", "18 avenue Edgar Quinet", "75012", "ESPAGNE", "0", "2", "2015-11-16", "2015-11-17");

INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod1", "Ceci est le premier produit", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod2", "Ceci est le deuxieme produit", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod3", "Ceci est le troisieme produit", "0.25", "0.45", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod4", "Ceci est le produit 4", "0.50", "0.30", "0.49", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod5", "Ceci est le produit 5", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod6", "Ceci est le produit 6", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod7", "Ceci est le produit 7", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod8", "Ceci est le produit 8", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod9", "Ceci est le produit 9", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod10", "Ceci est le produit 10", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod11", "Ceci est le produit 11", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod12", "Ceci est le produit 12", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod13", "Ceci est le produit 13", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod14", "Ceci est le produit 14", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod15", "Ceci est le produit 15", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod16", "Ceci est le produit 16", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod17", "Ceci est le produit 17", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod18", "Ceci est le produit 18", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod19", "Ceci est le produit 19", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod20", "Ceci est le produit 20", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod21", "Ceci est le produit 21", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod22", "Ceci est le produit 22", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod23", "Ceci est le produit 23", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod24", "Ceci est le produit 24", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod25", "Ceci est le produit 25", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod26", "Ceci est le produit 26", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod27", "Ceci est le produit 27", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod28", "Ceci est le produit 28", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod29", "Ceci est le produit 29", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod30", "Ceci est le produit 30", "0.50", "2", "1", "2015-11-16", "2015-11-17");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod31", "Ceci est le produit 31", "0.50", "2", "1", "2015-11-16", "2015-11-19");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod32", "Ceci est le produit 32", "0.50", "2", "1", "2015-11-16", "2015-11-19");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod33", "Ceci est le produit 33", "0.50", "2", "1", "2015-11-16", "2015-11-19");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod34", "Ceci est le produit 34", "0.50", "2", "1", "2015-11-16", "2015-11-19");
INSERT INTO Produits (Libelle, Description, Prix_achat, Prix_vente, Nombre_produit, Date_creation, Date_modification)
VALUES("Prod35", "Ceci est le produit 35", "0.50", "2", "1", "2015-11-16", "2015-11-19");

INSERT INTO Categories (Libelle, Description, Date_creation, Date_modification)
VALUES("Cteg1", "Voici la categorie 1", "2015-11-16", "2015-11-17");
INSERT INTO Categories (Libelle, Description, Date_creation, Date_modification)
VALUES("Cteg2", "Voici la categorie 2", "2015-11-16", "2015-11-17");
INSERT INTO Categories (Libelle, Description, Date_creation, Date_modification)
VALUES("Cteg3", "Voici la categorie 3", "2015-11-16", "2015-11-17");

INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "1");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "2");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "3");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "4");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "5");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "6");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "7");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "8");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "9");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("1", "10");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "11");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "12");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "13");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "14");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "15");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "16");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "17");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "18");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "19");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("2", "20");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "21");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "22");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "23");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "24");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "25");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "26");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "27");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "28");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "29");
INSERT INTO Categorie_Produit (ID_Categorie, ID_Produit)
VALUES("3", "30");

INSERT INTO Produit_Utilisateur (ID_Produit, ID_Utilisateur)
VALUES("1", "5");
INSERT INTO Produit_Utilisateur (ID_Produit, ID_Utilisateur)
VALUES("25", "10");
INSERT INTO Produit_Utilisateur (ID_Produit, ID_Utilisateur)
VALUES("10", "1");
INSERT INTO Produit_Utilisateur (ID_Produit, ID_Utilisateur)
VALUES("20", "3");
INSERT INTO Produit_Utilisateur (ID_Produit, ID_Utilisateur)
VALUES("30", "9");