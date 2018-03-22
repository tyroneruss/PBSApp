<?php

include_path: "C:\Program Files\php";
        
$servername = "jdbc:mysql://localhost:3306";
$username = "root";
$password = "rhouse11";
$dbname = "pbsdb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$file = fopen("bkforms.csv","r");
while(! feof($file))
  {
    $bkarray = fgetcsv($file);
    // print_r($bkarray[0]);    
    
    $sql = "INSERT INTO forms (Order,Name,Chapter,BI,Category,Description) "
            . " VALUES (" . $bkarray[0] . ",'" . $bkarray[1] . "','"
            . $bkarray[2] .  "','" . $bkarray[3] .  "','" 
            . $bkarray[4] . "','" . $bkarray[5] . "','" . $bkarray[6] . "')";
           
    if ($conn->query($sql) == TRUE) {
       echo "New record created successfully " . $bkarray[0];
    } else {
       echo "Error: " . $sql . "<br>" . $conn->error;
    }

  } // End while loop
  
fclose($file);
$conn->close();

?>
