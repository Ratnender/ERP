<?php
$service = 'localhost';
switch($service){
// localhost
    case 'localhost':
        $username = "root";
        $password = "sql@9091";
        $host = "localhost";
        $database = "erp";
        break;
// Google database
    case 'google':
        $username = "sid";
        $password = "KH5dtAtQeGzw8q6";
        $host = "35.202.253.161";
        $database = "erp";
        break;
}
    $conn = new mysqli($host,$username,$password,$database);
?>