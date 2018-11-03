<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT CUSTOMER.First_Name, CUSTOMER.Last_Name, RESERVES.License_Plate, RESERVES.Start_Date, RESERVES.Finish_Date
FROM CUSTOMER JOIN RESERVES ON RESERVES.Customer_ID=CUSTOMER.Customer_ID
WHERE  RESERVES.Start_Date >= CURDATE() ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>First_Name</th>
        <th>Last_Name</th>
        <th>License_Plate</th>
        <th>Start_Date</th>
        <th>Finish_Date</th>
                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['First_Name']."</td>
            <td>".$row['Last_Name']."</td>
            <td>".$row['License_Plate']."</td>
            <td>".$row['Start_Date']."</td>
            <td>".$row['Finish_Date']."</td>

                        </tr>
        ";
    }
    echo "</table>";
}
?>
