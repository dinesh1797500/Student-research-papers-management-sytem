<?php
$host = "localhost"; 
$user = "root"; 
$pass = ""; 
$dbname = "dinesh"; 

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die(" " . $conn->connect_error);
}
?>
