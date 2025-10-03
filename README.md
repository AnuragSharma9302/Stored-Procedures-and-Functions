## 🛠️ Stored Procedures & Functions 

## 🎯 Objective  
Learned how to create **stored procedures and functions** in PostgreSQL to modularize SQL logic for reusability, maintainability, and abstraction.  

---

## ⚙️ Tools Used  
- **PostgreSQL**
- **DB Browser for SQLite / MySQL Workbench (for practice)**
- **dbdiagram.io** for ERD

---

## ✅ What I Did in This Task  
- Designed a **database schema** with `Employees` and `Departments` tables.  
- Inserted **sample data** to test stored procedures and functions.  
- Created **scalar functions** (like calculating employee bonuses).  
- Implemented **table-valued functions** (like fetching employees by department).  
- Wrote **stored procedures** for operations such as salary increment and employee transfer.  
- Used **IN and OUT parameters** in procedures for dynamic data retrieval.  
- Implemented a **trigger** to log salary changes in a separate audit table.  
- Explored differences between **procedures, functions, loops, and triggers** through SQL queries.  
- Practiced queries that align with **interview-style questions** about stored routines.  

---
## 📌 Key Concepts   
- **Procedure vs Function** → Procedures don’t return values directly, functions always return a value.  
- **IN/OUT Parameter** → Defines whether data is passed into or out of a routine.  
- **Functions Returning Tables** → Possible via set-returning functions.  
- **RETURN** → Used to send back values from a function.  
- **Calling Procedures** → Done with `CALL` statement.  
- **Benefit of Stored Routines** → Reusability, abstraction, and performance optimization.  
- **Loops in Procedures** → Yes, procedural languages allow iteration inside.  
- **Scalar vs Table-Valued Function** → Scalar returns one value, table-valued returns multiple rows.  
- **Trigger** → A routine invoked automatically on table events.  
- **Debugging Procedures** → Use logging, `RAISE NOTICE`, and stepwise testing.  

---

## 📊 Outcome  
- Ability to modularize SQL logic using **stored routines**.  
- Gained practical exposure to **procedures, functions, and parameters**.  
- Learned to apply **loops, conditions, and returns** inside routines.  




