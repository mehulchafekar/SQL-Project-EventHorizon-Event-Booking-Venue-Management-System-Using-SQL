CREATE DATABASE Event_Horizon;
USE Event_Horizon;
DROP DATABASE IF EXISTS Event_Horizon;

DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Attendee;
DROP TABLE IF EXISTS Venue;
DROP TABLE IF EXISTS Vendor;
DROP TABLE IF EXISTS Task;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Budget;
DROP TABLE IF EXISTS event_coordinator;

-- create table for Venus --

CREATE TABLE Venue (
    VenueID INT PRIMARY KEY,
    VenueName VARCHAR(100),
    Location VARCHAR(100),
    Capacity INT
);

-- create table for attendee --
CREATE TABLE Attendee (
    AttendeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);


-- create table Event_Coordinator
CREATE TABLE Event_Coordinator (
    Coordinator_ID INT PRIMARY KEY  AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50));


-- create table for Vendor  --

CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(100),
    ServiceType VARCHAR(50),
    ContactInfo VARCHAR(100)
);


-- create table for Events 
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    VenueID INT,
    BudgetID INT,
    ScheduleID INT,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (BudgetID) REFERENCES Budget(BudgetID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID)
);


ALTER TABLE Events
ADD FOREIGN KEY (EventID) REFERENCES Attendee(AttendeeID);

-- create table for Task --
CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    TaskName VARCHAR(100),
    EventID INT,
    AssignedTo INT,
    DueDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (AssignedTo) REFERENCES Event_Coordinator(Coordinator_ID)
);


--  create table for Schedule -- 

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    EventID INT,
    StartTime TIME,
    EndTime TIME,
    Activity VARCHAR(100)
);


-- create table for Budget -- 

CREATE TABLE Budget (
    BudgetID INT PRIMARY KEY,
    EventID INT,
    TotalAmount DECIMAL(10, 2),
    AmountSpent DECIMAL(10, 2)
);


CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    EventID INT,
    AttendeeID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee (AttendeeID)
);


SHOW TABLES;



DESCRIBE Events;
DESCRIBE Attendee;
DESCRIBE Venue;
DESCRIBE Vendor;
DESCRIBE Task;
DESCRIBE Schedule;
DESCRIBE Budget;
DESCRIBE event_coordinator;
DESCRIBE Feedback;

INSERT INTO Venue (VenueID, VenueName, Location, Capacity) VALUES
(1, 'Taj Mahal Palace', 'Mumbai', 500),
(2, 'Leela Palace', 'Bengaluru', 300),
(3, 'ITC Grand Chola', 'Chennai', 700),
(4, 'The Oberoi', 'New Delhi', 400),
(5, 'Hyatt Regency', 'Kolkata', 350),
(6, 'JW Marriott', 'Pune', 450),
(7, 'The Lalit', 'Mumbai', 600),
(8, 'Radisson Blu', 'Jaipur', 500),
(9, 'Vivanta by Taj', 'Hyderabad', 550),
(10, 'The Leela', 'Goa', 300),
(11, 'Novotel', 'Visakhapatnam', 400),
(12, 'The Westin', 'Gurgaon', 350),
(13, 'Sheraton Grand', 'Bengaluru', 450),
(14, 'Renaissance', 'Mumbai', 500),
(15, 'Fairmont', 'Jaipur', 600),
(16, 'Hilton', 'Chennai', 400),
(17, 'Trident', 'Udaipur', 300),
(18, 'Four Seasons', 'Mumbai', 350),
(19, 'Park Hyatt', 'Hyderabad', 450),
(20, 'Grand Hyatt', 'Kochi', 500),
(21, 'Marriott', 'Ahmedabad', 400),
(22, 'Holiday Inn', 'Agra', 300),
(23, 'Courtyard by Marriott', 'Bhopal', 350),
(24, 'Le Meridien', 'Nagpur', 450),
(25, 'Radisson', 'Lucknow', 500);




INSERT INTO Attendee (AttendeeID, FirstName, LastName, Email, PhoneNumber) VALUES
(1, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
(2, 'Priya', 'Rao', 'priya.rao@example.com', '9876543211'),
(3, 'Rahul', 'Verma', 'rahul.verma@example.com', '9876543212'),
(4, 'Sneha', 'Patel', 'sneha.patel@example.com', '9876543213'),
(5, 'Vikram', 'Singh', 'vikram.singh@example.com', '9876543214'),
(6, 'Anjali', 'Nair', 'anjali.nair@example.com', '9876543215'),
(7, 'Rohit', 'Kumar', 'rohit.kumar@example.com', '9876543216'),
(8, 'Pooja', 'Desai', 'pooja.desai@example.com', '9876543217'),
(9, 'Suresh', 'Reddy', 'suresh.reddy@example.com', '9876543218'),
(10, 'Meera', 'Iyer', 'meera.iyer@example.com', '9876543219'),
(11, 'Arjun', 'Gupta', 'arjun.gupta@example.com', '9876543220'),
(12, 'Kavita', 'Joshi', 'kavita.joshi@example.com', '9876543221'),
(13, 'Manish', 'Bhatia', 'manish.bhatia@example.com', '9876543222'),
(14, 'Neha', 'Kapoor', 'neha.kapoor@example.com', '9876543223'),
(15, 'Sanjay', 'Mishra', 'sanjay.mishra@example.com', '9876543224'),
(16, 'Ritu', 'Shah', 'ritu.shah@example.com', '9876543225'),
(17, 'Deepak', 'Chauhan', 'deepak.chauhan@example.com', '9876543226'),
(18, 'Asha', 'Menon', 'asha.menon@example.com', '9876543227'),
(19, 'Karan', 'Malhotra', 'karan.malhotra@example.com', '9876543228'),
(20, 'Sunita', 'Rana', 'sunita.rana@example.com', '9876543229'),
(21, 'Rajesh', 'Pandey', 'rajesh.pandey@example.com', '9876543230'),
(22, 'Divya', 'Agarwal', 'divya.agarwal@example.com', '9876543231'),
(23, 'Nitin', 'Saxena', 'nitin.saxena@example.com', '9876543232'),
(24, 'Shweta', 'Bose', 'shweta.bose@example.com', '9876543233'),
(25, 'Vikas', 'Mehta', 'vikas.mehta@example.com', '9876543234');



INSERT INTO Event_Coordinator ( FirstName, LastName ) VALUES
('Amey', 'patil'),
( 'Sneha', 'Shinde'),
( 'Tanvi', 'singh' ),
( 'Ashish', 'Pandey' ),
( 'Pratiksha', 'Patil'),
( 'Isha', 'Shinde'),
( 'Sameer', 'Jadhav'),
( 'Rohan', 'Pawar'),
( 'Asif', 'Khan'),
( 'Omkar', 'Saxena'),
( 'Vikas', 'chauhan'),
( 'Rina', 'Khan'),
( 'Amruta', 'Desai'),
( 'kavita', 'Mishra'),
( 'prashant', 'Patil'),
( 'Rahul', 'More'),
( 'Harshala', 'Shinde'),
( 'Shraddha', 'Kapoor'),
( 'Avdhoot', 'Patil'),
( 'Aniket', 'Mishra'),
( 'Shrikant', 'Rathod'),
( 'Tarun', 'Patel'),
( 'Vaibhav', 'Salunke'),
( 'Rajendra', 'Aher'),
( 'Simran', 'Patel');



INSERT INTO Vendor (VendorID, VendorName, ServiceType, ContactInfo) VALUES
(1, 'Saffron Catering', 'Catering', 'saffron@example.com'),
(2, 'Sound Masters', 'Sound System', 'soundmasters@example.com'),
(3, 'Floral Fantasy', 'Decorations', 'floralfantasy@example.com'),
(4, 'Event Planners Inc.', 'Event Planning', 'eventplanners@example.com'),
(5, 'Tech Solutions', 'AV Equipment', 'techsolutions@example.com'),
(6, 'Gourmet Delights', 'Catering', 'gourmetdelights@example.com'),
(7, 'StageCraft', 'Stage Setup', 'stagecraft@example.com'),
(8, 'LightWorks', 'Lighting', 'lightworks@example.com'),
(9, 'Music Mania', 'DJ Services', 'musicmania@example.com'),
(10, 'PhotoPerfect', 'Photography', 'photoperfect@example.com'),
(11, 'VideoVision', 'Videography', 'videovision@example.com'),
(12, 'Royal Rides', 'Transportation', 'royalrides@example.com'),
(13, 'Security Solutions', 'Security', 'securitysolutions@example.com'),
(14, 'CleanSweep', 'Cleaning Services', 'cleansweep@example.com'),
(15, 'Green Gardens', 'Landscaping', 'greengardens@example.com'),
(16, 'Party Rentals', 'Equipment Rentals', 'partyrentals@example.com'),
(17, 'Sweet Treats', 'Desserts', 'sweettreats@example.com'),
(18, 'Beverage Bliss', 'Beverages', 'beveragebliss@example.com'),
(19, 'Crafty Creations', 'Handmade Decor', 'craftycreations@example.com'),
(20, 'Elegant Events', 'Event Coordination', 'elegantevents@example.com'),
(21, 'SoundWave', 'Sound System', 'soundwave@example.com'),
(22, 'Bright Lights', 'Lighting', 'brightlights@example.com'),
(23, 'Perfect Prints', 'Printing Services', 'perfectprints@example.com'),
(24, 'Luxury King', 'King Rentals', 'luxurylinens@example.com'),
(25, 'Fun Fiesta', 'Entertainment', 'funfiesta@example.com');



INSERT INTO Budget (BudgetID, EventID, TotalAmount, AmountSpent) VALUES
(1, 1, 500000.00, 250000.00),
(2, 2, 300000.00, 150000.00),
(3, 3, 700000.00, 350000.00),
(4, 4, 400000.00, 200000.00),
(5, 5, 350000.00, 175000.00),
(6, 6, 450000.00, 225000.00),
(7, 7, 600000.00, 300000.00),
(8, 8, 550000.00, 275000.00),
(9, 9, 500000.00, 250000.00),
(10, 10, 650000.00, 325000.00),
(11, 11, 300000.00, 150000.00),
(12, 12, 400000.00, 200000.00),
(13, 13, 350000.00, 175000.00),
(14, 14, 450000.00, 225000.00),
(15, 15, 500000.00, 250000.00),
(16, 16, 600000.00, 300000.00),
(17, 17, 550000.00, 275000.00),
(18, 18, 500000.00, 250000.00),
(19, 19, 650000.00, 325000.00),
(20, 20, 300000.00, 150000.00),
(21, 21, 400000.00, 200000.00),
(22, 22, 350000.00, 175000.00),
(23, 23, 450000.00, 225000.00),
(24, 24, 500000.00, 250000.00),
(25, 25, 600000.00, 300000.00);




INSERT INTO Schedule (ScheduleID, EventID, StartTime, EndTime, Activity) VALUES
(1, 1, '08:00', '09:00', 'Bride and Groom Getting Ready'),
(2, 1, '09:00', '10:00', 'Wedding Ceremony'),
(3, 1, '10:00', '11:00', 'Wedding Photoshoot'),
(4, 1, '11:00', '12:00', 'Wedding Reception'),
(5, 2, '18:00', '19:00', 'Birthday Party Setup'),
(6, 2, '19:00', '20:00', 'Birthday Cake Cutting'),
(7, 2, '20:00', '21:00', 'Birthday Dinner'),
(8, 2, '21:00', '22:00', 'Birthday Dance Party'),
(9, 3, '10:00', '11:00', 'Engagement Ceremony'),
(10, 3, '11:00', '12:00', 'Engagement Lunch'),
(11, 3, '12:00', '13:00', 'Engagement Photoshoot'),
(12, 4, '09:00', '10:00', 'Anniversary Celebration Setup'),
(13, 4, '10:00', '11:00', 'Anniversary Ceremony'),
(14, 4, '11:00', '12:00', 'Anniversary Lunch'),
(15, 4, '12:00', '13:00', 'Anniversary Dance'),
(16, 5, '17:00', '18:00', 'Baby Shower Setup'),
(17, 5, '18:00', '19:00', 'Baby Shower Games'),
(18, 5, '19:00', '20:00', 'Baby Shower Dinner'),
(19, 5, '20:00', '21:00', 'Baby Shower Gift Opening'),
(20, 6, '08:00', '09:00', 'Housewarming Setup'),
(21, 6, '09:00', '10:00', 'Housewarming Ceremony'),
(22, 6, '10:00', '11:00', 'Housewarming Breakfast'),
(23, 6, '11:00', '12:00', 'Housewarming Tour'),
(24, 7, '18:00', '19:00', 'Retirement Party Setup'),
(25, 7, '19:00', '20:00', 'Retirement Speech');










INSERT INTO Events (EventID, EventName, EventDate, VenueID, BudgetID, ScheduleID) VALUES
(1, 'Amit and Priya Wedding', '2024-12-05', 1, 1, 1),
(2, 'Rohan Birthday Bash', '2024-11-15', 2, 2, 2),
(3, 'Corporate Annual Meet', '2024-10-20', 3, 3, 3),
(4, 'Diwali Celebration', '2024-09-25', 4, 4, 4),
(5, 'Sangeet Night', '2024-08-30', 5, 5, 5),
(6, 'New Year Party', '2024-07-15', 6, 6, 6),
(7, 'Baby Shower', '2024-06-10', 7, 7, 7),
(8, 'Golden Jubilee Anniversary', '2024-05-05', 8, 8, 8),
(9, 'College Reunion', '2024-04-20', 9, 9, 9),
(10, 'Christmas Gala', '2024-03-15', 10, 10, 10),
(11, 'Product Launch', '2024-02-10', 11, 11, 11),
(12, 'Charity Fundraiser', '2024-01-05', 12, 12, 12),
(13, 'Ganesh Chaturthi', '2023-12-20', 13, 13, 13),
(14, 'Navratri Garba Night', '2023-11-15', 14, 14, 14),
(15, 'Wedding Reception', '2023-10-10', 15, 15, 15),
(16, 'Book Launch', '2023-09-05', 16, 16, 16),
(17, 'Photography Exhibition', '2023-08-01', 17, 17, 17),
(18, 'Dance Competition', '2023-07-25', 18, 18, 18),
(19, 'Yoga Retreat', '2023-06-20', 19, 19, 19),
(20, 'Tech Hackathon', '2023-05-15', 20, 20, 20),
(21, 'Startup Pitch', '2023-04-10', 21, 21, 21),
(22, 'Music Concert', '2023-03-05', 22, 22, 22),
(23, 'Art Workshop', '2023-02-01', 23, 23, 23),
(24, 'Family Function', '2023-01-15', 24, 24, 24),
(25, 'School Annual Day', '2022-12-10', 25, 25, 25);




INSERT INTO Task (TaskID, TaskName, EventID, AssignedTo, DueDate, Status) VALUES
(1, 'Setup Stage', 1, 1, '2024-12-04', 'Pending'),
(2, 'Arrange Catering', 2, 2, '2024-11-14', 'Completed'),
(3, 'Book Photographer', 3, 3, '2024-10-19', 'Pending'),
(4, 'Send Invitations', 4, 4, '2024-09-24', 'Completed'),
(5, 'Decorate Venue', 5, 5, '2024-08-29', 'In Progress'),
(6, 'Arrange Sound System', 6, 6, '2024-07-14', 'Pending'),
(7, 'Organize Seating', 7, 7, '2024-06-09', 'Completed'),
(8, 'Coordinate with Vendors', 8, 8, '2024-05-04', 'In Progress'),
(9, 'Prepare Welcome Kits', 9, 9, '2024-04-19', 'Pending'),
(10, 'Setup Registration Desk', 10, 10, '2024-03-14', 'Completed'),
(11, 'Arrange Transportation', 11, 11, '2024-02-09', 'Pending'),
(12, 'Plan Activities', 12, 12, '2024-01-04', 'In Progress'),
(13, 'Manage Social Media', 13, 13, '2023-12-19', 'Completed'),
(14, 'Coordinate Security', 14, 14, '2023-11-14', 'Pending'),
(15, 'Setup Lighting', 15, 15, '2023-10-09', 'In Progress'),
(16, 'Arrange Accommodation', 16, 16, '2023-09-04', 'Completed'),
(17, 'Organize Food Stalls', 17, 17, '2023-08-19', 'Pending'),
(18, 'Plan Entertainment', 18, 18, '2023-07-14', 'In Progress'),
(19, 'Setup Help Desk', 19, 19, '2023-06-09', 'Completed'),
(20, 'Arrange Medical Aid', 20, 20, '2023-05-04', 'Pending'),
(21, 'Coordinate Volunteers', 21, 21, '2023-04-19', 'In Progress'),
(22, 'Setup Wi-Fi', 22, 22, '2023-03-14', 'Completed'),
(23, 'Manage Budget', 23, 23, '2023-02-09', 'Pending'),
(24, 'Plan Backup Power', 24, 24, '2023-01-04', 'In Progress'),
(25, 'Arrange Cleanup Crew', 25, 25, '2022-12-19', 'Completed');



INSERT INTO Feedback (FeedbackID, EventID, AttendeeID, Rating, Comments) VALUES
(1, 1, 1, 5, 'Excellent event! Very well organized.'),
(2, 1, 2, 4, 'Great wedding ceremony, loved the decorations.'),
(3, 2, 3, 5, 'Amazing birthday party, had a lot of fun!'),
(4, 2, 4, 3, 'Good event, but the music was too loud.'),
(5, 3, 5, 4, 'Engagement ceremony was beautiful.'),
(6, 3, 6, 5, 'Loved the engagement lunch, very tasty food.'),
(7, 4, 7, 4, 'Anniversary celebration was well planned.'),
(8, 4, 8, 3, 'Anniversary dance was enjoyable.'),
(9, 5, 9, 5, 'Baby shower games were fun and engaging.'),
(10, 5, 10, 4, 'Baby shower dinner was delicious.'),
(11, 6, 11, 5, 'Housewarming ceremony was very welcoming.'),
(12, 6, 12, 4, 'Housewarming breakfast was good.'),
(13, 7, 13, 5, 'Retirement party was a great success.'),
(14, 7, 14, 4, 'Retirement speech was very touching.'),
(15, 8, 15, 5, 'Corporate annual meet was very informative.'),
(16, 8, 16, 4, 'Corporate event was well organized.'),
(17, 9, 17, 5, 'Diwali celebration was vibrant and colorful.'),
(18, 9, 18, 4, 'Diwali decorations were beautiful.'),
(19, 10, 19, 5, 'New Year party was fantastic.'),
(20, 10, 20, 4, 'New Year dinner was delicious.'),
(21, 11, 21, 5, 'Sangeet night was full of fun and dance.'),
(22, 11, 22, 4, 'Sangeet performances were amazing.'),
(23, 12, 23, 5, 'Christmas gala was very festive.'),
(24, 12, 24, 4, 'Christmas dinner was great.'),
(25, 13, 25, 5, 'Ganesh Chaturthi celebration was very spiritual.');



SELECT * FROM Events;
SELECT * FROM Attendee;
SELECT * FROM Venue;
SELECT * FROM Vendor;
SELECT * FROM Task;
SELECT * FROM Schedule;
SELECT * FROM Budget;
SELECT * FROM feedback;
SELECT * FROM event_coordinator;

-- Sub_Queries --

-- Question no 1 : List the attendees who have attended events with a rating of 5.

SELECT FirstName, LastName FROM Attendee
WHERE AttendeeID IN ( SELECT AttendeeID FROM Feedback
WHERE Rating = 5);


-- Question no 2 : Find events with tasks that are assigned but are not yet completed.

SELECT EventName FROM Events
WHERE EventID IN (SELECT EventID FROM Task
WHERE Status != 'Completed');


-- Question no 3 :  Find the event names that have a budget greater than the average total budget for all events.

SELECT EventName FROM Events
WHERE BudgetID IN (SELECT BudgetID FROM Budget
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Budget));


-- Question no 4 :  Find the names of events that have received feedback with comments containing the word ‘excellent’.

SELECT EventName FROM Events
WHERE EventID IN (SELECT EventID FROM Feedback WHERE Comments LIKE '%excellent%');



-- Question no 5 : Find the names of events scheduled to start before 9 AM.

SELECT EventName FROM Events 
WHERE ScheduleID IN (SELECT ScheduleID FROM Schedule 
WHERE StartTime < '09:00:00');


-- Question no 6 : Find the names of venues that have hosted events with a budget greater than 400,000.

SELECT VenueName FROM Venue 
WHERE VenueID IN (SELECT VenueID FROM Events 
WHERE BudgetID IN (SELECT BudgetID FROM Budget 
WHERE TotalAmount > 400000));


-- Question no 7 : Find the names of events that have tasks assigned to Sameer jadhav.

SELECT EventName FROM Events 
WHERE EventID IN ( SELECT EventID FROM Task WHERE AssignedTo = ( SELECT coordinator_ID FROM event_coordinator
WHERE FirstName = 'Sameer' AND LastName = 'Jadhav'));



-- Alternative Way Using IN Operator --
SELECT EventName FROM Events 
WHERE EventID IN (SELECT EventID FROM Task WHERE AssignedTo IN (SELECT coordinator_ID FROM event_coordinator
WHERE FirstName = 'Isha' AND LastName = 'Shinde'));


-- Question no 8 : List events that are held in venues with a capacity greater than the average venue capacity.

SELECT EventName FROM Events
WHERE VenueID IN (SELECT VenueID FROM Venue
WHERE Capacity > (SELECT AVG(Capacity) FROM Venue));


-- Question no 9: Find the details of tasks for events that have at least one attendee who gave a rating below 4.

SELECT TaskID, TaskName FROM Task
WHERE EventID IN (SELECT EventID FROM Feedback WHERE Rating < 4);


-- Question 10 : Find the Task Assigned to Coordinator Isha Shinde

SELECT TaskName FROM task 
WHERE AssignedTo = ( SELECT coordinator_ID FROM event_coordinator
WHERE FirstName = 'Isha' AND LastName = 'Shinde');




-- Joins-- 

-- Question no 1: show a list of all tasks and the associated event names.

SELECT T.TaskName, E.EventName FROM Task AS T
JOIN Events AS E ON T.EventID = E.EventID;



-- Question no 2: Find the list of all events along with the venue name


SELECT E.EventName, V.VenueName
FROM Events AS E
INNER JOIN Venue AS V ON E.VenueID = V.VenueID;


-- Question no 3: Find the event name and the total budget amount.


SELECT E.EventName, B.TotalAmount FROM Events AS E
 JOIN Budget AS B 
 ON E.BudgetID = B.BudgetID;


-- Question no 4: Find the list of tasks for each event along with the assigned coordinator full name.

SELECT E.EventName, T.TaskName, C.FirstName, C.LastName
FROM Task AS T
INNER JOIN Events AS E 
ON T.EventID = E.EventID
INNER JOIN event_coordinator AS C 
ON T.AssignedTo = C.Coordinator_ID;



-- Question no 5: Find the total amount spent for each event, along with the event name.

SELECT E.EventName, sum(B.AmountSpent) AS TotalSpent
FROM Events E
INNER JOIN Budget B ON E.BudgetID = B.BudgetID
GROUP BY E.EventName;


-- Question no 6: Find the list of events happening at a venue with a capacity of more than 500.

SELECT E.EventName, V.VenueName, V.Capacity FROM Events AS E
INNER JOIN Venue AS V
ON E.VenueID = V.VenueID
WHERE V.Capacity > 500;



-- Question no 7: Find the list of all events and the number of feedback comments each event has received.

SELECT E.EventName, COUNT(F.FeedbackID) AS FeedbackCount
FROM Events E
LEFT JOIN Feedback F ON E.EventID = F.EventID
GROUP BY E.EventName;


-- Question no 8: Find the  attendees for a specific event like Wedding Reception

SELECT A.FirstName, A.LastName, A.Email 
FROM Attendee A
JOIN Events AS E
ON A.AttendeeID = E.eventID
WHERE E.EventName = 'Wedding Reception';


-- Question no 9: Calculate Total Budget vs. Amount Spent for Each Event

SELECT E.EventName, B.TotalAmount, B.AmountSpent 
FROM Events AS E
JOIN Budget AS B 
ON E.BudgetID = B.BudgetID;



-- Question no 10  Display the Event name , tasks assigned for a particular event, including their statuses and assigned coordinator.

SELECT E.EventName ,T.TaskName, T.DueDate, T.Status, C.FirstName, C.LastName 
FROM Task AS T
JOIN event_coordinator C ON T.AssignedTo = C.Coordinator_ID
JOIN events AS E ON T.EventID = E.EventID
WHERE T.EventID = 5;


-- Question no 11: find the names and dates of all events that are being held at a specific venue  like leela palace.

SELECT EventName, EventDate FROM Events AS E
JOIN venue AS V 
ON V.venueID = E.EventID
WHERE Venuename = 'leela palace';


-- Question no 12:  FIND how much of the total budget is remaining for each event.
 
SELECT E.EventName, (B.TotalAmount - B.AmountSpent) AS BudgetRemaining FROM Events AS E
JOIN Budget AS B 
ON E.BudgetID = B.BudgetID
order by BudgetRemaining DESC;




-- Normal Query -- 

-- Question no 1: Find the number of tasks completed for each event

SELECT EventID, COUNT(*) AS CompletedTasks FROM Task
WHERE Status = 'Completed'
GROUP BY EventID;



-- Question no 2: List the vendors offering a specific service type like Catering

SELECT VendorName, servicetype, ContactInfo FROM Vendor
WHERE ServiceType = 'Catering';



-- Question no 3: Display all events scheduled between two specific dates 2024-01-01 AND 2024-12-31

SELECT EventName, EventDate FROM Events
WHERE EventDate BETWEEN '2024-01-01' AND '2024-12-31';



 -- Question no 4: find the full schedule of activities for a birthday cake cutting event
 
SELECT Activity, StartTime, EndTime FROM Schedule 
WHERE Activity = 'Birthday Cake Cutting';



-- Question no 5: find all the attendees whose first name starts with 's' in the Attendee table.

SELECT * FROM Attendee WHERE FirstName LIKE 'S%';




-- Question no 6: Find the unique service types provided by vendors in the Vendor table

SELECT  DISTINCT ServiceType FROM Vendor;




-- Question no 7: Find all tasks related to events and sort by DueDate

SELECT * FROM Task ORDER BY DueDate ASC;




-- Question no 8: Find which events are scheduled for specific venues with VenueID 1, 2, or 3

SELECT * FROM Events
 WHERE VenueID IN (1, 2, 3);




--  Question no 9: Find all Coordinator whose first name starts with 'A' and last name starts with 'P'

SELECT * FROM event_coordinator WHERE FirstName LIKE 'A%' AND LastName LIKE 'P%';




-- Question no 10: Find how many tasks are marked as In Progress

SELECT COUNT(*) FROM Task WHERE Status = 'In Progress';



-- Question no 11: Find all events where the total budget exceeds Rs 600000

SELECT EventID, SUM(TotalAmount) AS TotalBudget
FROM Budget 
GROUP BY EventID 
HAVING SUM(TotalAmount) > 600000;



-- Another Way to Solve --

SELECT EventID, TotalAmount
FROM Budget 
where TotalAmount > 600000;
