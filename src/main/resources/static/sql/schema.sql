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


INSERT INTO USER_T VALUES(1, '1', '0FFE1ABD1A08215353C233D6E009613E95EEC4253832A761AF28FF37AC5A150C', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
commit