<?php
require_once ('../common.php');
$connection = connectDatabase();

$License_Plate=$_POST["License_Plate"];
$Start_Date=$_POST["Start_Date"];
$Return_State=$_POST["Return_State"];

if ($Return_State == "") {
    die ("Return State must not be empty");
}
$sql1="SELECT Finish_Location
      FROM RENTS
      WHERE License_Plate = '$License_Plate' AND Start_Date = '$Start_Date'";
$result=$connection->query($sql1);
if ($result == TRUE) {
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $Finish_Location = $row["Finish_Location"];

        $sql2="UPDATE VEHICLE
               SET Store_ID = '$Finish_Location'
               WHERE License_Plate = '$License_Plate'";
        $sql3="UPDATE RENTS
               SET Return_State = '$Return_State'
               WHERE License_Plate = '$License_Plate' AND Start_Date = '$Start_Date'";

        $connection->begin_transaction();
        if ($connection->query($sql2) == TRUE) {
           if ($connection->query($sql3) == TRUE) {
               echo "Vehicle returned successfully";
               $connection->commit();
           } else {
               echo "Error returning Vehicle:". $connection->error;
               $connection->rollback();
           }
        } else {
           echo "Error returning Vehicle:". $connection->error;
           $connection->rollback();
        }
    } else {
        echo "There is no Rental with this License Plate and Start Date";
    }
} else {
echo "Error: ". $connection->error;
}
?>
