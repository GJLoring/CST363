<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>InsertNewAppointment PHP Page</title>
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

		$OwnerID = $_POST["OwnerID"];
		$CarID = $_POST["CarID"];
		$AppointmentDate = $_POST["AppointmentDate"];
		

		// Create SQL statement to INSERT new data
		$SQLINSERT = "INSERT INTO APPOINTMENT ";
		$SQLINSERT .= "VALUES( null, '$OwnerID', ";
		$SQLINSERT .= "'$CarID', '$AppointmentDate')";

		// Execute SQL statement
		$Result = $conn->query($SQLINSERT);

		// Test existence of result
		echo "<h1>
				The Hopper Auto Appointment Table
			</h1>
			<hr />";
		if ($Result){
			echo "<h2>
				New Appointment Added:
			</h2>
			<table>
				<tr>";

				echo "<tr>";
				echo "<td>OwnerID:</td>";
				echo "<td>" . $OwnerID . "</td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td>CarID:</td>";
				echo "<td>" . $CarID . "</td>";
				echo "</tr>";
				echo "<td>AppointmentDate:</td>";
				echo "<td>" . $AppointmentDate . "</td>";
				echo "</tr>";
				
			echo "</table><br /><hr />";
			}
			else {
				exit ("Insert failed: (" . $conn->errno . ") " . $conn->error);
			}

		// Create SQL statement to read CUSTOMER table data
    	$SQL = "SELECT * FROM APPOINTMENT";

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
	   		The Hopper Auto Shop APPOINTMENT Table
		</h1>
	    <hr />
	    <h2>
	        APPOINTMENT
		</h2>
	<?php
		// Table headers
	    echo "<table class='output' border='1'>
	    		<tr>
	    			<th>OwnerID</th>
	    			<th>CarID</th>
	    			<th>AppointmentDate</th>
	    			
	    		</tr>";

	    // Table data
	    while($RecordSetRow = $res->fetch_assoc() )
	    	{
	    	echo "<tr>";
	       	echo "<td>" . $RecordSetRow['OwnerID'] . "</td>";
	    	echo "<td>" . $RecordSetRow['CarID'] . "</td>";
	    	echo "<td>" . $RecordSetRow['AppointmentDate'] . "</td>";
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
