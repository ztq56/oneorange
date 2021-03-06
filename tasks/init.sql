--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS pgcrypto;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: clouds; Tablespace:
--

CREATE TABLE authors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL UNIQUE CONSTRAINT authors_name_character CHECK (name ~ '^[0-9a-zA-Z][0-9a-zA-Z.]{2,}[0-9a-zA-Z]$' and name not like '%..%'),
    password VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE anthologies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(200) NOT NULL,
    author_id UUID NOT NULL REFERENCES authors(id),
    description VARCHAR(200),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (name, author_id)
)
