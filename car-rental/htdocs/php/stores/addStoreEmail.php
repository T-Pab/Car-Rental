<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];
$EmailAddress=$_POST["EmailAddress"];

$sql = " INSERT INTO EMAIL_ADDRESS ( Store_ID, Email)
VALUES
('$StoreID', '$EmailAddress')";
if ($connection->query($sql) == TRUE) {
	echo "Email added successfully";
} else {
	echo "Error adding Email: ". $connection->error;
}
?>
