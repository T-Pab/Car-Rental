<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT v.Store_ID, v.CType, max(CYear) as Year, v.License_Plate
FROM VEHICLE as v
GROUP BY CType  ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>Store_ID</th>
        <th>CType</th>
        <th>Year</th>
        <th>License_Plate</th>



                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['CType']."</td>
            <td>".$row['Year']."</td>
            <td>".$row['License_Plate']."</td>



                        </tr>
        ";
    }
    echo "</table>";
}
?>
