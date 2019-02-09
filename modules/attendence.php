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
			$count = 0;$btn_check= 0;
			if($result = $conn->query($date_test))
			{
				$id_no = $_POST['first_id'];
				$get_date = $result->fetch_assoc();
				$test_date = $get_date['l_date'];
				if(!is_null($test_date))
				{
					$btn_check = 0;
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$temp = "r_".$id_no;
						$remark = $_POST[$temp];
						$tem_query = "update attendence set attendence ='".$attend."',remark = '".$remark."' where id =".$id_no." and l_date=".$p_date.";";
						if($attend == NULL) break;
						if($conn->query($tem_query) === TRUE)
						{
							$count = 1;
						}
						else{
							echo 'Update failed '.$conn->error;
						}
						$id_no++;

					}
				}
			
				else
				{
					$btn_check = 1;
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$temp = "r_".$id_no;
						$remark = $_POST[$temp];
						$tem_query = "insert into attendence values(".$id_no.",".$p_date.",(select name from students where id =".$id_no."),'".$attend."','".$remark."');";
						// echo $attend.'  attend'.$id_no.'<br>';
						if($attend == NULL) break;
						// echo '<br><br>'.$tem_query.'<br><br>';
						if($conn->query($tem_query) === TRUE)
						{
							$count = 3;
						}
						else{
							echo 'new Data entry failed '.$conn->error;
						}
						$id_no++;

					}
				}
			}
			
		}
	?>
	<div class = "choice_area">
	<form action = <?php echo $_SERVER['PHP_SELF']?> method = "post" id = "first_form">

	<?php
		$sec = $_POST['section'];
		if(is_null($sec)){
			$sec = "A1";
		}

		$date_value = $_POST['date'];
		if(is_null($date_value)){
		$date_value = date("Y-m-d");
		}
				
		?>
		Enter Date:
		<input class = "choice_box" type = "date" name = 'date' value = "<?php echo $date_value; ?>"/>
		Section:
		<select id = "section" name = "section" onchange = "change_sec()" class = "choice_box">
			<option value ="A1"<?php if ($sec == "A1"){ echo 'selected';}?>>A1</option>
			<option value ="A2"<?php if ($sec == "A2"){ echo 'selected';}?>>A2</option>
			<option value ="B1"<?php if ($sec == "B1"){ echo 'selected';}?>>B1</option>
			<option value ="B2"<?php if ($sec == "B2"){ echo 'selected';}?>>B2</option>
			<option value ="C1"<?php if ($sec == "C1"){ echo 'selected';}?>>C1</option>
			<option value ="C2"<?php if ($sec == "C2"){ echo 'selected';}?>>C2</option>
			</select>
			<input class = "btn" type = "submit" name = "search" value = "Search"/>
	</div>
	</form>
	<form action =<?php echo $_SERVER['PHP_SELF']?>  method = "post">
	<!-- <form action = "../php/test.php" method = "post"> -->
	<input type = 'hidden' name = 'date' value = "<?php if (isset($_POST['search'])){echo $_POST['date'];} else {echo date("Y-m-d");}?>"/>
	<input type = 'hidden' name = 'section' value = "<?php if (isset($_POST['search'])){echo $_POST['section'];} else {echo "A1";}?>"/>
		<table>
			<tr>
				<th>Name</th>
				<th>Roll No</th>
				<th>Present</th>
				<th>Absent</th>
				<th>Madical</th>
				<th>On Leave</th>
				<th>Remark</th>
			</tr>
		<?php
		if(isset($_POST['search'])){
		$sec = $_POST['section'];}
		else
		{$sec = "A1";}
		$student_query = 'select id,name,upper(college_roll) as college_roll,unv_roll from students where sec_group = "'.$sec.'";';
		if($result = $conn->query($student_query))
		{
			$loop_count = 1;
			while ($row = $result->fetch_assoc())
			{

				$name = $row['name'];
				$college_roll = $row['college_roll'];
				$unv_roll = $row['unv_roll'];
				$id = $row['id'];

				if($loop_count == 1)
				{
					echo '<input type = "hidden" name = "first_id" value = "'.$id.'"/>';
					$loop_count+=1;
					$loop_count++;
				}
				?>
				<tr <?php if($id%2 ==0) {echo "class = 'even'";}else{echo "class = 'odd'";}?>>
					<td><?php echo $name ?></td>
					<td><?php echo ($college_roll).' / '.$unv_roll ?></td>
					<td><input type = "radio" name ="<?php echo $id?>" value = "present" checked = "checked"/></td>
					<td><input type = "radio" name ="<?php echo $id?>" value = "absent"/></td>
					<td><input type = "radio" name ="<?php echo $id?>" value = "medical"/></td>
					<td><input type = "radio" name ="<?php echo $id?>" value = "on_leave"/></td>
					<td><input class = "text-box" type = "text" name ="r_<?php echo $id?>" value = "" placeholder = "Not listed reason"/></td>
				</tr>
			<?php
			}?>
			<p id = 'test'></p>
		</table>
		<input id = "attendence_reset" class = "btn" type = "reset" name = "reset" value = "Reset"/>
		<input id = "attendence_submit" onclick = "firstClick()" class = "btn" type = "submit" name = "submit" value = "Save"/>
	</form>
		<?php
		}
		else{
			echo 'Query failed Database not active'.$conn->error;
		}
		?>
<?php include "../php/end.php" ?>
<script src = "../javascript/attendence.js"></script>
<script>
	// ck_btn = <?php echo $btn_check ?>;
	// check_btn(ck_btn);
	count = <?php echo $count ?>;
	check_update_popup(count);
</script>