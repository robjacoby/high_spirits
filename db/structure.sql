--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: set_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        NEW.updated_at = CURRENT_TIMESTAMP;
        RETURN NEW;
      END;
      $$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bottles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bottles (
    id integer NOT NULL,
    name text,
    volume integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: bottles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bottles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bottles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bottles_id_seq OWNED BY bottles.id;


--
-- Name: bottles_whiskies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bottles_whiskies (
    bottle_id integer,
    whisky_id integer,
    volume integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: distilleries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE distilleries (
    id integer NOT NULL,
    name text NOT NULL,
    location text NOT NULL,
    region text NOT NULL,
    owned_by text,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: distilleries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE distilleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distilleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE distilleries_id_seq OWNED BY distilleries.id;


--
-- Name: event_streams; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE event_streams (
    data text DEFAULT '{}'::text NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: que_jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE que_jobs (
    priority smallint DEFAULT 100 NOT NULL,
    run_at timestamp with time zone DEFAULT now() NOT NULL,
    job_id bigint NOT NULL,
    job_class text NOT NULL,
    args json DEFAULT '[]'::json NOT NULL,
    error_count integer DEFAULT 0 NOT NULL,
    last_error text,
    queue text DEFAULT ''::text NOT NULL
);


--
-- Name: TABLE que_jobs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE que_jobs IS '3';


--
-- Name: que_jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE que_jobs_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: que_jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE que_jobs_job_id_seq OWNED BY que_jobs.job_id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    filename text NOT NULL
);


--
-- Name: whiskies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE whiskies (
    id integer NOT NULL,
    name text,
    age_statement integer,
    bottled_on date,
    cask_number text,
    batch_number text,
    abv double precision NOT NULL,
    distillery_id integer,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: whiskies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE whiskies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: whiskies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE whiskies_id_seq OWNED BY whiskies.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bottles ALTER COLUMN id SET DEFAULT nextval('bottles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY distilleries ALTER COLUMN id SET DEFAULT nextval('distilleries_id_seq'::regclass);


--
-- Name: job_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY que_jobs ALTER COLUMN job_id SET DEFAULT nextval('que_jobs_job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY whiskies ALTER COLUMN id SET DEFAULT nextval('whiskies_id_seq'::regclass);


--
-- Name: bottles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bottles
    ADD CONSTRAINT bottles_pkey PRIMARY KEY (id);


--
-- Name: distilleries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY distilleries
    ADD CONSTRAINT distilleries_pkey PRIMARY KEY (id);


--
-- Name: que_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY que_jobs
    ADD CONSTRAINT que_jobs_pkey PRIMARY KEY (queue, priority, run_at, job_id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- Name: whiskies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY whiskies
    ADD CONSTRAINT whiskies_pkey PRIMARY KEY (id);


--
-- Name: set_updated_at_on_bottles; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_on_bottles BEFORE UPDATE ON bottles FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();


--
-- Name: set_updated_at_on_bottles_whiskies; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_on_bottles_whiskies BEFORE UPDATE ON bottles_whiskies FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();


--
-- Name: set_updated_at_on_distilleries; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_on_distilleries BEFORE UPDATE ON distilleries FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();


--
-- Name: set_updated_at_on_whiskies; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_on_whiskies BEFORE UPDATE ON whiskies FOR EACH ROW EXECUTE PROCEDURE set_updated_at_column();


--
-- PostgreSQL database dump complete
--

