<?php
require_once ('../common.php');
$connection = connectDatabase();

$sql = "SELECT Customer_ID,IRS_Number,Last_Name,First_Name, COUNT(*) as Number_of_Unpaid_Finished_Reservations
        FROM CUSTOMER
        WHERE CUSTOMER.Customer_ID in (SELECT Customer_ID
                                       FROM RESERVES
                                       WHERE Start_Date < CURDATE() AND Paid = FALSE)
        group by CUSTOMER.Customer_ID
        order by Last_Name, First_Name";
$result=$connection->query($sql);

echo "<table>
		<tr>
		<th>Customer_ID</th>
		<th>IRS_Number</th>
		<th>Last_Name</th>
		<th>First_Name</th>
		<th>Number_of_Unpaid_Finished_Reservations</th>
		</tr>";

if (mysqli_num_rows($result) > 0) {
	while($row = mysqli_fetch_assoc($result)) {
		echo "<tr>";
		echo "<td>" . $row["Customer_ID"] . "</td>";
		echo "<td>" . $row["IRS_Number"] . "</td>";
		echo "<td>" . $row["Last_Name"] . "</td>";
		echo "<td>" . $row["First_Name"] . "</td>";
		echo "<td>" . $row["Number_of_Unpaid_Finished_Reservations"] . "</td>";
		echo "</tr>";
	}
    echo "</table>";
}
?>
