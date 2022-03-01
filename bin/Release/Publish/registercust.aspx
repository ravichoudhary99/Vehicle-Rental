<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="registercust.aspx.vb" Inherits="Vehicle_Rental.registercust" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/signupdefault.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a7b98e9319.js" ></script>
    <link href="style/reg_cust.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 38px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
    <script src="Scripts/signup.js" type="text/javascript"></script>
       
</head>
<body>
    <div class="logo">
        <a href="home.aspx">
        <img src="Images/logo1.png" /></a>
    </div>
    <form id="form1" runat="server">
        <div class="reg-main">
             <table>
        <tr>
          <td><label for="email">Email</label></td>
        <td><div class="inputicon"><i class="fas fa-envelope"></i><input type="email" name="email" id="emailadd" class="txtbox"  required="required" runat="server"/></div></td>
        </tr>
        <tr>
            <td class="auto-style1"><label for="ent_password">Password</label> </td>
            <td class="auto-style1"><div class="inputicon"><i class="fas fa-key"></i><input type="password"  name="ent_password" id="ent_pwd" maxlength="20" minlength="8" required="required" class="txtbox" runat="server"/></div></td>
        </tr>
            <tr>
                <td><label for="confirmpassword">Confirm Password</label></td>
                <td><div class="inputicon"><i class="fas fa-key"></i><input type="password" class="txtbox"  name="conf_password" id="conf_pwd" maxlength="20" required="required" minlength="8" onkeyup="validatepwd()" runat="server"/></div></td>
            </tr>
                 <tr><td></td><td><div id="pwdconf"></div></td></tr>
            <tr>
                <td><label for="name">Name (As per Driving Licence)</label></td>
                <td><div class="inputicon"><i class="fas fa-user"></i><input type="text"  class="txtbox"  name="name" id="cname" required="required" runat="server"/></div></td>
            </tr>
            <tr>
                <td><label for="mobileno">Mobile No</label></td>
              <td><div class="inputicon"><i class="fas fa-phone-alt"></i><input type="text" class="txtbox" onkeypress="return isNumberKey(event)" maxlength="10" id="mobileno" required="required" runat="server"/></div></td>
            </tr>
            <tr>
                <td><label for="idtype">ID Type</label></td>
                <td><div class="inputicon"><i class="far fa-id-card"></i><select id="idtype_"  class="txtbox" onchange="selectid()" runat="server"><option value="Select" selected="selected">---Select---</option><option value="DL">Driving Licence</option><option value="voterid">Voter ID</option><option value="aadhaarcard">Aadhaar Card</option></select></div></td>
            </tr>
            <tr>
                <td><label for="idcardno">ID Card No.</label></td>
              <td><div class="inputicon"><i class="far fa-id-card"></i><input type="text" class="txtbox" id="idcardno"  required="required" runat="server"/></div></td>
            </tr>
            <tr>
                <td class="auto-style2"><label for="uploadid">Upload ID Card</label></td><td class="auto-style2"><input type="file"  id="idcard"  accept="image/*" required="required" runat="server"/></td>
            </tr>
            <tr>
                <td><label for="uploaddl">Upload DL</label></td><td><input type="file"  id="dl" accept="image/*"  required="required" runat="server"/></td>
            </tr>
                 <tr>
                <td><label for="uploadphoto">Upload Photo</label></td><td><input type="file"  id="photo" accept="image/*" required="required" runat="server"/></td>
            </tr>
                 <tr>
                     <td colspan="2"  ><button type="submit" id="SubmitCust" runat="server">Submit</button></td>
                 </tr>
    </table>
            <asp:Label ID="signupstatus" runat="server" ForeColor="Red" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
