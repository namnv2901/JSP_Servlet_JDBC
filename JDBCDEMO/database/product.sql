--------------------------------------------------------
--  File created - Wednesday-November-07-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "QLTK"."PRODUCT" 
   (	"ID" NUMBER, 
	"PRODUCTNAME" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(1000 BYTE), 
	"PRICE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into QLTK.PRODUCT
SET DEFINE OFF;
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (1,'Iphone Xs Max','Gold 64GB',999);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (2,'Iphone Xs Max','Gold 128GB',1199);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (3,'Iphone Xs Max','Gold 256GB',1399);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (4,'Iphone Xs Max','Gold 512GB',1499);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (5,'Huawei Mate 20Pro','512GB- RAM 8GB',999);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (6,'Huawei Mate 20Pro','128GB- RAM 6GB',799);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (7,'Samsung Galaxy Note 9','512B - RAM 8GB',1099);
Insert into QLTK.PRODUCT (ID,PRODUCTNAME,DESCRIPTION,PRICE) values (8,'Samsung Galaxy Note 9','256B - RAM 8GB',999);
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QLTK"."PRODUCT_PK" ON "QLTK"."PRODUCT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "QLTK"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "QLTK"."PRODUCT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "QLTK"."PRODUCT" MODIFY ("PRICE" NOT NULL ENABLE);
