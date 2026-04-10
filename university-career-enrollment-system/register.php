<?php
include("db.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $birth_date = $_POST["birth_date"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];

    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    $check = $conn->prepare("SELECT student_id FROM students WHERE email = ?");
    $check->bind_param("s", $email);
    $check->execute();
    $result = $check->get_result();

    if ($result->num_rows > 0) {
        echo "Email already exists.<br><br>";
    } else {
        $stmt = $conn->prepare("INSERT INTO students (email, password_hash, first_name, last_name, birth_date, phone) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $email, $password_hash, $first_name, $last_name, $birth_date, $phone);

        if ($stmt->execute()) {
            echo "Registration successful!<br><br>";
            echo "<a href='login.php'>Go to Login</a>";
        } else {
            echo "Error: " . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>

<p>
    <a href="index.php">Home</a> |
    <a href="login.php">Login</a>
</p>

<h2>Student Registration</h2>

<form method="POST" action="">
    First Name: <input type="text" name="first_name" required><br><br>
    Last Name: <input type="text" name="last_name" required><br><br>
    Date of Birth: <input type="date" name="birth_date" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Phone: <input type="text" name="phone" required><br><br>
    Password: <input type="password" name="password" required><br><br>

    <input type="submit" value="Register">
</form>

<p>Already have an account? <a href="login.php">Login</a></p>

</body>
</html>