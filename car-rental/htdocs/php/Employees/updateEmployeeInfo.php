<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];
$Driver_License=$_POST["Driver_License"];
$Street=$_POST["Street"];
$Street_Number=$_POST["Street_Number"];
$Postal_Code=$_POST["Postal_Code"];
$City=$_POST["City"];

$sql="UPDATE EMPLOYEE
      SET Driver_License = '$Driver_License', Street = '$Street', Street_Number = '$Street_Number', Postal_Code = '$Postal_Code', City = '$City'
      WHERE IRS_Number = '$IRS_Number'";
if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
        echo "Employee info updated successfully";
    } else {
        echo "No Record updated.";
    }
} else {
	echo "Error updating Employee info: ". $connection->error;
}
?>
