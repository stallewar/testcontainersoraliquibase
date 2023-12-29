alter table active_retries add next_charge_date date;
/

alter table active_retries drop column last_charge_date;
/
