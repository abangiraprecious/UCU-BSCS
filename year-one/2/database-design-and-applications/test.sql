### Question One: Create and select a database named Uganda.
CREATE DATABASE Ug;

USE Ug;

### Question Two:Create tables named District and Citizen with the specified columns and relationships.
CREATE TABLE District (
    DistrictCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(15),
    Region VARCHAR(15)
);

DROP TABLE DISTRICT

CREATE TABLE Citizen (
    NIN INT PRIMARY KEY,
    Fname VARCHAR(3),
    Lname VARCHAR(15),
    Gender VARCHAR(10),
    DistrictCode VARCHAR(10),
    FOREIGN KEY (DistrictCode) REFERENCES District(DistrictCode)
);

### Question Three: Modify the Citizen and District tables to ensure that all columns are NOT NULL.
ALTER TABLE Citizen
MODIFY NIN INT NOT NULL,
MODIFY Fname VARCHAR(3) NOT NULL,
MODIFY Lname VARCHAR(15) NOT NULL,
MODIFY Gender VARCHAR(10) NOT NULL,
MODIFY DistrictCode VARCHAR(10) NOT NULL;

ALTER TABLE District 
MODIFY DistrictCode VARCHAR(10) NOT NULL,
MODIFY Name VARCHAR(15) NOT NULL,
MODIFY Region VARCHAR(15) NOT NULL;


### Question Four: Add a uniqueness constraint on the Name column of the District table.
ALTER TABLE District
ADD CONSTRAINT Unique_DistrictName UNIQUE (Name);

### Question Five: Add a check constraint to the Citizen table to ensure the Gender column can only contain 'Male' or 'Female'.
ALTER TABLE Citizen
ADD CONSTRAINT Check_Gender CHECK (Gender IN ('Male', 'Female'));

### Question Six: Add a check constraint to the Citizen table to ensure the NIN is at least 11 characters long.
ALTER TABLE Citizen 
ADD CONSTRAINT Check_NIN CHECK (LENGTH(NIN) >= 11);

### Question Seven: Modify the Fname column of the Citizen table to have a length of 15 characters.
ALTER TABLE Citizen
MODIFY Fname VARCHAR(15);


### Question Eight: Add a new column named Population to the District table, ensuring it is NOT NULL.
ALTER TABLE District
ADD COLUMN Population INT NOT NULL;

### Question Nine: Insert sample data into the District and Citizen tables. Change the data type of NIN in the Citizen table to BIGINT.
ALTER TABLE Citizen
MODIFY NIN BIGINT;

INSERT INTO District( DistrictCode, Name, Region, Population)
VALUES (
    '001',
    'Arua',
    'Northern-Uganda',
    '1000000'
);

INSERT INTO Citizen (NIN, Fname, Lname, Gender, DistrictCode)
VALUES (
    '12345678901',
    'Alexa',
    'Mulungi',
    'Female',
    '001'
);

### Question Ten: Create a view named view1 to count the total number of districts.
CREATE VIEW view1 AS
SELECT COUNT(*) AS TotalDistricts FROM District;

### Question Eleven: Create a view named view2 to concatenate the first name and last name of citizens into a full name.
CREATE VIEW view2 AS
SELECT CONCAT('Fname', ' ', 'Lname') AS FullName FROM Citizen;

### Question Twelve: Create a view named view3 to select all citizens from districts in the Northern region.
CREATE view3 AS
SELECT 

### Question Thirteen: Create a view named view4 to select districts where the name starts with 'A'.
CREATE VIEW view4 AS
SELECT * FROM District
WHERE Name LIKE 'A%';

### Question Fourteen: Create a view named view5 to calculate the total population of all districts.
CREATE VIEW view5 AS
SELECT SUM(Population) AS TotalPopulation FROM District;

### Question Fifteen: Create a view named view6 to select the district with the highest population.
CREATE VIEW view6 AS 
SELECT * FROM District
WHERE Population = (SELECT MAX(Population) FROM District);
