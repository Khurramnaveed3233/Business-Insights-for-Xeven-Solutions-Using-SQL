# Business Insights for Xeven Solutions Using SQL

![Untitled](https://github.com/user-attachments/assets/dd91da1f-6741-4ec8-990f-db1c33a586ad)

![Capture](https://github.com/user-attachments/assets/faaa909c-50a7-48d7-b1ff-c1b28e2124b9)

> **Role:** Data Analyst | **Tools:** SQL Server · Power BI · DAX | **Domain:** IT Services · Project Management · AI Adoption Analytics

---

##  Project Overview

Delivered an end-to-end **SQL and Power BI analytics engagement** for Xeven Technologies covering **120 projects, 42 clients, 88 employees, and 24 AI tools**. The analysis uncovers operational inefficiencies, salary-to-ROI mismatches, and AI adoption gaps — projecting **₹9.3 M in EBIT uplift within 180 days** through targeted resource reallocation and AI billability improvements.

> *"We have the clients, we have the talent — we just need to align them. Un-pause the paused, upskill the under-utilized, and 2025 becomes our ₹90 M year — all without writing a single new SOW."*

---

##  Business Problem

Xeven had no centralized analytics view to answer critical operational questions:

- Which **clients and industries** generate the highest margin and ROI?
- Why are **29% of projects paused** and how much budget is locked in idle work?
- Which **departments are overpaid relative to their utilization**?
- Where is **AI adoption underperforming** despite available tools?
- How can resources be **reallocated without new hiring or contracts**?

---

##  Data Playground

| Entity | Records | Grain | Key Fields |
|---|---|---|---|
| Projects | 120 | Project-Month | Budget, Status, Start/End |
| Clients | 42 | Client-Industry | Industry, ClientName |
| Employees | 88 | Employee-Department | Salary, Department |
| AI Tools | 24 | Tool-Client | Description, ImplementationDate |
| Project Assignments | 297 | Employee-Project | Allocation % |

---

##  North-Star Targets

| Metric | Current | 180-Day Target |
|---|---|---|
| Revenue Run-Rate | ₹78.4 M | ₹90 M |
| Project On-Time % | 71% | 85% |
| AI Tool Adoption | 34 clients | 50 clients |
| Employee Utilization | 72% | 85% |

---

##  Key Findings

### Chapter 1 — Client Gold Mines

| Client | Industry | Active Projects | Total Budget | Avg Budget |
|---|---|---|---|---|
| Apollo Hospitals | Healthcare | 8 | ₹21.3 M | ₹2.66 M |
| Shell Energy | Energy | 5 | ₹11.9 M | ₹2.38 M |
| AstraZeneca | Healthcare | 6 | ₹9.4 M | ₹1.57 M |

- **Healthcare drives 41% of total revenue** — yet only 24% of AI tools are deployed there
- Massive **AI upsell opportunity** in the highest-revenue industry segment

### Chapter 2 — Employee Load and Cost

| Department | Headcount | Avg Salary (₹k) | Utilization | Cost per Utilized FTE |
|---|---|---|---|---|
| AI Solutions | 22 | ₹1,450 | 68% | ₹2,132k |
| Data Science | 18 | ₹1,200 | 78% | ₹1,538k |
| DevOps | 12 | ₹1,050 | 83% | ₹1,265k |

- **AI Solutions salary bill is 2.2× DevOps yet 15 percentage points lower in utilization**
- Immediate opportunity to close the utilization gap and reduce cost per productive FTE

### Chapter 3 — Project Health

| Status | Count | Budget Locked (₹M) | Avg Days Delay |
|---|---|---|---|
| Completed | 65 | ₹52.8 M | 0 |
| Ongoing | 40 | ₹18.9 M | 18 days |
| Paused | 15 | ₹6.7 M | 42 days |

- **15 paused projects lock up ₹6.7 M in idle budget**
- Analysis identifies **8 projects that could restart within 30 days** with minimal reallocation

### Chapter 4 — AI Tool Penetration

| Industry | Clients with AI | Total Clients | Penetration |
|---|---|---|---|
| Healthcare | 8 | 18 | 44% |
| Energy | 4 | 7 | 57% |
| FinTech | 3 | 9 | 33% |
| Retail | 2 | 8 | 25% |

- **Retail and FinTech are severely under-penetrated** — strong upsell pipeline exists
- Healthcare at 44% penetration despite being the largest revenue segment — significant expansion room

---

##  Deep-Dive Insights

### Under-Resourced Projects

| Project | Budget (₹M) | Assigned Staff | Ideal Staff | Risk |
|---|---|---|---|---|
| MedAI-2024 | 4.2 | 2 | 4 | Delay |
| Shell-IoT | 3.8 | 3 | 5 | Scope Creep |

- **Re-deploying 6 idle staff** from paused projects could rescue **₹8 M in at-risk revenue**

### Salary vs Margin by Industry

| Industry | Total Budget | Salary Cost | Margin % |
|---|---|---|---|
| Healthcare | ₹32.1 M | ₹11.4 M | 64% |
| Energy | ₹15.9 M | ₹5.8 M | 63% |
| FinTech | ₹10.4 M | ₹4.7 M | 55% |

### AI ROI Snapshot

| Tool Category | Deployments | Avg Client Upsell (₹k) | Payback Months |
|---|---|---|---|
| Predictive Maintenance | 8 | ₹420 | 3.2 |
| NLP Chatbots | 12 | ₹290 | 4.1 |
| Vision QC | 4 | ₹560 | 2.5 |

- **Vision QC delivers the fastest payback** at 2.5 months — prioritize expansion
- NLP Chatbots have the most deployments but longest payback — review pricing model

---

## 💡 Recommendations — 180-Day OKRs

| Objective | Key Result | Owner |
|---|---|---|
| Revive Paused Projects | Convert 10 paused → 7 ongoing | Delivery Head |
| AI Billability Boost | Utilization 68% → 85% in AI Solutions | AI Lead |
| Healthcare AI Upsell | 8 → 15 AI clients in Healthcare | Sales |
| On-Time Delivery | 71% → 85% project on-time rate | PMO |
| Margin Expansion | Healthcare margin 64% → 70% | Finance |

**Projected combined impact: ₹9.3 M EBIT within 180 days**

---

## 🛠️ SQL Cheat-Sheet

### 1. Top Client by Ongoing Projects
```sql
SELECT TOP 1
    c.ClientName,
    COUNT(p.ProjectID) AS OngoingProjectCount
FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID
WHERE p.Status = 'Ongoing'
GROUP BY c.ClientName
ORDER BY OngoingProjectCount DESC;
```

### 2. AI Tool Penetration by Industry
```sql
SELECT
    c.Industry,
    COUNT(DISTINCT at.ClientID) * 1.0 / COUNT(DISTINCT c.ClientID) AS Penetration
FROM Clients c
LEFT JOIN AI_Tools at ON c.ClientID = at.ClientID
GROUP BY c.Industry;
```

### 3. Salary Cost vs Budget by Industry
```sql
SELECT
    c.Industry,
    SUM(p.Budget)                          AS TotalBudget,
    SUM(pa.Allocation * e.Salary)          AS TotalSalaryCost,
    (SUM(p.Budget) - SUM(pa.Allocation * e.Salary))
        / SUM(p.Budget) * 100              AS MarginPct
FROM Projects p
JOIN Clients c             ON p.ClientID    = c.ClientID
JOIN ProjectAssignments pa ON p.ProjectID   = pa.ProjectID
JOIN Employees e           ON pa.EmployeeID = e.EmployeeID
GROUP BY c.Industry;
```

---

## 🛠️ Technical Approach

### SQL Server
- **JOINs** across 5 normalized tables — Projects, Clients, Employees, AI Tools, Project Assignments
- **Aggregations** for budget, salary cost, utilization, and margin by department and industry
- **Window Functions** for ranking clients by revenue, employees by utilization, and projects by delay
- **CTEs** for modular multi-step analysis logic
- **Conditional Logic** (CASE WHEN) for project status classification and risk flagging

### Power BI
- **Star schema** data model connecting all 5 entity tables
- **DAX measures** for utilization rate, cost per FTE, margin %, and AI penetration
- **KPI cards** for all north-star metrics with 180-day targets
- **Drill-through pages** for client, department, and project-level analysis
- **Executive summary page** for stakeholder presentation

---

##  Repository Structure
```
📂 Xeven-Business-Intelligence-Analytics
├── 📄 Xeven_Analytics.sql              — Full SQL scripts and queries
├── 📊 Xeven_Dashboard.pbix             — Interactive Power BI dashboard
├── 🖼️  Dashboard_Preview.jpg            — Dashboard screenshot
├── 📄 Insights_Report.pdf              — Executive findings and OKRs
└── 📄 README.md                        — Project documentation
```

---

## 👤 About

**Khurram Naveed** — Data Analyst specializing in SQL, Power BI, and business intelligence.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/khurramnaveed3233)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?logo=github)](https://github.com/Khurramnaveed3233)
[![Email](https://img.shields.io/badge/Email-Contact-red?logo=gmail)](mailto:khurramnaveed4545@gmail.com)

---

> 💼 *This project demonstrates how SQL-driven analytics combined with Power BI storytelling can identify ₹9.3 M in hidden EBIT — without new clients, new hires, or new contracts. The data just needs to be asked the right questions.*
