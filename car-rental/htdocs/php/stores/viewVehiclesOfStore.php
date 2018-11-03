<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

$sql="SELECT License_Plate,Model,CType,Make
    FROM Vehicles_Stores
    WHERE Store_ID = '$StoreID'
    ";

$result=$connection->query($sql);
echo "<h1>Vehicles of Store_ID: ".$StoreID."</h1><br/>
    <table border='1'>
        <tr>
            <th>License_Plate</th>
            <th>Model</th>
            <th>CType</th>
            <th>Make</th>
        </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['License_Plate']."</td>
            <td>".$row['Model']."</td>
            <td>".$row['CType']."</td>
            <td>".$row['Make']."</td>
            </tr>
        ";
    }
    echo "</table>";
}
?>
