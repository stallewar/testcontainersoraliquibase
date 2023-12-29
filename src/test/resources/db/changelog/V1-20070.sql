create table recharged_smsne
(
    id          number               not null
        constraint recharged_smsne_pk
            primary key,
    external_id number               not null,
    msisdn      number               not null,
    balance     number(19, 2)        not null,
    created     date default sysdate not null
)
/

create sequence recharged_smsne_seq
/

alter table recharged_smsne add constraint recharged_smsne_un1 unique (msisdn, external_id);
/