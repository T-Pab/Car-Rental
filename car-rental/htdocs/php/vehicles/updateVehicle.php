<?php
require_once ('../common.php');
$connection = connectDatabase();


$License_Plate=$_POST["License_Plate"];
$Kilometers=$_POST["Kilometers"];
$Damages=$_POST["Damages"];
$Malfunctions=$_POST["Malfunctions"];
$Next_Service=$_POST["Next_Service"];
$Insurance_Exp_Date=$_POST["Insurance_Exp_Date"];
$Last_Service=$_POST["Last_Service"];
$Store_ID=$_POST["Store_ID"];
$Fuel=$_POST["Fuel"];

$sql1= "UPDATE VEHICLE
       SET Kilometers = '$Kilometers', Damages = '$Damages', Malfunctions = '$Malfunctions', Next_Service = '$Next_Service', Insurance_Exp_Date = '$Insurance_Exp_Date', Last_Service = '$Last_Service', Store_ID = '$Store_ID'
       WHERE License_Plate = '$License_Plate'";
$sql2="UPDATE FUEL_TYPE SET Fuel = '$Fuel' WHERE License_Plate = '$License_Plate' ";

$connection->begin_transaction();
if ($connection->query($sql1) == TRUE) {
    $affected=$connection->affected_rows;
    if ($connection->query($sql2) == TRUE) {
        $affected += $connection->affected_rows;
        if ($affected > 0) {
            echo "Vehicle updated successfully";
        } else {
            echo "No Record updated.";
        }
        $connection->commit();
    } else {
        echo "Error updating Vehicle: ". $connection->error;
        $connection->rollback();
    }
} else {
    echo "Error updating Vehicle: ". $connection->error;
    $connection->rollback();
}
?>
