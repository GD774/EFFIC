drop sequence user_seq;

create sequence user_seq nocache;

drop table user_t;

create table user_t (
  id       number   not null,
  emp_id   varchar2(32) not null,
  password varchar2(64) not null,
  perm_code number  default 0 not null,
  name     varchar2(32) null,
  email    varchar2(64) null,
  phone    varchar2(10) null,
  user_img blob     null,
  status   number   null,
  dep_id   number   null,
  pos_id   number   null,
  res_id   number   null,
  join_dt  date     null,
  leave_dt date     null,
  sign_img blob     null,
  sign_stamp blob     null
);
