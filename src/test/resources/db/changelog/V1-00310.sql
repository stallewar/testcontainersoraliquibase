ALTER TABLE subscriptions ADD debt_remember_days NUMBER;
/

ALTER TABLE subscriptions ADD charge_debt_ifclosed VARCHAR2(1);
/

ALTER TABLE subscriptions ADD forgive_debt_ifcharged VARCHAR2(1);
/

ALTER TABLE subscriptions ADD max_debt_amount_per_day NUMBER(19,2);
/