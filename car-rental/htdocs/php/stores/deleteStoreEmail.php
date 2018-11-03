<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$EmailAddress=$_POST["EmailAddress"];

$sql=" DELETE FROM EMAIL_ADDRESS
	   WHERE Store_ID = '$StoreID' and Email= '$EmailAddress'";
if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
		echo "E-mail deleted successfully";
	} else {
		echo "No record deleted";
	}
} else {
	echo "Error deleting E-mail: ". $connection->error;
}
?>
