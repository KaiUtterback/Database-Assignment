-- Creating the database and selecting it
CREATE DATABASE IF NOT EXISTS fitness_center;
USE fitness_center;

-- Disabling safe update mode for the current session
SET SQL_SAFE_UPDATES = 0;

-- Creating Trainers table
CREATE TABLE IF NOT EXISTS Trainers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255)
);

-- Creating Members table
CREATE TABLE IF NOT EXISTS Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES Trainers(id)
);

-- Creating WorkoutSessions table
CREATE TABLE IF NOT EXISTS WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Inserting data into Trainers
INSERT INTO Trainers (id, name, specialty) VALUES
(1, 'Sarah Connor', 'Yoga'),
(2, 'Mark Ruff', 'Weight Training'),
(3, 'Lucy Hale', 'Pilates');

-- Inserting data into Members
INSERT INTO Members (id, name, age, trainer_id) VALUES
(1, 'Alice Johnson', 30, 1),
(2, 'Bob Lee', 25, 2),
(3, 'Charlie Brown', 28, 1),
(4, 'Jane Doe', 22, 3);

-- Inserting data into WorkoutSessions
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) VALUES
(1, 1, '2023-10-05', '08:00 AM', 'Yoga'),
(2, 2, '2023-10-05', '10:00 AM', 'Weight Training'),
(3, 3, '2023-10-05', '06:00 PM', 'Cardio'),
(4, 4, '2023-10-05', '09:00 AM', 'Pilates');

-- Update the session time for Jane Doe
UPDATE WorkoutSessions
SET session_time = '06:00 PM'
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe') AND session_date = '2023-10-05' AND session_time = '09:00 AM';

-- Delete records for John Smith from the Members table
DELETE FROM Members WHERE name = 'John Smith';

-- Re-enabling safe update mode after operations
SET SQL_SAFE_UPDATES = 1;

-- Queries to view the contents of each table
-- Viewing Trainers
SELECT * FROM Trainers;

-- Viewing Members
SELECT * FROM Members;

-- Viewing WorkoutSessions
SELECT * FROM WorkoutSessions;