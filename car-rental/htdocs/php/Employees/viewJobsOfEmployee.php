<?php
require_once ('../common.php');
$connection = connectDatabase();

$IRS_Number=$_POST["IRS_Number"];

if ($IRS_Number <= 0) {
    exit ("IRS Number must be positive integer");
}

$sql="SELECT Store_ID,Start_Date,Finish_Date,Job
    FROM EMPLOYEE natural join WORKS
    WHERE IRS_Number = '$IRS_Number'";

$result=$connection->query($sql);
echo "<h1>Jobs of Employee with IRS Number: ".$IRS_Number."</h1><br/>
    <table>
        <tr>
        <th>Store_ID</th>
        <th>Start_Date</th>
        <th>Finish_Date</th>
        <th>Job</th>
        </tr>
    ";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['Start_Date']."</td>
            <td>".$row['Finish_Date']."</td>
            <td>".$row['Job']."</td>
            </tr>
        ";
    }
    echo "</table>";
}
?>
