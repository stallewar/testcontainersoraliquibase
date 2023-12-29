CREATE INDEX active_retries_idx1 ON active_retries (status, next_charge_date)
/

CREATE INDEX tblocked_retries_idx1 ON tblocked_retries (status, next_charge_date)
/

CREATE INDEX subscriptions_idx3 ON subscriptions (status, next_charge_date)
/
