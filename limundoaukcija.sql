-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: limundoaukcija | type: SCHEMA --
-- DROP SCHEMA IF EXISTS limundoaukcija CASCADE;
CREATE SCHEMA limundoaukcija;
-- ddl-end --

SET search_path TO pg_catalog,public,limundoaukcija;
-- ddl-end --

-- object: limundoaukcija.prodavac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.prodavac CASCADE;
CREATE TABLE limundoaukcija.prodavac (
	korisnicko_ime text NOT NULL,
	email text,
	ime text,
	prezime text,
	adresa text,
	CONSTRAINT prodavac_pk PRIMARY KEY (korisnicko_ime)

);
-- ddl-end --

-- object: limundoaukcija.proizvod | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.proizvod CASCADE;
CREATE TABLE limundoaukcija.proizvod (
	id_proizvoda text NOT NULL,
	pocetna_cena integer,
	ponuda_cene integer,
	krajnja_cena integer,
	datum text,
	idkorisnicko_ime text,
	CONSTRAINT proizvod_pk PRIMARY KEY (id_proizvoda)

);
-- ddl-end --

-- object: limundoaukcija.kupac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.kupac CASCADE;
CREATE TABLE limundoaukcija.kupac (
	korisnicko_ime text NOT NULL,
	email text,
	ime text,
	prezime text,
	adresa text,
	CONSTRAINT kupac_pk PRIMARY KEY (korisnicko_ime)

);
-- ddl-end --

-- object: limundoaukcija.povratne_informacije_kupca | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.povratne_informacije_kupca CASCADE;
CREATE TABLE limundoaukcija.povratne_informacije_kupca (
	id_kupca text,
	komentar text,
	ocena integer,
	korisnicko_imefk text NOT NULL
);
-- ddl-end --

-- object: limundoaukcija.povratne_informacije_prod | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.povratne_informacije_prod CASCADE;
CREATE TABLE limundoaukcija.povratne_informacije_prod (
	id_prodavca text NOT NULL,
	komentar text,
	ocena integer,
	korisnicko_imefk text NOT NULL,
	CONSTRAINT povratne_informacije_prod_pk PRIMARY KEY (id_prodavca)

);
-- ddl-end --

-- object: limundoaukcija.kategorija | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.kategorija CASCADE;
CREATE TABLE limundoaukcija.kategorija (
	id_kategorija text NOT NULL,
	potkategorija text,
	CONSTRAINT kategorija_pk PRIMARY KEY (id_kategorija)

);
-- ddl-end --

-- object: limundoaukcija.kupac_proizvod | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.kupac_proizvod CASCADE;
CREATE TABLE limundoaukcija.kupac_proizvod (
	korisnicko_ime text NOT NULL,
	id_proizvoda text NOT NULL,
	CONSTRAINT kupac_proizvod_pk PRIMARY KEY (korisnicko_ime,id_proizvoda)

);
-- ddl-end --

-- object: limundoaukcija.korisnik | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.korisnik CASCADE;
CREATE TABLE limundoaukcija.korisnik (
	id_korisnika text NOT NULL,
	CONSTRAINT korisnik_pk PRIMARY KEY (id_korisnika)

);
-- ddl-end --
-- ALTER TABLE limundoaukcija.korisnik OWNER TO postgres;
-- ddl-end --

-- object: limundoaukcija.korisnik_kupac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.korisnik_kupac CASCADE;
CREATE TABLE limundoaukcija.korisnik_kupac (
	id_korisnika text NOT NULL,
	korisnicko_ime text NOT NULL,
	CONSTRAINT korisnik_prodavac_pk PRIMARY KEY (id_korisnika,korisnicko_ime)

);
-- ddl-end --
-- ALTER TABLE limundoaukcija.korisnik_kupac OWNER TO postgres;
-- ddl-end --

-- object: limundoaukcija.korisnik_prodavac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.korisnik_prodavac CASCADE;
CREATE TABLE limundoaukcija.korisnik_prodavac (
	id_korisnika text NOT NULL,
	korisnicko_ime text NOT NULL,
	CONSTRAINT korisnik_prodavac_pk PRIMARY KEY (id_korisnika,korisnicko_ime)

);
-- ddl-end --

-- object: limundoaukcija.kategorija_proizvod | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.kategorija_proizvod CASCADE;
CREATE TABLE limundoaukcija.kategorija_proizvod (
	id_kategorija text NOT NULL,
	id_proizvod text NOT NULL,
	CONSTRAINT kategorija_proizvod_pk PRIMARY KEY (id_kategorija,id_proizvod)

);
-- ddl-end --

-- object: limundoaukcija.informacije_proizvod_kupac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.informacije_proizvod_kupac CASCADE;
CREATE TABLE limundoaukcija.informacije_proizvod_kupac (
	id_info text NOT NULL,
	id_proizvod text NOT NULL,
	CONSTRAINT informacije_proizvod_kupac_pk PRIMARY KEY (id_info,id_proizvod)

);
-- ddl-end --

-- object: limundoaukcija.informacije_proizvod_prodavac | type: TABLE --
-- DROP TABLE IF EXISTS limundoaukcija.informacije_proizvod_prodavac CASCADE;
CREATE TABLE limundoaukcija.informacije_proizvod_prodavac (
	id_proizvoda text NOT NULL,
	id_prodavca text NOT NULL,
	CONSTRAINT informacije_proizvod_prodavac_pk PRIMARY KEY (id_proizvoda,id_prodavca)

);
-- ddl-end --

-- object: korisnicko_imefk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.proizvod DROP CONSTRAINT IF EXISTS korisnicko_imefk CASCADE;
ALTER TABLE limundoaukcija.proizvod ADD CONSTRAINT korisnicko_imefk FOREIGN KEY (idkorisnicko_ime)
REFERENCES limundoaukcija.prodavac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkkorisnicko_ime | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.povratne_informacije_kupca DROP CONSTRAINT IF EXISTS fkkorisnicko_ime CASCADE;
ALTER TABLE limundoaukcija.povratne_informacije_kupca ADD CONSTRAINT fkkorisnicko_ime FOREIGN KEY (korisnicko_imefk)
REFERENCES limundoaukcija.kupac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkkorisnickoime | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.povratne_informacije_prod DROP CONSTRAINT IF EXISTS fkkorisnickoime CASCADE;
ALTER TABLE limundoaukcija.povratne_informacije_prod ADD CONSTRAINT fkkorisnickoime FOREIGN KEY (korisnicko_imefk)
REFERENCES limundoaukcija.prodavac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: kategorija_fk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.kategorija DROP CONSTRAINT IF EXISTS kategorija_fk CASCADE;
ALTER TABLE limundoaukcija.kategorija ADD CONSTRAINT kategorija_fk FOREIGN KEY (potkategorija)
REFERENCES limundoaukcija.kategorija (id_kategorija) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: korisnicko_imefk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.kupac_proizvod DROP CONSTRAINT IF EXISTS korisnicko_imefk CASCADE;
ALTER TABLE limundoaukcija.kupac_proizvod ADD CONSTRAINT korisnicko_imefk FOREIGN KEY (korisnicko_ime)
REFERENCES limundoaukcija.kupac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: idproizvodafk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.kupac_proizvod DROP CONSTRAINT IF EXISTS idproizvodafk CASCADE;
ALTER TABLE limundoaukcija.kupac_proizvod ADD CONSTRAINT idproizvodafk FOREIGN KEY (id_proizvoda)
REFERENCES limundoaukcija.proizvod (id_proizvoda) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_korisnika | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.korisnik_kupac DROP CONSTRAINT IF EXISTS id_korisnika CASCADE;
ALTER TABLE limundoaukcija.korisnik_kupac ADD CONSTRAINT id_korisnika FOREIGN KEY (id_korisnika)
REFERENCES limundoaukcija.korisnik (id_korisnika) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_kupca | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.korisnik_kupac DROP CONSTRAINT IF EXISTS id_kupca CASCADE;
ALTER TABLE limundoaukcija.korisnik_kupac ADD CONSTRAINT id_kupca FOREIGN KEY (korisnicko_ime)
REFERENCES limundoaukcija.kupac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: korisnikfk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.korisnik_prodavac DROP CONSTRAINT IF EXISTS korisnikfk CASCADE;
ALTER TABLE limundoaukcija.korisnik_prodavac ADD CONSTRAINT korisnikfk FOREIGN KEY (id_korisnika)
REFERENCES limundoaukcija.korisnik (id_korisnika) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: prodavacfk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.korisnik_prodavac DROP CONSTRAINT IF EXISTS prodavacfk CASCADE;
ALTER TABLE limundoaukcija.korisnik_prodavac ADD CONSTRAINT prodavacfk FOREIGN KEY (korisnicko_ime)
REFERENCES limundoaukcija.prodavac (korisnicko_ime) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: kategorijafk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.kategorija_proizvod DROP CONSTRAINT IF EXISTS kategorijafk CASCADE;
ALTER TABLE limundoaukcija.kategorija_proizvod ADD CONSTRAINT kategorijafk FOREIGN KEY (id_kategorija)
REFERENCES limundoaukcija.kategorija (id_kategorija) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: proizvodfk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.kategorija_proizvod DROP CONSTRAINT IF EXISTS proizvodfk CASCADE;
ALTER TABLE limundoaukcija.kategorija_proizvod ADD CONSTRAINT proizvodfk FOREIGN KEY (id_proizvod)
REFERENCES limundoaukcija.proizvod (id_proizvoda) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: infofk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.informacije_proizvod_kupac DROP CONSTRAINT IF EXISTS infofk CASCADE;
ALTER TABLE limundoaukcija.informacije_proizvod_kupac ADD CONSTRAINT infofk FOREIGN KEY (id_info)
REFERENCES limundoaukcija.povratne_informacije_kupca (id_kupca) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "proizvodFK" | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.informacije_proizvod_kupac DROP CONSTRAINT IF EXISTS "proizvodFK" CASCADE;
ALTER TABLE limundoaukcija.informacije_proizvod_kupac ADD CONSTRAINT "proizvodFK" FOREIGN KEY (id_proizvod)
REFERENCES limundoaukcija.proizvod (id_proizvoda) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_proizvoda | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.informacije_proizvod_prodavac DROP CONSTRAINT IF EXISTS id_proizvoda CASCADE;
ALTER TABLE limundoaukcija.informacije_proizvod_prodavac ADD CONSTRAINT id_proizvoda FOREIGN KEY (id_proizvoda)
REFERENCES limundoaukcija.proizvod (id_proizvoda) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_prodavcafk | type: CONSTRAINT --
-- ALTER TABLE limundoaukcija.informacije_proizvod_prodavac DROP CONSTRAINT IF EXISTS id_prodavcafk CASCADE;
ALTER TABLE limundoaukcija.informacije_proizvod_prodavac ADD CONSTRAINT id_prodavcafk FOREIGN KEY (id_prodavca)
REFERENCES limundoaukcija.povratne_informacije_prod (id_prodavca) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


