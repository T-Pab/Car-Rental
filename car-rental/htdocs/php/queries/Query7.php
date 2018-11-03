<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT  Count(*) as Number_Of_vehicles, v.CType
from VEHICLE as v
group by CType ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>CType</th>
        <th>Number_Of_vehicles</th>



                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['CType']."</td>
            <td>".$row['Number_Of_vehicles']."</td>


                        </tr>
        ";
    }
    echo "</table>";
}
?>
