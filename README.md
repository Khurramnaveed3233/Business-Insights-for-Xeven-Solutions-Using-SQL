# Business Insights for Xeven Solutions Using SQL

![Untitled](https://github.com/user-attachments/assets/dd91da1f-6741-4ec8-990f-db1c33a586ad)

SQL Portfolio Project: Analyzing Xeven Solutions' Business Operations Using SQL Server

#  Overview

In this project, I performed end-to-end SQL-based analysis for Xeven Solutions, a tech company operating in diverse industries such as healthcare, energy, and artificial intelligence. Using SQL Server, I answered multiple real-world business questions by querying simulated enterprise data involving clients, projects, employees, departments, and AI tools.

This project demonstrates my ability to derive actionable business insights using structured query language, aggregate functions, joins, and analytical logic, reflecting practical problem-solving for operations, HR, project management, and revenue analysis.

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

Which employee has worked on the most projects?
