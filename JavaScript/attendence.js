function check_update_popup(count)
{
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
}
function check_btn(entry)
{
    switch(entry)
    {
        case 0:
        document.getElementById("attendence_save").value = "Update";
        break;
        case 1:
        document.getElementById("attendence_save").value = "Save";
        break;
    }
}
function firstClick(){
    document.getElementById('attendence_save').value = "Update";
}
function src_clr_change()
    {
        document.getElementById('search_btn').style.backgroundColor = "rgb(5, 161, 5)";
    }
function show_status(entry,hide)
{
    if(hide == 0)
    {
        document.getElementById('record_status').innerHTML = "Search to Enter or Update any record";
        document.getElementById('record_status').style.color = "rgba(4, 82, 134, 0.979)";
    }
    else{
        if (entry  == 1){
            document.getElementById('record_status').innerHTML = "Update existing record";
            document.getElementById('record_status').style.color = "red";
                
        }
        else{
            document.getElementById('record_status').innerHTML = "Enter new record";
            document.getElementById('record_status').style.color = "green";
        }
    }
}
function calculate(first,last)
	{
		var p_count = 0,a_count = 0,m_count = 0,l_count = 0;
		for(i = first;i<=last;i++)
		{
			var s_present = i + "_" + 'present';
			var s_absent = i + "_" + "absent";
			var s_medical = i + '_' + 'medical';
			var s_on_leave = i + '_' + 'on_leave';
			present = document.getElementById(s_present).checked;
			absent = document.getElementById(s_absent).checked;
			medical = document.getElementById(s_medical).checked;
			on_leave = document.getElementById(s_on_leave).checked;
			if(present == true)
			{
				p_count++;
			}
			else if(absent == true)
			{
				a_count++;
			}
			else if(medical == true)
			{
				m_count++;
			}
			else if(on_leave == true)
			{
				l_count++;
			}
		}
		document.getElementById('total_student').innerHTML = (p_count + a_count + m_count + l_count);
		document.getElementById('total_present').innerHTML = p_count;
		document.getElementById('total_absent').innerHTML = a_count;
		document.getElementById('total_other').innerHTML = m_count + l_count;
		document.getElementById('present_per').innerHTML = ((p_count *100)/(p_count + a_count + m_count + l_count)).toFixed(2);
		document.getElementById('absent_per').innerHTML = ((a_count/(p_count + a_count + m_count + l_count))*100).toFixed(2);
        document.getElementById('other_per').innerHTML = (((m_count + l_count)/(p_count + a_count + m_count + l_count))*100).toFixed(2);
        document.getElementById('total_input').value = (p_count + a_count + m_count + l_count);
        document.getElementById('present_input').value = p_count;
        document.getElementById('absent_input').value = a_count;
        document.getElementById('other_input').value = m_count + l_count;

	}