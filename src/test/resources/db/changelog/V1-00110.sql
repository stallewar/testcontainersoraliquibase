create table ACTIVE_RETRIES
(
    ID               NUMBER               not null
        constraint ACTIVE_RETRIES_PK
            primary key,
    SUBSCRIPTION_ID  NUMBER               not null,
    MAX_ATTEMPTS     NUMBER(2)            not null,
    ATTEMPTS         NUMBER(2)            not null,
    STATUS           NUMBER(2)            not null,
    LAST_CHARGE_DATE DATE,
    CHARGE_INTERVAL  NUMBER(2)            not null,
    CREATED          DATE default sysdate not null,
    CONSTRAINT ACTIVE_RETRIES_FK1
        FOREIGN KEY (SUBSCRIPTION_ID)
            REFERENCES SUBSCRIPTIONS (ID)
)
/

create sequence ACTIVE_RETRIES_SEQ
/

alter table services add ar_max_attempts NUMBER(4);
/

alter table services add ar_charge_interval NUMBER(10);
/

alter table services add tbr_max_attempts NUMBER(4);
/

alter table services add tbr_charge_interval NUMBER(10);
/
