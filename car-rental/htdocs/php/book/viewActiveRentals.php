<?php
require_once ('../common.php');
$connection = connectDatabase();


$sql= "SELECT * FROM RENTS as R
WHERE(R.Start_Date<=CURDATE() and R.Finish_Date>=CURDATE())";
$result=$connection->query($sql);


echo "<table>
        <tr>
		<th> Start_Date </th>
		<th> License_Plate </th>
		<th> Start_Location </th>
		<th> Finish_Location </th>
		<th> Finish_Date </th>
		<th> Return_State </th>
		<th> Customer_ID </th>
    <th> IRS_Number </th>
		</tr>";

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo "<tr>
			<td>" . $row["Start_Date"] . "</td>
			<td>" . $row["License_Plate"] . "</td>
			<td>" . $row["Start_Location"] . "</td>
			<td>" . $row["Finish_Location"] . "</td>
			<td>" . $row["Finish_Date"] . "</td>
			<td>" . $row["Return_State"] . "</td>
			<td>" . $row["Customer_ID"] . "</td>
      <td>" . $row["IRS_Number"] . "</td>
			</tr>";
	}
	echo "</table>";
}
?>
