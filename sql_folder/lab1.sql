/*create table exp*/
create table DETAILS(
    id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INTEGER NOT NULL,
    gender VARCHAR(1) NOT NULL,
    position VARCHAR(15) NOT NULL,
    department VARCHAR(20) NOT NULL,
    rate DECIMAL(7,2) NOT NULL,
    hours INTEGER NOT NULL
);
