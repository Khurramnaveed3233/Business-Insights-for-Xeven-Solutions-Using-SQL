CREATE DATABASE XevenSolutions;

USE XevenSolutions;

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(100) NOT NULL,
    Industry NVARCHAR(50),
    Country NVARCHAR(50),
    ContactEmail NVARCHAR(100) UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);

INSERT INTO Clients (ClientName, Industry, Country, ContactEmail)
VALUES
('ABC Tech', 'Healthcare', 'USA', 'contact@abctech.com'),
('Green Solutions', 'Environmental', 'Canada', 'info@greensolutions.ca'),
('EduSpark', 'Education', 'UK', 'support@eduspark.co.uk'),
('FinTech Innovators', 'Finance', 'Australia', 'hello@fintech.com'),
('Retail Pro', 'Retail', 'India', 'contact@retailpro.in'),
('Energy Axis', 'Energy', 'Germany', 'info@energyaxis.de'),
('MediCare Plus', 'Healthcare', 'USA', 'support@medicareplus.com'),
('AgriAdvance', 'Agriculture', 'Brazil', 'contact@agriadvance.com'),
('SkyHigh Drones', 'Aerospace', 'France', 'info@skyhighdrones.fr'),
('AutoDrive AI', 'Automotive', 'Japan', 'contact@autodriveai.jp');


CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ProjectName NVARCHAR(100),
    Status NVARCHAR(20) CHECK (Status IN ('Ongoing', 'Completed', 'Paused')),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(18,2),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Projects (ClientID, ProjectName, Status, StartDate, EndDate, Budget)
VALUES
(1, 'AI Chatbot for Healthcare', 'Completed', '2023-01-01', '2023-06-01', 15000.00),
(2, 'Environmental Data Insights', 'Ongoing', '2023-07-01', NULL, 25000.00),
(3, 'Student Performance Predictor', 'Paused', '2022-11-01', NULL, 10000.00),
(4, 'Financial Fraud Detection', 'Completed', '2022-01-01', '2022-12-31', 30000.00),
(5, 'Retail Recommendation System', 'Ongoing', '2023-05-01', NULL, 20000.00),
(6, 'Energy Consumption Optimization', 'Ongoing', '2023-08-01', NULL, 18000.00),
(7, 'AI Diagnostic Assistant', 'Completed', '2023-02-01', '2023-07-01', 22000.00),
(8, 'Crop Yield Predictor', 'Completed', '2022-06-01', '2022-11-01', 17000.00),
(9, 'Drone Navigation System', 'Paused', '2023-03-01', NULL, 12000.00),
(10, 'Autonomous Driving AI', 'Ongoing', '2023-09-01', NULL, 40000.00);


CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Role NVARCHAR(50),
    Department NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    HireDate DATE,
    Salary DECIMAL(18,2)
);

INSERT INTO Employees (FirstName, LastName, Role, Department, Email, HireDate, Salary)
VALUES
('Ali', 'Khan', 'AI Developer', 'AI Solutions', 'ali.khan@xeven.com', '2021-06-01', 80000),
('Ayesha', 'Ahmed', 'Data Analyst', 'Data Science', 'ayesha.ahmed@xeven.com', '2022-03-15', 70000),
('Bilal', 'Siddiqui', 'Project Manager', 'Management', 'bilal.siddiqui@xeven.com', '2020-09-10', 90000),
('Fatima', 'Hussain', 'UI/UX Designer', 'Design', 'fatima.hussain@xeven.com', '2023-01-05', 65000),
('Hamza', 'Sheikh', 'DevOps Engineer', 'DevOps', 'hamza.sheikh@xeven.com', '2019-11-25', 85000),
('Zainab', 'Ali', 'Data Scientist', 'AI Solutions', 'zainab.ali@xeven.com', '2021-08-14', 95000),
('Usman', 'Chaudhry', 'AI Developer', 'AI Solutions', 'usman.chaudhry@xeven.com', '2022-05-10', 78000),
('Amina', 'Farooq', 'Cybersecurity Analyst', 'Security', 'amina.farooq@xeven.com', '2020-03-20', 72000),
('Hassan', 'Raza', 'Business Analyst', 'Data Science', 'hassan.raza@xeven.com', '2022-09-30', 68000),
('Sara', 'Shah', 'Digital Marketer', 'Marketing', 'sara.shah@xeven.com', '2023-06-01', 60000);


CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Category NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);

INSERT INTO Services (ServiceName, Description, Category)
VALUES
('AI Chatbot Development', 'Intelligent chatbot solutions for various industries.', 'AI Development'),
('Predictive Analytics', 'Data-driven insights for decision-making.', 'Big Data'),
('Computer Vision', 'Image and video analysis using AI.', 'AI Development'),
('Sentiment Analysis', 'Natural language processing for sentiment tracking.', 'AI Development'),
('DevOps Automation', 'Streamlined development and deployment pipelines.', 'DevOps'),
('UI/UX Design', 'Creating user-friendly interfaces.', 'Design'),
('Natural Language Processing', 'AI solutions for language-related tasks.', 'AI Development'),
('Digital Marketing Analytics', 'Optimized marketing strategies using data.', 'Big Data'),
('Recommendation Systems', 'Personalized recommendations for users.', 'AI Development'),
('Cybersecurity Analytics', 'AI-driven security solutions.', 'Security');




CREATE TABLE ProjectAssignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    EmployeeID INT NOT NULL,
    AssignedDate DATE DEFAULT GETDATE(),
    Role NVARCHAR(50),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO ProjectAssignments (ProjectID, EmployeeID, Role)
VALUES
(1, 1, 'AI Developer'),
(1, 2, 'Data Analyst'),
(2, 6, 'Data Scientist'),
(2, 3, 'Project Manager'),
(3, 1, 'AI Developer'),
(3, 3, 'Project Manager'),
(4, 5, 'DevOps Engineer'),
(5, 7, 'AI Developer'),
(5, 4, 'UI/UX Designer'),
(6, 6, 'Data Scientist'),
(6, 5, 'DevOps Engineer'),
(7, 1, 'AI Developer'),
(7, 2, 'Data Analyst'),
(8, 9, 'Business Analyst'),
(9, 7, 'AI Developer'),
(10, 6, 'Data Scientist');


CREATE TABLE AI_Tools (
    ToolID INT IDENTITY(1,1) PRIMARY KEY,
    ToolName NVARCHAR(100),
    Description NVARCHAR(MAX),
    ClientID INT NOT NULL,
    ImplementationDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO AI_Tools (ToolName, Description, ClientID, ImplementationDate)
VALUES
('ChatBot X', 'Advanced chatbot for healthcare queries.', 1, '2023-07-10'),
('VisionPro', 'AI-based environmental monitoring tool.', 2, '2023-09-20'),
('Predictify', 'Predictive model for student performance.', 3, '2023-02-15'),
('FraudShield', 'AI-driven fraud detection system.', 4, '2022-03-10'),
('ShopSmart', 'Personalized retail recommendations.', 5, '2023-06-15'),
('EnergySaver AI', 'Energy consumption optimization tool.', 6, '2023-10-01'),
('MediAssist', 'AI diagnostic assistant for doctors.', 7, '2023-08-05'),
('AgriYield', 'AI tool for predicting crop yields.', 8, '2023-01-10'),
('SkyNav', 'Autonomous drone navigation system.', 9, '2023-05-20'),
('DriveSense AI', 'Autonomous driving assistance system.', 10, '2023-10-15');


SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'dbo';

select * from clients 
select * from Projects 
select * from ProjectAssignments
select * from Employees
select * from Services
select * from AI_Tools

=== Client-Focused Questions:

--- 1. Which client has the highest number of ongoing projects? 

select * from projects 
select * from clients 

select top 1  c.clientname , 
       count(p.projectid) as ProjectOngoingCount 
from clients c 
join projects p on c.clientid = p.clientid 
where status ='ongoing'
group by c.clientname 
order by ProjectOngoingCount desc 


--- 2. What is the total revenue (budget) generated by projects for clients in the healthcare industry?

select * from projects 
select * from clients 
select * from AI_Tools

select c.industry , sum(p.budget) as Revenue 
from clients c 
join projects p on c.clientid = p.clientid 
where c.Industry = 'Healthcare'
group by c.industry


--- 3.	How many clients have active AI tools implemented by Xeven Solutions?

select count(distinct c.clientid) as AcyiveAIClients 
from clients c 
join AI_Tools at on c.clientid = at.clientid 
where at.ImplementationDate is not null 

--- 4. Which clients have the highest project budgets in the past year?

SELECT 
    c.ClientName, 
    SUM(p.Budget) AS TotalProjectBudget
FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID
WHERE p.StartDate >= DATEADD(YEAR, -1, GETDATE())  -- Projects in the past year
GROUP BY c.ClientName
ORDER BY TotalProjectBudget DESC;






--- 5 What is the average project budget for clients in the energy industry 

select avg(p.budget) as AvgProjectBudget 
from projects p 
join clients c on p.clientid = c.clientid 
where c.industry = 'energy'


======== 2.	Employee-Focused Questions:

1. Which employee has worked on the greatest number of projects?

select * from employees
select * from ProjectAssignments

select top 1 e.firstname , e.lastname , count(pa.projectid) as ProjectCount
from employees e 
join ProjectAssignments pa on e.employeeid = pa.employeeid 
group by e.firstname , e.lastname
order by ProjectCount desc 

--- 2. 	What is the average salary for employees working in the AI Solutions department?

SELECT 
    AVG(e.Salary) AS AverageSalary
FROM 
    Employees e
WHERE 
    e.Department = 'AI Solutions';

select * from employees

select avg(e.salary) as AvgSalary 
from employees e 
where e.department = 'ai_solutions' ; 

-- 3. How many employees have been assigned to each project? Which projects are under-resourced?

select * from ProjectAssignments
select * from Projects

select p.projectname , COUNT(pa.EmployeeID) AS EmployeeCount
from projectassignments pa 
join projects p on pa.projectid = p.projectid 
group by p.projectname 
having COUNT(pa.EmployeeID) < 3

	--- 4. How many employees have a role in the data science department?

SELECT 
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
WHERE e.Department = 'Data Science';

--- 5. What is the total salary expenditure for all employees assigned to the "Healthcare" industry projects?

select * from projects 
select * from clients 

select sum(e.salary) as SalaryExpenditure 
from ProjectAssignments pa
join employees e on pa.employeeid = e.employeeid 
join projects p on pa.projectid = p.projectid 
join clients c on  p.clientid = c.clientid
where industry = 'Healthcare';


=========================================================================

-----  3.	Project-Focused Questions:

1. Which projects are currently paused and why?

select * from projects 

select projectname ,status 
from projects 
where status = 'Paused' ; 

2. What is the overall project completion rate for all projects?

select cast(count(case when status = 'Completed' then 1 end) as float ) / count(projectid) *100 as CompletionRate 
from projects 

3. How many projects have been completed within the set timeline versus those that have gone beyond their expected end date?

select * from Projects
select * from ai_tools

select sum(case when enddate <= enddate then 1 else 0 end ) as ProjectsOnTime , 
       sum(case when enddate > enddate then 1 else 0 end ) as ProjectsOverdue 
from projects ; 


4. What is the average duration for a project from start to completion?

To ensure we only consider completed projects

select avg(datediff(day,startdate,enddate)) AS AverageProjectDuration
from projects 
where enddate is not null ; 


========================================================================================
--- 4.	AI Tool and Solution-Focused Questions:

---	What is the total number of AI tools developed by Xeven Solutions and their impact on client operations?

SELECT 
    COUNT(at.ToolID) AS TotalAI_Tools,
    STRING_AGG(at.Description, ', ') AS ToolImpact
FROM 
    AI_Tools at;

==============================
ALTER TABLE Projects
ADD ServiceID INT;

-- Assign ServiceID values to existing projects
UPDATE Projects
SET ServiceID = 1
WHERE ProjectID = 1;

UPDATE Projects
SET ServiceID = 2
WHERE ProjectID = 2;

UPDATE Projects
SET ServiceID = 3
WHERE ProjectID = 3;

UPDATE Projects
SET ServiceID = 4
WHERE ProjectID = 4;

UPDATE Projects
SET ServiceID = 5
WHERE ProjectID = 5;

UPDATE Projects
SET ServiceID = 6
WHERE ProjectID = 6;

UPDATE Projects
SET ServiceID = 7
WHERE ProjectID = 7;

UPDATE Projects
SET ServiceID = 8
WHERE ProjectID = 8;

UPDATE Projects
SET ServiceID = 9
WHERE ProjectID = 9;

UPDATE Projects
SET ServiceID = 10
WHERE ProjectID = 10;


select * from projects 















