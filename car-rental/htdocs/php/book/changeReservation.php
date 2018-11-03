<?php
require_once ('../common.php');
$connection = connectDatabase();

$License_Plate=$_POST["License_Plate"];
$Start_Date=$_POST["Start_Date"];
$Start_Location=$_POST["Start_Location"];
$Finish_Location=$_POST["Finish_Location"];
$Finish_Date=$_POST["Finish_Date"];
$Customer_ID=$_POST["Customer_ID"];

if ($Finish_Date < date('Y-m-d')) {
    die ("Finish Date must be higher than today");
}
$sql="UPDATE RESERVES
      SET Start_Location = '$Start_Location', Finish_Location = '$Finish_Location', Finish_Date = '$Finish_Date', Customer_ID = '$Customer_ID')
      WHERE Start_Date ='$Start_Date' AND License_Plate = '$License_Plate'";


if ($connection->query($sql) == TRUE) {
   echo "Reservation added successfully";
} else {
  echo "Error adding Reservation:". $connection->error;
}
?>
