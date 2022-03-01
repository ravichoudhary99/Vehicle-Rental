<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SignUp.aspx.vb" Inherits="Vehicle_Rental.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp for Vehicle Rent</title>
     <script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
    <link rel="stylesheet" type="text/css" href="https://colorlib.com/etc/lf/Login_v1/vendor/bootstrap/css/bootstrap.min.css"/>
    <link href="style/signup.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 36px;
        }
    </style>
</head>
<body>
    <div class="main-signup">
    <form id="car_rent" runat="server">
         <div>  
        <table><tr>
      <td><label for="email">Email</label></td>
        <td> <input type="email" name="email" class="email" runat="server" required="required" /></td></tr>
         <tr><td><label for="password">Password</label> </td>
            <td><input type="password" class="password" runat="server" name="password" required="required"/></td></tr>
            <tr><td><label for="confirmpassword">Confirm Password</label> </td>
            <td><input type="password" class="password" runat="server" name="conf_password" required="required"/></td></tr>
                 <tr><td><label for="name">Name (As per Driving Licence)</label> </td>
           <td> <input type="text"  class="nameid" runat="server" name="name" required="required"/></td></tr>
            <tr><td class="auto-style1"><label for="mobileno">Mobile No</label></td><td class="auto-style1"><input type="tel" class="mobilebtn" id="mobileno"/></td></tr>
            <tr><td><label for="idtype">ID Type</label></td><td><select id="idtype_" runat="server"><option value="Select" selected="selected">---Select---</option><option value="DL">Driving Licence</option><option value="voterid">Voter ID</option><option value="aadhaarcard">Aadhaar Card</option></select></td></tr>
            <tr><td><label for="idcardno">ID Card No.</label></td><td><input type="text" class="nameid" id="idcardno" runat="server" /></td></tr>
            <tr><td><label for="uploadid">Upload ID Card</label></td><td><input type="file" runat="server" id="idcard" /></td></tr>
            <tr><td><label for="uploaddl">Upload DL</label></td><td><input type="file" runat="server" id="dl" /></td></tr>
            <tr><td><label for="uploadphoto">Upload Photo</label></td><td><input type="file" runat="server" id="photo" /></td></tr>
            </table>
              <input type="submit" class="btndesign" value="Sign Up" runat="server"/>
             </div>
    </form>
          </div>
             <script type="text/javascript"> 
                 $('#idcard,#dl,#photo').on('change', function () {

                     const size =
                         (this.files[0].size / 1024 / 1024).toFixed(2);

                     if (size > 1) {
                         alert("File must be less than 1 MB");
                     } else {
                         alert("File uploaded successfully")
                     }
                 });
                
</script>
</body>
</html>