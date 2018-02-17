<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert New Car Page</title>
		<style type="text/css">
			h1 {text-align: center; color: blue}
			h2 {font-family: Ariel, sans-serif; text-align: left; color: blue}
			p.footer {text-align: center}
			table.output {font-family: Ariel, sans-serif}
		</style>
	</head>
	<body>
	<?php
		// Get connection
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

		$ManufacturerName = $_POST["ManufacturerName"];
		$ModelName = $_POST["ModelName"];
		$LicensePlate = $_POST["LicensePlate"];
		$Year = $_POST["Year"];

		// Create SQL statement to INSERT new data
		$SQLINSERT = "INSERT INTO CAR ";
		$SQLINSERT .= "VALUES( null, '$ManufacturerName', '$ModelName', ";
		$SQLINSERT .= "'$LicensePlate', '$Year')";

		// Execute SQL statement
		$Result = $conn->query($SQLINSERT);

		// Test existence of result
		echo "<h1>
				The Hopper Auto Car Table
			</h1>
			<hr />";
		if ($Result){
			echo "<h2>
				New Car Added:
			</h2>
			<table>
				<tr>";

				echo "<tr>";
				echo "<td>ManufacturerName:</td>";
				echo "<td>" . $ManufacturerName . "</td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td>ModelName:</td>";
				echo "<td>" . $ModelName . "</td>";
				echo "</tr>";
				echo "<td>LicensePlate:</td>";
				echo "<td>" . $LicensePlate . "</td>";
				echo "</tr>";
				echo "<td>Year:</td>";
				echo "<td>" . $Year . "</td>";
				echo "</tr>";
			echo "</table><br /><hr />";
			}
			else {
				exit ("Insert failed: (" . $conn->errno . ") " . $conn->error);
			}

		// Create SQL statement to read Car table data
    	$SQL = "SELECT * FROM Car";

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
	   		The Hopper Auto Shop Car Table
		</h1>
	    <hr />
	    <h2>
	        Car
		</h2>
	<?php
		// Table headers
	    echo "<table class='output' border='1'>
	    		<tr>
	    			<th>ManufacturerName</th>
	    			<th>ModelName</th>
	    			<th>LicensePlate</th>
	    			<th>Year</th>
	    		</tr>";

	    // Table data
	    while($RecordSetRow = $res->fetch_assoc() )
	    	{
	    	echo "<tr>";
	       	echo "<td>" . $RecordSetRow['ManufacturerName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['ModelName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['LicensePlate'] . "</td>";
	    	echo "<td>" . $RecordSetRow['Year'] . "</td>";
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
