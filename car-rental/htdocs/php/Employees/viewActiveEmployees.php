<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT * FROM EMPLOYEE natural join WORKS where Finish_Date > CURDATE() ORDER BY Store_ID";

$result=$connection->query($sql);
echo "<table border='1'>
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
        <th>Store_ID</th>
        <th>Start_Date</th>
        <th>Finish_Date</th>
        <th>Job</th>
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
