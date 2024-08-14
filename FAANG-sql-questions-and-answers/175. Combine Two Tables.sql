-- Question 1. 175. Combine Two Tables

--Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:

--FirstName, LastName, City, State

--Solution:

SELECT
    p.FirstName
    , P.LastName
    , A.City
    , A.State
FROM
    Person P
LEFT JOIN 
    Address A 
    ON P.PersonId = A.PersonId;



--REFERENCES

-- Create the Person table
CREATE TABLE Person (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create the Address table
CREATE TABLE Address (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(100),
    State VARCHAR(100),
    FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

-- Insert data into the Person table
INSERT INTO Person (PersonId, FirstName, LastName)
VALUES 
(1, 'John', 'Doe'),          -- Person with an address
(2, 'Jane', 'Smith'),        -- Person with an address
(3, 'Emily', 'Jones'),       -- Person with an address
(4, 'Michael', 'Brown'),     -- Person without an address
(5, 'Sarah', 'Davis'),       -- Person with an address
(6, 'David', 'Wilson'),      -- Person without an address
(7, 'Laura', 'Taylor'),      -- Person with multiple addresses (edge case)
(8, 'Robert', 'Moore'),      -- Person with an empty last name (edge case)
(9, 'Daniel', 'Garcia'),     -- Person with NULL as the last name (edge case)
(10, 'Sophia', 'Lopez');     -- Person without an address

-- Insert data into the Address table
INSERT INTO Address (AddressId, PersonId, City, State)
VALUES 
(1, 1, 'New York', 'NY'),         -- Standard case
(2, 2, 'Los Angeles', 'CA'),      -- Standard case
(3, 3, 'Chicago', 'IL'),          -- Standard case
(4, 5, 'Houston', 'TX'),          -- Standard case
(5, 7, 'San Francisco', 'CA'),    -- Multiple addresses for one person (edge case)
(6, 7, 'Oakland', 'CA'),          -- Multiple addresses for one person (edge case)
(7, 8, 'Las Vegas', 'NV'),        -- Address for person with an empty last name
(8, 9, 'Miami', 'FL'),            -- Address for person with a NULL last name
(9, 9, NULL, NULL),               -- Address with NULL city and state (edge case)
(10, 7, '', '');                  -- Address with empty city and state (edge case)