<?php
$service = 'google';
switch($service){
// localhost
    case 'localhost':
        $username = "root";
        $password = "sql@9091";
        $host = "localhost";
        $database = "erp";
        break;
// Amazon database
    case 'aws':
        $username = "siddb";
        $password = "siddb9091";
        $host = "sidsql.c16xhakp74ff.us-east-2.rds.amazonaws.com";
        $database = "erp";
        break;

// Google database
    case 'google':
        $username = "sid";
        $password = "KH5dtAtQeGzw8q6";
        $host = "35.202.253.161";
        $database = "erp";
        break;
    
//db4free database
    case 'db4free':
        $username = "sidsql";
        $password = "sql@9091";
        $host = "db4free.net";
        $database = "erptest";
        break;
    }
    $conn = new mysqli($host,$username,$password,$database);
?>