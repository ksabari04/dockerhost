<?php
$servername = "mysql"; // Replace with your database server name (e.g., 'localhost' or IP address)
$username = "sabarivasan"; // Replace with your database username
$password = "S@03112004"; // Replace with your database password
$dbname = "mydb"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo '<div class="message">Connection successful!</div>';
    // Optionally, you can redirect back to the HTML page or perform other tasks.
}

// Close connection
$conn->close();
?>
