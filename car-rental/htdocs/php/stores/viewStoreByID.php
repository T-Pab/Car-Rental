<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

$sql="SELECT * FROM STORE WHERE Store_ID='$StoreID'";

$result=$connection->query($sql);
echo "<table border='1'>
        <tr>
        <th>Store_ID</th>
        <th>Street</th>
        <th>Street_Number</th>
        <th>Postal_Code</th>
        <th>City</th>
        </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['Store_ID']."</td>
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
