<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$EmailAddress=$_POST["EmailAddress"];
$NewEmailAddress=$_POST["NewEmailAddress"];

$sql="UPDATE EMAIL_ADDRESS
	  SET Email= '$NewEmailAddress'
	  WHERE Store_ID = '$StoreID' AND Email = '$EmailAddress'";
if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
    	echo "Email updated successfully";
    } else {
        echo "No Record updated.";
    }
} else {
	echo "Error updating Email: ". $connection->error;
}
?>
