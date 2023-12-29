create table pending_sc_events
(
    id            NUMBER not null constraint pending_sc_events_pk primary key,
    msisdn        NUMBER not null,
    new_msisdn    NUMBER,
    sc_event      VARCHAR2(100) not null,
    status        NUMBER(1) not null,
    tx_id         VARCHAR2(100),
    created       DATE default sysdate not null
);
/

create unique index pending_sc_events_un1 on pending_sc_events (msisdn, decode(status,0,0,id));
/

create sequence pending_sc_events_seq
/
