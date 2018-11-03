<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];
$Store_ID=$_POST["Store_ID"];
$Start_Date=$_POST["Start_Date"];
$Finish_Date=$_POST["Finish_Date"];

$sql="UPDATE WORKS
    SET Finish_Date = '$Finish_Date'
    WHERE (IRS_Number = '$IRS_Number' AND Store_ID = '$Store_ID' AND Start_Date = '$Start_Date')";

if ($connection->query($sql) == TRUE) {
    if ($connection->affected_rows > 0) {
        echo "Employee's Work Finish Date updated successfully";
    } else {
        echo "No Record updated";
    }
} else {
	echo "Error updating Employee Work: ". $connection->error;
}
?>
