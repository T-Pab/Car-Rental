<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];

if ($IRS_Number <= 0) {
	echo "IRS Number must be a positive integer";
}
else {
	$sql = "DELETE FROM EMPLOYEE
	WHERE IRS_Number = $IRS_Number";
	if ($connection->query($sql) == TRUE) {
		$numOfUpdatedRecords = mysqli_affected_rows($connection);
	    if ($numOfUpdatedRecords !=0) {
			echo "Employee deleted successfully";
		} else {
			echo "No record deleted";
		}
	} else {
		echo "Error deleting Store: ". $connection->error;
	}
}
?>
