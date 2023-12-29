create table msisdn_changed
(
    id           NUMBER not null constraint msisdn_changed_pk primary key,
    old_msisdn   NUMBER NOT NULL,
    new_msisdn   NUMBER NOT NULL,
    created_date DATE default sysdate not null
)
/

create sequence msisdn_changed_seq
/