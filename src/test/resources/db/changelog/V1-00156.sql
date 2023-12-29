ALTER TABLE notifications DROP COLUMN initial_state;
/

ALTER TABLE notifications ADD notify_type VARCHAR2(100) NOT NULL;
/

ALTER TABLE notifications ADD next_charge_date DATE;
/

ALTER TABLE notifications ADD amount NUMBER(19,2);
/
