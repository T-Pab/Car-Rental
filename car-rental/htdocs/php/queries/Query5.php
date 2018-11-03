<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT CUSTOMER.First_Name, CUSTOMER.Last_Name, RENTS.License_Plate, RENTS.Start_Date, RENTS.Finish_Date
FROM CUSTOMER JOIN RENTS ON RENTS.Customer_ID=CUSTOMER.Customer_ID
WHERE  RENTS.Start_Date <= '2017-12-31' AND  RENTS.Start_Date >='2017-01-01' AND RENTS.Finish_Date<='2018-01-01'
ORDER BY Start_Date, Finish_Date";

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
