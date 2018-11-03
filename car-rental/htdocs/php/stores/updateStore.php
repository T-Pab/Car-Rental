<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=(int)$_POST["StoreID"];
$Street=$_POST["Street"];
$StreetNumber=$_POST["StreetNumber"];
$PostalCode=$_POST["PostalCode"];
$City=$_POST["City"];


$sql="UPDATE STORE
      SET Street = '$Street', Street_Number = '$StreetNumber', Postal_Code = '$PostalCode', City = '$City'
      WHERE Store_ID = '$StoreID'";

if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
    	echo "Store updated successfully";
    } else {
        echo "No Record updated.";
    }
} else {
	echo "Error updating Store: ". $connection->error;
}
?>
