<?php
require 'vendor/autoload.php';

use PhpOffice\PhpWord\IOFactory;
use Smalot\PdfParser\Parser;

header("Content-Type: application/json");

// Database connection
$conn = new mysqli("localhost", "root", "", "dinesh");

// Check for connection error
if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Database connection failed: " . $conn->connect_error]);
    exit();
}

// Ensure the request is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["success" => false, "message" => "Invalid request method. Use POST."]);
    exit();
}

// Ensure file and user_id are provided
if (!isset($_FILES['file']) || !isset($_POST['user_id'])) {
    echo json_encode(["success" => false, "message" => "File or user_id missing."]);
    exit();
}

$file = $_FILES['file'];
$user_id = intval($_POST['user_id']); // Get user_id from POST request
$filename = basename($file['name']);
$tmpPath = $file['tmp_name'];
$fileExt = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

if (!in_array($fileExt, ['docx', 'pdf'])) {
    echo json_encode(["success" => false, "message" => "Only DOCX and PDF files are supported."]);
    exit();
}

// Validate user_id
if ($user_id <= 0) {
    echo json_encode(["success" => false, "message" => "Invalid user_id."]);
    exit();
}

// Save the file to the uploads folder
$uploadDir = "uploads/";
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}
$filePath = $uploadDir . time() . "_" . $filename;
move_uploaded_file($tmpPath, $filePath);

// Extract text based on file type
$text = "";
if ($fileExt === 'docx') {
    $text = extractTextFromDocx($filePath);
} elseif ($fileExt === 'pdf') {
    $text = extractTextFromPdf($filePath);
}

// Example reference text for Plagiarism Check
$referenceText = "This is an example text used for checking plagiarism. Modify this with actual data.";

// Calculate Plagiarism Percentage
$plagiarismPercentage = calculatePlagiarism($text, $referenceText);

// Insert file details into the database
$stmt = $conn->prepare("INSERT INTO plagiarism_results (user_id, filename, file_path, plagiarism_percentage) VALUES (?, ?, ?, ?)");
$stmt->bind_param("issd", $user_id, $filename, $filePath, $plagiarismPercentage);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "File uploaded and plagiarism check stored successfully.",
        "user_id" => $user_id,
        "filename" => $filename,
        "file_path" => $filePath,
        "plagiarism_percentage" => "$plagiarismPercentage%"
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Failed to store file in database: " . $conn->error]);
}

$stmt->close();
$conn->close();
exit();

// Function to extract text from DOCX
function extractTextFromDocx($filePath) {
    $phpWord = IOFactory::load($filePath);
    $text = "";
    foreach ($phpWord->getSections() as $section) {
        foreach ($section->getElements() as $element) {
            if (method_exists($element, 'getText')) {
                $text .= $element->getText() . " ";
            }
        }
    }
    return trim($text);
}

// Function to extract text from PDF
function extractTextFromPdf($filePath) {
    $parser = new Parser();
    $pdf = $parser->parseFile($filePath);
    return trim($pdf->getText());
}

// Function to calculate plagiarism percentage
function calculatePlagiarism($text, $referenceText) {
    similar_text($text, $referenceText, $percent);
    return round($percent, 2);
}
?>