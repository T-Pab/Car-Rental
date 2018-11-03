<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT * FROM EMPLOYEE ORDER BY Last_Name";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>IRS_Number</th>
        <th>SSN</th>
        <th>Driver_License</th>
        <th>First_Name</th>
        <th>Last_Name</th>
        <th>Street</th>
        <th>Street_Number</th>
        <th>Postal_Code</th>
        <th>City</th>
        </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['IRS_Number']."</td>
            <td>".$row['SSN']."</td>
            <td>".$row['Driver_License']."</td>
            <td>".$row['First_Name']."</td>
            <td>".$row['Last_Name']."</td>
            <td>".$row['Street']."</td>
            <td>".$row['Street_Number']."</td>
            <td>".$row['Postal_Code']."</td>
            <td>".$row['City']."</td>
            </tr>
        ";
    }
    echo "</table>";
}
?>
