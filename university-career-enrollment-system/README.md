# 🎓 University Career Enrollment System

A web-based application developed using **PHP and MySQL** that allows students to register, log in, choose a career path, enroll in courses, and view their academic information.

---

## 🚀 Features

- Student registration with password hashing
- Secure login system
- Career selection (many-to-many relationship)
- Course enrollment system
- Student homepage with:
  - personal information
  - enrolled careers
  - enrolled courses

---

## 🛠 Technologies Used

- PHP (server-side logic)
- MySQL (database)
- HTML (frontend)
- XAMPP (local server)
- phpMyAdmin
- mysqli (database connection)

---

## 🗄 Database Structure

Main entities:

- `students`
- `departments`
- `careers`
- `student_careers`
- `courses`
- `professors`
- `classrooms`
- `course_offerings`
- `enrollments`

### Relationships:

- One-to-many:
  - department → careers
  - department → courses
- Many-to-many:
  - students ↔ careers (`student_careers`)
  - students ↔ course_offerings (`enrollments`)

---

## ⚙️ How to Run

1. Install XAMPP
2. Place project in: http://localhost/index.php
3. Start Apache and MySQL
4. Import `database.sql` into phpMyAdmin
5. Open: http://localhost/index.php
---

## 📌 Author

Nguyen Hung Minh