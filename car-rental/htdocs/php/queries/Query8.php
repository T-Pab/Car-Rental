<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT v.Store_ID, Max(CYear) as Year,v.Make, v.Model, v.License_Plate
from VEHICLE as v
where( v.CType='car')
group by Store_ID  ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>Store_ID</th>
        <th>Year</th>
        <th>Make</th>
        <th>Model</th>
        <th>License_Plate</th>


                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
            <td>".$row['Year']."</td>
            <td>".$row['Make']."</td>
            <td>".$row['Model']."</td>
            <td>".$row['License_Plate']."</td>



                        </tr>
        ";
    }
    echo "</table>";
}
?>
