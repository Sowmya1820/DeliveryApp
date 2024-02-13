<!DOCTYPE html>
<html>
<head>
    <title>Order Summary Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            padding: 20px;
            background-image: url('33210633.jpg');
            background-size: cover;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        p {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ddd;
            color: #333;
        }
        .order-details {
            text-align: center;
            padding: 0.5px;
            background-color: #fff;
            border: 0.3px solid #ccc;
            border-radius: 1px;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);
            width: 40%;
            margin: 0 auto;
            font-family: Arial, sans-serif;
            background-image: url('33210633.jpg');
            background-size: cover;
            font-size: 15px;
            font-weight: bold;
            color: #555;
        }
        input[type="submit"] {
            width: 30%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .button-container {
            display: flex;
            justify-content: center;
            width: 100%;
        }
    </style>
</head>
<body>
<h2>Order Summary Details And Other Information</h2>

<?php

session_start();

// Your database connection setup
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "OnlineDeliverySystem";

$order_id = $_SESSION['order_id'];
$customer_id = $_SESSION['customerid'];

// Create connection
$con = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

//showing the customer name for a particular order using inner join
// Use a JOIN query to get the customer name
$innerjoinquery = "SELECT C.FullName, O.OrderStatus FROM Orders O INNER JOIN Customer C ON O.CustomerID = C.CustomerID WHERE O.OrderID = '$order_id';";
$result = $con->query($innerjoinquery);

// Display the Customer Name and Order Status
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $customer_name = $row["FullName"];
    $order_status = $row["OrderStatus"];
    echo '<div class="order-details">
            <p> CUSTOMER NAME :  ' . $customer_name . '</p>
            <p> ORDER STATUS : ' . $order_status . '</p>
         </div>';
} else {
    echo '<div class="order-details">Order details not found.</div>';
}


// Package Delivery Location using view and join
$viewsql = "SELECT Location FROM customerorderview WHERE OrderID='$order_id';";
$resultview = $con->query($viewsql);

// Display the delivery Location for a particular order
if ($resultview->num_rows > 0) {
    while ($row = $resultview->fetch_assoc()) {
        $delivery_address = $row["Location"];
        echo '<div class="order-details">
            <p> DELIVERY ADDRESS :  ' . $delivery_address . '</p>
         </div>';
    }
} else {
    echo '<div class="order-details">Delivery Location not found for this order.</div>';
}

// SQL query
//showing the count of orders placed by a customer using group by
$sql = "SELECT CustomerID, COUNT(*) as total_orders FROM Orders where CustomerID ='$customer_id' GROUP BY CustomerID";
$resultsql = $con->query($sql);

// Display the data
if ($resultsql->num_rows > 0) {
    while ($row = $resultsql->fetch_assoc()) {
        echo '<div class="order-details">
            <p> CUSTOMER ID : ' . $row["CustomerID"] . '</p>
            <p> TOTAL ORDERS : ' . $row['total_orders'] . '</p>
         </div>';
    }
} else {
    echo '<div class="order-details">No orders placed.</div>';
}

// showing address of a customer who ordered using nested query
$nestedquery = "Select Address from Customer where CustomerID in (Select CustomerID from Orders where OrderID = '$order_id');";
$resultnq = $con->query($nestedquery);

// Display the customer Address
if ($resultnq->num_rows > 0) {
    $row = $resultnq->fetch_assoc();
    $customer_address = $row["Address"];
    echo '<div class="order-details">
            <p> CUSTOMER ADDRESS : ' . $customer_address . '</p>
         </div>';
} else {
    echo '<div class="order-details">Customer Address not found for this order.</div>';
}

// finding the maximum amount using ALL
$all = " SELECT * FROM Payment WHERE Amount >= ALL(SELECT Amount FROM Payment);";
$resultall = $con->query($all);

// Display the max amount
if ($resultall->num_rows > 0) {
    while ($row = $resultall->fetch_assoc()) {
        $max_amount = $row["Amount"];
        echo '<div class="order-details">
            <p> MAX AMOUNT PAID : ' . $max_amount . '</p>
         </div>';
    }
} else {
    echo '<div class="order-details">No Max Amount found.</div>';
}

//average revenue using correlated subquery
$correlatedsq = " SELECT AVG(Amount) as Revenue FROM Payment p WHERE OrderID IN (SELECT OrderID FROM Orders o WHERE p.OrderId = o.OrderID);";
$resultcorr = $con->query($correlatedsq);

// Display the avg revenue
if ($resultcorr->num_rows > 0) {
    while ($row = $resultcorr->fetch_assoc()) {
        $avg_revenue = $row["Revenue"];
        echo '<div class="order-details">
            <p> AVERAGE REVENUE TODAY : ' . $avg_revenue. '</p>
         </div>';
    }
} else {
    echo "No avg revenue.";
}





// Close the connection
$con->close();
?>


<div class="button-container">
    <input type="submit" value="Logout" onclick="redirectToLogin()">
</div>
<script>
    function redirectToLogin() {
        window.location.href = "home_page.html";
    }
</script>

</body>
</html>
