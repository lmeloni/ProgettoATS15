--------------------------------------------------------
--  File creato - giovedì-ottobre-29-2015   
--------------------------------------------------------
DROP TABLE "SCOTT"."ASSOCIAZIONE" cascade constraints;
DROP TABLE "SCOTT"."CATEGORIA_PIETANZA" cascade constraints;
DROP TABLE "SCOTT"."CATEGORIA_RISTORANTE" cascade constraints;
DROP TABLE "SCOTT"."CLIENTE" cascade constraints;
DROP TABLE "SCOTT"."ORDINE" cascade constraints;
DROP TABLE "SCOTT"."PIETANZA" cascade constraints;
DROP TABLE "SCOTT"."PREPARAZIONE" cascade constraints;
DROP TABLE "SCOTT"."RISTORANTE" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDINE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."ORDINE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PIETANZA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."PIETANZA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RISTORANTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."RISTORANTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ASSOCIAZIONE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ASSOCIAZIONE" 
   (	"ID_ORDINE" NUMBER, 
	"ID_PIETANZA" NUMBER, 
	"QUANTITA" NUMBER DEFAULT 1
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CATEGORIA_PIETANZA
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CATEGORIA_PIETANZA" 
   (	"NOME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CATEGORIA_RISTORANTE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CATEGORIA_RISTORANTE" 
   (	"NOME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CLIENTE" 
   (	"ID" NUMBER, 
	"EMAIL" VARCHAR2(256 BYTE), 
	"PASSWORD" VARCHAR2(64 BYTE), 
	"NOME" VARCHAR2(20 BYTE), 
	"COGNOME" VARCHAR2(20 BYTE), 
	"INDIRIZZO" VARCHAR2(100 BYTE), 
	"CITTA" VARCHAR2(50 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDINE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ORDINE" 
   (	"ID" NUMBER, 
	"ID_CLIENTE" NUMBER, 
	"ID_RISTORANTE" NUMBER, 
	"DATA" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"IMPORTO" NUMBER(9,2), 
	"DATA_RITIRO" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PIETANZA
--------------------------------------------------------

  CREATE TABLE "SCOTT"."PIETANZA" 
   (	"ID" NUMBER, 
	"NOME" VARCHAR2(50 BYTE), 
	"CATEGORIA" VARCHAR2(20 BYTE), 
	"DESCRIZIONE" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PREPARAZIONE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."PREPARAZIONE" 
   (	"ID_PIETANZA" NUMBER, 
	"ID_RISTORANTE" NUMBER, 
	"PREZZO" NUMBER(9,2), 
	"NOTE" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RISTORANTE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."RISTORANTE" 
   (	"ID" NUMBER, 
	"EMAIL" VARCHAR2(256 BYTE), 
	"PASSWORD" VARCHAR2(64 BYTE), 
	"NOME" VARCHAR2(100 BYTE), 
	"CATEGORIA" VARCHAR2(30 BYTE), 
	"INDIRIZZO" VARCHAR2(100 BYTE), 
	"CITTA" VARCHAR2(50 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"DESCRIZIONE" VARCHAR2(1000 BYTE), 
	"ORARIO_APERTURA" VARCHAR2(10 BYTE) DEFAULT NULL, 
	"ORARIO_CHIUSURA" VARCHAR2(10 BYTE) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.ASSOCIAZIONE
SET DEFINE OFF;
REM INSERTING into SCOTT.CATEGORIA_PIETANZA
SET DEFINE OFF;
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Antipasto');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Bevande');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Contorno');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Dessert');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Hamburger');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Hot dog');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Panino');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Patate');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Piadina');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Pizza classica');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Pizza dolce');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Primo');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Secondo');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Sushi e sashimi');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Tempura');
REM INSERTING into SCOTT.CATEGORIA_RISTORANTE
SET DEFINE OFF;
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Cinese');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Creperia');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Giapponese');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Messicano');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Paninoteca');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Pizzeria');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Ristorante');
Insert into SCOTT.CATEGORIA_RISTORANTE (NOME) values ('Tipico');
REM INSERTING into SCOTT.CLIENTE
SET DEFINE OFF;
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('8','annacau@hotmail.it','peb','Anna','Cau','via palestrina 55','Cagliari','3348659357');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('9','giannimagni@gmail.com','peb','Gianni','Magni','viale Trento 30','Monserrato','070338697');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('10','fabiopaulesu@libero.it','peb','Fabio','Paulesu','via Strauss 13','Quartu','070385942');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('11','carlozucca@libero.it','peb','Carlo','Zucca','via Oniferi 11','Pirri','3498843057');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('12','alessandraboi@gmail.com','peb','Alessandra','Boi','via Ungheria 22','Quartu','3485721345');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('13','michelemele@tiscali.it','peb','Michele','Mele','via Bellini 12','Selargius','3339842583');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('14','pierofranceschi@hotmail.it','peb','Piero','Franceschi','via San Benedetto 78','Cagliari','070369823');
REM INSERTING into SCOTT.ORDINE
SET DEFINE OFF;
REM INSERTING into SCOTT.PIETANZA
SET DEFINE OFF;
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('1','Involtini primavera','Antipasto','Pasta sfoglia fritta con verdure miste (2 Pz)');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('2','Sake tatrare','Antipasto','Salmone tritato con avocado e tobiko');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('3','Samurai stick','Antipasto','Spring roll di pesce');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('4','Bresaola con grana scaglie e rucola','Antipasto',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('5','Caprese','Antipasto','Mozzarella e pomodoro');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('6','Insalata di mare','Antipasto','Contiene: seppie, calamari, surimi, cozze, peperoni, olive.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('7','Polpa di granchio alla catalana','Antipasto','Contiene: surimi, pomodoro fresco, basilico, cipolla.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('8','Salmone marinato','Antipasto','Contiene: salmone, sale, pepe.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('9','Trippa alla romana','Antipasto','Contiene: trippa, sugo, menta.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('10','Nuvole di drago ','Antipasto','Sfogliatine fritte realizzate con farina di tapioca e frutti di mare misti ');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('11','Acqua Piccola','Bevande','1 L');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('12','Acqua Media','Bevande','0.5 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('13','Aranciata','Bevande','1.5 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('14','Birra Ichnusa Media','Bevande','66 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('15','Birra Ichnusa Piccola','Bevande','33 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('16','Birra Moretti','Bevande','0.33 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('17','Coca cola Media','Bevande','1.5 L');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('18','Coca cola Piccola','Bevande','33 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('19','Coca cola zero Piccola','Bevande','33 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('20','Fanta','Bevande','33 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('21','Sprite','Bevande','33 cl');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('22','The alla pesca','Bevande','1.5 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('23','Vino Bianco','Bevande','0.75 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('24','Vino Rosso','Bevande','0.75 litri');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('25','Insalata di nervetti','Contorno',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('26','Insalata di tonno, fagioli e cipolle','Contorno',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('27','Insalata di tonno, pomodori e uova','Contorno',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('28','Piselli con prosciutto','Contorno',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('29','Verdure grigliate','Contorno','Contiene: zucchine, melanzane, peperoni.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('30','Biscotti della fortuna','Dessert','farina, zucchero, vanillina e olio');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('31','Creme caramel','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('32','Dolcetto di riso','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('33','Gelato al the verde','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('34','Gelato Fritto','Dessert','Gelato alla vaniglia, crema, cioccolato');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('35','Panna cotta','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('36','Profiteroles','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('37','Tiramisù','Dessert',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('38','Cheeseburger','Hamburger','Formaggio, Hamburger, pomodoro');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('39','Hamburger completo','Hamburger','insalata, pomodoro, ketchup, maionese');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('40','Hamburger uova e formaggio','Hamburger',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('41','Hot dog classico','Hot dog','wurstel, cipolla, ketchup, maionese');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('42','Hot dog formaggio','Hot dog','wurstel, formaggio, ketchup, maionese');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('43','Pollo, maionese, insalata','Panino',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('44','Speck, scamorza, pomodorini','Panino',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('45','Crocchette di patate','Patate',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('46','Patate al forno','Patate','Rosmarino');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('47','Patatine fritte','Patate','Potrebbero essere surgelate');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('48','Bresaola, Rucola, Grana ','Piadina',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('49','Cotto, Fontina','Piadina',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('50','Crudo, Mozzarella, Pomodoro','Piadina',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('51','Margherita','Pizza classica','pomodoro, mozzarella');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('52','Marinara','Pizza classica','pomodoro, aglio');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('53','Ortolana','Pizza classica','pomodoro, mozzarella, verdure');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('54','Prosciutto cotto','Pizza classica','pomodoro, mozzarella, prosciutto cotto');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('55','Crema e fragole','Pizza dolce','Crema pasticcera, fragole fresche');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('56','Nutella','Pizza dolce','nutella');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('57','Riso alla cantonese','Primo','Prosciutto, frittata a pezzettini, piselli, a volte accompagnati da mais, gamberetti, peperoni ed altre verdure');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('58','Spaghetti di soia con verdure e gamberi','Primo','I gamberi potrebbero essere surgelati');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('59','Lasagne alla bolognese','Primo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('60','Pasta allo scoglio','Primo','Contiene: cozze, scampi, vongole, pomodori, aglio, prezzemolo.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('61','Risotto alla pescatora','Primo','Contiene: vongole, cozze, seppie, cipolla e prezzemolo.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('62','Malloreddus alla carlofortina','Primo','Contiene: pesto, tonno, panna.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('63','Penne al salmone','Primo','Contiene: sugo, salmone, panna.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('64','Pennette all''arrabbiata','Primo','Contiene: sugo piccante.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('65','Trofie alla bottarga','Primo','Contiene: bottarga, olio d''oliva, aglio.');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('66','Anatra con bambù e funghi cinesi','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('67','Pollo alle mandorle','Secondo','mandorle, zenzero, salsa alla soia, cipolla');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('68','Bistecca di manzo','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('69','Calamari fritti','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('70','Cotoletta alla milanese','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('71','Scaloppine con funghi','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('72','Scaloppine con vino','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('73','Spiedini alla brace','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('74','Salsiccia ai ferri','Secondo',null);
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('75','Sake','Sushi e sashimi','Nigiri di salmone');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('76','Tako','Sushi e sashimi','Nigiri di polipo');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('77','Ebi','Tempura','Gamberoni fritti con pastella leggera');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('78','Yasai','Tempura','Verdure miste fritte con pastella leggera');
REM INSERTING into SCOTT.PREPARAZIONE
SET DEFINE OFF;
REM INSERTING into SCOTT.RISTORANTE
SET DEFINE OFF;
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('2','blacksun@hotmail.com','peb','Black Sun 2','Creperia','Via Sonnino,12','Cagliari','070541220',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('3','likitta@outlook.com','peb','Likitta','Creperia','Via Merello,27','Cagliari','070321098',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('4','aikido45@gmail.com','peb','Aikido','Giapponese','Via Milano 34','Cagliari','070556694',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('5','fukurua11@gmail.com','peb','Fukurua','Giapponese','Via Nuoro 88','Cagliari','3495747456',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('6','retroburger@gmail.com','peb','Retro Burger','Paninoteca','Via Azuni, 98','Cagliari','3888506085',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('7','prustico@libero.it','peb','Panino Rustico','Paninoteca','Piazza San Rocco,5','Cagliari','3382274659',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('8','ilgatto@gmail.com','peb','Il Gatto','Pizzeria','v.le Trieste,5','Cagliari','070547896',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('9','ilpeperosa@live.it','peb','Il Pepe Rosa','Pizzeria','Via Della Pineta,108','Cagliari','070303313',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('10','info@luigipomata.com','peb','Luigi Pomata Restaurant','Ristorante','via Roma 23','Cagliari','3423345679',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('11','info@lozodiaco.com','peb','Lo Zodiaco','Ristorante','via Sassari 89','Cagliari','0709805643',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('12','asianinn456@libero.it','peb','Asian Inn','Cinese','via Cina 54','Monserrato','3467890234',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('13','fruiteco@gmail.com','peb','Fruit & Co.','Creperia','Via San Giacomo,33','Monserrato','3206596315',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('14','kuwai@gmail.com','peb','Kawai','Giapponese','Via Mazzini 3','Monserrato','070986523',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('15','poldo@tiscali.it','peb','Poldo','Paninoteca','Via Nazionale ,118','Monserrato','070752389',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('16','marino67@libero.it','peb','Da Marino al St.Remy','Ristorante','via Oristano 12','Monserrato','3456789262',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('17','dalin123@tiscali.it','peb','Da Lin','Cinese','via Nuoro 56','Pirri','0709806754',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('18','fuj@tiscali.com','peb','Fujinami','Giapponese','Via Sicilia 39','Pirri','070556421',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('19','sstampu@outlook.com','peb','Su Stampu','Pizzeria','via Giotto, 76','Pirri','070876320',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('20','lyo@libero.it','peb','Lyo','Giapponese','Via Tolmino 78','Quartu Sant'' Elena','070943651',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('21','popo45@tiscali.it','peb','Poporaya','Giapponese','Via Inghilterra 28','Quartu Sant'' Elena','3336581699',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('22','cornelio@live.it','peb','Cornelio','Creperia','Via Ciusa','Quartu Sant'' Elena','3459863250',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('23','info@peterpan.it','peb','Peter Pan','Creperia','Via Garibaldi,55','Quartu Sant'' Elena','0707898625',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('24','spizzico@gmail.com','peb','Spizzico','Pizzeria','via Londra,18','Quartu Sant'' Elena','070572877',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('25','info@giardino.com','peb','Giardino d''Oriente','Cinese','via Mandas 98','Quartu Sant'' Elena','3498657432',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('26','info@polpaburger.it','peb','Polpa Burger','Paninoteca','Via Angioj,22','Quartu Sant'' Elena','0706670469',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('27','info@anticaquartu.com','peb','Antica Quartu','Ristorante','via is Maglias','Quartu Sant'' Elena','3457762341',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('28','cardiga89@libero.it','peb','Sa Cardiga e su Schironi','Ristorante','via Sanluri 56','Quartu Sant'' Elena','0709805467',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('29','info@shanghai.com','peb','Grande Shanghai','Cinese','via Molise 23','Selargius','0709805432',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('30','cittadrago@tiscali.it','peb','Città del Drago','Cinese','via Basilicata 56','Selargius','0709806432',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('31','yazawa@hotmail.it','peb','Yazawa','Giapponese','Via Cavour 21','Selargius','346778564',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('32','piper@libero.it','peb','Piper','Pizzeria','Viale Armando Diaz,154','Selargius','070301194',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('33','basilio56@tiscali.it','peb','Da Basilio','Ristorante','via Timavo 97','Selargius','0709805261',null,'10:00','23:00');
Insert into SCOTT.RISTORANTE (ID,EMAIL,PASSWORD,NOME,CATEGORIA,INDIRIZZO,CITTA,TELEFONO,DESCRIZIONE,ORARIO_APERTURA,ORARIO_CHIUSURA) values ('1','schironada@gmail.com','peb','Sa schironada','Tipico','Via Sardegna, 1','Cagliari','070-123456','Cucina tipica sarda: proceddu, spiedini, ecc..','11:00','24:00');
--------------------------------------------------------
--  DDL for Index ASSOCIAZIONE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ASSOCIAZIONE_PK" ON "SCOTT"."ASSOCIAZIONE" ("ID_ORDINE", "ID_PIETANZA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORIA_PIETANZA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CATEGORIA_PIETANZA_PK" ON "SCOTT"."CATEGORIA_PIETANZA" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORIA_RISTORANTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CATEGORIA_RISTORANTE_PK" ON "SCOTT"."CATEGORIA_RISTORANTE" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CLIENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CLIENTE_PK" ON "SCOTT"."CLIENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CLIENTE_EMAIL_UX
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CLIENTE_EMAIL_UX" ON "SCOTT"."CLIENTE" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDINE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ORDINE_PK" ON "SCOTT"."ORDINE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PIETANZA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PIETANZA_PK" ON "SCOTT"."PIETANZA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PIETANZA_NOME_UX
--------------------------------------------------------

  CREATE INDEX "SCOTT"."PIETANZA_NOME_UX" ON "SCOTT"."PIETANZA" ("NOME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PREPARAZIONE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PREPARAZIONE_PK" ON "SCOTT"."PREPARAZIONE" ("ID_PIETANZA", "ID_RISTORANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RISTORANTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."RISTORANTE_PK" ON "SCOTT"."RISTORANTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RISTORANTE_EMAIL_UX
--------------------------------------------------------

  CREATE INDEX "SCOTT"."RISTORANTE_EMAIL_UX" ON "SCOTT"."RISTORANTE" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ASSOCIAZIONE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ASSOCIAZIONE" ADD CONSTRAINT "ASSOCIAZIONE_PK" PRIMARY KEY ("ID_ORDINE", "ID_PIETANZA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."ASSOCIAZIONE" MODIFY ("ID_ORDINE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ASSOCIAZIONE" MODIFY ("ID_PIETANZA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ASSOCIAZIONE" MODIFY ("QUANTITA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORIA_PIETANZA
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CATEGORIA_PIETANZA" ADD CONSTRAINT "CATEGORIA_PIETANZA_PK" PRIMARY KEY ("NOME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."CATEGORIA_PIETANZA" MODIFY ("NOME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORIA_RISTORANTE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CATEGORIA_RISTORANTE" ADD CONSTRAINT "CATEGORIA_RISTORANTE_PK" PRIMARY KEY ("NOME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."CATEGORIA_RISTORANTE" MODIFY ("NOME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CLIENTE" ADD CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("NOME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("COGNOME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("INDIRIZZO" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."CLIENTE" MODIFY ("CITTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDINE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ORDINE" ADD CONSTRAINT "ORDINE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."ORDINE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ORDINE" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ORDINE" MODIFY ("ID_RISTORANTE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ORDINE" MODIFY ("DATA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."ORDINE" MODIFY ("IMPORTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PIETANZA
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PIETANZA" ADD CONSTRAINT "PIETANZA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."PIETANZA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."PIETANZA" MODIFY ("NOME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."PIETANZA" MODIFY ("CATEGORIA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PREPARAZIONE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PREPARAZIONE" ADD CONSTRAINT "PREPARAZIONE_PK" PRIMARY KEY ("ID_PIETANZA", "ID_RISTORANTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."PREPARAZIONE" MODIFY ("ID_PIETANZA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."PREPARAZIONE" MODIFY ("ID_RISTORANTE" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."PREPARAZIONE" MODIFY ("PREZZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RISTORANTE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."RISTORANTE" ADD CONSTRAINT "RISTORANTE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("NOME" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("CATEGORIA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("INDIRIZZO" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("CITTA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("TELEFONO" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("ORARIO_APERTURA" NOT NULL ENABLE);
 
  ALTER TABLE "SCOTT"."RISTORANTE" MODIFY ("ORARIO_CHIUSURA" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ASSOCIAZIONE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ASSOCIAZIONE" ADD CONSTRAINT "ASSOCIAZIONE_FK1" FOREIGN KEY ("ID_ORDINE")
	  REFERENCES "SCOTT"."ORDINE" ("ID") ENABLE;
 
  ALTER TABLE "SCOTT"."ASSOCIAZIONE" ADD CONSTRAINT "ASSOCIAZIONE_FK2" FOREIGN KEY ("ID_PIETANZA")
	  REFERENCES "SCOTT"."PIETANZA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDINE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ORDINE" ADD CONSTRAINT "ORDINE_FK1" FOREIGN KEY ("ID_CLIENTE")
	  REFERENCES "SCOTT"."CLIENTE" ("ID") ENABLE;
 
  ALTER TABLE "SCOTT"."ORDINE" ADD CONSTRAINT "ORDINE_FK2" FOREIGN KEY ("ID_RISTORANTE")
	  REFERENCES "SCOTT"."RISTORANTE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PIETANZA
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PIETANZA" ADD CONSTRAINT "PIETANZA_FK1" FOREIGN KEY ("CATEGORIA")
	  REFERENCES "SCOTT"."CATEGORIA_PIETANZA" ("NOME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PREPARAZIONE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."PREPARAZIONE" ADD CONSTRAINT "PREPARAZIONE_FK1" FOREIGN KEY ("ID_PIETANZA")
	  REFERENCES "SCOTT"."PIETANZA" ("ID") ENABLE;
 
  ALTER TABLE "SCOTT"."PREPARAZIONE" ADD CONSTRAINT "PREPARAZIONE_FK2" FOREIGN KEY ("ID_RISTORANTE")
	  REFERENCES "SCOTT"."RISTORANTE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RISTORANTE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."RISTORANTE" ADD CONSTRAINT "RISTORANTE_FK1" FOREIGN KEY ("CATEGORIA")
	  REFERENCES "SCOTT"."CATEGORIA_RISTORANTE" ("NOME") ENABLE;
--------------------------------------------------------
--  DDL for Trigger CLIENTE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SCOTT"."CLIENTE_TRG" 
BEFORE INSERT ON CLIENTE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CLIENTE_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."CLIENTE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDINE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SCOTT"."ORDINE_TRG" 
BEFORE INSERT ON ORDINE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ORDINE_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."ORDINE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PIETANZA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SCOTT"."PIETANZA_TRG" 
BEFORE INSERT ON PIETANZA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT PIETANZA_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."PIETANZA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RISTORANTE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SCOTT"."RISTORANTE_TRG" 
BEFORE INSERT ON RISTORANTE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT RISTORANTE_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."RISTORANTE_TRG" ENABLE;
