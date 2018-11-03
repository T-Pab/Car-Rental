<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql="SELECT CUSTOMER.First_Name, CUSTOMER.Last_Name, COUNT(*) AS Number_of_Rents
FROM  CUSTOMER, RENTS
WHERE CUSTOMER.Customer_ID = RENTS.Customer_ID
Group BY CUSTOMER.Customer_ID
ORDER BY Number_of_Rents, Last_Name; ";

$result=$connection->query($sql);
echo "<table>
        <tr>
        <th>First_Name</th>
        <th>Last_Name</th>
        <th>Number_of_Rents</th>


                </tr>
";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>".$row['First_Name']."</td>
            <td>".$row['Last_Name']."</td>
            <td>".$row['Number_of_Rents']."</td>

                        </tr>
        ";
    }
    echo "</table>";
}
?>
