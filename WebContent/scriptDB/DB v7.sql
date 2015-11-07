--------------------------------------------------------
--  File creato - mercoledì-novembre-04-2015   
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

   CREATE SEQUENCE  "SCOTT"."CLIENTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 28 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDINE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."ORDINE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PIETANZA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."PIETANZA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 79 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RISTORANTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."RISTORANTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 34 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ASSOCIAZIONE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ASSOCIAZIONE" 
   (	"ID_ORDINE" NUMBER, 
	"ID_PIETANZA" NUMBER, 
	"QUANTITA" NUMBER DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
Insert into SCOTT.ASSOCIAZIONE (ID_ORDINE,ID_PIETANZA,QUANTITA) values ('1','20','1');
Insert into SCOTT.ASSOCIAZIONE (ID_ORDINE,ID_PIETANZA,QUANTITA) values ('2','20','1');
REM INSERTING into SCOTT.CATEGORIA_PIETANZA
SET DEFINE OFF;
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Antipasto');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Bevande');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Contorno');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Cornetto');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Crepe dolce');
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Crepe salata');
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
Insert into SCOTT.CATEGORIA_PIETANZA (NOME) values ('Waffle');
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
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('1','annacau@hotmail.it','peb','Anna','Cau','via palestrina 55','Cagliari','3348659357');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('2','giannimagni@gmail.com','peb','Gianni','Magni','viale Trento 30','Monserrato','070338697');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('3','fabiopaulesu@libero.it','peb','Fabio','Paulesu','via Strauss 13','Quartu','070385942');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('4','carlozucca@libero.it','peb','Carlo','Zucca','via Oniferi 11','Pirri','3498843057');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('5','alessandraboi@gmail.com','peb','Alessandra','Boi','via Ungheria 22','Quartu','3485721345');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('6','michelemele@tiscali.it','peb','Michele','Mele','via Bellini 12','Selargius','3339842583');
Insert into SCOTT.CLIENTE (ID,EMAIL,PASSWORD,NOME,COGNOME,INDIRIZZO,CITTA,TELEFONO) values ('7','pierofranceschi@hotmail.it','peb','Piero','Franceschi','via San Benedetto 78','Cagliari','070369823');
REM INSERTING into SCOTT.ORDINE
SET DEFINE OFF;
Insert into SCOTT.ORDINE (ID,ID_CLIENTE,ID_RISTORANTE,DATA,IMPORTO,DATA_RITIRO) values ('1','1','9',to_timestamp('04-NOV-15 15:03:36,072000000','DD-MON-RR HH24:MI:SSXFF'),'9,72',to_timestamp('07-MAG-17 08:14:00,000000000','DD-MON-RR HH24:MI:SSXFF'));
Insert into SCOTT.ORDINE (ID,ID_CLIENTE,ID_RISTORANTE,DATA,IMPORTO,DATA_RITIRO) values ('2','1','9',to_timestamp('04-NOV-15 15:07:21,857000000','DD-MON-RR HH24:MI:SSXFF'),'9,72',to_timestamp('07-MAG-17 08:14:00,000000000','DD-MON-RR HH24:MI:SSXFF'));
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
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('79','Cornetto Mignon','Cornetto','Non ripieno');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('80','Cornetto Albicocca','Cornetto','Ripieno di confettura albiccocca');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('81','Crepe Solita','Crepe dolce','Nutella');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('82','Crepe Delizia','Crepe dolce','Crema vaniglia');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('83','Crepe Delicata all’arancia','Crepe dolce','Marmellata');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('84','Crepe Semplice','Crepe salata','Mozzarella, prosciutto');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('85','Crepe Rustica','Crepe salata','Mozzarella, pomodoro');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('86','Crepe Vegetariana','Crepe salata','Crema agli spinaci');
Insert into SCOTT.PIETANZA (ID,NOME,CATEGORIA,DESCRIZIONE) values ('87','Waffle Classico','Waffle','Ricoperto di zucchero a velo');
REM INSERTING into SCOTT.PREPARAZIONE
SET DEFINE OFF;
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('51','19','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('51','32','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('52','19','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('52','32','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('53','32','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('54','32','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('55','32','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','11','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('56','32','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('53','19','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','32','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','16','6,21',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('23','1','6,13',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','14','7,52',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','1','9,22',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','31','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('9','28','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('51','8','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','20','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('54','19','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('55','19','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('52','8','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','2','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('53','8','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','32','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('56','19','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('23','14','8,72',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('59','28','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','21','6,58',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','19','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('54','8','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('24','1','7,94',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','19','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','2','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','2','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','2','3,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('15','2','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('16','2','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('17','2','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('79','2','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('80','2','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('81','2','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('82','2','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('83','2','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('84','2','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('85','2','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('86','2','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('87','2','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','3','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','3','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','3','3,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('15','3','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('16','3','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('17','3','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('79','3','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('80','3','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('81','3','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('82','3','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('83','3','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('84','3','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('85','3','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('86','3','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('87','3','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','13','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','13','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','13','3,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('15','13','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('16','13','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('17','13','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('79','13','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('80','13','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('81','13','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('82','13','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('83','13','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('84','13','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('85','13','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('86','13','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('87','13','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','22','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','22','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','22','3,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('15','22','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('16','22','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('17','22','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('79','22','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('80','22','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('81','22','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('82','22','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('83','22','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('84','22','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('85','22','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('86','22','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('87','22','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('12','23','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('13','23','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('14','23','3,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('15','23','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('16','23','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('17','23','2,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('79','23','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('80','23','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('81','23','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('82','23','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('83','23','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('84','23','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('85','23','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('86','23','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('87','23','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('1','12','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('10','12','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','12','6,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','12','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('66','12','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('67','12','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('30','12','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('34','12','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('1','17','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('10','17','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','17','6,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','17','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('66','17','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('67','17','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('30','17','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('34','17','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('1','25','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('10','25','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','25','6,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','25','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('66','25','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('67','25','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('30','25','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('34','25','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('1','29','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('10','29','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','29','6,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','29','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('66','29','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('67','29','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('30','29','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('34','29','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('1','30','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('10','30','2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','30','6,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','30','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('66','30','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('67','30','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('30','30','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('34','30','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','4','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','4','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','20','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','20','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','20','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','20','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','20','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','4','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','5','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','5','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','5','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','5','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','5','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','5','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','5','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','5','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','14','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','14','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','14','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','14','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','14','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','14','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','14','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','14','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','4','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','4','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','4','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','4','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','4','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','20','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','20','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','21','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('2','18','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','18','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','18','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','18','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','18','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','18','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','18','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','18','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','21','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('75','21','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','21','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','21','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','21','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','21','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','21','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('3','31','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('76','31','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('77','31','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('78','31','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('32','31','3',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('33','31','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('38','7','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('39','7','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('40','7','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('41','7','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('42','7','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('43','7','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('44','7','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('45','7','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('46','7','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('47','7','4,2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('48','7','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('49','7','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('50','7','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('38','6','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('39','6','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('40','6','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('41','6','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('42','6','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('43','6','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('44','6','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('45','6','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('46','6','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('47','6','4,2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('48','6','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('49','6','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('50','6','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('38','15','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('39','15','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('40','15','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('41','15','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('42','15','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('43','15','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('44','15','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('45','15','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('46','15','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('47','15','4,2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('48','15','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('38','26','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('39','26','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('40','26','4,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('41','26','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('42','26','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('43','26','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('44','26','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('45','26','5,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('46','26','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('47','26','4,2',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('48','26','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('49','15','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('50','15','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('55','8','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('56','8','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','8','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','8','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('51','9','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('52','9','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('53','9','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('54','9','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('55','9','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('56','9','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','9','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','9','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('51','24','4',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('52','24','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('53','24','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('54','24','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('55','24','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('56','24','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('57','24','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('58','24','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','10','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('9','10','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('59','10','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','10','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','10','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','10','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','10','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','10','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','10','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','10','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('9','11','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('59','11','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','11','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','11','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','11','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','11','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','11','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','11','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','11','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','16','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('9','16','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('59','16','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','16','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','16','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','16','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','16','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','16','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','16','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','16','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','27','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('9','27','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('59','27','6',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','27','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','27','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','27','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','27','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','27','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','27','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','27','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','28','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','28','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','28','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','28','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','28','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','28','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','28','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','28','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('4','33','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('65','33','10',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('25','33','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('29','33','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('68','33','9',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('74','33','5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('31','33','7',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('36','33','8',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','3','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','13','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','22','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','23','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','12','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','17','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','25','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','29','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','30','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','4','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','5','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','14','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','18','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','20','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','21','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','31','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','6','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','7','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','15','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','26','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','8','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','9','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','19','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','24','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','32','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','10','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','11','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','16','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','27','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','28','1,5',null);
Insert into SCOTT.PREPARAZIONE (ID_PIETANZA,ID_RISTORANTE,PREZZO,NOTE) values ('11','33','1,5',null);
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
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
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

ALTER TABLE "SCOTT"."ORDINE" ADD "EVASO" NUMBER(1) DEFAULT 0 NOT NULL;
