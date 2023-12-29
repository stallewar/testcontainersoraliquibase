alter table ACTIVE_RETRIES modify MAX_ATTEMPTS NUMBER(4);
/

alter table ACTIVE_RETRIES modify ATTEMPTS NUMBER(4);
/

alter table ACTIVE_RETRIES modify charge_interval NUMBER(10);
/

alter table TBLOCKED_RETRIES modify MAX_ATTEMPTS NUMBER(4);
/

alter table TBLOCKED_RETRIES modify ATTEMPTS NUMBER(4);
/

alter table TBLOCKED_RETRIES modify charge_interval NUMBER(10);
/