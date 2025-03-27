<?php
header("Content-Type: application/json");
require 'vendor/autoload.php';
use PhpOffice\PhpWord\IOFactory;
use Smalot\PdfParser\Parser;
$mysqli = new mysqli("localhost", "root", "", "research_db"); // Update DB details

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
    exit();
}

if (!isset($_FILES['file'])) {
    echo json_encode(["success" => false, "message" => "No file uploaded."]);
    exit();
}

$file = $_FILES['file']['tmp_name'];
$fileType = $_FILES['file']['type'];

function extractText($file, $fileType) {
    if (strpos($fileType, "word") !== false) {
        $phpWord = IOFactory::load($file);
        $text = "";
        foreach ($phpWord->getSections() as $section) {
            foreach ($section->getElements() as $element) {
                if (method_exists($element, 'getText')) {
                    $text .= $element->getText() . " ";
                }
            }
        }
        return strtolower(trim($text));
    } elseif (strpos($fileType, "pdf") !== false) {
        $parser = new Parser();
        $pdf = $parser->parseFile($file);
        return strtolower(trim($pdf->getText()));
    } elseif (strpos($fileType, "text") !== false) {
        return strtolower(trim(file_get_contents($file)));
    }
    return false;
}

$uploadedText = extractText($file, $fileType);
if ($uploadedText === false) {
    echo json_encode(["success" => false, "message" => "Unsupported file format."]);
    exit();
}

// Fetch stored research papers from DB
$query = $mysqli->query("SELECT content FROM research_papers");
$databaseTexts = [];
while ($row = $query->fetch_assoc()) {
    $databaseTexts[] = strtolower($row['content']);
}

function cosineSimilarity($text1, $text2) {
    $words1 = array_count_values(str_word_count($text1, 1));
    $words2 = array_count_values(str_word_count($text2, 1));
    $dotProduct = 0;
    foreach ($words1 as $word => $count) {
        if (isset($words2[$word])) {
            $dotProduct += $count * $words2[$word];
        }
    }
    $magnitude1 = sqrt(array_sum(array_map(fn($count) => $count ** 2, $words1)));
    $magnitude2 = sqrt(array_sum(array_map(fn($count) => $count ** 2, $words2)));
    return ($magnitude1 && $magnitude2) ? ($dotProduct / ($magnitude1 * $magnitude2)) : 0;
}

$maxPlagiarism = 0;
foreach ($databaseTexts as $dbText) {
    $similarity = cosineSimilarity($uploadedText, $dbText);
    $maxPlagiarism = max($maxPlagiarism, $similarity * 100);
}

echo json_encode([
    "success" => true,
    "message" => "Plagiarism check completed.",
    "plagiarism_percentage" => round($maxPlagiarism, 2) . "%"
]);
?>
