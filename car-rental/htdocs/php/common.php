<?php

function connectDatabase() {
	$database_host = "localhost";
	$database_user = "root";
	$database_pass = "";
	$database_name = "CAR_RENTAL";
	$connection = mysqli_connect($database_host, $database_user, $database_pass, $database_name);
	if ($connection->connect_error) {
		die ("MySQL connection failed: " . $connection->connect_error());
	}
	return $connection;
}
?>
