BEGIN
    UPDATE service_codes
    SET cascade_period_days=to_char(period_days),
        cascade_amount=to_char(amount),
        cascade_service_code=to_char(service_code),
        temp_blocked_allowed='Y';
    COMMIT;
END;
/