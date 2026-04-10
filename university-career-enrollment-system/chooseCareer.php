<?php
session_start();
include("db.php");

if (!isset($_SESSION["student_id"])) {
    echo "Login to enroll";
    exit;
}

$student_id = $_SESSION["student_id"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["career_id"])) {
        $career_id = $_POST["career_id"];

        // 🔹 Prevent selecting more than one career
        $check_all = $conn->prepare("SELECT * FROM student_careers WHERE student_id = ?");
        $check_all->bind_param("i", $student_id);
        $check_all->execute();
        $existing = $check_all->get_result();

        if ($existing->num_rows > 0) {
            echo "You have already selected a career.<br><br>";
        } else {
            $insert = $conn->prepare("INSERT INTO student_careers (student_id, career_id, enroll_date, status, is_primary) VALUES (?, ?, CURDATE(), 'active', 1)");
            $insert->bind_param("ii", $student_id, $career_id);

            if ($insert->execute()) {
                header("Location: homepage.php");
                exit;
            } else {
                echo "Error: " . $conn->error;
            }
        }
    } else {
        echo "Please select a career.<br><br>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Choose a Career</title>
</head>
<body>

<p>
    <a href="homepage.php">Home</a> |
    <a href="courseEnroll.php">Enroll Courses</a> |
    <a href="logout.php">Logout</a>
</p>

<h1>Choose Your Career</h1>

<form method="POST">
    <table border="1" cellpadding="10">
        <tr>
            <th>Select</th>
            <th>Career Name</th>
            <th>Department ID</th>
            <th>Degree Level</th>
            <th>Duration (Years)</th>
            <th>Description</th>
        </tr>

        <?php
        $sql = "SELECT * FROM careers";
        $result = $conn->query($sql);

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td><input type='radio' name='career_id' value='{$row['career_id']}' required></td>
                    <td>{$row['name']}</td>
                    <td>{$row['department_id']}</td>
                    <td>{$row['degree_level']}</td>
                    <td>{$row['duration_years']}</td>
                    <td>{$row['description']}</td>
                  </tr>";
        }
        ?>
    </table>

    <br>
    <input type="submit" value="Enroll in Selected Career">
</form>

</body>
</html>