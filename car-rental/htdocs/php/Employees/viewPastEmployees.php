<?php
require_once ('../common.php');
$connection = connectDatabase();

$current_date=date("Y-m-d");
$sql= " select * from EMPLOYEE where IRS_Number in (select IRS_Number from (select IRS_Number,max(Finish_Date) from (SELECT IRS_Number,SSN,Driver_License,First_Name,Last_Name,Street,Street_Number,Postal_Code,City,Finish_Date FROM EMPLOYEE natural join WORKS order by IRS_Number,Finish_Date DESC) as x group by IRS_Number HAVING max(Finish_Date)<CURDATE()) as y ) " ;  
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
