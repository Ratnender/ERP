<?php include "../php/start.php" ?>
<link href = "../CSS/table.css" rel = "stylesheet"/>
	<center><h1>Attendence Sheet</h1></center>

	<?php

		require "../php/connection.php";
		include "../php/functions.php";
		
		check_connection();?>
	<?php
		if(isset($_POST['submit']))
		{

			$p_date = $_POST['date'];
			$temp_p_date = strtotime($p_date);
			$p_date = date('Ymd',$temp_p_date);
			$date_test = "select * from attendence where l_date =".$p_date.";";
			$count = 0;
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
						if($attend == NULL) break;
						if($conn->query($tem_query) === TRUE)
						{
							$count = 1;
						}
						else{
							$count = 2;
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
						// echo $attend.'  attend'.$id_no.'<br>';
						if($attend == NULL) break;
						// echo '<br><br>'.$tem_query.'<br><br>';
						if($conn->query($tem_query) === TRUE)
						{
							$count = 3;
						}
						else{
							$count = 4;
						}
						$id_no++;

					}
				}
			}
			
		}
	?>
	<form action =<?php echo $_SERVER['PHP_SELF']?>  method = "post">
	<div class = "choice_area">
		Enter Date:
		<input class = "choice_box" type = "date" name = 'date' value = "<?php echo date("Y-m-d")?>"/>
		Section:
		<select class = "choice_box">
			<option name = "section" value ="A1">A1</option>
			<option name = "section" value ="A2">A2</option>
			<option name = "section" value ="B1">B1</option>
			<option name = "section" value ="B2">B2</option>
			<option name = "section" value ="C1">C1</option>
			<option name = "section" value ="C2">C2</option>
			</select>
	</div>
		<table>
			<tr>
				<th>Name</th>
				<th>Roll No</th>
				<th>Present</th>
				<th>Absent</th>
				<th>Madical</th>
				<th>On Leave</th>
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
				?>
				<tr <?php if($id%2 ==0) {echo "class = 'odd'";}else{echo "class = 'even'";}?>>
					<td><?php echo $name ?></td>
					<td><?php echo $roll ?></td>
					<td style = "height:1em;weidth:1em"><input type = "radio" name ="<?php echo $id?>" value = "present" checked = "checked"/></td>
					<td style = "height:1em;weidth:1em"><input type = "radio" name ="<?php echo $id?>" value = "absent"/></td>
					<td style = "height:1em;weidth:1em"><input type = "radio" name ="<?php echo $id?>" value = "medical"/></td>
					<td style = "height:1em;weidth:1em"><input type = "radio" name ="<?php echo $id?>" value = "on_leave"/></td>
					<td><input class = "text-box" type = "text" name ="an_<?php echo $id?>" value = "" placeholder = "Another reason"/></td>
				</tr>
			<?php
			}?>
		</table>
		<input id = "attendence_reset" class = "btn" type = "reset" name = "reset" value = "Reset"/>
		<input id = "attendence_submit" class = "btn" type = "submit" name = "submit" value = "Save"/>
	</form>
		<?php
		}
		else{
			echo 'Query failed'.$conn->error;
		}
		?>
<?php include "../php/end.php" ?>
<script>
	count = <?php echo $count ?>;
	switch(count)
	{
		case 0:
		window.alert('Query Failed');
		break;
		case 1:
		window.alert('Update Successfull');
		break;
		case 2:
		windwo.alert('Update Failed');
		break;
		case 3:
		window.alert('New Entry added');
		break;
		case 4:
		window.alert('New Entry Failed');
		break;
	}
</script>