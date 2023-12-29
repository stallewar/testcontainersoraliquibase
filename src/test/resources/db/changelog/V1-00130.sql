create table TBLOCKED_RETRIES
(
    ID               NUMBER               not null
        constraint TBLOCKED_RETRIES_PK
            primary key,
    SUBSCRIPTION_ID  NUMBER               not null,
    MAX_ATTEMPTS     NUMBER(2)            not null,
    ATTEMPTS         NUMBER(2)            not null,
    STATUS           NUMBER(2)            not null,
    NEXT_CHARGE_DATE DATE,
    CHARGE_INTERVAL  NUMBER(2)            not null,
    CREATED          DATE default sysdate not null,
    CONSTRAINT TBLOCKED_RETRIES_FK1
        FOREIGN KEY (SUBSCRIPTION_ID)
            REFERENCES SUBSCRIPTIONS (ID)
)
/

create sequence TBLOCKED_RETRIES_SEQ
/
