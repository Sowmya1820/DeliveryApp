<?php

session_start(); // start the session
//php for customer signup


// Retrieve data from the form
$user_id = $_POST['user_id'];
$full_name = $_POST['full_name'];
$email = $_POST['new_email'];
$phone_number = $_POST['phone_number'];
$address = $_POST['address'];
$password = $_POST['new_password'];

$_SESSION['customerid'] = $user_id;

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
// Validating the UserID and Phone Number
if (isset($_POST['user_id']) && isset($_POST['phone_number'])) {

    // Check if UserID already exists
    $checkQuery = "SELECT * FROM Customer WHERE CustomerID = '$user_id'";
    $result = $con->query($checkQuery);

    if ($result->num_rows > 0) {
        echo '<script>alert("User ID already exists. Please choose a different UserID."); window.history.back();</script>';
    } else {
        // Check if the phone number is 10 digits
        if (strlen($phone_number) !== 10 || !is_numeric($phone_number)) {
            echo '<script>alert("Phone number should be 10 digits. Please enter a valid phone number."); window.history.back();</script>';
        } else {

            $sql = "INSERT INTO Customer VALUES ('$user_id', '$full_name','$password', '$email','$phone_number','$address')";
            if (mysqli_query($con, $sql)) {
                echo '<script>alert("Sign up successful :) , goahead and login"); window.location.href="customer_login.html";</script>';
            } else {
                echo "Error: " . $sql . "<br>" . mysqli_error($con);
            }
        }
    }
}
// Close the connection
mysqli_close($con);

?>

