function openNav() {
    document.getElementById("side_btn").style.position = "";
    document.getElementById("mySidenav").style.width = "200px";
    document.getElementById("main").style.marginLeft = "200px";
    document.getElementById("side_btn").style.opacity = "0";   
  }
  
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.getElementById("side_btn").style.opacity = "1";
  }