create table locks
(
    id           NUMBER not null constraint locks_pk primary key,
    lock_id      VARCHAR2(1000),
    created_date DATE default sysdate not null
)
/

create sequence locks_seq
/

alter table locks add constraint locks_un1 unique (lock_id);
/