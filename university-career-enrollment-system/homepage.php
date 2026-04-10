<?php
session_start();
include("db.php");

if (!isset($_SESSION["student_id"])) {
    echo "Student not found";
    exit;
}

$student_id = $_SESSION["student_id"];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Homepage</title>
</head>
<body>

<p>
    <a href="homepage.php">Home</a> |
    <a href="chooseCareer.php">Choose Career</a> |
    <a href="courseEnroll.php">Enroll in Courses</a> |
    <a href="logout.php">Logout</a>
</p>

<h1>Student Homepage</h1>

<?php
$student_sql = $conn->prepare("SELECT first_name, last_name, email FROM students WHERE student_id = ?");
$student_sql->bind_param("i", $student_id);
$student_sql->execute();
$student_result = $student_sql->get_result();
$student = $student_result->fetch_assoc();

echo "<p>Welcome, " . $student["first_name"] . " " . $student["last_name"] . "</p>";
echo "<p>Email: " . $student["email"] . "</p>";
?>

<hr>
<h2>Your Career</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>Career Name</th>
        <th>Degree Level</th>
        <th>Duration</th>
        <th>Status</th>
        <th>Enroll Date</th>
    </tr>

<?php
$career_sql = $conn->prepare("
    SELECT c.name, c.degree_level, c.duration_years, sc.status, sc.enroll_date
    FROM student_careers sc
    JOIN careers c ON sc.career_id = c.career_id
    WHERE sc.student_id = ?
");
$career_sql->bind_param("i", $student_id);
$career_sql->execute();
$career_result = $career_sql->get_result();

while ($row = $career_result->fetch_assoc()) {
    echo "<tr>
            <td>{$row['name']}</td>
            <td>{$row['degree_level']}</td>
            <td>{$row['duration_years']}</td>
            <td>{$row['status']}</td>
            <td>{$row['enroll_date']}</td>
          </tr>";
}
?>
</table>

<hr>
<h2>Your Enrolled Courses</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>Course Code</th>
        <th>Course Name</th>
        <th>Professor</th>
        <th>Semester</th>
        <th>Academic Year</th>
        <th>Status</th>
        <th>Enroll Date</th>
        <th>Grade</th>
    </tr>

<?php
$course_sql = $conn->prepare("
    SELECT 
        c.code,
        c.name AS course_name,
        p.first_name,
        p.last_name,
        co.semester,
        co.academic_year,
        e.status,
        e.enroll_date,
        e.grade
    FROM enrollments e
    JOIN course_offerings co ON e.offering_id = co.offering_id
    JOIN courses c ON co.course_id = c.course_id
    JOIN professors p ON co.professor_id = p.professor_id
    WHERE e.student_id = ?
");
$course_sql->bind_param("i", $student_id);
$course_sql->execute();
$course_result = $course_sql->get_result();

while ($row = $course_result->fetch_assoc()) {
    echo "<tr>
            <td>{$row['code']}</td>
            <td>{$row['course_name']}</td>
            <td>{$row['first_name']} {$row['last_name']}</td>
            <td>{$row['semester']}</td>
            <td>{$row['academic_year']}</td>
            <td>{$row['status']}</td>
            <td>{$row['enroll_date']}</td>
            <td>{$row['grade']}</td>
          </tr>";
}
?>
</table>

</body>
</html>