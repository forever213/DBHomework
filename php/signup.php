<?php

if (!isset($_POST['signup-username']) || !isset($_POST['signup-email']) || !isset($_POST['signup-password'])) exit("Illegal Access!");

$servername = "localhost";
$adminUsername = "root";
$adminPassword = "root";

$conn = new mysqli($servername, $adminUsername, $adminPassword);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

// Using database
$sql = "USE playermansystem";
if ($conn->query($sql) === TRUE) {
    echo "Use PlayerManagementSystem successfully";
    echo "<script type='text/javascript'>alert('Hello World!');</script>";
} else {
    echo "Error creating database: " . $conn->error;
}

if( $stmt = $conn->prepare("INSERT INTO users(Alias,email,password) VALUES (?,?,?)") ){

	$inAlias = test_input($_POST['signup-username']);
	$inEmail = test_input($_POST["signup-email"]);
	$inPass = md5( test_input($_POST["signup-password"]) );
	$stmt->bind_param("sss",$inAlias,$inEmail,$inPass);

	echo "<br>";
	if( $stmt->execute() ){
		echo "\nsign up seuccessfully!\n";
	}else{
		echo $inAlias ;
		echo "<br>";
		echo $inEmail ;
		echo "<br>";
		echo $inPass ;
		echo "<br>";
		echo $conn->error;
	}
}

$conn->close();

function test_input($data){
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
?>
