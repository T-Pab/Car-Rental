<?php
require_once ('../common.php');
$connection = connectDatabase();

$License_Plate=$_POST["License_Plate"];
$Start_Date=$_POST["Start_Date"];
$Payment_Amount=$_POST["Payment_Amount"];
$Payment_Method=$_POST["Payment_Method"];
$IRS_Number=$_POST["IRS_Number"];

if ($Start_Date < date('Y-m-d')) {
    die ("Start Date must be higher than today");
}
$sql1="SELECT Start_Location,Finish_Location,Finish_Date,Customer_ID
       FROM RESERVES
       WHERE RESERVES.License_Plate = '$License_Plate' AND RESERVES.Start_Date = '$Start_Date'";
$result=$connection->query($sql1);
if ($result == TRUE) {
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $Start_Location=$row["Start_Location"];
        $Finish_Location=$row["Finish_Location"];
        $Finish_Date=$row["Finish_Date"];
        $Customer_ID=$row["Customer_ID"];

        $sql2="INSERT INTO RENTS (Start_Date,License_Plate,Start_Location,Finish_Location,Finish_Date,Return_State,Customer_ID, IRS_Number)
               VALUES ('$Start_Date','$License_Plate','$Start_Location','$Finish_Location','$Finish_Date',NULL,'$Customer_ID','$IRS_Number')";
        $sql3="INSERT INTO PAYMENT_TRANSACTION (Start_Date, License_Plate, Payment_Amount, Payment_Method)
               VALUES ('$Start_Date', '$License_Plate', '$Payment_Amount', '$Payment_Method')";
        $connection->begin_transaction();
        if ($connection->query($sql2) == TRUE) {
            if ($connection->query($sql3) == TRUE) {
                echo "Rental and Payment Transaction added successfully";
                $connection->commit();
            } else {
                echo "Error adding Rental and Payment Transaction:". $connection->error;
                $connection->rollback();
            }
        } else {
            echo "Error adding Rental and Payment Transaction:". $connection->error;
            $connection->rollback();
        }
    } else {
        echo "There is no reservation with this License_Plate and Start_Date";
    }
} else {
    echo "Error: ". $connection->error;
}
?>
