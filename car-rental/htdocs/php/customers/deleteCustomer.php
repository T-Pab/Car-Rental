<?php
require_once ('../common.php');
$connection = connectDatabase();

$Customer_ID=$_POST["Customer_ID"];

$sql = "DELETE FROM CUSTOMER WHERE  Customer_ID= '$Customer_ID'";
if ($connection->query($sql) == TRUE) {
	if ($connection->affected_rows != 0) {
		echo "Customer deleted successfully";
	} else {
		echo "No record deleted";
	}
} else {
	echo "Error deleting Customer: ". $connection->error;
}
?>
