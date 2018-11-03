<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$PhoneNumber=$_POST["PhoneNumber"];

$sql= "INSERT INTO PHONE_NUMBER (Store_ID, Phone) VALUES
('$StoreID','$PhoneNumber')";
if ($connection->query($sql) == TRUE) {
	echo "Phone added successfully";
} else {
	echo "Error adding Phone: ". $connection->error;
}
?>
