-- Table: metadatos

-- DROP TABLE metadatos;

CREATE TABLE metadatos
(
  id serial NOT NULL,
  archivo character varying,
  metadato text,
  CONSTRAINT "primaryKey" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE metadatos
  OWNER TO postgres;
