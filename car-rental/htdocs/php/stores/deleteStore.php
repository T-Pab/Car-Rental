<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

if ($StoreID <= 0) {
	echo "Store ID must be a positive integer";
}
else {
	$sql = "DELETE FROM STORE
			WHERE Store_ID = $StoreID";
	if ($connection->query($sql) == TRUE) {
	    if ($connection->affected_rows > 0) {
			echo "Store deleted successfully";
		} else {
			echo "No record deleted";
		}
	} else {
		echo "Error deleting Store: ". $connection->error;
	}
}
?>
