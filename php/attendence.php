<!DOCTYPE html>
<html>
<head>
	<title>Attencence Sheet</title>
</head>
<body>
	<center><h1>Attendence Sheet</h1></center>

	<?php

		require "connection.php";
		include "functions.php";
		
		check_connection();?>
	<?php
		if(isset($_POST['submit']))
		{

			$p_date = $_POST['date'];
			$temp_p_date = strtotime($p_date);
			$p_date = date('Ymd',$temp_p_date);
			// echo $p_date.'date drom form';
			$date_test = "select * from attendence where l_date =".$p_date.";";
			if($result = $conn->query($date_test))
			{
				$id_no = 1;
				$get_date = $result->fetch_assoc();
				$test_date = $get_date['l_date'];
				if(!is_null($test_date))
				{
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$tem_query = "update attendence set attendence ='".$attend."'where id =".$id_no." and l_date=".$p_date.";";
						echo $attend.'  attend'.$id_no.'<br>';
						if($attend == NULL) break;
						echo '<br><br>'.$tem_query.'<br><br>';
						if($conn->query($tem_query) === TRUE)
						{
							echo "data entry successfull".$id_no."<br>";
						}
						else{
							echo "data entry failed".$conn->error;
						}
						$id_no++;

					}
				}
			
				else
				{
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$tem_query = "insert into attendence values(".$id_no.",".$p_date.",(select name from students where id =".$id_no."),'".$attend."');";
						echo $attend.'  attend'.$id_no.'<br>';
						if($attend == NULL) break;
						echo '<br><br>'.$tem_query.'<br><br>';
						if($conn->query($tem_query) === TRUE)
						{
							echo "data entry successfull".$id_no."<br>";
						}
						else{
							echo "data entry failed".$conn->error;
						}
						$id_no++;

					}
				}
			}
			
		}
	?>
	<form action =<?php echo $_SERVER['PHP_SELF']?>  method = "post">
		Enter Date:
		<input type = "date" name = 'date' value = "<?php echo date("Y-m-d")?>"/>
		<table>
			<tr>
				<th>Name</th>
				<th>Roll No</th>
				<th>Present</th>
				<th>Absent</th>
				<th>Madical</th>
				<th>Other</th>
			</tr>
		<?php
		$student_query = "select id,name,roll_no from students;";
		if($result = $conn->query($student_query))
		{
			while ($row = $result->fetch_assoc())
			{

				$name = $row['name'];
				$roll = $row['roll_no'];
				$id = $row['id'];
				echo '
				<tr>
					<td>'.$name.'</td>
					<td>'.$roll.'</td>
					<td><input type = "radio" name ="'.$id.'" value = "present" checked = "checked"/></td>
					<td><input type = "radio" name ="'.$id.'" value = "absent"/></td>
					<td><input type = "radio" name ="'.$id.'" value = "medical"/></td>
				</tr>';
			}?>
		</table>
		<input type = "submit" name = "submit"/>
		</form>
		<?php
		}
		else{
			echo 'Query failed'.$conn->error;
		}
	?>
</body>
</html>