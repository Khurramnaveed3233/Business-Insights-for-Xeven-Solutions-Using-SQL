# Business Insights for Xeven Solutions Using SQL

![Untitled](https://github.com/user-attachments/assets/dd91da1f-6741-4ec8-990f-db1c33a586ad)

![Capture](https://github.com/user-attachments/assets/faaa909c-50a7-48d7-b1ff-c1b28e2124b9)

# 📊 Analyzing Xeven Solutions' Business Operations Using SQL

This project demonstrates how to extract actionable business insights using **pure SQL** from a simulated database of **Xeven Solutions**, a fictional tech company. The analysis focuses on clients, projects, employees, and AI tool implementations to support data-driven decision-making.

---

## 🎯 Objective

To perform structured SQL analysis across multiple dimensions:
- Evaluate client contributions and industry trends
- Analyze employee roles, project distribution, and salaries
- Measure project performance and resource gaps
- Assess AI tool deployment across clients

---

## 🗃️ Database Schema

The project uses five relational tables:

- `Clients` – Client details and industries
- `Projects` – Project metadata, status, and budgets
- `Employees` – Staff information including departments and salaries
- `ProjectAssignments` – Mapping of employees to projects
- `AI_Tools` – AI tools deployed for clients

---

## 🔍 Business Questions & SQL Solutions

### 🧑‍💼 Client-Focused Insights

1. **Which client has the highest number of ongoing projects?**  
   → Identified the top client to prioritize relationship management.

2. **What is the total revenue from healthcare sector clients?**  
   → Summed budgets for all healthcare-linked projects to gauge market value.

3. **How many clients have active AI tools implemented?**  
   → Counted distinct clients with deployed AI tools (`ImplementationDate` not null).

4. **What’s the average project budget in the energy sector?**  
   → Used `AVG()` to support sector-based pricing and planning.

---

### 👩‍💻 Employee-Focused Insights

1. **Which employee has contributed to the most projects?**  
   → Ranked employees by total project assignments.

2. **What is the average salary in the AI Solutions department?**  
   → Calculated department-level salary trends using `AVG()`.

3. **Which projects are under-resourced (fewer than 3 employees)?**  
   → Used `HAVING COUNT() < 3` to flag potential bottlenecks.

4. **How many employees work in Data Science?**  
   → Counted based on department filter.

5. **What is the total salary expense for Healthcare projects?**  
   → Joined across 4 tables to compute cumulative salary cost for domain-specific projects.

---

### 📁 Project-Focused Insights

1. **Which projects are currently paused?**  
   → Filtered by status to help management prioritize reactivation.

2. **What’s the overall project completion rate?**  
   → Used conditional aggregation to calculate % completed.

3. **How many projects finished on time vs overdue?**  
   → Compared `EndDate` against actual completion to assess execution quality.

---

### 🤖 AI Tools Analysis

1. **How many AI tools are in use, and what is their described impact?**  
   → Aggregated tool count and concatenated descriptions to report current AI footprint.

---

## 🧰 Tools & Technologies

- ✅ **SQL Server / PostgreSQL** (compatible)
- 📁 Structured queries using `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `CASE`, `AVG`, `SUM`, etc.
- 🧠 Business logic and insight generation from raw data

---

## 📌 Key Learnings

- Demonstrated how **SQL alone** can power complex BI insights without dashboards.
- Showcased **relational thinking**, multi-table joins, and scenario-based queries.
- Gained deeper understanding of organizational KPIs and how to surface them through clean code.

---

## 📎 Related Projects

- [Power BI Dashboard: TrendMart Sales Analysis](#)  
- [Excel-Based Sales Tracker](#)  
- [Customer Segmentation in SQL](#)

---

## 📫 Let’s Connect

If you have feedback or would like to collaborate on data projects, feel free to reach out!

**Khurram Naveed**  
📧 khurramnaveed4545@gmail.com  
🔗 [LinkedIn](#) • [Portfolio](#)

---

> 💡 *This project reflects my ability to use SQL to turn raw data into business strategy.*
