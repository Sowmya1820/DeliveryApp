<?php
session_start(); // start the session
// php for delivery partner login
// Retrieve the values from the form
$user_id = $_POST['UserID'];
$password = $_POST['password'];


$_SESSION['partnerid'] = $user_id;

//For connecting with database
$servername = "localhost";
$username = "root";
$pwd = "";
$dbname = "OnlineDeliverySystem";

// Create connection
$con = mysqli_connect($servername, $username, $pwd, $dbname);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
// Construct the SQL query
// Validating the UserID and Password
if (isset($_POST['UserID']) && isset($_POST['password'])) {

    // Check if UserID and password matches already exists
    $checkQuery = "SELECT * FROM DeliveryPartner WHERE PartnerID = '$user_id' AND Password = '$password'";
    $result = $con->query($checkQuery);

    if ($result->num_rows > 0) {
        echo '<script>alert("Login Successful."); window.location.href="delivery_partner_home.html";</script>';
    } else {
        echo '<script>alert("Please enter valid credentials"); window.history.back();</script>';
    }
    // Close the connection
    mysqli_close($con);
}
?>

