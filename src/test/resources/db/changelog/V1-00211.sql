ALTER TABLE service_codes ADD cascade_period_days VARCHAR2(100);
/

ALTER TABLE service_codes ADD cascade_amount VARCHAR2(100);
/

ALTER TABLE service_codes ADD cascade_service_code VARCHAR2(500);
/

ALTER TABLE service_codes ADD fallback_period_days NUMBER(9);
/

ALTER TABLE service_codes ADD fallback_amount NUMBER(19,2);
/

ALTER TABLE service_codes ADD fallback_service_code NUMBER;
/

ALTER TABLE service_codes ADD debt_allowed VARCHAR2(1);
/

ALTER TABLE service_codes ADD temp_blocked_allowed VARCHAR2(1);
/
