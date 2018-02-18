<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Show Service Page</title>
		<style type="text/css">
			h1 {text-align: center; color: blue}
			h2 {font-family: Ariel, sans-serif; text-align: left; color: blue}
			p.footer {text-align: center}
			table.output {font-family: Ariel, sans-serif}
		</style>
	</head>
	<body>
	<?php
		// make a connection
		$Host = "localhost";
		$Database = "hopperauto";
    	$User = "root";
		$Password = "root";
		$Port = 8889;

		$conn = new mysqli($Host, $User, $Password , $Database, $Port);
		if ($conn->connect_errno) {
			exit ("Failed to connect: (" . $conn->connect_errno . ") " . $conn->connect_error );
        }
        
		// Create short variable names
		$AppointmentID = $_POST["AppointmentID"];

		// Create SQL statement
    	$SQL = "select *
        from car_owner c, appointment a, service s 
        where s.AppointmentID = a.AppointmentID and
        a.OwnerID = c.OwnerID
        and s.AppointmentID = " . $AppointmentID . ";";

    	// Execute SQL statement
         $res = $conn->query($SQL);
         $owner = $conn->query($SQL);

		if (!$res) 	{
	       	exit ("Select failed: (" . $conn->errno . ") " . $conn->error);
	    }
	?>
	    <!--  Page Headers -->
	    <h1>
	   		The Hopper Auto Car Table
		</h1>
	    <hr />
	    <h2>
	        Customer Info
		</h2>
    <?php
    	echo "<table class='output' border='1'>
            <tr>
                <th>First</th>
                <th>Last</th>
                <th>Phone</th>
                <th>Email</th>
            </tr>";

        // Table data
        if($RecordSetRow = $owner->fetch_assoc() ) {
            echo "<tr>";
            echo "<td>" . $RecordSetRow['OwnerFirstName'] . "</td>";
            echo "<td>" . $RecordSetRow['OwnerLastName'] . "</td>";
            echo "<td>" . $RecordSetRow['OwnerPhone'] . "</td>";
            echo "<td>" . $RecordSetRow['OwnerEmail'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

	    echo "<h2>
	        Service Record
		</h2>";

		// Table headers
	    echo "<table class='output' border='1'>
	    		<tr>
	    			<th>Service Description</th>
	    			<th>Cost</th>
	    		</tr>";

	    // Table data
	    while($RecordSetRow = $res->fetch_assoc() ) {
	    	echo "<tr>";
	    	echo "<td>" . $RecordSetRow['ServiceName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['ServiceCost'] . "</td>";
	    	echo "</tr>";
	    }
	    echo "</table>";

	    // Close connection
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