create table SUBSCRIPTIONS
(
    ID               NUMBER               not null
        constraint SUBSCRIPTIONS_PK
            primary key,
    MSISDN           NUMBER(11)           not null,
    START_DATE       DATE                 not null,
    END_DATE         DATE,
    STATUS           NUMBER(2)            not null,
    NEXT_CHARGE_DATE DATE,
    SERVICE_NAME     VARCHAR2(50)         not null,
    HANDLER          VARCHAR2(50)         not null,
    CREATED          DATE default sysdate not null
)
/

create table SERVICES
(
    ID           NUMBER               not null
        constraint SERVICES_PK
            primary key,
    SERVICE_CODE NUMBER               not null,
    SERVICE_NAME VARCHAR2(50)         not null,
    CREATED      DATE default sysdate not null
)
/

create table CHARGES
(
    ID              NUMBER               not null
        constraint CHARGES_PK
            primary key,
    SUBSCRIPTION_ID NUMBER               not null,
    TX_ID           VARCHAR2(100)        not null,
    STATUS          NUMBER(2)            not null,
    ERROR           VARCHAR2(50),
    CHARGE_DATE     DATE,
    CREATED         DATE default sysdate not null
)
/

create sequence SUBSCRIPTIONS_SEQ
/

create sequence CHARGES_SEQ
/

create sequence SERVICES_SEQ
/
