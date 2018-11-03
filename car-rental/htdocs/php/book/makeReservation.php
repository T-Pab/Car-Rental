<?php
require_once ('../common.php');
$connection = connectDatabase();

$License_Plate=$_POST["License_Plate"];
$Start_Date=$_POST["Start_Date"];
$Start_Location=$_POST["Start_Location"];
$Finish_Location=$_POST["Finish_Location"];
$Finish_Date=$_POST["Finish_Date"];
$Customer_ID=$_POST["Customer_ID"];

if ($Start_Date < date('Y-m-d')) {
    die ("Start Date must be higher than today");
} else if ($Finish_Date < date('Y-m-d')) {
    die ("Finish Date must be higher than today");
}
$sql="INSERT INTO RESERVES (Start_Date,License_Plate,Start_Location,Finish_Location,Finish_Date,Paid,Customer_ID)
      VALUES ('$Start_Date','$License_Plate','$Start_Location','$Finish_Location','$Finish_Date',FALSE,'$Customer_ID')";


if ($connection->query($sql) == TRUE) {
   echo "Reservation added successfully";
} else {
  echo "Error adding Reservation:". $connection->error;
}
?>
