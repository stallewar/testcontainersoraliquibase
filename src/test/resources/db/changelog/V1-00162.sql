create table pending_unsubscribes
(
    id            NUMBER not null constraint pending_unsubscribes_pk primary key,
    msisdn        NUMBER not null,
    service_code  NUMBER not null,
    status        NUMBER(1) not null,
    tx_id         VARCHAR2(100),
    created       DATE default sysdate not null
);
/

create unique index pending_unsubscribes_un1 on pending_unsubscribes (msisdn, service_code, decode(status,0,0,id));
/

create sequence pending_unsubscribes_seq
/