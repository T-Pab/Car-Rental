<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT  City, COUNT(Customer_ID) as Number_Of_Customers
FROM CUSTOMER
GROUP BY City
HAVING COUNT(Customer_ID) > 2
ORDER BY Number_Of_Customers, City;";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>City</th>
        <th>Number_Of_Customers</th>
                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['City']."</td>
            <td>".$row['Number_Of_Customers']."</td>
                        </tr>
        ";
    }
    echo "</table>";
}
?>
