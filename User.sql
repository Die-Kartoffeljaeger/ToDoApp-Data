CREATE TABLE appuser
(
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	username character varying(32) NOT NULL DEFAULT(''),
	password bytea NOT NULL DEFAULT(''),
	active boolean NOT NULL DEFAULT(FALSE),
	createdon timestamp without time zone NOT NULL DEFAULT now(),
	CONSTRAINT user_pkey PRIMARY KEY (id)
)
WITH
(
	OIDS=FALSE
);

CREATE INDEX ix_user_username
	ON appuser
	USING btree(username);

-----
CREATE TABLE activeuser
(
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	userid uuid NOT NULL,
	username character varying(32) NOT NULL DEFAULT(''),
	sessionkey character varying(128) NOT NULL DEFAULT(''),
	createdon timestamp without time zone NOT NULL DEFAULT now(),
	CONSTRAINT activeuser_pkey PRIMARY KEY (id)
)
WITH
(
	OIDS=FALSE
);

CREATE INDEX ix_activeuser_userid
	ON activeuser
	USING btree(userid);

CREATE INDEX ix_activeuser_sessionkey
	ON activeuser
	USING btree(sessionkey);
