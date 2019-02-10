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
        document.getElementById('search_btn').style.backgroundColor = "rgb(248, 38, 38)";
    }
function change_selection()
{
    var x = document.getElementById('all_selection');
    var y = document.getElementById()
    if(x.value == 'present')
    {
        document.getElementById()
    }
}