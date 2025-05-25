# Business Insights for Xeven Solutions Using SQL

![Untitled](https://github.com/user-attachments/assets/dd91da1f-6741-4ec8-990f-db1c33a586ad)

SQL Portfolio Project: Analyzing Xeven Solutions' Business Operations Using SQL Server

#  Overview

In this project, I performed end-to-end SQL-based analysis for Xeven Solutions, a tech company operating in diverse industries such as healthcare, energy, and artificial intelligence. Using SQL Server, I answered multiple real-world business questions by querying simulated enterprise data involving clients, projects, employees, departments, and AI tools.

This project demonstrates my ability to derive actionable business insights using structured query language, aggregate functions, joins, and analytical logic, reflecting practical problem-solving for operations, HR, project management, and revenue analysis.

![Capture](https://github.com/user-attachments/assets/faaa909c-50a7-48d7-b1ff-c1b28e2124b9)


#  Business Questions & SQL Solutions

✅ Client-Focused Analysis

1. Which client has the highest number of ongoing projects?

       SELECT TOP 1 c.ClientName, COUNT(p.ProjectID) AS OngoingProjectCount
       FROM Projects p
       JOIN Clients c ON p.ClientID = c.ClientID
       WHERE p.Status = 'Ongoing'
       GROUP BY c.ClientName
       ORDER BY OngoingProjectCount DESC;

2. What is the total revenue from clients in the healthcare industry?

       SELECT SUM(p.Budget) AS TotalRevenue
       FROM Projects p
       JOIN Clients c ON p.ClientID = c.ClientID
       WHERE c.Industry = 'Healthcare';

3. How many clients have active AI tools implemented?

       SELECT COUNT(DISTINCT c.ClientID) AS ActiveAIClients
       FROM AI_Tools at
       JOIN Clients c ON at.ClientID = c.ClientID
       WHERE at.ImplementationDate IS NOT NULL;

4. What is the average project budget in the energy sector?

       SELECT AVG(p.Budget) AS AverageProjectBudget
       FROM Projects p
       JOIN Clients c ON p.ClientID = c.ClientID
       WHERE c.Industry = 'Energy';

#  👨‍💼 Employee-Focused Analysis

1. Which employee has worked on the most projects?

       SELECT TOP 1 e.FirstName, e.LastName, COUNT(pa.ProjectID) AS ProjectCount
       FROM Employees e
       JOIN ProjectAssignments pa ON e.EmployeeID = pa.EmployeeID
       GROUP BY e.FirstName, e.LastName
       ORDER BY ProjectCount DESC;

2. Average salary in the AI Solutions department?

       SELECT AVG(e.Salary) AS AverageSalary
       FROM Employees e
       WHERE e.Department = 'AI Solutions';
   
3. Which projects are under-resourced (fewer than 3 employees)?

       SELECT p.ProjectName, COUNT(pa.EmployeeID) AS EmployeeCount
       FROM ProjectAssignments pa
       JOIN Projects p ON pa.ProjectID = p.ProjectID
       GROUP BY p.ProjectName
       HAVING COUNT(pa.EmployeeID) < 3;
   
4. How many employees are in the Data Science department?

       SELECT COUNT(e.EmployeeID) AS EmployeeCount
       FROM Employees e
       WHERE e.Department = 'Data Science';
   
5. Total salary expenditure for healthcare-related projects?

       SELECT SUM(e.Salary) AS TotalSalaryExpenditure
       FROM ProjectAssignments pa
       JOIN Employees e ON pa.EmployeeID = e.EmployeeID
       JOIN Projects p ON pa.ProjectID = p.ProjectID
       JOIN Clients c ON p.ClientID = c.ClientID
       WHERE c.Industry = 'Healthcare';
   
# 📁 Project-Focused Analysis

1. Which projects are currently paused?

       SELECT p.ProjectName
       FROM Projects p
       WHERE p.Status = 'Paused';
   
2. What is the overall project completion rate?

       SELECT (CAST(COUNT(CASE WHEN p.Status = 'Completed' THEN 1 END) AS FLOAT) / COUNT(p.ProjectID)) * 100 AS CompletionRate
       FROM Projects p;
   
4. Projects completed on time vs. overdue

       SELECT 
       SUM(CASE WHEN p.EndDate <= p.EndDate THEN 1 ELSE 0 END) AS ProjectsOnTime,
       SUM(CASE WHEN p.EndDate > EndDate THEN 1 ELSE 0 END) AS ProjectsOverdue
       FROM Projects p;
   
# 🤖 AI Tool & Technology Analysis

1. Total number of AI tools deployed and their impact summaries

       SELECT COUNT(at.ToolID) AS TotalAI_Tools, STRING_AGG(at.Description, ', ') AS ToolImpact
       FROM AI_Tools at;

# 🛠️ Tools & Technologies


-    Optimizing vehicle sales strategies

-    Language: T-SQL (Transact-SQL)

-    Data Modeling: Normalized schema with Clients, Projects, Employees, AI_Tools, and ProjectAssignments tables

   Concepts Used:

  - Aggregations (SUM, AVG, COUNT)

  - Joins (INNER JOIN)

  - Filtering (WHERE, HAVING)

  - Grouping and ordering

  - Subqueries and derived metrics

# 📈 Key Business Insights

  - Identified top-performing clients and underutilized resources.

  - Highlighted potential HR gaps in departments like Data Science and AI.

  - Calculated the completion rate and delay factors of ongoing projects.

  - Estimated revenue and salary costs segmented by industry and team.

  - Evaluated the spread and impact of AI tools within the company’s ecosystem.


# 📌 How to Use This Project

 - You can clone or fork this repository and:

 - Practice and tweak the SQL queries using your own simulated database.

 - Extend this project by creating views, indexes, and stored procedures.

 - Visualize insights using Power BI or Tableau.
 

