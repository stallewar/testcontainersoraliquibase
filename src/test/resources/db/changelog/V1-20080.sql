ALTER TABLE recharged_smsne ADD status NUMBER
/

CREATE INDEX recharged_smsne_idx1 ON recharged_smsne (status)
/