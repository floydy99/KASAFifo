use master
GO


CREATE DATABASE KASA
GO

USE KASA
GO

CREATE TABLE SKLEP(
 id int identity primary key,
 nazwa varchar(30),
 adres varchar(30)
 )

 CREATE TABLE LOGOWANIE(
 id int identity primary key,
 nazwa varchar(30),
 haslo varchar(30),
 idsklepu int
 
 foreign key (idsklepu) references SKLEP(id)
 )


CREATE TABLE KASJER(
 id int identity primary key,
 data_rozpoczecia datetime2,
 data_zakonczenia datetime2,
 idlogowania int

 foreign key (idlogowania) references Logowanie(id)
 )

CREATE TABLE KLIENT(
 id int identity primary key,
 data_wejscia datetime2,
 data_obsluzenia datetime2,
 idkasjera int

 foreign key (idkasjera) references KASJER(id)
 )

CREATE TABLE PRODUKT(
 id int identity primary key,
 nazwa varchar(60),
 cena decimal(19,2)
 )

CREATE TABLE SKLEP_PRODUKT(
 idsklepu int,
 idproduktu int

 foreign key (idsklepu) references SKLEP(id),
 foreign key (idproduktu) references PRODUKT(id)
 )

CREATE TABLE KLIENT_PRODUKT(
 idklienta int,
 idproduktu int

 foreign key (idklienta) references KLIENT(id),
 foreign key (idproduktu) references PRODUKT(id)
 )