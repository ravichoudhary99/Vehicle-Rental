function searchdata() {
    var selectcity = document.getElementById("Cty");
    var selectlocal = document.getElementById("locality");
    var selectdate = document.getElementById("date1");
    var selecttime = document.getElementById("time");
    document.getElementById("SelectedCity").innerHTML = selectcity.Value;
    document.getElementById("SelectedLocality").innerHTML = selectlocal.Value;
    document.getElementById("SelectedDate").innerHTML = selectdate.Value;
    document.getElementById("SelectedTime").innerHTML = selecttime.Value;
    document.getElementById("CarSearchbtn").removeAttribute("disabled");
    alert(selectcity.Value);
    alert(selectlocal.Value);
    alert(selectdate.Value);
    alert(selecttime.Value);
}