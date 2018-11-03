<?php
require_once ('../common.php');
$connection = connectDatabase();

$License_Plate=$_POST["License_Plate"];
$Model=$_POST["Model"];
$CType=$_POST["CType"];
$Make=$_POST["Make"];
$CYear=$_POST["CYear"];
$Kilometers=$_POST["Kilometers"];
$Cylinder_Capacity=$_POST["Cylinder_Capacity"];
$Horse_Power=$_POST["Horse_Power"];
$Damages=$_POST["Damages"];
$Malfunctions=$_POST["Malfunctions"];
$Next_Service=$_POST["Next_Service"];
$Insurance_Exp_Date=$_POST["Insurance_Exp_Date"];
$Last_Service=$_POST["Last_Service"];
$Store_ID=$_POST["Store_ID"];
$Fuel=$_POST["Fuel"];

$sql1="INSERT INTO VEHICLE (License_Plate,Model,CType,Make,CYear,Kilometers,Cylinder_Capacity,Horse_Power,Damages,Malfunctions,Next_Service,Insurance_Exp_Date,Last_Service,Store_ID) VALUES('$License_Plate','$Model','$CType','$Make','$CYear','$Kilometers','$Cylinder_Capacity','$Horse_Power','$Damages','$Malfunctions','$Next_Service','$Insurance_Exp_Date','$Last_Service','$Store_ID')";

$sql2="INSERT INTO FUEL_TYPE(License_Plate,Fuel) VALUES('$License_Plate','$Fuel')";

$connection->begin_transaction();
if ($connection->query($sql1) == TRUE) {
    if ($connection->query($sql2) == TRUE) {
        $connection->commit();
        echo "Vehicle added successfully";
    } else {
        echo "Error adding Vehicle: ". $connection->error;
        $connection->rollback();
    }
} else {
	echo "Error2 adding Vehicle: ". $connection->error;
    $connection->rollback();
}
?>
