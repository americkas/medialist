CREATE TABLE Utilisateur(
    pseudo VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(20) NOT NULL,
    date_creation DATE NOT NULL,
    mail VARCHAR(50),
    statut BOOLEAN NOT NULL DEFAULT false,
    banni BOOLEAN NOT NULL
);

CREATE TABLE Liste(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_liste VARCHAR(100) NOT NULL,
    likes INTEGER DEFAULT 0
);


CREATE TABLE Ravoir(
    pseudo VARCHAR(20) NOT NULL,
    id_liste INTEGER NOT NULL AUTO_INCREMENT,
    CONSTRAINT  fk_avoir_pseudo FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
    CONSTRAINT  fk_avoir_id_liste FOREIGN KEY (id_liste) REFERENCES Liste(id),
    PRIMARY KEY (pseudo,id_liste)    
);


CREATE TABLE Oeuvre(
    numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    lien_photo VARCHAR,
    synopsis TEXT,
    date_sortie DATE 
);

CREATE TABLE Livre(
    M1_cle INTEGER NOT NULL AUTO_INCREMENT,
    nb_pages INTEGER NOT NULL,
    langue VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    CONSTRAINT fk_M1 FOREIGN KEY (M1_cle) REFERENCES Oeuvre(numero)
);

CREATE TABLE Film(
    M2_cle INTEGER NOT NULL AUTO_INCREMENT,
    realisateur VARCHAR(50),
    genre VARCHAR(50) NOT NULL,
    duree SMALLINT NOT NULL,
    producteur VARCHAR(50),
    CONSTRAINT fk_M2 FOREIGN KEY (M2_cle) REFERENCES Oeuvre(numero)
);

CREATE TABLE Serie(
    M3_cle INTEGER NOT NULL AUTO_INCREMENT,
    nb_ep INTEGER,
    nb_saisons INTEGER,
    duree SMALLINT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    anime SMALLINT NOT NULL,
    CONSTRAINT fk_M3 FOREIGN KEY (M3_cle) REFERENCES Oeuvre(numero)
);

CREATE VIEW Vlivre(numero,titre,lien_photo,date_sortie,nb_pages,langue,genre) AS SELECT Oeuvre.numero,Oeuvre.titre,Oeuvre.lien_photo,Oeuvre.date_sortie,Livre.nb_pages,Livre.langue,Livre.genre FROM Oeuvre JOIN Livre ON Oeuvre.numero = Livre.M1_cle;
CREATE VIEW Vfilm(numero,titre,lien_photo,date_sortie,realisateur,genre,duree,producteur) AS SELECT Oeuvre.numero,Oeuvre.titre,Oeuvre.lien_photo,Oeuvre.date_sortie,Film.realisateur,Film.genre,Film.duree,Film.producteur FROM Oeuvre JOIN Film ON Oeuvre.numero = Film.M2_cle;
CREATE VIEW Vserie(numero,titre,lien_photo,date_sortie,nb_ep,nb_saisons,duree,genre,anime) AS SELECT Oeuvre.numero,Oeuvre.titre,Oeuvre.lien_photo,Oeuvre.date_sortie,Serie.nb_ep,Serie.nb_saisons,Serie.duree,Serie.genre,Serie.anime FROM Oeuvre JOIN Serie ON Oeuvre.numero = Serie.M3_cle;

CREATE TABLE EtreDans(
    numero INTEGER NOT NULL,
    id_liste INTEGER NOT NULL,
    CONSTRAINT  fk_etre_dans_numero FOREIGN KEY (numero) REFERENCES Oeuvre(numero),
    CONSTRAINT  fk_etre_dans_id_liste FOREIGN KEY (id_liste) REFERENCES Liste(id),
    PRIMARY KEY (numero,id_liste)    
);


CREATE TABLE Noter(
    pseudo VARCHAR(20) NOT NULL,
    numero INTEGER NOT NULL,
    note SMALLINT,
    CONSTRAINT  fk_noter_pseudo FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
    CONSTRAINT  fk_noter_numero FOREIGN KEY (numero) REFERENCES Oeuvre(numero),
    PRIMARY KEY (pseudo,numero)    
);

CREATE TABLE Commentaire(
    id SERIAL PRIMARY KEY,
    pseudo VARCHAR(20) NOT NULL,
    numero INTEGER NOT NULL,
    texte TEXT,
    date_com TIMESTAMP,
    alerte VARCHAR(20),
    CONSTRAINT fk_link_pseudo FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
    CONSTRAINT fk_link_id FOREIGN KEY (numero) REFERENCES Oeuvre(numero)
);

CREATE TABLE Suivre(
    suiveur VARCHAR(15) NOT NULL,
    suivi VARCHAR(15) NOT NULL,
    CONSTRAINT fk_suiveur FOREIGN KEY (suiveur) REFERENCES Utilisateur(pseudo),
    CONSTRAINT fk_suivi FOREIGN KEY (suivi) REFERENCES Utilisateur(pseudo),
    PRIMARY KEY (suiveur, suivi)
);

CREATE TABLE Liker(
    liste INTEGER NOT NULL,
    pseudo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_liste FOREIGN KEY (liste) REFERENCES Liste(id),
    CONSTRAINT fk_pseudo FOREIGN KEY (pseudo) REFERENCES Utilisateur(pseudo),
    PRIMARY KEY(liste,pseudo)
);

SET datestyle = dmy;


insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('admin', 'admin', 'admin','123456', '2000/4/12', 'orugg0@bbc.co.uk', true, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Pain Reli', 'Omero', 'Rugg','123456', '2000/4/12', 'nicolas.brunel@ensiie.fr', true, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Olay Profe', 'Diane','Nettleship', '32087', '2000/4/12','dnettleship1@shop-pro.jp', false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Olanzapi', 'Ayn', 'MacTrustam','3192864832', '2000/4/12', 'amactrustam2@japanpost.jp', false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Tea Tree Anti', 'Hobard', 'Plampin','42981329871','2000/4/12', 'hplampin3@wikia.com', false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Dior Bronze', 'Faina', 'Brunke','51293Y1', '2000/4/12', 'fbrunke4@independent.co.uk', false, true);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Doxycycli', 'Davina', 'Issett', '612831','2000/4/12', 'dissett5@alexa.com',false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Aplicare Tot', 'Ardenia', 'McGriffin','71038021', '2000/4/12', 'amcgriffin6@wired.com',false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('All Day Moist', 'Elna', 'Dalwood', '82713','2000/4/12', 'edalwood7@sohu.com',false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Milk of Magne', 'Malvin', 'Keilty', '912831','2000/4/12','mkeilty8@yelp.com',false, true);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('HYDROCHLOR', 'Rube', 'Langfield', '10&23889','2000/4/12','rlangfield9@tinyurl.com',false, false);
insert into Utilisateur (pseudo, prenom, nom, mot_de_passe, date_creation, mail, statut, banni) values ('Modafinil', 'Irma', 'Varrow', '111203912','2000/4/12','ivarrowa@apache.org',false, true);

INSERT INTO Liste (nom_liste,likes) VALUES ('Favoris',33);
INSERT INTO Liste (nom_liste,likes) VALUES ('Favoris',503);
insert into Liste ( nom_liste,likes) values ( 'Nicotine Polacrilex',5000);
insert into Liste ( nom_liste,likes) values ( 'Lidocaine Hydrochloride and Epinephrine Bitartrate',30);
insert into Liste ( nom_liste,likes) values ( 'Naproxen Sodium',40);
insert into Liste ( nom_liste,likes) values ( 'memantine hydrochloride',12);
insert into Liste ( nom_liste,likes) values ( 'TRICLOSAN',6);
insert into Liste ( nom_liste,likes) values ( 'Flumazenil',57);
insert into Liste ( nom_liste,likes) values ( 'vancomycin hydrochloride',10);
insert into Liste ( nom_liste,likes) values ( 'Methocarbamol',37);
insert into Liste ( nom_liste,likes) values ( 'Ragweed Short',22);


INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Pain Reli',1);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Aplicare Tot',2);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Doxycycli',3);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Pain Reli',5);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Tea Tree Anti',3);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Dior Bronze',4);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Dior Bronze',8);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Aplicare Tot',6);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Olay Profe',7);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Aplicare Tot',9);
INSERT INTO Ravoir (pseudo,id_liste) VALUES ('Pain Reli',10);
 
insert into Oeuvre (numero, titre, lien_photo, synopsis, date_sortie) values (1, 'Avatar','img/avatar.jpg', 'Malgr?? sa paralysie, Jake Sully, un ancien marine immobilis?? dans un fauteuil roulant, est rest?? un combattant au plus profond de son ??tre. Il est recrut?? pour se rendre ?? des ann??es-lumi??re de la Terre, sur Pandora, o?? de puissants groupes industriels exploitent un minerai rarissime destin?? ?? r??soudre la crise ??nerg??tique sur Terre.','2000/01/01');
insert into Oeuvre (numero, titre, lien_photo, synopsis, date_sortie) values (2, 'Pulp Fiction','img/pulpfiction.jpg','L''odyss??e sanglante et burlesque de petits malfrats dans la jungle de Hollywood ?? travers trois histoires qui sentrem??lent. Dans un restaurant, un couple de jeunes braqueurs, Pumpkin et Yolanda, discutent des risques que comporte leur activit??. Deux truands, Jules Winnfield et son ami Vincent Vega, qui revient dAmsterdam, ont pour mission de r??cup??rer une mallette au contenu myst??rieux et de la rapporter ?? Marsellus Wallace.','2000/01/01');
insert into Oeuvre (numero, titre, lien_photo, synopsis, date_sortie) values (3, 'Rocky','img/rocky.jpg','Rocky Balboa travaille pour Tony Gazzo, un usurier, et dispute de temps ?? autre des combats de boxe pour quelques dizaines de dollars sous l''appellation de l''??talon Italien. Cependant, Mickey, propri??taire du club de boxe o?? Rocky a l''habitude de sentra??ner, d??cide de c??der son casier ?? un boxeur plus talentueux.','2000/01/01');
insert into Oeuvre (numero, titre, lien_photo, synopsis, date_sortie) values (4, 'Interstellar','img/interstellar.jpg','Dans un futur proche, la Terre est de moins en moins accueillante pour l''humanit?? qui conna??t une grave crise alimentaire. Le film raconte les aventures d''un groupe d''explorateurs qui utilise une faille r??cemment d??couverte dans l''espace-temps afin de repousser les limites humaines et partir ?? la conqu??te des distances astronomiques dans un voyage interstellaire.','2000/01/01');
insert into Oeuvre (numero, titre, lien_photo, synopsis, date_sortie) values (5, 'Inception','img/inception.jpg','Dom Cobb est un voleur exp??riment?? dans l''art p??rilleux de l''extraction : sa sp??cialit?? consiste ?? s''approprier les secrets les plus pr??cieux d''un individu, enfouis au plus profond de son subconscient, pendant qu''il r??ve et que son esprit est particuli??rement vuln??rable. Tr??s recherch?? pour ses talents dans l''univers trouble de l''espionnage industriel, Cobb est aussi devenu un fugitif traqu?? dans le monde entier. Cependant, une ultime mission pourrait lui permettre de retrouver sa vie d''avant.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (6,'Wonder Woman 2','img/wonderwoman2.jpg','Suite des aventures de Diana Prince, alias Wonder Woman, Amazone devenue une super-h??ro??ne dans notre monde.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (7,'Forrest Gump','img/forrestgump.jpg','Au fil des diff??rents interlocuteurs qui viennent s''asseoir tour ?? tour ?? c??t?? de lui sur un banc, Forrest Gump raconte la fabuleuse histoire de sa vie. Sa vie est ?? l''image d''une plume qui se laisse porter par le vent, tout comme Forrest se laisse porter par les ??v??nements qu''il traverse dans l''Am??rique de la seconde moiti?? du 20e si??cle.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (8,'La Ligne verte','img/laligneverte.jpg','Paul Edgecomb, pensionnaire centenaire d''une maison de retraite, est hant?? par ses souvenirs. Gardien-chef du p??nitencier de Cold Mountain, en 1935, en Louisiane, il ??tait charg?? de veiller au bon d??roulement des ex??cutions capitales au bloc E (la ligne verte) en s''effor??ant d''adoucir les derniers moments des condamn??s. Parmi eux se trouvait un colosse du nom de John Coffey, accus?? du viol et du meurtre de deux fillettes.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (9,'Titanic','img/titanic.jpg','En 1997, l''??pave du Titanic est l''objet d''une exploration fi??vreuse, men??e par des chercheurs de tr??sor en qu??te d''un diamant bleu qui se trouvait ?? bord. Frapp??e par un reportage t??l??vis??, l''une des rescap??s du naufrage, ??g??e de 102 ans, Rose DeWitt, se rend sur place et ??voque ses souvenirs. 1912. Fianc??e ?? un industriel arrogant, Rose croise sur le bateau un artiste sans le sou.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (10,'Star Wars IV: Un nouvel espoir','img/starwars4.jpg','Il y a bien longtemps, dans une galaxie tr??s lointaine. La guerre civile fait rage entre l''Empire galactique et l''Alliance rebelle. Captur??e par les troupes de choc de l''Empereur men??es par le sombre et impitoyable Dark Vador, la princesse Leia Organa dissimule les plans de l''Etoile Noire, une station spatiale invuln??rable, ?? son dro??de R2-D2 avec pour mission de les remettre au Jedi Obi-Wan Kenobi.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (11,'Jurrasic World','img/jurrasicworld.jpg','L''??le Nublar accueille maintenant un parc th??matique compl??tement fonctionnel sur les dinosaures, appel?? Jurassic World. Apr??s dix ans d''op??ration et un nombre de visiteurs en chute libre, une nouvelle attraction est cr????e dans le but d''attirer d''autres curieux, mais les r??sultats ne sont pas exactement ceux auxquels l''organisation s''attendait.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (12,'OSS 117: Alerte rouge en Afrique noire','img/oss117.jpg','L''intrigue d''OSS 117 : Alerte rouge en Afrique Noire se d??roulera dans les ann??es 1970-1980, ?? la diff??rence des deux pr??c??dents films qui prenaient place entre le milieu des ann??es 1950 et 1960.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (13,'Fast and Furious 9','img/fastandfurious.jpg','Dominic Toretto et son ??quipe unissent leurs forces pour combattre l''assassin le plus habile et le conducteur le plus performant qu''ils aient jamais rencontr?? : son fr??re abandonn??.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (14,'L''??nigme de la chambre 622','img/chambre622.jpg','L''??nigme de la Chambre 622. R??sum?? : Une nuit de d??cembre, un meurtre a lieu au Palace de Verbier, dans les Alpes suisses. L''enqu??te de police n''aboutira jamais.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (15,'West Side Story','img/westsidestory.jpg','Upper West Side, ann??es 1950. Deux bandes de jeunes s''affrontent : d''un c??t?? les Sharks dirig??s par Bernardo et de l''autre les Jets, avec Riff ?? leur t??te. Tony, li?? au Jets, va s''??prendre de Maria, la s??ur de Bernardo.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (16,'Black Widow','img/blackwidow.jpg','Il arrive un moment o?? il faut choisir entre ce que le monde veut que tu sois et ce que tu es vraiment.','28/10/2020');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (17,'Mulan','img/mulan.jpg','Lorsque l''empereur de Chine d??cr??te qu''un homme par famille doit servir dans l''arm??e imp??riale pour d??fendre le pays des envahisseurs du Nord, Hua Mulan, la fille a??n??e d''un guerrier honor??, prend la place de son p??re malade. Se faisant passer pour un homme, Hua Jun, elle est mise ?? l''??preuve tout au long de son p??riple l''obligeant ?? mobiliser sa force int??rieure et ?? exploiter son v??ritable potentiel. C''est un voyage ??pique qui la transformera en guerri??re honor??e et lui fera gagner le respect de la nation ainsi que la fiert?? de son p??re.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (18,'Conjuring 3 : sous l''emprise du diable','Une affaire terrifiante de meurtre et de pr??sence mal??fique myst??rieuse ??branle m??me les enqu??teurs paranormaux Ed et Lorraine Warren, pourtant tr??s aguerris. Dans cette affaire issue de leurs dossiers secrets, Ed et Lorrain commencent par se battre pour prot??ger l''??me d''un petit gar??on, puis basculent dans un monde radicalement inconnu. C''est la premi??re fois dans l''histoire des ??tats-Unis qu''un homme soup??onn?? de meurtre plaide la possession d??moniaque comme ligne de d??fense.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (19,'The Umbrella Academy 2','img/theumbrellaacademy2.jpg','En 1989, le m??me jour, quarante-trois b??b??s sont inexplicablement n??s de femmes qui n''??taient pas enceintes et que rien ne relie. Sir Reginald Hargreeves, un industriel milliardaire, adopte sept de ces enfants et cr??e The Umbrella Academy pour les pr??parer ?? sauver le monde.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (20,'Stranger Things 4','img/strangerthings4.jpg','Jim Hopper : le sh??rif de Stranger Things est-il vivant ou mort ? Le suspense est lev?? par la premi??re bande-annonce de la saison 4. A la fin d''un long plan remontant un chemin de fer b??ti par des prisonniers, on y d??couvre Jim Hopper, le cr??ne et la moustache ras??s, mais bien vivant.','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (21,'Solo Leveling','/img/220px-Solo_Leveling_Webtoon.png','Depuis qu''un portail connectant notre monde ?? un monde peupl?? de monstres et de cr??atures en tout genre est apparu, des personnes "ordinaires" ont acquis la capacit?? de chasser ces derniers. On les appelle les chasseurs. Vous pensez qu''ils sont tous balaises ?','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (22,'Game of Thrones','/img/got.jpg','Le Royaume des Sept Couronnes, dont la capitale est Port-R??al (500 000 habitants), est constitu?? de sept provinces r??gies par des ?? maisons ?? dont la plupart des chefs aspirent ?? monter sur le tr??ne. La mort du roi aiguise les app??tits. Ce royaume occupe tout le sud du continent de Westeros. ?? l''extr??me-nord, un gigantesque mur de glace prot??ge le royaume de plusieurs cr??atures potentiellement dangereuses, celui-ci est supervis?? par la garde de nuit une organisation militaire officielle qui vise ?? prot??ger le mur et le royaume des menaces du grand nord. Au-del?? du mur vivent des cr??atures ?? primitives ??, les Sauvageons qui tentent d''envahir le royaume pour fuir des cr??atures mythiques et tr??s dangereuses que l''on pensait disparues depuis plusieurs si??cles. ?? l''est, au-del?? d???un d??troit, se trouve le continent d???Essos sur lequel une jeune princesse en exil pr??pare son retour. ','2000/01/01');
INSERT INTO Oeuvre(numero, titre, lien_photo, synopsis, date_sortie) VALUES (23,'Tower of god','img/Tower-of-god.jpeg','Que d??sirez-vous? La richesse? La gloire? Le pouvoir? La vengeance? Ou une chose qui surpasse toutes les autres ? Quel que soit votre d??sir, il se trouve ici !','2000/01/01');


insert into EtreDans(numero, id_liste) values (1,1);
insert into EtreDans(numero, id_liste) values (2,1);
insert into EtreDans(numero, id_liste) values (5,2);
insert into EtreDans(numero, id_liste) values (4,9);
insert into EtreDans(numero, id_liste) values (3,9);
insert into EtreDans(numero, id_liste) values (2,2);
insert into EtreDans(numero, id_liste) values (1,3);
INSERT INTO EtreDans(numero,id_liste) VALUES (2,3);
INSERT INTO EtreDans(numero,id_liste) VALUES (3,4);
INSERT INTO EtreDans(numero,id_liste) VALUES (7,6);
INSERT INTO EtreDans(numero,id_liste) VALUES (11,10);
INSERT INTO EtreDans(numero,id_liste) VALUES (9,10);
INSERT INTO EtreDans(numero,id_liste) VALUES (7,10);
INSERT INTO EtreDans(numero,id_liste) VALUES (4,10);

insert into Film (M2_cle, realisateur, genre, duree, producteur) values (1,'James Cameron','Animation',162,'Jon Landau');
insert into Film (M2_cle, realisateur, genre, duree, producteur) values (2,'Quentin Tarantino','Biopic',154,'Quentin Tarantino');
insert into Film (M2_cle, realisateur, genre, duree, producteur) values (3,'John G.Avildsen','Drame',119,'Robert Chartoff');
insert into Film (M2_cle, realisateur, genre, duree, producteur) values (4,'Christopher Nolan','Documentaire',169,'Warner Bros');
insert into Film (M2_cle, realisateur, genre, duree, producteur) values (5,'Christopher Nolan','Com??die',148,'Warner Bros');

insert into Livre(M1_cle,nb_pages,langue,genre) values(21,400,'Anglais,Fran??ais,Cor??en','Webtoon');
insert into Livre(M1_cle,nb_pages,langue,genre) values(23,1000,'Anglais,Fran??ais,Cor??en','Webtoon');

insert into Serie(M3_cle,nb_ep ,nb_saisons ,duree, genre ,anime) values(22,80,8,60,'Action',0);

INSERT INTO Noter (pseudo,numero,note) VALUES ('Pain Reli',3,5);
INSERT INTO Noter (pseudo,numero,note) VALUES ('Dior Bronze',2,3);
INSERT INTO Noter (pseudo,numero,note) VALUES ('Olay Profe',1,4);
INSERT INTO Noter (pseudo,numero,note) VALUES ('Dior Bronze',5,1);
INSERT INTO Noter (pseudo,numero,note) VALUES ('Modafinil',4,2);
INSERT INTO Noter (pseudo,numero,note) VALUES ('Aplicare Tot',4,3);

insert into Commentaire (pseudo,numero, texte,date_com) values ('Pain Reli',2,'Cette oeuvre est tout bonnement majestueuse !','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Doxycycli',2,'Je suis un spammeur !','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Doxycycli',2,'Je suis un spammeur !!!!! !','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Doxycycli',2,'Je peux spammer ce site et il ne peut rien faire !','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Doxycycli',2,'SPAM!','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Tea Tree Anti',10,'Retour aux bases','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Aplicare Tot',2,'Jen ai eu les larmes aux yeux','2000/01/01');
insert into Commentaire (pseudo,numero,alerte,texte,date_com) values ('Dior Bronze',5,'vulgarit??','De la merde','2000/01/01');
insert into Commentaire (pseudo,numero, texte,date_com) values ('Pain Reli',1,'Dommage que la fin ai ??t?? b??cl??e, sinon pas mal','2000/01/01');

insert into Suivre(suiveur,suivi) values ('Pain Reli','Aplicare Tot');
insert into Suivre(suiveur,suivi) values ('Modafinil','Dior Bronze');
insert into Suivre(suiveur,suivi) values ('Olay Profe','Doxycycli');
insert into Suivre(suiveur,suivi) values ('Doxycycli','Olay Profe');

