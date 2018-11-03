<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT w.Store_ID, Count(*) as Number_Of_Employees
FROM WORKS as w, EMPLOYEE as e
WHERE( w.IRS_Number=e.IRS_Number and w.Finish_Date>CURDATE())
GROUP BY Store_ID ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>Store_ID</th>
        <th>Number_Of_Employees</th>
        </tr>
";
if (($result->num_rows) > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['Number_Of_Employees']."</td>
                        </tr>
        ";
    }
    echo "</table>";
}
?>
