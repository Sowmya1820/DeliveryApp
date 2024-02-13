<?php

session_start();

// php for placing order
// Retrieve the values from the form
$size = $_POST['size'];
$description = $_POST['description'];
$location = $_POST['location'];
$package_id = uniqid();
$order_id = uniqid();
$partner_id = '8' ;
$customer_id = $_SESSION['customerid'];

$_SESSION['order_id'] = $order_id;


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
//inserting
//inserting data into Orders table
$ordersql = "INSERT INTO Orders VALUES ('$order_id', 'Picked Up', '$customer_id', '$partner_id', '$location')";

if ($con->query($ordersql) === TRUE) {
    // Insert the package table
    $sqlp = "INSERT INTO Package VALUES ('$package_id ', '$order_id', '$size', '$description')";
    if ($con->query($sqlp) === TRUE) {
        echo '<script>alert("Order Placed Successfully."); window.location.href = "orders_details.php";</script>';
    } else {
        echo "Error: " . $sqlp . "<br>" . $con->error;
    }
} else {
    echo "Error: " . $ordersql . "<br>" . $con->error;
}
// Close the connection
mysqli_close($con);

?>

