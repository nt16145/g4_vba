--
-- PostgreSQL database dump
--
\c r01_j4_exp;

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: company_23; Type: TABLE; Schema: public; Owner: keiu; Tablespace: 
--

CREATE TABLE company_23 (
    code character(4) NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text,
    labors numeric NOT NULL
);


ALTER TABLE public.company_23 OWNER TO nt16145;

--
-- Data for Name: company_23; Type: TABLE DATA; Schema: public; Owner: keiu
--

COPY company_23 (code, name, address, phone, labors) FROM stdin;
\.


--
-- Name: company_23_pkey; Type: CONSTRAINT; Schema: public; Owner: keiu; Tablespace: 
--

--
-- company_出席番号に置き換え
-- keiuとynakamuraはいないので削除
--

ALTER TABLE ONLY company_23
    ADD CONSTRAINT company_23_pkey PRIMARY KEY (code);


--
-- Name: company_23; Type: ACL; Schema: public; Owner: keiu
--

REVOKE ALL ON TABLE company_23 FROM PUBLIC;
REVOKE ALL ON TABLE company_23 FROM nt16145;
-- GRANT ALL ON TABLE company_23 TO keiu;
GRANT ALL ON TABLE company_23 TO nt16145;
-- GRANT ALL ON TABLE company_23 TO ynakamura;


--
-- PostgreSQL database dump complete
--
