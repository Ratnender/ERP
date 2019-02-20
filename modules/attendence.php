<?php include "../php/start.php" ?>
<link href = "../CSS/table.css" rel = "stylesheet"/>
<title>Attendence Sheet</title>
	<center><h1>Attendence Sheet</h1></center>

	<?php

		require "../php/connection.php";
		include "../php/functions.php";
		
		check_connection();?>

<!-- loop to inter or update the attendence based on the date entered -->
	<?php
		if(isset($_POST['save']))
		{
			$sec = $_POST['section'];
			$p_date = $_POST['date'];
			$temp_p_date = strtotime($p_date);
			$p_date = date('Ymd',$temp_p_date);

			$date_test = 'select * from attendence as a
			inner join students as s on a.id = s.id
			where l_date ='.$p_date.' and sec_group = "'.$sec.'";';   //Query for checking if there is a existing record or not
			$count = 0;$btn_check= 0;
			if($result = $conn->query($date_test))
			{
				$id_no = $_POST['first_id'];
				$get_date = $result->fetch_assoc();
				$test_date = $get_date['l_date'];
				if(!is_null($test_date))			//Check if there is a previous record or not
				{
					$total = $_POST['total'];
					$present = $_POST['present'];
					$absent = $_POST['absent'];
					$other = $_POST['other'];
					$summary_query = "update attendence_summary set l_date = ".$p_date.",sec_group = '".$sec."',total = ".$total.",present = ".$present.",absent = ".$absent.",other = ".$other." where l_date = ".$p_date." and sec_group = '".$sec."';";
					if($conn->query($summary_query)=== TRUE){}
					else{
						echo 'summary update failed'.$conn->error;
					}
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$temp = "r_".$id_no;
						$remark = $_POST[$temp];
						$tem_query = "update attendence set attendence ='".$attend."',remark = '".$remark."' where id =".$id_no." and l_date=".$p_date.";";
						if($attend == NULL){
							 break;
						}
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
					$total = $_POST['total'];
					$present = $_POST['present'];
					$absent = $_POST['absent'];
					$other = $_POST['other'];
					$summary_query = "insert into attendence_summary(l_date,sec_group,total,present,absent,other) values(".$p_date.",'".$sec."',".$total.",".$present.",".$absent.",".$other.");";
					if($conn->query($summary_query)=== TRUE){}
					else{
						echo 'summary insert failed'.$conn->error;
					}
					while (TRUE)
					{
						$attend = $_POST[$id_no];
						$temp = "r_".$id_no;
						$remark = $_POST[$temp];
						$tem_query = "insert into attendence values(".$id_no.",".$p_date.",(select name from students where id =".$id_no."),'".$attend."','".$remark."');";
						// echo $attend.'  attend'.$id_no.'<br>';
						if($attend == NULL) {
							break;
						}
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

	<!-- End of the inset and update part -->

<!-- Starting the form part -->

	<div class = "choice_area">
	<form action = <?php echo $_SERVER['PHP_SELF']?> method = "post" id = "first_form">

	<?php

	/*Getting the value of section and date from the save page*/

		$sec = $_POST['section'];
		if(is_null($sec)){
			$sec = "A1";
		}

		$date_value = $_POST['date'];
		if(is_null($date_value)){
		$date_value = date("Y-m-d");
		}
		?>
	<!-- Applying previous page date and section in the input value		 -->

		<label class = "lbl">Enter Date:</label>
		<input class = "choice_box" onchange = "src_clr_change()" type = "date" name = 'date' value = "<?php echo $date_value; ?>"/>
		<label class = "lbl">Section:</label>
		<select id = "section" onchange = src_clr_change() name = "section" class = "choice_box">
			<option value ="A1"<?php if ($sec == "A1"){ echo 'selected';}?>>A1</option>
			<option value ="A2"<?php if ($sec == "A2"){ echo 'selected';}?>>A2</option>
			<option value ="B1"<?php if ($sec == "B1"){ echo 'selected';}?>>B1</option>
			<option value ="B2"<?php if ($sec == "B2"){ echo 'selected';}?>>B2</option>
			<option value ="C1"<?php if ($sec == "C1"){ echo 'selected';}?>>C1</option>
			<option value ="C2"<?php if ($sec == "C2"){ echo 'selected';}?>>C2</option>
			</select>
		<label class = "lbl">Select all as</label>
		<select id = "all_selection" class = "choice_box" onchange = "change_selection()" onclick = "onclick_calculate()">
			<option value = "present">Present</option>
			<option value = "absent">Absent</option>
			<option value = "medical">Medical</option>
			<option value = "on_leave">On leave</option>
		</select>
			<input id = "search_btn" class = "btn" type = "submit" name = "search" value = "Search"/>
	</div>
	</form>
<!-- Area to show if user entering new record or editing existing record -->
<div id = "record_status" style = "text-align: center;
    padding:25px;
    font-size: 25px;
    "><p></p></div>


<!-- End of Choosing area -->
<?php
		if(isset($_POST['search']))
		{
			$hide_form = 1;
		}
		else if(isset($_POST['save']))
		{
			$hide_form = 1;
		}
		else {
			$hide_form = 0;
		}
	?>
	<div id = 'data_form' <?php if($hide_form == 0){echo 'style = "visibility:hidden"';}?>> <!--Hide when there is no search action present in the page-->

	<form action =<?php echo $_SERVER['PHP_SELF']?>  method = "post" id = 'main_form'>
	<!-- <form action = "../php/test.php" method = "post"> -->
	<input type = 'hidden' name = 'date' value = "<?php if (isset($_POST['search'])){echo $_POST['date'];} else {echo date("Y-m-d");}?>"/>
	<input type = 'hidden' name = 'section' value = "<?php if (isset($_POST['search'])){echo $_POST['section'];} else {echo "A1";}?>"/>
		<table>
			<tr>
				<th>Name</th>
				<th>Roll No</th>
				<th>C . A %</th>
				<th>Attendence</th>
				<th>Remark</th>
			</tr>

<!-- // Checking if there is a previous record or not. -->

		<?php
			$p_date = $_POST['date'];
			$temp_p_date = strtotime($p_date);
			$p_date = date('Ymd',$temp_p_date);

			$date_test = 'select * from attendence as a
			inner join students as s on a.id = s.id
			where l_date ='.$p_date.' and sec_group = "'.$sec.'";'; //Query for checking if there is a existing record or not

			if($result = $conn->query($date_test))
			{
				$get_date = $result->fetch_assoc();
				$test_date = $get_date['l_date'];
				if(!is_null($test_date))
				{
					$student_query = 'select s.id as id,s.name as name,upper(s.college_roll) as college_roll,s.unv_roll as unv_roll,a.attendence as attendence, a.remark as remark
					from students as s
					inner join attendence as a on s.id = a.id
					where a.l_date = '.$p_date.' and s.sec_group = "'.$sec.'";';
					$prev_date_found = 1;
					
					// echo 'showing attendence of '.date("d-m-Y");
				}
				else{
					$student_query = 'select id,name,upper(college_roll) as college_roll,unv_roll from students where sec_group = "'.$sec.'";';
					$prev_date_found = 0;
					// echo 'Enter the attendence of '.date("d-m-Y");
				}
			}

// End of checking previous record

		$total_date_query = "select count(*) as total_l from attendence_summary where sec_group = '".$sec."';";
		$present_query = "select sum(case attendence when 'present' then 1 else 0 end) as ca from attendence as a
		inner join students as s on a.id = s.id
		where s.sec_group = '".$sec."'
		group by s.id;";
		if ($result3 = $conn->query($total_date_query)){
			$total_lecture = $result3->fetch_assoc();
			$total_lecture = $total_lecture['total_l'];
		}
		else{
			echo 'Total lecture counting failed'.$conn->query;
		}
		if($result = $conn->query($student_query))
		{
			$loop_count = 1;
			$result1 = $conn->query($present_query);
			while ($row = $result->fetch_assoc())  //Getting all the record of students on given date and section
			{
				if($total_lecture == 0){
					$ca = '-';
				}
				else{
					$row1 = $result1->fetch_assoc();
					$ca = round((($row1['ca']/$total_lecture)*100),2);
				}
				$name = $row['name'];
				$college_roll = $row['college_roll'];
				$unv_roll = $row['unv_roll'];
				$id = $row['id'];
				$last_id_no = $row['id'];

				if($prev_date_found == 1)  //If there is a previous record then show the previous record not the default value.
				{
					$show_attendence = $row['attendence'];
					$show_remark = $row['remark'];
				}

				if($loop_count == 1) //Getting the first number of student id series
				{
					echo '<input type = "hidden" name = "first_id" value = "'.$id.'"/>';
					$first_id_no = $id;
					$loop_count+=1;
					$loop_count++;
				}
				?>
				<tr <?php if($id%2 ==0) {echo "class = 'even'";}else{echo "class = 'odd'";}?>>
					<td><?php echo $name ?></td>
					<td><?php echo ($college_roll).' / '.$unv_roll ?></td>
					<td id = <?php echo $id.'_ca'?>><?php echo $ca ?></td>
					<td><select name ="<?php echo $id?>" id ="<?php echo $id?>_attend" class = "choice_box" onchange = "onclick_calculate()">
					<option id = "<?php echo $id.'_present';?>" value = "present" <?php if($prev_date_found == 1 and $show_attendence == 'present'){echo 'selected = "selected"';} else{echo 'selected';} ?>>Present</option>
					<option id = "<?php echo $id.'_absent';?>" value = "absent" <?php if($prev_date_found == 1 and $show_attendence == 'absent'){echo 'selected = "selected"';} ?>>Absent</option>
					<option id = "<?php echo $id.'_medical';?>" value = "medical" <?php if($prev_date_found == 1 and $show_attendence == 'medical'){echo 'selected = "selected"';} ?>>Medical</option>
					<option id = "<?php echo $id.'_on_leave';?>" value = "on_leave" <?php if($prev_date_found == 1 and $show_attendence == 'on_leave'){echo 'selected = "selected"';} ?>>On leave</option>
				</select></td>
				<td><input class = "text-box" type = "text" name ="r_<?php echo $id?>" value = "<?php if($prev_date_found == 1){echo $show_remark;}?>" placeholder = "Not listed reason"/></td>
				</tr>
			<?php
			}?>
		</table>
		<input id = "attendence_reset" class = "btn" type = "reset" name = "reset" value = "Reset"/>
		<input id = "attendence_save" class = "btn" type = "submit" name = "save" value = "Save" onclick = "onclick_calculate()"/>
		<table>
			<caption id = 'summary_caption'>Attendence Summary</caption><br/><br/>
			<tr id = 'summary_head'>
				<th>Total No. of Students</th>
				<th>Total No. of Presents</th>
				<th>Total No. of Absents</th>
				<th>Other</th>
				<th>Present %</th>
				<th>Absent %</th>
				<th>Other %</th>
			</tr>
			<tr id = 'summary_data'>
				<td id = 'total_student'></td>
				<td id = 'total_present'></td>
				<td id = 'total_absent'></td>
				<td id = 'total_other'></td>
				<td id = 'present_per'></td>
				<td id = 'absent_per'></td>
				<td id = 'other_per'></td>
			</tr>
		</table>
	</form>
		<?php
		}
		else{
			echo 'Query failed Database not active'.$conn->error;
		}
	
		?>
	</div>
	<script src = "../javascript/attendence.js"></script>
	<script>
	</script>

	<script>

	//Function for changing all selection 
	
	first = <?php echo $first_id_no ?>;
	last = <?php echo $last_id_no ?>;
	
	
	function change_selection()
	{
		var sec;
		sec = document.getElementById('all_selection').value;
			for(i = first; i<= last; i++)
			{
				var temp = i + "_" + sec;
				document.getElementById(temp).selected = 'selected';
			}
		}
		
		//End of function of changing all selection
		check_attendence(first,last);
		
		// For showing the status of record
		
		var res_prev_data_found = <?php echo $prev_date_found; ?>;
		var res_hide_form = <?php echo $hide_form; ?>;
		show_status(res_prev_data_found,res_hide_form);
		
		//End of showing the status of record

	//For calculating the summary

		calculate(first,last);
		function onclick_calculate()
		{
			calculate(first,last);
		}
		//End of calculatin summary
		
		</script>
		
	<input id = 'total_input' type = 'hidden' name = 'total' value = '' form = 'main_form'/>
	<input id = 'present_input' type = 'hidden' name = 'present' value = '' form = 'main_form'/>
	<input id = 'absent_input' type = 'hidden' name = 'absent' value = '' form = 'main_form'/>
	<input id = 'other_input' type = 'hidden' name = 'other' value = '' form = 'main_form'/>
<script>
	count = <?php echo $count ?>;
	check_update_popup(count);
</script>
<?php include "../php/end.php" ?>