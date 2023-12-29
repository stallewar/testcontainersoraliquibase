create unique index tnb_periods_uk2 on tnb_periods (service_name, decode(is_default, 'Y', is_default, to_char(id)));
/

create unique index subscriptions_un1 on subscriptions (msisdn, service_name, decode(status, 0,-1, 1,-1, 2,-1, 3,-1, id));
/
