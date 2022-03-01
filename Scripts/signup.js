function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function selectid() {
    var idtype = document.getElementById("idtype_");
    if (idtype.value === "aadhaarcard") {
        var x = document.getElementById("idcardno");
        x.setAttribute("onkeypress", "return isNumberKey(event)");
        x.setAttribute("maxlength", "12");
    }
    if (idtype.value != "aadhaarcard") {
        var x = document.getElementById("idcardno");
        x.removeAttribute("onkeypress");
        x.setAttribute("maxlength", "15");
    }
}
function validatepwd(evt) {
    var pwd = document.getElementById("ent_pwd").value;
    var conpwd = document.getElementById("conf_pwd").value;
    if (pwd != conpwd) {
        document.getElementById("pwdconf").innerHTML = "Password and Confirm Password do not match. Re-enter"
        var x = document.getElementById("pwdconf");
        x.setAttribute("style", "color:Red");
        var y = document.getElementById("SubmitCust");
        y.setAttribute("disabled", "");
    }
    if (pwd === conpwd) {
        document.getElementById("pwdconf").innerHTML = "Password matched.";
        var x = document.getElementById("pwdconf");
        x.setAttribute("style", "color:Green");
        var y = document.getElementById("SubmitCust");
        y.removeAttribute("disabled");
    }
}
function charlimit(evt) {
    var char = document.getElementById("qmsg").value;
    if (char.length < 400)
        return true
    else
        return false
}
function availcity() {
    var cityi = document.getElementById("state");
    if (cityi.value != " Jodhpur") {
        alert("Currently we are not available in your city.");
    }
}