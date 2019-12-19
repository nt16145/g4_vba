-- 適宜置き換え
create role nt16145 login password 'nt16145';
create database r01_j4_exp;
grant all privileges on database r01_j4_exp to nt16145;