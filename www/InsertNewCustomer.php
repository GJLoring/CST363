<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert New Customer PHP Page</title>
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

		$LastName = $_POST["LastName"];
		$FirstName = $_POST["FirstName"];
		$Phone = $_POST["Phone"];
		$Email = $_POST["Email"];

		// Create SQL statement to INSERT new data
		$SQLINSERT = "INSERT INTO car_owner ";
		$SQLINSERT .= "VALUES( null, '$LastName', '$FirstName', ";
		$SQLINSERT .= "'$Phone', '$Email')";

		// Execute SQL statement
		$Result = $conn->query($SQLINSERT);

		// Test existence of result
		echo "<h1>
				The Hopper Auto Customer Table
			</h1>
			<hr />";
		if ($Result){
			echo "<h2>
				New Customer Added:
			</h2>
			<table>
				<tr>";

				echo "<tr>";
				echo "<td>LastName:</td>";
				echo "<td>" . $LastName . "</td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td>FirstName:</td>";
				echo "<td>" . $FirstName . "</td>";
				echo "</tr>";
				echo "<td>Phone:</td>";
				echo "<td>" . $Phone . "</td>";
				echo "</tr>";
				echo "<td>EmailAddress:</td>";
				echo "<td>" . $Email . "</td>";
				echo "</tr>";
			echo "</table><br /><hr />";
			}
			else {
				exit ("Insert failed: (" . $conn->errno . ") " . $conn->error);
			}

		// Create SQL statement to read CUSTOMER table data
    	$SQL = "SELECT * FROM car_owner";

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
	   		The Hopper Auto Shop CUSTOMER Table
		</h1>
	    <hr />
	    <h2>
	        CUSTOMER
		</h2>
	<?php
		// Table headers
	    echo "<table class='output' border='1'>
	    		<tr>
	    			<th>LastName</th>
	    			<th>FirstName</th>
	    			<th>Phone</th>
	    			<th>Email</th>
	    		</tr>";

	    // Table data
	    while($RecordSetRow = $res->fetch_assoc() )
	    	{
	    	echo "<tr>";
	       	echo "<td>" . $RecordSetRow['OwnerLastName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['OwnerFirstName'] . "</td>";
	    	echo "<td>" . $RecordSetRow['OwnerPhone'] . "</td>";
	    	echo "<td>" . $RecordSetRow['OwnerEmail'] . "</td>";
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
