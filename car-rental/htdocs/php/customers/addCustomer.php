<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];
$SSN=$_POST["SSN"];
$Last_Name=$_POST["Last_Name"];
$First_Name=$_POST["First_Name"];
$Driver_License=$_POST["Driver_License"];
$First_Registration=$_POST["First_Registration"];
$City=$_POST["City"];
$Postal_Code=$_POST["Postal_Code"];
$Street=$_POST["Street"];
$Street_Number=$_POST["Street_Number"];

$sql = "INSERT INTO CUSTOMER
(IRS_Number, SSN, Last_Name, First_Name, Driver_License, First_Registration, City, Postal_Code, Street, Street_Number)
VALUES
('$IRS_Number','$SSN','$Last_Name','$First_Name','$Driver_License','$First_Registration','$City','$Postal_Code','$Street','$Street_Number')";
if ($connection->query($sql) == TRUE) {
	echo "Customer added successfully";
} else {
	echo "Error adding Customer: ". $connection->error;
}
?>
