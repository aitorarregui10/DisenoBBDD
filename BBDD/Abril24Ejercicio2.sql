-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.animales
(
    id_animal integer NOT NULL,
    pais_origen character varying(50) COLLATE pg_catalog."default",
    sexo character varying(50) COLLATE pg_catalog."default",
    continente character varying(50) COLLATE pg_catalog."default",
    f_nacimiento date,
    id_zoo integer,
    id_especie integer,
    CONSTRAINT animales_pkey PRIMARY KEY (id_animal)
);

CREATE TABLE IF NOT EXISTS public.especie
(
    id_especie integer NOT NULL,
    n_cientifico character varying(50) COLLATE pg_catalog."default",
    n_vulgar character varying(50) COLLATE pg_catalog."default",
    peligro_extincion boolean,
    familia character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT especie_pkey PRIMARY KEY (id_especie)
);

CREATE TABLE IF NOT EXISTS public.zoo
(
    id_zoo integer NOT NULL,
    pais character varying(50) COLLATE pg_catalog."default",
    tamano numeric(10, 2),
    presupuesto_anual numeric(15, 2),
    ciudad character varying(50) COLLATE pg_catalog."default",
    nombre character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT zoo_pkey PRIMARY KEY (id_zoo)
);

ALTER TABLE IF EXISTS public.animales
    ADD CONSTRAINT animales_id_especie_fkey FOREIGN KEY (id_especie)
    REFERENCES public.especie (id_especie) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.animales
    ADD CONSTRAINT animales_id_zoo_fkey FOREIGN KEY (id_zoo)
    REFERENCES public.zoo (id_zoo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;