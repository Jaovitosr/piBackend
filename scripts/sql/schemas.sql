create table if not exists users (
  id uuid default gen_random_uuid() primary key, 
  name varchar not null, 
  email varchar not null,
  password varchar not null,
  createdAt timestamp default now(),
  updatedAt timestamp default now()
);

create table if not exists users_companies (
  id uuid default gen_random_uuid() primary key, 
  companyId varchar default '',
  userId uuid not null,
  createdAt timestamp default now(),
  updatedAt timestamp default now()
);

alter table users_companies add column if not exists type varchar default 'other';

create table if not exists companies (
  id uuid default gen_random_uuid() primary key, 
  name varchar not null,
  email varchar not null,
  cnpj varchar not null,
  hubId varchar not null default '',
  createdAt timestamp default now(),
  updatedAt timestamp default now()
);