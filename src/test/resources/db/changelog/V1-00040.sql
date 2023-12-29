alter table SERVICES add notify_url VARCHAR2(4000)
/

create table notifications
(
    id             number         not null,
    service_name   varchar2(50) not null,
    msisdn         number not null,
    notify_date    date,
    created_date   date default sysdate,
    status         number(2),
    attempts       number(2),
    last_sent_date date,
    tx_id          varchar2(255)   not null,
    next_sent_date date,
    notify_status  varchar2(100),
    error          varchar2(4000),
    constraint notifications_pkey
        primary key(id),
    constraint notifications_un1
        unique (tx_id, service_name)
)
/

create sequence notifications_seq
/

create index notifications_idx1 on notifications (status)
/
