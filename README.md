# Twitter Simulation Project

This project simulates a simplified version of Twitter using SQL (MySQL).

## Contents
- **ERD Diagram** (`ERD.png`) : Shows the entity-relationship model for the database.
- **SQL Script** (`twitter_sim.sql`) : Contains all SQL code to create the database, tables, constraints, procedures, and sample data.

## How to Use
1. Open MySQL Workbench or any MySQL client.
2. Run the script `twitter_sim.sql`.
3. The script will:
   - Create the database `twitter_sim`.
   - Create tables (`users`, `profiles`, `followers`, `tweets`, `likes`).
   - Create stored procedures (`createAccount`, `User_Follow`).
   - Insert sample data (users, tweets, follows, likes).
   - Provide example query to count tweets for a given user.

## GitHub Repository Structure
```
twitter_project/
│
├── README.md                # Project overview & instructions
├── twitter_sim.sql          # Full SQL script
└── ERD.png                  # ER Diagram image (to be added)
```

## Notes
- Passwords are stored as SHA-256 hashes in binary format.
- All IDs are auto-increment.
- Account creation and following are handled via stored procedures.
