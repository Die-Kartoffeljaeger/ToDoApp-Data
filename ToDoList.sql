CREATE TABLE todolist
(
    entryid uuid NOT NULL DEFAULT gen_random_uuid(),
	userid uuid NOT NULL,
	createdon timestamp without time zone NOT NULL DEFAULT now(),
	suggester character varying(32) NOT NULL DEFAULT(''),
	content character varying(280) NOT NULL DEFAULT(''),
	deadline timestamp without time zone,
	CONSTRAINT user_pkey FOREIGN KEY (userid) REFERENCES app_user(id)
)
WITH(
	OIDS=FALSE
);

CREATE INDEX ix_todolist_entryid
	ON todolist
	USING btree(entryid);

CREATE INDEX ix_todolist_userid
	ON todolist
	USING btree(userid);
