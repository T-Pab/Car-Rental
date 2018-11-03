<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT  v.Store_ID, Count(*) as Number_Of_cars
FROM VEHICLE as v
WHERE (v.CType='car')
GROUP BY Store_ID
ORDER BY Store_ID ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>Store_ID</th>
        <th>Number_Of_cars</th>
                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['Number_Of_cars']."</td>
                        </tr>
        ";
    }
    echo "</table>";
}
?>
