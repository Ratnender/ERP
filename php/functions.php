<?php
    require "connection.php";
    function check_connection()
        {
            if($conn->connect_error)
            {
                die("Connection error" .$conn->connect_error);
            }
            else{
                echo '<strong>Connection successfull</strong>';
            }
        }
    function exec_query($query)
    {
        if($conn->query($query) === TRUE)
		{
			echo "<center><p>group creation successfull</p></center>";
		}
		else
		{
			echo "group creation failed".$conn->error;
		}
    }
    function ct_subject_table($name)
    {
        $query = "create table $name
        (
            id int not null primary key,
            l_date date not null,
            name varchar(40) not null,
            attendance varchar(10) not null
        );";
        exec_query($query);
    }
    
    // function check_date($p_date,$table,$column)
    // {
    //     $temp_p_date = strtotime($p_date);
    //     $p_date = date('Ymd',$temp_p_date);
    //     $date_test = "select * from ".$table." where ".$column." =".$p_date.";";
    //     echo 'in function';
    //     echo '<br>'.$date_test;
    //     echo 'testing'.$conn->query($date_test);
    //     if($result = $conn->query($date_test))
    //     {
    //         echo 'in if';
    //         $get_date = $result->fetch_assoc();
    //         $test_date = $get_date[$column];
    //         if(!is_null($test_date))
    //         {
    //             $res = NULL;
    //         }
    //         else{
    //             $res = $p_date;
    //         }
    //         return $res;
    //     }
    //     else
    //     {
    //         echo 'function failed'.$conn->error;
    //     }
    // }

?>