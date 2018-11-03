<?php
require_once ('../common.php');
$connection = connectDatabase();

$Street=$_POST["Street"];
$StreetNumber=$_POST["StreetNumber"];
$PostalCode=$_POST["PostalCode"];
$City=$_POST["City"];


$sql = "INSERT INTO STORE (Street, Street_Number, Postal_Code, City)
VALUES ('$Street','$StreetNumber','$PostalCode','$City')";
if ($connection->query($sql) == TRUE) {
	echo "Store added successfully";
} else {
	echo "Error adding Store: ". $connection->error;
}
?>
