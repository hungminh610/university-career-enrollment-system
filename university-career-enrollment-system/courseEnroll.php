<?php
session_start();
include("db.php");

if (!isset($_SESSION["student_id"])) {
    echo "Please login first.";
    exit;
}

$student_id = $_SESSION["student_id"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["offering_id"])) {
        $offering_id = $_POST["offering_id"];

        // Prevent duplicate enrollment
        $check = $conn->prepare("SELECT * FROM enrollments WHERE student_id = ? AND offering_id = ?");
        $check->bind_param("ii", $student_id, $offering_id);
        $check->execute();
        $result = $check->get_result();

        if ($result->num_rows > 0) {
            echo "You are already enrolled in this course.<br><br>";
        } else {
            $insert = $conn->prepare("INSERT INTO enrollments (student_id, offering_id, enroll_date, status, grade) VALUES (?, ?, CURDATE(), 'enrolled', NULL)");
            $insert->bind_param("ii", $student_id, $offering_id);

            if ($insert->execute()) {
                echo "Enrollment successful!<br><br>";
            } else {
                echo "Error: " . $conn->error;
            }
        }
    } else {
        echo "Please select a course.<br><br>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Course Enrollment</title>
</head>
<body>

<p>
    <a href="homepage.php">Home</a> |
    <a href="chooseCareer.php">Choose Career</a> |
    <a href="logout.php">Logout</a>
</p>

<h1>Enroll in Courses</h1>

<form method="POST">
<table border="1" cellpadding="10">
<tr>
    <th>Select</th>
    <th>Course</th>
    <th>Professor</th>
</tr>

<?php
$sql = "
SELECT co.offering_id, c.name, p.first_name, p.last_name
FROM course_offerings co
JOIN courses c ON co.course_id = c.course_id
JOIN professors p ON co.professor_id = p.professor_id
";

$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    echo "<tr>
        <td><input type='radio' name='offering_id' value='{$row['offering_id']}' required></td>
        <td>{$row['name']}</td>
        <td>{$row['first_name']} {$row['last_name']}</td>
    </tr>";
}
?>
</table>

<br>
<input type="submit" value="Enroll">

</form>

</body>
</html>