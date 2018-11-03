<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];
$SSN = $_POST["SSN"];
$Driver_License=$_POST["Driver_License"];
$First_Name=$_POST["First_Name"];
$Last_Name=$_POST["Last_Name"];
$Street=$_POST["Street"];
$Street_Number=$_POST["Street_Number"];
$Postal_Code=$_POST["Postal_Code"];
$City=$_POST["City"];
$Store_ID=$_POST["Store_ID"];
$Start_Date=$_POST["Start_Date"];
$Finish_Date=$_POST["Finish_Date"];
$Job=$_POST["Job"];


$sql1 = "INSERT INTO EMPLOYEE (IRS_Number,SSN,Driver_License,First_Name,Last_Name,Street,Street_Number,Postal_Code,City)
         VALUES ('$IRS_Number','$SSN','$Driver_License','$First_Name','$Last_Name','$Street','$Street_Number','$Postal_Code','$City')";

$sql2 = "INSERT INTO WORKS (IRS_Number,Store_ID,Start_Date,Finish_Date,Job)
         VALUES ('$IRS_Number', '$Store_ID', '$Start_Date','$Finish_Date','$Job')";

$connection->begin_transaction();
if ($connection->query($sql1) == TRUE) {
    if ($connection->query($sql2) == TRUE) {
        echo "Employee added successfully";
        $connection->commit();
    } else {
        echo "Error adding Employee: ". $connection->error;
        $connection->rollback();
    }
} else {
    echo "Error adding Employee: ". $connection->error;
    $connection->rollback();
}
?>
