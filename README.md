# Hospital Database Creation

This project is designed to create a database for managing hospital information, including patients, doctors, visits, and appointments. The database is structured using SQL and includes tables for storing relevant data.

## Project Files

- `Hospital_database_creation.sql`: Contains the SQL code for creating the hospital database and its tables.

## Database Structure

The database includes the following tables:

1. **Doctor**
    - `doc_id` (Primary Key)
    - `doc_name`
    - `doc_spec`
    - `doc_deg`
    - `doc_exp`

2. **Patient**
    - `pat_id` (Primary Key)
    - `pat_name`
    - `pat_addr`
    - `pat_age`
    - `pat_gender`
    - `pat_status`
    - `pat_illness`

3. **Visit**
    - `visit_id` (Primary Key)
    - `doc_id` (Foreign Key)
    - `pat_id` (Foreign Key)
    - `visit_date`

4. **Appointment**
    - `apt_id` (Primary Key)
    - `pat_id` (Foreign Key)
    - `apt_date`
    - `apt_time`
    - `apt_with`
