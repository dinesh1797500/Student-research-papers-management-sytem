<?php
header("Content-Type: application/json");
$conn = new mysqli("localhost", "root", "", "dinesh");

if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Database connection failed"]);
    exit();
}

$data = json_decode(file_get_contents("php://input"), true);
$user_id = isset($data['id']) ? intval($data['id']) : 0;

if ($user_id === 0) {
    echo json_encode(["success" => false, "message" => "Invalid or missing user ID"]);
    exit();
}

$stmt = $conn->prepare("SELECT user_id, email, password FROM users WHERE user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    echo json_encode([
        "success" => true,
        "message" => "Profile fetched successfully",
        "user" => [
            "user_id" => $user['user_id'],
            "email" => $user['email'],
            "password" => $user['password'] // Include password
        ]
    ]);
} else {
    echo json_encode(["success" => false, "message" => "User not found"]);
}

$stmt->close();
$conn->close();
?>