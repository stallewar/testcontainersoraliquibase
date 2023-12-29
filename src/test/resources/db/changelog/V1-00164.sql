create table pending_cdpnotifier
(
    id            NUMBER not null constraint pending_cdpnotifier_pk primary key,
    msisdn        NUMBER not null,
    service_name  VARCHAR2(100) not null,
    service_code  NUMBER not null,
    status        NUMBER(1) not null,
    tx_id         VARCHAR2(100),
    created       DATE default sysdate not null
);
/

create unique index pending_cdpnotifier_un1 on pending_cdpnotifier (msisdn, service_code, decode(status,0,0,id));
/

create sequence pending_cdpnotifier_seq
/