<?php
// localhost
switch($database){
    case 'localhost':
        $username = "root";
        $password = "sql@9091";
        $host = "localhost";
        $database = "erp";
        $conn = new mysqli($host,$username,$password,$database);
// Amazon database
    case 'aws':
        $username = "siddb";
        $password = "siddb9091";
        $host = "sidsql.c16xhakp74ff.us-east-2.rds.amazonaws.com";
        $database = "erp";
        $conn = new mysqli($host,$username,$password,$database);

// Google database
    case 'google':
        $username = "siddb";
        $password = "siddb9091";
        $host = "35.202.253.161";
        $database = "erp";
        $conn = new mysqli($host,$username,$password,$database);
    
//db4free database
    case 'db4free':
        $username = "sidsql";
        $password = "sql@9091";
        $host = "db4free.net";
        $database = "erptest";
        $conn = new mysqli($host,$username,$password,$database);
}
?>