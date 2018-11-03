<?php
require_once ('../common.php');
$connection = connectDatabase();

$CType=$_POST["CType"];
$Start_Date=$_POST["Start_Date"];
$Finish_Date=$_POST["Finish_Date"];

if ($Start_Date < date('Y-m-d')) {
    die ("Start Date must be higher than today");
} else if ($Finish_Date < date('Y-m-d')) {
    die ("Finish Date must be higher than today");
}

$sql="SELECT *
	  FROM VEHICLE
	  WHERE CType='$CType' and License_Plate not in (
		SELECT License_Plate
		FROM RESERVES
		WHERE (Start_Date <= '$Start_Date' and '$Start_Date' <= Finish_Date) or (Start_Date <= '$Finish_Date' and '$Finish_Date' <= Finish_Date) or ('$Start_Date' <= Start_Date and Finish_Date <= '$Finish_Date'))";

$result=$connection->query($sql);


echo "<table>
		<tr>
		<th> Store_ID</th>
		<th> License_Plate </th>
		<th> Model </th>
		<th> CType </th>
		<th> Make </th>
		<th> CYear </th>
		<th> Kilometers </th>
		<th> Cylinder_Capacity </th>
		<th> Horse_Power </th>
		<th> Damages</th>
		<th> Malfunctions</th>
		<th> Next_Service</th>
		<th> Insurance_Exp_Date</th>
		<th> Last_Service</th>
		</tr>";

if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo "<tr>
			<td>" . $row["Store_ID"] . "</td>
			<td>" . $row["License_Plate"] . "</td>
			<td>" . $row["Model"] . "</td>
			<td>" . $row["CType"] . "</td>
			<td>" . $row["Make"] . "</td>
			<td>" . $row["CYear"] . "</td>
			<td>" . $row["Kilometers"] . "</td>
			<td>" . $row["Cylinder_Capacity"] . "</td>
			<td>" . $row["Horse_Power"] . "</td>
			<td>" . $row["Damages"] . "</td>
			<td>" . $row["Malfunctions"] . "</td>
			<td>" . $row["Next_Service"] . "</td>
			<td>" . $row["Insurance_Exp_Date"] . "</td>
			<td>" . $row["Last_Service"] . "</td>
			</tr>";
	}
	echo "</table>";
}



?>
