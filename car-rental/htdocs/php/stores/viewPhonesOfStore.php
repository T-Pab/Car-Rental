<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

$sql="SELECT Phone
    FROM STORE natural join PHONE_NUMBER
    WHERE Store_ID = '$StoreID'
    ";

$result=$connection->query($sql);
echo "<h1>Phone Numbers of Store_ID: ".$StoreID."</h1><br/>
    <table>
        <tr><th>Phone</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row['Phone']."</td></tr>";
    }
    echo "</table>";
}
?>
