<?php
// Establish a connection to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "OnlineDeliverySystem";

$order_id = $_POST['OrderID'];


$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

    // Call the stored procedure
    $sql = "CALL DeleteOrder($order_id)";
    if ($conn->query($sql) === TRUE) {
        echo '<script>alert("Order Deleted Succesfully.");</script>';
    } else {
        echo '<script>alert("Error Deleting Order.");</script>';

    }

// Close the connection
$conn->close();
?>
