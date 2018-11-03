<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];
$Store_ID=$_POST["Store_ID"];
$Start_Date=$_POST["Start_Date"];
$Finish_Date=$_POST["Finish_Date"];
$Job=$_POST["Job"];

$sql = "INSERT INTO WORKS (IRS_Number,Store_ID,Start_Date,Finish_Date,Job)
        VALUES ('$IRS_Number', '$Store_ID', '$Start_Date','$Finish_Date','$Job')";

if ($connection->query($sql) == TRUE) {
	echo " Job added successfully";
} else {
	echo "Error adding job: ". $connection->error;
}
?>
