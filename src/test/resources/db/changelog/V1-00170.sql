create table partners
(
    login        varchar2(100)        not null,
    password     varchar2(500)        not null,
    enabled      number(1),
    CREATED_date DATE default sysdate not null
)
/

create table authorities
(
    login        varchar2(100)        not null,
    authority     varchar2(100)        not null,
    created_date DATE default sysdate not null
)
/
