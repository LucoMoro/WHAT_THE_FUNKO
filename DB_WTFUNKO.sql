DROP DATABASE IF EXISTS WHATTHEFUNKO2;
CREATE DATABASE WHATTHEFUNKO2;
USE WHATTHEFUNKO2;

CREATE TABLE product (
  product_code integer primary key AUTO_INCREMENT,
  urlimage varchar(300) not null,
  product_name varchar(200) not null,
  product_description varchar(200),
  price integer default 0,
  quantity integer default 0,
  rarity integer default 0,
  dimension double default 9.5, 
  FranchiseName varchar(200) default "default",
  series varchar(200) default "default",
  mediumScore varchar(200) default 0.00
);


CREATE TABLE cliente (
ID varchar(200) primary key,
ID_password varchar (200),
email varchar (200)
);

CREATE TABLE valuta (
ID varchar(200),
product_code integer,
data_valutazione varchar(200),
condizioni_ordine integer,
score double,
recensione varchar (300),
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE CASCADE,
foreign key (product_code) references product (product_code) ON UPDATE CASCADE
											 ON DELETE CASCADE
);

CREATE TABLE dati_anagrafici (
ID varchar(200),
nome varchar(200),
cognome varchar (200),
numero_telefono varchar(200),
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE CASCADE
);

CREATE TABLE carta_credito (
CVV integer,
codice varchar (200) primary key,
ID varchar(200),
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE CASCADE
);


CREATE TABLE indirizzo (
provincia varchar(200),
citta varchar (200),
ncivico varchar (200),
ID  varchar(200) primary key,
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE NO ACTION
);

CREATE TABLE ordine (
ID varchar(200),
codice_ordine integer auto_increment primary key,
IVA double,
data_ordine date,
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE NO ACTION
);

CREATE TABLE pagamento (
ID varchar(200),
codice_ordine integer,
prezzo_totale double,
data_pagamento date,
foreign key  (ID) references cliente(ID) ON UPDATE CASCADE
										 ON DELETE NO ACTION,
foreign key  (codice_ordine) references ordine(codice_ordine) ON UPDATE CASCADE
															  ON DELETE NO ACTION
);

CREATE TABLE compone (							
codice_ordine integer,
n_oggetto integer,
product_code integer,
price integer,
product_name varchar(200),
foreign key  (codice_ordine) references ordine(codice_ordine) ON UPDATE CASCADE
																	   ON DELETE CASCADE,
foreign key (product_code) references product (product_code) ON UPDATE CASCADE
															ON DELETE CASCADE
);

/*MARVEL*/
INSERT INTO product values (1, "./Images/Product/venomgroot.jpg" , "Venom Groot","Ecco qui i Pop! dei tuoi personaggi preferiti di Marvel!", 30 , 10, 1, 25,"Marvel",  "Venom Groot", 8.6 );
INSERT INTO product values (2, "./Images/Product/venomizedironman.jpg" , "Venomized Iron Man","Ecco a voi i Funko Pop! Vinyl dei vostri personaggi preferiti Marvel in versione Venomizzata!", 16 , 8, 0, 9, "Marvel",  "Iron Man", 8.2 );
INSERT INTO product values (3, "./Images/Product/carnagesuper.jpg" , "King Carnage","Ecco a voi i Funko Pop! Vinyl dei vostri personaggi preferiti Marvel in versione Venomizzata!", 16 ,0, 0, 10, "Marvel",  "Carnage", 8.7 );
INSERT INTO product values (4, "./Images/Product/venomizedcap.jpg" , "Venomized Captain America","Ecco a voi i Funko Pop! Vinyl dei vostri personaggi preferiti Marvel in versione Venomizzata!", 16 ,0, 1, 10, "Marvel",  "Venomized Captain America", 8.0 );
INSERT INTO product values (5, "./Images/Product/venomizeddoctor.jpg" , "Venomized Doctor Strange","Ecco a voi i Funko Pop! Vinyl dei vostri personaggi preferiti Marvel in versione Venomizzata!", 16 ,5, 0, 10, "Marvel",  "Doctor Strange", 8.1 );
INSERT INTO product values (6, "./Images/Product/i_am_iron_man.jpg" ,  "IronMan (i am Iron Man)", "Ecco a voi il nuovissimo Pop! Esclusivo I Am Iron Man PX Exclusive Glow In The Dark!", 20, 6, 2, 10, "Marvel", "IronMan", 9.0);

/*DISNEY*/
INSERT INTO product values (7, "./Images/Product/jacks.jpg" , "Jack Sparrow ","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Pirati dei Caraibi!", 16 , 5, 1, 10, "Disney",  "Jack Sparrow", 7.8 );
INSERT INTO product values (8, "./Images/Product/malefica.jpg" , "Malefica ","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti dei cattivi Disney!", 16 ,0, 0, 10, "Disney",  "Malefica", 8.0 );
INSERT INTO product values (9, "./Images/Product/grillo.jpg" , "Grillo parlante ","Ecco a voi il nuovo Funko Pop! Disney!", 16 , 10, 0, 10, "Disney",  "Grillo parlante", 7.2 );
INSERT INTO product values (10, "./Images/Product/timon.jpg" , "Luau Timon","Sono finalmente disponibili i nuovi Pop! Vinyl de Il Re Leone!", 16 , 6, 0, 10, "Disney",  "Luau Timon", 7.0 );
INSERT INTO product values (11, "./Images/Product/sally.jpg" , " Sally ","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Nightmare Before Christmas!", 16 , 4, 0, 10, "Disney",  "Sally", 6.9 );

/*DC COMICS*/
INSERT INTO product values (12, "./Images/Product/redh.jpg" ,  "Red Hood (Jason Todd) ","Red Hood è l'ultimo personaggio DC ad unirsi alla collezione Pop In A Box Exclusives!", 16 , 10, 1, 10, "DC Comics",  "Red Hood (Jason Todd)", 7.3 );
INSERT INTO product values (13, "./Images/Product/bmanta.jpg" ,  "Black Manta ","I tuoi personaggi preferiti di Aquaman DC hanno ricevuto il trattamento Funko! ", 16 , 8, 0, 10, "DC Comics",  "Black Manta", 7.8 );
INSERT INTO product values (14, "./Images/Product/batman.jpg" ,  "Batman (Guitar Solo) ","Ecco a voi il nuovo Funko Pop! DC Comics!", 16 , 10, 1, 10, "DC Comics",  "Batman (Guitar Solo)", 7.5 );
INSERT INTO product values (15, "./Images/Product/harley.jpg" ,  "Harley Queen con aiutante","Aggiungi i migliori Pop DC Heroes al tuo Natale!", 16 , 10, 0, 10, "DC Comics",  "Harley Queen con aiutante", 8.3 );
INSERT INTO product values (16, "./Images/Product/gl_jessica.jpg" , "Green Lantern Jessica","Ecco a voi il nuovo Funko Pop! Dia De Los DC!", 16 , 10, 0, 10, "DC Comics",  "Green Lantern Jessica", 8.2 );

/*PIXAR*/
INSERT INTO product values (17, "./Images/Product/bullseye.jpg" ,  "Bullseye ","Ecco a voi i nuovissimi Funko Pop! di Toy Story!", 16 , 10, 0, 10, "Pixar",  "Bullseye ", 8.0 );
INSERT INTO product values (18, "./Images/Product/woody.jpg" ,  "Woody Sceriffo ","Ecco a voi i Funko Pop! Vinyl di Toy Story 4!", 16 , 8, 1, 10, "Pixar",  "Woody Sceriffo ", 8.5 );
INSERT INTO product values (19, "./Images/Product/buzz.jpg" ,  "Buzz Lightyear","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Toy Story!", 16 , 10, 1, 10, "Pixar",  "Buzz Lightyear ", 8.2 );
INSERT INTO product values (20, "./Images/Product/shrek.jpg" , "Shrek","Shreck è amore, Shreck è vita", 69 , 12, 2, 10, "Pixar",  "Shrek", 9.0 );
INSERT INTO product values (21, "./Images/Product/jessie.jpg" , "Jessie ","Ecco a voi i Funko Pop! Vinyl di Toy Story 4!", 16 , 5, 0, 10, "Pixar",  "Jessie", 8.2 );

/*STAR WARS*/
INSERT INTO product values (22, "./Images/Product/boba.jpg" ,  "Mandalorian Boba Fett"," Star Wars The Mandalorian Boba Fett Funko Pop! Vinyl", 16 , 12, 1, 10, "Star Wars",  "Mandalorian Boba Fett", 8.0 );
INSERT INTO product values (23, "./Images/Product/palpatine.jpg" ,  "Emperor Palpatine","Ecco a voi il nuovo Funko Pop! Star Wars!", 16 , 5, 1, 10, "Star Wars",  "Emperor Palpatine", 7.6 );
INSERT INTO product values (24, "./Images/Product/rey.jpg" ,  "Rey (Two Light Sabers )","Ecco a voi il nuovo Funko Pop! Star Wars!", 16 , 8, 0, 10, "Star Wars",  "Rey (Two Light Sabers )", 8.2 );
INSERT INTO product values (25, "./Images/Product/kylo.jpg" ,  "Kylo Ren Elettronico","Ecco a voi i nuovissimi Pop! Vinyl di Star Wars", 16 , 7, 0, 10, "Star Wars",  "Kylo Ren Elettronico", 7.4 );
INSERT INTO product values (26, "./Images/Product/baby.jpg" ,  "Baby Yoda ","Ecco a voi i nuovi Funko Pop! Star Wars!", 16 , 12, 1, 10, "Star Wars",  "Baby Yoda ", 9.0 );

/*WWE*/
INSERT INTO product values (27, "./Images/Product/under.jpg" ,  "Undertaker Hooded ","Ecco a voi il nuovo Funko Pop! WWE!", 16 , 12, 1, 10, "WWE",  "Undertaker Hooded ", 8.7 );
INSERT INTO product values (28, "./Images/Product/raym.jpg" ,  "Ray Mysterio ","Ecco a voi il nuovo Funko Pop! WWE!", 16 , 12, 0, 10, "WWE",  "Ray Mysterio ", 8.0 );
INSERT INTO product values (29, "./Images/Product/jerryl.jpg" ,  "Jerry Lawler ","Ecco a voi il nuovo Funko Pop! WWE!", 16 , 7, 0, 10, "WWE",  "Jerry Lawler ", 7.5 );
INSERT INTO product values (30, "./Images/Product/johnc.jpg" ,  "John Cena ","Ecco a voi il nuovo Funko Pop! WWE!", 16 , 6, 1, 10, "WWE",  "John Cena", 8.2 );
INSERT INTO product values (31, "./Images/Product/drewm.jpg" ,  "Drew Mcintyre","Ecco a voi il nuovo Funko Pop! WWE!", 16 , 9, 0, 10, "WWE",  "Drew Mcintyre ", 8.2 );

/*LORD OF THE RINGS*/
INSERT INTO product values (32, "./Images/Product/32balrog.png" , "Balrog","Ecco a voi il nuovo Funko Pop! Il Signore Degli Anelli!", 20 ,5, 0, 20, "Lord of the rings",  "Balrog", 8.3 );
INSERT INTO product values (33, "./Images/Product/samwise_gamgee.jpg" , "Samwise Gamgee","Ecco a voi il nuovo Funko Pop! Il Signore Degli Anelli!", 16 ,7, 0, 10, "Lord of the rings",  "La compagnia dell'anello", 6.9 );
INSERT INTO product values (34, "./Images/Product/legolas.jpg" , "Legolas","Ecco a voi il nuovo Funko Pop! Il Signore Degli Anelli!", 16 ,8, 0, 10, "Lord of the rings",  "La compagnia dell'anello", 7.6 );
INSERT INTO product values (35, "./Images/Product/aragorn.jpg" , "Aragorn","Ecco a voi il nuovo Funko Pop! Il Signore Degli Anelli!", 16 ,6, 0, 10, "Lord of the rings",  "La compagnia dell'anello", 8.3 );
INSERT INTO product values (36, "./Images/Product/gimli.jpg" , "Gimli","Ecco a voi il nuovo Funko Pop! Il Signore Degli Anelli!", 16 ,9, 0, 10, "Lord of the rings",  "La compagnia dell'anello", 8.3 );

/*FILM*/
INSERT INTO product values (37, "./Images/Product/john_e_cane.jpg" , "John Wick con cane","Ecco a voi il nuovo Funko Pop dei vostri film più amati!", 16 ,9, 3, 13, "Film",  "John Wick", 8.7 );
INSERT INTO product values (38, "./Images/Product/alien.jpg" , "Alien","Ecco a voi il nuovo Funko Pop dei vostri film più amati!", 16 ,4, 0, 10, "Film",  "Alien", 8.7 );
INSERT INTO product values (39, "./Images/Product/wendy.jpg" , "The shining! Wendy Torrance","Ecco a voi il nuovo Funko Pop dei vostri film più amati!", 16 ,7, 0, 10, "Film",  "The shining", 8.0 );
INSERT INTO product values (40, "./Images/Product/edward_mani_di_forbice.jpg" , "Edward mani di forbice","Ecco a voi il nuovo Funko Pop dei vostri film più amati!", 16 ,5, 1, 10, "Film",  "Edward mani di forbice", 8.1 );
INSERT INTO product values (41, "./Images/Product/beetlejuice.jpg" , "Beetlejuice","Ecco a voi il nuovo Funko Pop dei vostri film più amati!", 16 ,2, 0, 10, "Film",  "Beetlejuice", 8.2 );

/*MUSICA*/
INSERT INTO product values (42, "./Images/Product/linkinpark.jpg" , "LINKIN PARK - HYBRID THEORY","Ecco a voi i nuovi Funko Pop! Linkin Park!", 20 ,5, 0, 20, "Musica",  "Linkin Park", 9.1  );
INSERT INTO product values (43, "./Images/Product/acdc.jpg" , "AC/DC - HIGHWAY TO HELL","Ecco a voi il nuovo Funko Pop! AC/DC!", 20 ,6, 0, 20, "Musica",  "ACDC", 8.1  );
INSERT INTO product values (44, "./Images/Product/motorhead.jpg" , "MOTORHEAD - ACE OF SPADES","Ecco a voi il nuovo Funko Pop! Motorhead!", 20 ,9, 0, 20, "Musica",  "Motorhead", 8.3  );
INSERT INTO product values (45, "./Images/Product/queen.jpg" , "QUEEN - NEWS OF THE WORLD","Questa notizia regina del mondo Funko Pop! Vinyl Album Figure", 20 ,10, 0, 20, "Musica",  "Queen", 9.0  );
INSERT INTO product values (46, "./Images/Product/lilwayne.jpg" , "LIL WAYNE - THA CARTER III","Questo Lil Wayne Tha Carter III Funko Pop! Vinyl Album Figure", 20 ,7, 0, 20, "Musica",  "Lil Wayne", 8.7  );

/*HARRY POTTER*/
INSERT INTO product values (47, "./Images/Product/patronus_harry.jpg" , "Patronus di Harry Potter","Il Patronus Pop di Harry Potter!", 10 ,6, 0, 20, "Harry Potter",  "Patronus di Harry Potter", 8.7  );
INSERT INTO product values (48, "./Images/Product/ginny.jpg" , "Ginny Weasley con il diario di Tom Riddle","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Harry Potter!", 10 ,5, 0, 20, "Harry Potter",  "Ginny Weasley con il diario di Tom Riddle", 8.2  );
INSERT INTO product values (49, "./Images/Product/tom.jpg" , "Tom Riddle","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Harry Potter!", 10 ,3, 0, 20, "Harry Potter",  "Tom Riddle", 7.7  );
INSERT INTO product values (50, "./Images/Product/harry_e_voldy.jpg" , "Harry contro Voldemort","Ecco qui i Pop! Vinyl dei tuoi personaggi preferiti di Harry Potter!", 20 ,7, 2, 20, "Harry Potter",  "Harry contro Voldemort", 9.3  );

/* ONE PEIECE*/
INSERT INTO product values (51, "./Images/Product/chopper.jpg" , "Chopper","Il dottore è dentro! Questo One Piece Tony Chopper Pop! La figura in vinile presenta il pirata renna come un'adorabile figura in vinile!", 10 ,6, 0, 20, "One piece",  " Chopper", 7.3 );
INSERT INTO product values (52, "./Images/Product/zoro.jpg" , "Zoro","Questo Zoro Pop!Aggiungi questo fantastico Pop! alla tua collezione oggi stesso!", 10 ,8, 0, 20, "One piece",  "Zoro", 7.6  );
INSERT INTO product values (53, "./Images/Product/dq.jpg" , "DQ Doflamingo","Unisciti alla ciurma dei Pirati di Cappello di Paglia con questi nuovi One Piece Pop! Figure in vinile!", 10 ,9, 0, 20, "One piece",  "DQ Doflamingo", 8.1  );
INSERT INTO product values (54, "./Images/Product/luffy.jpg" , "Monkey D. Luffy","Capitano sul ponte! Questo One Piece Monkey D. Luffy Pop!", 10 ,10, 1, 20, "One piece",  "Monkey D. Luffy", 8.3  );

/* DEMON SLAYER */
INSERT INTO product values (55, "./Images/Product/Tanjiro_Kamado.jpg" , "Tanjiro Kamado","Ecco a voi il nuovo Funko Pop! Demon Slayer!", 10 ,9, 0, 20, "Demon Slayer",  "Tanjiro Kamado", 7.4  );
INSERT INTO product values (56, "./Images/Product/nezuko_kamado.jpg" , "Nezuko Kamado","Ecco a voi il nuovo Funko Pop! Demon Slayer!", 8 ,9, 0, 20, "Demon Slayer",  "Nezuko Kamado", 7.8  );

INSERT INTO cliente VALUES ("Moro", "morelli1", "morelli-2000luca@gmail.com");
INSERT INTO cliente VALUES ("JewDaiko", "palmisciano1", "palmisciano.2000@gmail.com");
INSERT INTO cliente VALUES ("PeppSdrogo", "peppe1", "peppe.2000@gmail.com");
INSERT INTO cliente VALUES ("FunkoAdmin", "FunkoAdmin", "admin@gmail.com");
INSERT INTO cliente VALUES ("guest", "guest", "guest@gmail.com");
INSERT INTO cliente VALUES("Pippo123","Papa123456","pippo@gmail.com");

/*INSERT INTO valuta VALUES ("Moro", 6, "20/4/2020", 5, 9.0, "Prodotto non male. Arrivato in ottime condizioni");
INSERT INTO valuta VALUES ("FunkoAdmin", 1, "20/4/2020", 1, 3.2, "Prodotto non male. Peccato sia arrivato in pessime condizioni");
INSERT INTO valuta VALUES ("JewDaiko", 3, "20/4/2020", 3, 7.2, "Prodotto non male. Peccato sia arrivato in discrete condizioni");*/

INSERT INTO dati_anagrafici VALUES ("Moro", "Luca", "Morelli", "1234567890");
INSERT INTO dati_anagrafici VALUES ("JewDaiko", "Marco", "Palmisciano", "1345678902");
INSERT INTO dati_anagrafici VALUES ("PeppSdrogo", "Giuseppe", "Ragosta", "1234567809");
INSERT INTO dati_anagrafici VALUES ("FunkoAdmin", "FunkoAdmin", "FunkoAdmin", "0987654321");
INSERT INTO dati_anagrafici VALUES ("guest", "guest", "guest", "0123456789");

INSERT INTO carta_credito VALUES ("456", "ABC123EFG456", "Moro");
INSERT INTO carta_credito VALUES ("123", "EFG456ABC123", "JewDaiko");
INSERT INTO carta_credito VALUES ("467", "ABC456EFG123", "PeppSdrogo");
INSERT INTO carta_credito VALUES ("567", "EFG123ABC456", "FunkoAdmin");
INSERT INTO carta_credito VALUES ("789", "EFG321ABC654", "guest");

INSERT INTO indirizzo VALUES ("BN", "Benevento", "30 Garibaldi", "Moro");
INSERT INTO indirizzo VALUES ("RO", "Roma", "12 Garibaldi", "JewDaiko");
INSERT INTO indirizzo VALUES ("SA", "Salerno", "30 viale delle Rose", "PeppSdrogo");
INSERT INTO indirizzo VALUES ("NA", "Napoli", "3 Centrale", "FunkoAdmin");
INSERT INTO indirizzo VALUES ("BN", "Benevento", "16 Garibaldi", "guest");

/*INSERT INTO ordine  VALUES ("Moro",1,  22,"2021-5-10" );   
INSERT INTO ordine  VALUES ("Moro", 2,  22, "2021-5-1");
INSERT INTO ordine  VALUES ("FunkoAdmin", 3,  22, "2021-5-31");*/

/*INSERT INTO pagamento VALUES ("Moro", 1,  40.0, "2021-5-10");
INSERT INTO pagamento VALUES ("Moro", 2,  40.0, "2021-5-1");
INSERT INTO pagamento VALUES ("FunkoAdmin", 3,  30.0, "2021-5-31");*/

/*INSERT INTO compone VALUES (1,  1, 6);
INSERT INTO compone VALUES (2,  1, 4);
INSERT INTO compone VALUES (3, 1, 2);*/