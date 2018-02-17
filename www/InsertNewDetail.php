<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>InsertNewCustomer PHP Page</title>
		<style type="text/css">
			h1 {text-align: center; color: blue}
			h2 {font-family: Ariel, sans-serif; text-align: left; color: blue}
			p.footer {text-align: center}
			table.output {font-family: Ariel, sans-serif}
		</style>
	</head>
	<body>
	<?php
		$Host = "localhost";
		$Database = "hopperauto";
    	$User = "root";
		$Password = "root";
		$Port = 8889;

		$conn = new mysqli($Host, $User, $Password , $Database, $Port);
        if ($conn->connect_errno) {
              exit ("Failed to connect to MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error );
        }

		// Create short variable names

		$AppointmentID = $_POST["AppointmentID"];
		$ServiceName = $_POST["ServiceName"];
		$ServiceCost = $_POST["ServiceCost"];

		// Create SQL statement to INSERT new data
		$SQLINSERT = "INSERT INTO Service ";
		$SQLINSERT .= "VALUES( null, '$AppointmentID', '$ServiceName', ";
		$SQLINSERT .= "'$ServiceCost')";

		// Execute SQL statement
		$Result = $conn->query($SQLINSERT);

		// Test existence of result
		echo "<h1>
				The James River Designs CUSTOMER Table
			</h1>
			<hr />";
		if ($Result){
			echo "<h2>
				New Customer Added:
			</h2>
			<table>
				<tr>";

				echo "<tr>";
				echo "<td>AppointmentID:</td>";
				echo "<td>" . $AppointmentID . "</td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td>ServiceName:</td>";
				echo "<td>" . $ServiceName . "</td>";
				echo "</tr>";
				echo "<td>ServiceCost:</td>";
				echo "<td>" . $ServiceCost . "</td>";
				echo "</tr>";
			echo "</table><br /><hr />";
			}
			else {
				exit ("Insert failed: (" . $conn->errno . ") " . $conn->error);
			}

		// Create SQL statement to read CUSTOMER table data
    	$SQL = "SELECT * FROM Service";

    	// Execute SQL statement
    	$res = $conn->query($SQL);

    	// Test existence of recordset
    	if (!$res)
	    	{
	        	exit ("Select failed: (" . $conn->errno . ") " . $conn->error);
	    	}
	?>
	    <!--  Page Headers -->
	    <h1>
	   		The Hopper Auto Shop Appointment Detail Table
		</h1>
	    <hr />
	    <h2>
	        Detail
		</h2>
	<?php
		// Table headers
	    echo "<table class='output' border='1'>
	    		<tr>
	    			<th>AppointmentID</th>
	    			<th>ServiceName</th>
	    			<th>ServiceCost</th>
	    		</tr>";

	    // Table data
	    while($RecordSetRow = $res->fetch_assoc() )
	    	{
	    	echo "<tr>";
	       	echo "<td>" . $RecordSetRow['AppointmentID'] . "</td>";
	    	echo "<td>" . $RecordSetRow['ServiceName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['ServiceCost'] . "</td>";
	    	}
	    echo "</table>";

	    //  Close connection
		$conn->close();
	?>
		<br />
		<hr />
		<p class="footer">
			<a href="index.html">Return to Hopper Auto Shop Home Page</a>
		</p>
		<hr />
	</body>
</html>
