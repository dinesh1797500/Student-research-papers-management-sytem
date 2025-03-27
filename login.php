<?php
header("Content-Type: application/json");
include "db.php";  // Ensure database connection

// Log raw POST data for debugging
file_put_contents('debug.txt', "Raw Input: " . file_get_contents('php://input') . "\n", FILE_APPEND);
file_put_contents('debug.txt', "POST Data: " . print_r($_POST, true) . "\n", FILE_APPEND);

// Read form-data inputs
$email = isset($_POST['email']) ? trim($_POST['email']) : "";
$password = isset($_POST['password']) ? trim($_POST['password']) : "";

// Check if email and password are provided
if (empty($email) || empty($password)) {
    echo json_encode(["success" => false, "message" => "Email and password are required."]);
    exit();
}

// Fetch user details from DB
$stmt = $conn->prepare("SELECT user_id, password FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $row = $result->fetch_assoc();
    $storedPassword = $row['password'];

    // Check if entered password matches stored password
    if ($password === $storedPassword) {
        echo json_encode([
            "success" => true,
            "message" => "Login successful.",
            "user_id" => $row['user_id']
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Invalid email or password."]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Email not found."]);
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>