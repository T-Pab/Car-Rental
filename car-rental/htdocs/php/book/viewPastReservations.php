<?php
require_once ('../common.php');
$connection = connectDatabase();


$sql= "SELECT * FROM RESERVES as r
WHERE(r.Start_Date<CURDATE())";
$result=$connection->query($sql);


echo "<table>
        <tr>
		<th> License_Plate </th>
		<th> Start_Date </th>
		<th> Start_Location </th>
		<th> Finish_Location </th>
		<th> Finish_Date </th>
		<th> Paid </th>
		<th> Customer_ID </th>
		</tr>";

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo "<tr>
			<td>" . $row["License_Plate"] . "</td>
			<td>" . $row["Start_Date"] . "</td>
			<td>" . $row["Start_Location"] . "</td>
			<td>" . $row["Finish_Location"] . "</td>
			<td>" . $row["Finish_Date"] . "</td>
			<td>" . $row["Paid"] . "</td>
			<td>" . $row["Customer_ID"] . "</td>
			</tr>";
	}
	echo "</table>";
}



?>
