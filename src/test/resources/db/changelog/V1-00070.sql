ALTER TABLE charges ADD CONSTRAINT charges_un1 UNIQUE (tx_id)
/

CREATE INDEX subscriptions_idx1 ON subscriptions (msisdn, service_code)
/
