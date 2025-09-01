# Business Insights for Xeven Solutions Using SQL

![Untitled](https://github.com/user-attachments/assets/dd91da1f-6741-4ec8-990f-db1c33a586ad)

![Capture](https://github.com/user-attachments/assets/faaa909c-50a7-48d7-b1ff-c1b28e2124b9)

> **Portfolio Project** 
> *By Khurram Naveed , Data Analyst & Storyteller*  


---

## Executive Snapshot 

> “Xeven closed **₹78.4 M** in 2024 revenue across 120 active projects, but **29 % are paused** and **AI Solutions is 2× salary-heavy** vs. ROI.  
> Re-allocating 15 paused projects and doubling AI billability can unlock **₹9.3 M EBIT** in 180 days.”

| North-Star | Current | 180-Day Stretch |
|---|---|---|
| Revenue Run-Rate | ₹78.4 M | ₹90 M |
| Project On-Time % | 71 % | 85 % |
| AI Tool Adoption | 34 clients | 50 clients |
| Employee Utilization | 72 % | 85 % |

---

## Data Playground

| Entity | Records | Grain | Key Fields |
|---|---|---|---|
| **Projects** | 120 | Project-Month | Budget, Status, Start/End |
| **Clients** | 42 | Client-Industry | Industry, ClientName |
| **Employees** | 88 | Employee-Department | Salary, Department |
| **AI_Tools** | 24 | Tool-Client | Description, ImplementationDate |
| **ProjectAssignments** | 297 | Employee-Project | Allocation % |

---

##  Story Arc – Four Chapters

### Chapter 1 – Client Gold-Mines  

| Client | Industry | Active Projects | Total Budget | Avg Budget |
|---|---|---|---|---|
| **Apollo Hospitals** | Healthcare | 8 | ₹21.3 M | ₹2.66 M |
| **Shell Energy** | Energy | 5 | ₹11.9 M | ₹2.38 M |
| **AstraZeneca** | Healthcare | 6 | ₹9.4 M | ₹1.57 M |

> *Healthcare drives 41 % of revenue, but only 24 % of AI tools are deployed there.*

### Chapter 2 – Employee Load & Cost  

| Department | Headcount | Avg Salary (₹k) | Utilization | Cost per Utilized FTE |
|---|---|---|---|---|
| **AI Solutions** | 22 | ₹1 450 | 68 % | ₹2 132 k |
| **Data Science** | 18 | ₹1 200 | 78 % | ₹1 538 k |
| **DevOps** | 12 | ₹1 050 | 83 % | ₹1 265 k |

> *AI Solutions salary bill is 2.2× DevOps yet 15 pp lower utilization.*

### Chapter 3 – Project Health  

| Status | Count | Budget Locked (₹M) | Avg Days Delay |
|---|---|---|---|
| **Completed** | 65 | 52.8 | 0 |
| **Ongoing** | 40 | 18.9 | 18 |
| **Paused** | 15 | 6.7 | 42 |

> *15 paused projects tie up ₹6.7 M in idle budget – 8 could restart within 30 days.*

### Chapter 4 – AI Tool Penetration  

| Industry | Clients with AI | Total Clients | Penetration |
|---|---|---|---|
| Healthcare | 8 | 18 | 44 % |
| Energy | 4 | 7 | 57 % |
| FinTech | 3 | 9 | 33 % |
| Retail | 2 | 8 | 25 % |

---

##  Deep-Dive Insights  

### 1. Under-Resourced Projects  
| Project | Budget (₹M) | Assigned Staff | Ideal Staff | Risk |
|---|---|---|---|---|
| **MedAI-2024** | 4.2 | 2 | 4 | Delay |
| **Shell-IoT** | 3.8 | 3 | 5 | Scope Creep |

> *Re-deploying 6 idle staff could rescue ₹8 M revenue.*

### 2. Salary vs Margin by Industry  
| Industry | Total Budget | Total Salary Cost | Margin % |
|---|---|---|---|
| Healthcare | ₹32.1 M | ₹11.4 M | 64 % |
| Energy | ₹15.9 M | ₹5.8 M | 63 % |
| FinTech | ₹10.4 M | ₹4.7 M | 55 % |

### 3. AI ROI Snapshot  
| Tool Category | Deployments | Avg Client Upsell (₹k) | Payback Months |
|---|---|---|---|
| Predictive Maintenance | 8 | ₹420 | 3.2 |
| NLP Chatbots | 12 | ₹290 | 4.1 |
| Vision QC | 4 | ₹560 | 2.5 |

---

## Recommendations (180-Day OKRs)

| Objective | Key Result | Owner | Tooling |
|---|---|---|---|
| **Revive Paused Projects** | convert 10 → 7 to “Ongoing” | Delivery Head | Resource re-allocation sheet |
| **AI Billability Boost** | utilization 68 % → 85 % | AI Lead | Skill matrix & training |
| **Healthcare AI Upsell** | 8 → 15 AI clients | Sales | ROI calculator deck |
| **On-Time Delivery** | 71 % → 85 % | PMO | Jira SLA dashboard |
| **Margin Expansion** | Healthcare margin 64 % → 70 % | Finance | Vendor re-negotiation |

---

##  SQL Cheat-Sheet (for reviewers)

-- 1. Top client by ongoing projects

         SELECT TOP 1 c.ClientName,
         COUNT(p.ProjectID) AS OngoingProjectCount
         FROM Projects p
         JOIN Clients c ON p.ClientID = c.ClientID
         WHERE p.Status = 'Ongoing'
         GROUP BY c.ClientName
         ORDER BY OngoingProjectCount DESC;

-- 2. AI tool penetration by industry

        SELECT c.Industry,
        COUNT(DISTINCT at.ClientID) * 1.0 / COUNT(DISTINCT c.ClientID) AS Penetration
        FROM Clients c
        LEFT JOIN AI_Tools at ON c.ClientID = at.ClientID
        GROUP BY c.Industry;

-- 3. Salary cost vs budget by industry
 
       SELECT c.Industry,
       SUM(p.Budget)                                   AS Budget,
       SUM(pa.Allocation * e.Salary)                   AS SalaryCost
       FROM Projects p
       JOIN Clients c        ON p.ClientID = c.ClientID
       JOIN ProjectAssignments pa ON p.ProjectID = pa.ProjectID
       JOIN Employees e      ON pa.EmployeeID = e.EmployeeID
       GROUP BY c.Industry;

**Closing Note**

- The data tells a simple story: we have the clients, we have the talent, we just need to align them.
- Un-pause the paused, upskill the under-utilized, and 2025 becomes our ₹90 M year—all without writing a single new SOW.”

  **Khurram Naveed** , Data Analyst
