ALTER TABLE service_codes DROP COLUMN period_days;
/

ALTER TABLE service_codes DROP COLUMN amount;
/

ALTER TABLE services ADD full_service_name VARCHAR2(100);
/

ALTER TABLE subscriptions ADD cascade_period_days VARCHAR2(100);
/

ALTER TABLE subscriptions ADD cascade_amount VARCHAR2(100);
/

ALTER TABLE subscriptions ADD cascade_service_code VARCHAR2(500);
/

ALTER TABLE subscriptions ADD fallback_period_days NUMBER(9);
/

ALTER TABLE subscriptions ADD fallback_amount NUMBER(19,2);
/

ALTER TABLE subscriptions ADD fallback_service_code NUMBER;
/

ALTER TABLE subscriptions ADD debt_allowed VARCHAR2(1);
/

ALTER TABLE subscriptions ADD temp_blocked_allowed VARCHAR2(1);
/