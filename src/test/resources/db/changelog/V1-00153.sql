alter table tnb_warnings drop constraint tnb_warnings_uk1;
/

alter table tnb_warnings drop column tnb_name;
/

ALTER TABLE tnb_warnings ADD tnb_name VARCHAR2(100);
/

alter table tnb_warnings add constraint tnb_warnings_uk1 unique (tnb_name, days_before_close);
/
