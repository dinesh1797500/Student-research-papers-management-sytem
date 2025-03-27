<?php
$enteredPassword = "Test@123";
$storedHash = "$2y$10$lWXDYVoyvpRN4d0AG2sw6eU2VHjKOT.YRPYPx2mmKbZd803r2LRKm";

if (password_verify($enteredPassword, $storedHash)) {
    echo "✅ Password is correct!";
} else {
    echo "❌ Password is incorrect!";
}
?>
