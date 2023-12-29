alter table services drop column charge_type;
/

alter table services drop column period_days;
/

alter table services drop column service_code;
/

ALTER TABLE services ADD charge_notify_url VARCHAR2(4000);
/

ALTER TABLE services ADD endtnb_notify_url VARCHAR2(4000);
/

ALTER table services ADD constraint services_uk1 unique (service_name);
/

create table service_codes
(
    id            NUMBER not null constraint service_codes_pk primary key,
    service_name  VARCHAR2(50) not null,
    service_code  NUMBER not null,
    action        VARCHAR2(100) not null,
    charge_type   VARCHAR2(20),
    period_days   NUMBER(9),
    amount        NUMBER(19,2),
    created       DATE default sysdate not null
);
/

ALTER table service_codes ADD constraint service_codes_uk1 unique (service_code);
/

create sequence service_codes_seq
/

ALTER TABLE subscriptions ADD ordering_channel VARCHAR2(100);
/

ALTER TABLE subscriptions ADD promo_channel VARCHAR2(100);
/

ALTER TABLE subscriptions ADD tnb_name VARCHAR2(100);
/

ALTER TABLE subscriptions ADD trial_warning_date DATE;
/

ALTER TABLE subscriptions ADD trial_end_date DATE;
/

ALTER TABLE subscriptions ADD trial_closed VARCHAR2(1);
/

ALTER TABLE subscriptions ADD trial_warning_text VARCHAR2(4000);
/

ALTER TABLE subscriptions ADD charge_type VARCHAR2(20);
/

ALTER TABLE subscriptions ADD period_days NUMBER(9);
/

ALTER TABLE subscriptions ADD amount NUMBER(19,2);
/

create table tnb_periods
(
    ID               NUMBER               not null
        constraint tnb_periods_pk
            primary key,
    service_name     VARCHAR2(50)         not null,
    tnb_name         VARCHAR2(100)        not null,
    trial_days_count NUMBER not null,
    is_default       VARCHAR2(1),
    created          DATE default sysdate not null
)
/

alter table tnb_periods add constraint tnb_periods_uk1 unique (tnb_name);
/

-- alter table tnb_periods add constraint tnb_periods_uk2 unique (DECODE("is_default", 'Y', "is_default", TO_CHAR(id)), service_name);
-- /

create sequence tnb_periods_seq
/

create table tnb_warnings
(
    id                NUMBER               not null constraint tnb_warnings_pk primary key,
    tnb_name          NUMBER               not null,
    pattern           VARCHAR2(4000),
    days_before_close NUMBER               not null,
    created           DATE default sysdate not null
);
/

alter table tnb_warnings add constraint tnb_warnings_uk1 unique (tnb_name, days_before_close);
/

create sequence tnb_warnings_seq
/