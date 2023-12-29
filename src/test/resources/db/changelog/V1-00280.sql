ALTER TABLE switch_overs ADD service_name VARCHAR2(100);
/

ALTER TABLE services ADD switchover_notify_url VARCHAR2(4000);
/

ALTER TABLE notifications ADD new_service_code NUMBER;
/