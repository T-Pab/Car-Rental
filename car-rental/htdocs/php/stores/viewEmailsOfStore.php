<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

$sql="SELECT Email
    FROM STORE natural join EMAIL_ADDRESS
    WHERE Store_ID = '$StoreID'
    ";

$result=$connection->query($sql);
echo "<h1>Email Addresses of Store_ID: ".$StoreID."</h1><br/>
    <table>
        <tr><th>Email</th></tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row['Email']."</td></tr>";
    }
    echo "</table>";
}
?>
