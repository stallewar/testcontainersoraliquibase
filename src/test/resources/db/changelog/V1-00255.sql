ALTER TABLE pending_syncpay ADD subscription_id NUMBER;
/

CREATE TABLE subs_charge_progress (
 id NUMBER NOT NULL constraint subs_charge_progress_pk primary key,
 subscription_id NUMBER NOT NULL,
 tx_id VARCHAR2(100),
 cascade_id NUMBER(2) NOT NULL,
 status NUMBER(2) NOT NULL,
 created_date DATE DEFAULT SYSDATE NOT NULL
);
/

create sequence subs_charge_progress_seq;
/

ALTER TABLE charges ADD period_days NUMBER(9);
/

ALTER TABLE charges ADD amount NUMBER(19,2);
/

ALTER TABLE charges ADD service_code NUMBER;
/

ALTER TABLE notifications ADD debt VARCHAR2(1);
/

CREATE TABLE subs_debt_status (
                                  id NUMBER NOT NULL constraint subs_debt_status_pk primary key,
                                  subscription_id NUMBER NOT NULL,
                                  debt_period_begin DATE NOT NULL,
                                  debt_period_end DATE NULL,
                                  debt_amount NUMBER(19,2) NOT NULL,
                                  status NUMBER(2) NOT NULL,
                                  created_date DATE DEFAULT SYSDATE NOT NULL
);
/

create sequence subs_debt_status_seq;
/

create index subs_charge_progress_idx1 on subs_charge_progress (subscription_id, status);
/