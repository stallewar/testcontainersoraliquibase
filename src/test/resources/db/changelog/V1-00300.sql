ALTER TABLE service_codes ADD debt_remember_days NUMBER;
/

ALTER TABLE service_codes ADD charge_debt_ifclosed VARCHAR2(1);
/

ALTER TABLE service_codes ADD forgive_debt_ifcharged VARCHAR2(1);
/

ALTER TABLE service_codes ADD max_debt_amount_per_day NUMBER(19,2);
/