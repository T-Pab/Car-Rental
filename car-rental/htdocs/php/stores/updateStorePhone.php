<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$PhoneNumber=$_POST["PhoneNumber"];
$NewPhoneNumber=$_POST["NewPhoneNumber"];

$sql= " UPDATE PHONE_NUMBER
		SET Phone= '$NewPhoneNumber'
		WHERE Store_ID = '$StoreID' AND Phone = '$PhoneNumber'";
if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
    	echo "Phone updated successfully";
    } else {
        echo "No Record updated.";
    }
} else {
	echo "Error updating Phone: ". $connection->error;
}
?>
