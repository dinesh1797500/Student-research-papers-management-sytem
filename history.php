<?php
// Database connection
$host = "localhost";
$username = "root";
$password = "";
$database = "dinesh"; // Your database name

$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Database connection failed: " . $conn->connect_error]));
}

// Get user ID from request (Assuming you're sending `user_id` via GET request)
$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;

if ($user_id === 0) {
    echo json_encode(["success" => false, "message" => "User ID is required."]);
    exit();
}

// Fetch all uploaded files and plagiarism percentages for the user
$sql = "SELECT id, filename, file_path, plagiarism_percentage FROM plagiarism_results WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$files = [];
while ($row = $result->fetch_assoc()) {
    $files[] = [
        "id" => $row['id'],
        "filename" => $row['filename'],
        "file_path" => $row['file_path'],
        "plagiarism_percentage" => $row['plagiarism_percentage'] . "%"
    ];
}

if (!empty($files)) {
    echo json_encode([
        "success" => true,
        "message" => "File history retrieved successfully.",
        "files" => $files
    ]);
} else {
    echo json_encode(["success" => false, "message" => "No files found for this user."]);
}

// Close connection
$stmt->close();
$conn->close();
?>
