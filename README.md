# SQL Murder Mystery: A Database Investigation

### Project Overview
This project documents the step-by-step investigation of a murder using a relational database. Through a series of logical deductions and SQL queries, I was able to identify the murderer and the mastermind behind the crime. This project demonstrates practical skills in **database administration, data analysis, and problem-solving**.

### Key Skills & Technologies
* **SQL (Structured Query Language):** For querying and manipulating data.
* **Database Management:** Understanding relational database schemas and table relationships.
* **MySQL Workbench:** For executing queries and viewing results.
* **Logical Reasoning & Data Analysis:** Using clues to form hypotheses and validate them against data.

### The Challenge
A murder took place on January 15, 2018, in the city of SQL City. The police database is a collection of interconnected tables (persons, drivers licenses, crime reports, interviews, gym check-ins, etc.), and the clues were scattered across them. The goal was to write a series of SQL queries to piece together the evidence and solve the case.

### My Solution
The investigation was conducted in a series of steps, with each query building upon the last to narrow down the suspects. The final queries revealed both the murderer and the mastermind behind the crime.

### SQL Queries
The full, commented SQL script is available in the `Murder Mystery Solution.sql` file. It includes the following steps:

```sql
-- Step 1: Analyze the crime scene report for initial clues.
-- Step 2: Identify the witnesses based on physical descriptions.
-- Step 3: Get interview transcripts to gather clues about the suspect.
-- Step 4: Use clues to find suspects by filtering gym and person data.
-- Step 5: Validate suspect with digital records (e.g., gym check-in logs).
-- Step 6: Confirm suspect identity with a final piece of evidence (e.g., license plate data).
-- Step 7: Uncover the mastermind using clues from the confession.
```

### Video Walkthrough
Watch a full walkthrough of the investigation, demonstrating the queries in action and revealing how each piece of evidence was uncovered.[NIDS GUI Walkthrough Video](murder-mystery-solution.mp4)

### Full Report & Documentation
For a detailed explanation of the logic, a complete report, and the full SQL queries with outputs, download the official report here: [solution-report.pdf](solution-report.pdf)
