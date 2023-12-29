ALTER TABLE service_codes ADD discount_syncpay_scode NUMBER;
/

ALTER TABLE service_codes ADD discount_amount NUMBER(19,2);
/

create table discount_msisdn
(
    msisdn NUMBER not null constraint discount_msisdn_pk primary key
);
/