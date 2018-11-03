<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT e.First_Name, e.Last_Name, w.Store_ID, w.IRS_Number
FROM WORKS AS w , EMPLOYEE AS e
WHERE(w.job='Manager' AND w.Finish_Date>=CURDATE() AND w.IRS_Number=e.IRS_Number)
ORDER BY Store_ID ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>Store_ID</th>
        <th>First_Name</th>
        <th>Last_Name</th>
        <th>IRS_Number</th>
        </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['First_Name']."</td>
            <td>".$row['Last_Name']."</td>
            <td>".$row['IRS_Number']."</td>
            </tr>
        ";
    }
    echo "</table>";
}
?>
