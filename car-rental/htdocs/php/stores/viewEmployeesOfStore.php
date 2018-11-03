<?php
require_once ('../common.php');
$connection = connectDatabase();

$StoreID=$_POST["StoreID"];

$sql="SELECT IRS_Number,Job,First_Name,Last_Name
    FROM WORKS natural join EMPLOYEE
    WHERE Store_ID = '$StoreID'
    ";

$result=$connection->query($sql);
echo "<h1>Employees of Store_ID: ".$StoreID."</h1><br/>
    <table border='1'>
        <tr>
            <th>IRS_Number</th>
            <th>Job</th>
            <th>First_Name</th>
            <th>Last_Name</th>
        </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['IRS_Number']."</td>
            <td>".$row['Job']."</td>
            <td>".$row['First_Name']."</td>
            <td>".$row['Last_Name']."</td>
            </tr>
        ";
    }
    echo "</table>";
}
?>
