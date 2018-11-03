<?php
require_once ('../common.php');
$connection = connectDatabase();

$Customer_ID=$_POST["Customer_ID"];
$City=$_POST["City"];
$Postal_Code=$_POST["Postal_Code"];
$Street=$_POST["Street"];
$Street_Number=$_POST["Street_Number"];


$sql = "UPDATE CUSTOMER
        SET City = '$City', Postal_Code = '$Postal_Code', Street = '$Street', Street_Number = '$Street_Number'
        WHERE Customer_ID = '$Customer_ID'";

if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
        echo "Customer Updated successfully";
    } else {
        echo "No Record updated.";
    }
} else {
	echo "Error adding Customer: ". $connection->error;
}
?>
