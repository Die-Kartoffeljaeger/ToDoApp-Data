CREATE TABLE appUser
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
	ON appUser
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
-----
CREATE TABLE todolist
(
	id uuid NOT NULL,
	entryid NOT NULL gen_random_uuid(),
	createdon timestamp without time zone NOT NULL DEFAULT now(),
	suggester character varying(32) NOT NULL DEFAULT(''),
	content character varying(280) NOT NULL DEFAULT(''),
	deadline timestamp without time zone,
	CONSTRAINT user_pkey FOREIGN KEY (id) REFERENCES appUser(id)
)
WITH(
	OIDS=FALSE
);

CREATE INDEX ix_todolist_entryid
	ON todolist
	USING btree(entryid)

CREATE INDEX ix_todolist_id
	ON todolist
	USING btree(id)