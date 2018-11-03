<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$PhoneNumber=$_POST["PhoneNumber"];

$sql = "DELETE FROM PHONE_NUMBER
		WHERE Store_ID = '$StoreID' and Phone= '$PhoneNumber'";
if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
		echo "Phone deleted successfully";
	} else {
		echo "No record deleted";
	}
} else {
	echo "Error deleting Phone: ". $connection->error;
}
?>
