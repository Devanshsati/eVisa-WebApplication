CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1101,1), -- Start Employee ID from 1101
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL, -- Use a larger size for passwords
    Location VARCHAR(100)
);

-- Create HR Table with specific ID start
CREATE TABLE HR (
    HRID INT PRIMARY KEY IDENTITY(5101,1), -- Start HR ID from 5101
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Location VARCHAR(100)
);

-- Create Admin Table with specific ID start
CREATE TABLE Admin (
    ADMINID INT PRIMARY KEY IDENTITY(9101,1), -- Start Admin ID from 9101
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Location VARCHAR(100)
);

-- Create Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(601,1), -- Start Feedback ID from 601
    EmployeeID INT NULL,
    HRID INT NULL,
    FeedbackDate DATE NOT NULL,
    FeedbackText TEXT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (HRID) REFERENCES HR(HRID) ON DELETE CASCADE,
    CHECK (
        (EmployeeID IS NOT NULL AND HRID IS NULL) OR 
        (EmployeeID IS NULL AND HRID IS NOT NULL)
    )
);


CREATE TABLE VisaStatus (
    VisaID INT PRIMARY KEY IDENTITY(101,1), -- Start Visa ID from 101
    EmployeeID INT NOT NULL,
    VisaType VARCHAR(50),
    VisaExpiry DATE,
    RenewalRequested VARCHAR(5) CHECK (RenewalRequested IN ('YES', 'NO')),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


-- Create the Applicant Report table
CREATE TABLE ApplicantReport (
    ReportID INT PRIMARY KEY IDENTITY(201,1), -- Start Report ID from 1101
    EmployeeID INT NOT NULL,
    ReportDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create the Interview Report table
CREATE TABLE InterviewReport (
    InterviewID INT PRIMARY KEY IDENTITY(301,1), -- Start Interview ID from 1101
    EmployeeID INT NOT NULL,
    InterviewDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create the Result Report table
CREATE TABLE ResultReport (
    ResultID INT PRIMARY KEY IDENTITY(401,1), -- Start Result ID from 1101
    EmployeeID INT NOT NULL,
    ResultDate DATE,
    Result VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create the Onsite Report table
CREATE TABLE OnsiteReport (
    OnsiteID INT PRIMARY KEY IDENTITY(501,1), -- Start Onsite ID from 1101
    EmployeeID INT NOT NULL,
    ReportDate DATE,
    Details TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (Name, Username, Email, Password, Location) VALUES
('John Doe', 'johndoe', 'john.doe@example.com', 'Password1', 'New York'),
('Jane Smith', 'janesmith', 'jane.smith@example.com', 'Password2', 'Los Angeles'),
('Michael Johnson', 'michaelj', 'michael.johnson@example.com', 'Password3', 'Chicago'),
('Emily Davis', 'emilydavis', 'emily.davis@example.com', 'Password4', 'Houston'),
('David Wilson', 'davidwilson', 'david.wilson@example.com', 'Password5', 'Phoenix'),
('Sarah Brown', 'sarahbrown', 'sarah.brown@example.com', 'Password6', 'Philadelphia'),
('Jessica Taylor', 'jessicataylor', 'jessica.taylor@example.com', 'Password7', 'San Antonio'),
('Daniel Martinez', 'danielmartinez', 'daniel.martinez@example.com', 'Password8', 'San Diego'),
('Matthew Garcia', 'matthewgarcia', 'matthew.garcia@example.com', 'Password9', 'Dallas'),
('Linda Anderson', 'lindaanderson', 'linda.anderson@example.com', 'Password10', 'San Jose'),
('Paul Thomas', 'paulthomas', 'paul.thomas@example.com', 'Password11', 'Austin'),
('Laura Jackson', 'laurajackson', 'laura.jackson@example.com', 'Password12', 'Fort Worth'),
('Robert White', 'robertwhite', 'robert.white@example.com', 'Password13', 'Columbus'),
('Patricia Harris', 'patriciaharris', 'patricia.harris@example.com', 'Password14', 'Charlotte'),
('Charles Clark', 'charlesclark', 'charles.clark@example.com', 'Password15', 'San Francisco'),
('Michelle Lewis', 'michellelewis', 'michelle.lewis@example.com', 'Password16', 'Indianapolis'),
('Brian Lee', 'brianlee', 'brian.lee@example.com', 'Password17', 'Seattle'),
('Barbara Walker', 'barbarawalker', 'barbara.walker@example.com', 'Password18', 'Denver'),
('Jason Hall', 'jasonhall', 'jason.hall@example.com', 'Password19', 'Washington'),
('Helen Young', 'helenyoung', 'helen.young@example.com', 'Password20', 'Boston'),
('Kevin King', 'keving', 'kevin.king@example.com', 'Password21', 'El Paso'),
('Deborah Wright', 'deborahwright', 'deborah.wright@example.com', 'Password22', 'Detroit'),
('Jennifer Scott', 'jenniferscott', 'jennifer.scott@example.com', 'Password23', 'Nashville'),
('George Green', 'georgegreen', 'george.green@example.com', 'Password24', 'Memphis'),
('Nancy Adams', 'nancyadams', 'nancy.adams@example.com', 'Password25', 'Baltimore'),
('Edward Nelson', 'edwardnelson', 'edward.nelson@example.com', 'Password26', 'Milwaukee'),
('Dorothy Hill', 'dorothyhill', 'dorothy.hill@example.com', 'Password27', 'Albuquerque'),
('Andrew Ramirez', 'andrewramirez', 'andrew.ramirez@example.com', 'Password28', 'Tucson'),
('Rebecca Campbell', 'rebeccacampbell', 'rebecca.campbell@example.com', 'Password29', 'Fresno'),
('Samuel Mitchell', 'samuelmitchell', 'samuel.mitchell@example.com', 'Password30', 'Sacramento'),
('Katherine Perez', 'katherineperez', 'katherine.perez@example.com', 'Password31', 'Long Beach'),
('Jeremy Roberts', 'jeremyroberts', 'jeremy.roberts@example.com', 'Password32', 'Kansas City'),
('Emma Turner', 'emmaturner', 'emma.turner@example.com', 'Password33', 'Mesa'),
('Laura Phillips', 'lauraphillips', 'laura.phillips@example.com', 'Password34', 'Virginia Beach'),
('Dennis Evans', 'dennisevans', 'dennis.evans@example.com', 'Password35', 'Atlanta'),
('Steven Edwards', 'stevenedwards', 'steven.edwards@example.com', 'Password36', 'Colorado Springs'),
('Megan Collins', 'megancollins', 'megan.collins@example.com', 'Password37', 'Omaha'),
('Gregory Stewart', 'gregorystewart', 'gregory.stewart@example.com', 'Password38', 'Raleigh'),
('Christine Sanchez', 'christinesanchez', 'christine.sanchez@example.com', 'Password39', 'Miami'),
('Ronald Morris', 'ronaldmorris', 'ronald.morris@example.com', 'Password40', 'Cleveland'),
('Cheryl Rogers', 'cherylrogers', 'cheryl.rogers@example.com', 'Password41', 'Tulsa'),
('Rachel Reed', 'rachelreed', 'rachel.reed@example.com', 'Password42', 'Oakland'),
('Frank Cook', 'frankcook', 'frank.cook@example.com', 'Password43', 'Minneapolis'),
('Tina Morgan', 'tinamorgan', 'tina.morgan@example.com', 'Password44', 'Wichita'),
('Joe Bell', 'joebell', 'joe.bell@example.com', 'Password45', 'New Orleans'),
('Marie Bailey', 'mariebailey', 'marie.bailey@example.com', 'Password46', 'Arlington'),
('Theresa Rivera', 'theresarivera', 'theresa.rivera@example.com', 'Password47', 'Bakersfield'),
('Carlos Cooper', 'carloscooper', 'carlos.cooper@example.com', 'Password48', 'Tampa'),
('Ruth Gonzalez', 'ruthgonzalez', 'ruth.gonzalez@example.com', 'Password49', 'Honolulu'),
('Aaron Ward', 'aaronward', 'aaron.ward@example.com', 'Password50', 'Anaheim');


INSERT INTO HR (Name, Username, Email, Password, Location) VALUES
('Alice Williams', 'alicewilliams', 'alice.williams@hr.com', 'HRPassword1', 'New York'),
('Bob Johnson', 'bobjohnson', 'bob.johnson@hr.com', 'HRPassword2', 'Chicago'),
('Cathy Brown', 'cathybrown', 'cathy.brown@hr.com', 'HRPassword3', 'Los Angeles'),
('Daniel White', 'danielwhite', 'daniel.white@hr.com', 'HRPassword4', 'Houston'),
('Emma Green', 'emmagreen', 'emma.green@hr.com', 'HRPassword5', 'Phoenix'),
('Frank King', 'frankking', 'frank.king@hr.com', 'HRPassword6', 'Philadelphia'),
('Grace Lee', 'gracelee', 'grace.lee@hr.com', 'HRPassword7', 'San Diego'),
('Henry Harris', 'henryharris', 'henry.harris@hr.com', 'HRPassword8', 'Dallas'),
('Irene Martin', 'irenemartin', 'irene.martin@hr.com', 'HRPassword9', 'San Antonio'),
('Jack Thompson', 'jackthompson', 'jack.thompson@hr.com', 'HRPassword10', 'San Francisco'),
('Kelly Rodriguez', 'kellyrodriguez', 'kelly.rodriguez@hr.com', 'HRPassword11', 'Austin'),
('Liam Walker', 'liamwalker', 'liam.walker@hr.com', 'HRPassword12', 'Fort Worth');


INSERT INTO Admin (Name, Username, Email, Password, Location) VALUES
('Nina Scott', 'ninascott', 'nina.scott@admin.com', 'AdminPassword1', 'New York'),
('Oscar Lewis', 'oscarlewis', 'oscar.lewis@admin.com', 'AdminPassword2', 'Los Angeles'),
('Paul Turner', 'paulturner', 'paul.turner@admin.com', 'AdminPassword3', 'Chicago'),
('Quinn Young', 'quinnyoung', 'quinn.young@admin.com', 'AdminPassword4', 'Houston'),
('Rachel Hill', 'rachelhill', 'rachel.hill@admin.com', 'AdminPassword5', 'Phoenix'),
('Steve Baker', 'stevebaker', 'steve.baker@admin.com', 'AdminPassword6', 'Philadelphia'),
('Tina Adams', 'tinaadams', 'tina.adams@admin.com', 'AdminPassword7', 'San Diego'),
('Uma Torres', 'umatorres', 'uma.torres@admin.com', 'AdminPassword8', 'Dallas'),
('Victor Nelson', 'victornelson', 'victor.nelson@admin.com', 'AdminPassword9', 'San Antonio'),
('Wendy Mitchell', 'wendymitchell', 'wendy.mitchell@admin.com', 'AdminPassword10', 'San Francisco'),
('Xander Perez', 'xanderperez', 'xander.perez@admin.com', 'AdminPassword11', 'Austin'),
('Yvonne Rivera', 'yvonnerivera', 'yvonne.rivera@admin.com', 'AdminPassword12', 'Fort Worth'),
('Zoe Sanchez', 'zoesanchez', 'zoe.sanchez@admin.com', 'AdminPassword13', 'Columbus');

INSERT INTO VisaStatus (EmployeeID, VisaType, VisaExpiry, RenewalRequested) VALUES
(1101, 'H-1B', '2025-06-30', 'NO'),
(1102, 'L-1A', '2026-01-15', 'YES'),
(1103, 'B-2', '2024-09-10', 'NO'),
(1104, 'F-1', '2024-05-20', 'YES'),
(1105, 'H-2B', '2023-12-31', 'YES'),
(1106, 'O-1', '2025-11-05', 'NO'),
(1107, 'J-1', '2024-03-25', 'NO'),
(1108, 'TN', '2025-02-28', 'YES');


INSERT INTO OnsiteReport (EmployeeID, ReportDate, Details) VALUES
(1101, '2024-01-25', 'Onsite interview scheduled'),
(1102, '2024-02-28', 'Onsite interview completed'),
(1103, '2024-03-15', 'Final interview scheduled'),
(1104, '2024-04-20', 'Onsite interview canceled'),
(1105, '2024-05-15', 'Onsite interview successful'),
(1106, '2024-06-20', 'Onsite interview rescheduled'),
(1107, '2024-07-25', 'Onsite interview completed'),
(1108, '2024-08-30', 'Awaiting feedback');


INSERT INTO ResultReport (EmployeeID, ResultDate, Result) VALUES
(1101, '2024-01-20', 'Approved'),
(1102, '2024-02-25', 'Denied'),
(1103, '2024-03-30', 'Approved'),
(1104, '2024-04-05', 'Approved'),
(1105, '2024-05-10', 'Denied'),
(1106, '2024-06-15', 'Approved'),
(1107, '2024-07-20', 'Denied'),
(1108, '2024-08-25', 'Approved');


INSERT INTO InterviewReport (EmployeeID, InterviewDate, Status) VALUES
(1101, '2024-01-15', 'Passed'),
(1102, '2024-02-20', 'Failed'),
(1103, '2024-03-25', 'Passed'),
(1104, '2024-04-30', 'Passed'),
(1105, '2024-05-05', 'Failed'),
(1106, '2024-06-10', 'Passed'),
(1107, '2024-07-15', 'Failed'),
(1108, '2024-08-20', 'Passed');



INSERT INTO ApplicantReport (EmployeeID, ReportDate, Status) VALUES
(1101, '2024-01-10', 'Pending'),
(1102, '2024-02-15', 'Approved'),
(1103, '2024-03-20', 'Rejected'),
(1104, '2024-04-25', 'Pending'),
(1105, '2024-05-30', 'Approved'),
(1106, '2024-06-05', 'Pending'),
(1107, '2024-07-10', 'Rejected'),
(1108, '2024-08-15', 'Approved');

INSERT INTO Feedback (EmployeeID, HRID, FeedbackDate, FeedbackText) VALUES
(1101, NULL, '2024-01-10', 'Great communication during the onboarding process.'),
(1102, NULL, '2024-02-15', 'Need more clarity on the job responsibilities.'),
(1103, NULL, '2024-03-20', 'Fantastic support from HR regarding benefits.'),
(NULL, 5101, '2024-01-12', 'Employee performance evaluation was thorough.'),
(NULL, 5102, '2024-02-18', 'HR should improve response times for queries.'),
(NULL, 5103, '2024-03-22', 'Excellent feedback on the new policy implementation.'),
(1104, NULL, '2024-04-25', 'I appreciate the flexibility with work hours.'),
(NULL, 5104, '2024-05-30', 'HR could enhance the training programs available.'),
(1105, NULL, '2024-06-05', 'Feedback was constructive and helpful.'),
(NULL, 5105, '2024-07-10', 'Regular updates on company changes are helpful.');
