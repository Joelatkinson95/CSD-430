-- Joel Atkinson
-- CSD430 Server Side Development
-- SQL Script: Create DB, user, permissions, table, and populate data
-- Database: CSD430
-- User: student1
-- Password: pass
-- Table: Joel_states_data

/* 1) Create Database */

CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

/* 2) Create User + Password */

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
ALTER USER 'student1'@'localhost' IDENTIFIED BY 'pass';

/* 3) Grant Permissions */

GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';

/* 4) Drop + Create Table */

DROP TABLE IF EXISTS Joel_states_data;

CREATE TABLE Joel_states_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_code VARCHAR(2) NOT NULL,
    state_name VARCHAR(50) NOT NULL,
    capital VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    population BIGINT NOT NULL,
    year_founded INT NOT NULL
);

/* 5) Populate Table */

INSERT INTO Joel_states_data
(state_code, state_name, capital, region, population, year_founded)
VALUES
('AZ','Arizona','Phoenix','Southwest',7623818,1912),
('FL','Florida','Tallahassee','Southeast',23462518,1845),
('NE','Nebraska','Lincoln','Midwest',1961996,1867),
('WA','Washington','Olympia','Pacific Northwest',8001020,1889),
('HI','Hawaii','Honolulu','West',1432820,1959),
('NY','New York','Albany','Northeast',20203696,1788),
('MI','Michigan','Lansing','Midwest',10254700,1837),
('AL','Alabama','Montgomery','Southeast',5237750,1819),
('MA','Massachusetts','Boston','Northeast',7275380,1788),
('IL','Illinois','Springfield','Midwest',12846000,1818),
('OR','Oregon','Salem','Pacific Northwest',4309810,1859),
('TX','Texas','Austin','Southwest',32416700,1845),
('CA','California','Sacramento','West',39896400,1850),
('PA','Pennsylvania','Harrisburg','Northeast',13200800,1787),
('CO','Colorado','Denver','West',6069800,1876);

