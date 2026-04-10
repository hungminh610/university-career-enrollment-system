<?php
session_start();
include("db.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $stmt = $conn->prepare("SELECT student_id, password_hash, first_name, last_name FROM students WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();

        if (password_verify($password, $row["password_hash"])) {
            $_SESSION["student_id"] = $row["student_id"];
            $_SESSION["student_name"] = $row["first_name"] . " " . $row["last_name"];

            $check = $conn->prepare("SELECT * FROM student_careers WHERE student_id = ?");
            $check->bind_param("i", $_SESSION["student_id"]);
            $check->execute();
            $career_result = $check->get_result();

            if ($career_result->num_rows > 0) {
                header("Location: homepage.php");
            } else {
                header("Location: chooseCareer.php");
            }
            exit;
        } else {
            echo "Invalid password.<br><br>";
        }
    } else {
        echo "Email not found.<br><br>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
</head>
<body>

<p>
    <a href="index.php">Home</a> |
    <a href="register.php">Register</a>
</p>

<h2>Student Login</h2>

<form method="POST" action="">
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>

<p>Don't have an account? <a href="register.php">Register here</a></p>

</body>
</html>