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