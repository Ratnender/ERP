<?php
echo '<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <link href = "../CSS/layout.css" rel = "stylesheet" />
       
    </head>
    <body>
        <div class = "heading">
            <h1 id = "logo">SID</h1>
            <div>
            <p id = "username">Suman Das</p>
            </div>
        </div>
        <div class = "sdw"></div>
        
    <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href= "../modules/dashboard.php">Dashboard</a>
            <a href="../modules/attendence.php">Attendence</a>
    </div>
        <div id="main">
            
           <div id = "side_btn">
            <div class = "single_btn" title = "Modules" onclick="openNav()">&#9776;</div>
            <hr/>
        </div>
            <div id = "cntnt" class = "content">';
?>