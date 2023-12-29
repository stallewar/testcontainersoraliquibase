ALTER TABLE services ADD debt_count NUMBER;
/

ALTER TABLE services ADD debt_amount NUMBER(19,2);
/

ALTER TABLE subs_debt_status ADD service_name VARCHAR2(100);
/

ALTER TABLE subs_debt_status ADD msisdn NUMBER;
/