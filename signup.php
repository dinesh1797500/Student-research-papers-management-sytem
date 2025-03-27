<?php
header("Content-Type: application/json");
include "db.php";  // Ensure database connection

// Read form-data inputs
$email = isset($_POST['email']) ? trim($_POST['email']) : "";
$password = isset($_POST['password']) ? trim($_POST['password']) : "";

// Check if email and password are provided
if (empty($email) || empty($password)) {
    echo json_encode(["success" => false, "message" => "Email and password are required."]);
    exit();
}

// Check if email already exists
$stmt = $conn->prepare("SELECT user_id FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Email already exists."]);
    exit();
}

// Insert user with plain-text password (⚠️ NOT RECOMMENDED)
$stmt = $conn->prepare("INSERT INTO users (email, password) VALUES (?, ?)");
$stmt->bind_param("ss", $email, $password);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Signup successful."]);
} else {
    echo json_encode(["success" => false, "message" => "Signup failed. Try again."]);
}

// Close connection
$stmt->close();
$conn->close();
?>
