<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql = "SELECT *
        FROM CUSTOMER
        WHERE CUSTOMER.Customer_ID not in (SELECT Customer_ID
                                           FROM RESERVES)";
$result=$connection->query($sql);

echo "<table>
		<tr>
		<th>Customer_ID</th>
		<th>IRS_Number</th>
		<th>SSN</th>
		<th>Last_Name</th>
		<th>First_Name</th>
		<th>Driver_License</th>
		<th>First_Registration</th>
		<th>City</th>
		<th>Postal_Code</th>
		<th>Street</th>
		<th>Street_Number</th>
		</tr>";

if (mysqli_num_rows($result) > 0) {
	while($row = mysqli_fetch_assoc($result)) {
		echo "<tr>";
		echo "<td>" . $row["Customer_ID"] . "</td>";
		echo "<td>" . $row["IRS_Number"] . "</td>";
		echo "<td>" . $row["SSN"] . "</td>";
		echo "<td>" . $row["Last_Name"] . "</td>";
		echo "<td>" . $row["First_Name"] . "</td>";
		echo "<td>" . $row["Driver_License"] . "</td>";
		echo "<td>" . $row["First_Registration"] . "</td>";
		echo "<td>" . $row["City"] . "</td>";
		echo "<td>" . $row["Postal_Code"] . "</td>";
		echo "<td>" . $row["Street"] . "</td>";
		echo "<td>" . $row["Street_Number"] . "</td>";
		echo "</tr>";
	}
}
?>
