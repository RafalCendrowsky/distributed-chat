create table person
(
    id          varchar(36) default uuid_generate_v4() not null primary key,
    first_name  varchar,
    last_name   varchar,
    email       varchar,
    created_at  timestamp default current_timestamp not null
);

create table person_account
(
    id              varchar(36) default uuid_generate_v4() not null primary key,
    person_id       varchar(36) not null references person (id),
    login           varchar not null,
    password_hash   varchar not null,
    salt            varchar not null,
    constraint uk_person_account_person_id unique (person_id),
    constraint uk_person_account_login unique (login)
)
