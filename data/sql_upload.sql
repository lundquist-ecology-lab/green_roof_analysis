-- Import into SQL database
-- Create database
-- Database: green_roof

create database if not exists green_roof;

-- Use database
use green_roof;

-- Table: soil_temp_data_September_2020

create table if not exists soil_temp_data_September_2020 (
    id int not null,
    day int null,
    soil_temp DECIMAL(5,3) null,
    logger int null,
    primary key(id))
    with system versioning
    partition by system_time (
    partition part_history history,
    partition part_current current
    );

-- Populate table 
load data local
infile 'soil_temp_data_September_2020.csv' 
into table soil_temp_data_September_2020 fields terminated by ',' 
ignore 1 rows; --Ignore the top row


-- Table: air_temp_and_light_data_October_2020

create table if not exists air_temp_and_light_data_October_2020 (
    id int not null,
    day int null,
    temperature DECIMAL(10,8) null,
    light_intensity int null,
    logger int null,
    primary key(id))
    with system versioning
    partition by system_time (
    partition part_history history,
    partition part_current current
    );

-- Populate table 
load data local
infile 'air_temp_and_light_data_October_2020.csv' 
into table air_temp_and_light_data_October_2020 fields terminated by ',' 
ignore 1 rows; --Ignore the top row

-- Table: terrace_biodiversity

create table if not exists terrace_biodiversity (
    id int not null,
    secton int null,
    genus VARCHAR(50) null,
    species VARCHAR(50) null,
    common_name VARCHAR(50) null,
    primary key(id))
    with system versioning
    partition by system_time (
    partition part_history history,
    partition part_current current
    );

-- Populate table 
load data local
infile 'terrace_biodiversity.csv' 
into table terrace_biodiversity fields terminated by ',' 
ignore 1 rows; --Ignore the top row

-- Table: terrace_abundance

create table if not exists terrace_abundance (
    id int not null,
    abundance int null,
    species VARCHAR(50) null,
    secton int null,
    primary key(id))
    with system versioning
    partition by system_time (
    partition part_history history,
    partition part_current current
    );

-- Populate table 
load data local
infile 'terrace_abundance.csv' 
into table terrace_abundance fields terminated by ',' 
ignore 1 rows; --Ignore the top row