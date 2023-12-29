ALTER TABLE subscriptions DROP COLUMN period_days;
/

ALTER TABLE subscriptions DROP COLUMN amount;
/

CREATE TABLE switch_overs(
 id NUMBER NOT NULL constraint switch_overs_pk primary key,
 msisdn NUMBER(11) NOT NULL,
 service_code NUMBER NOT NULL,
 tx_id VARCHAR2(100),
 status NUMBER(2) NOT NULL,
 created_date DATE DEFAULT SYSDATE NOT NULL
);
/

create sequence switch_overs_seq;
/

create index switch_overs_idx1 on switch_overs (msisdn)
/