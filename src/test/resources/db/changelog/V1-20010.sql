ALTER TABLE services ADD debt_charge_interval NUMBER;
/

ALTER TABLE service_codes ADD subs_max_debt_amount_per_day NUMBER(19,2);
/

ALTER TABLE subs_debt_status ADD charging VARCHAR2(1);
/

ALTER TABLE subs_debt_status ADD updated DATE;
/

ALTER TABLE subs_debt_status ADD service_code NUMBER;
/

create table recharges
(
    id              number               not null
        constraint recharges_pk
            primary key,
    subscription_id number               not null,
    debt_id         number               not null,
    tx_id           varchar2(100)        not null,
    status          number(2)            not null,
    error           varchar2(50),
    charge_date     date,
    service_code    number               not null,
    amount          number(19, 2)        not null,
    created         date default sysdate not null
)
/

create sequence recharges_seq
/