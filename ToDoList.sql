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