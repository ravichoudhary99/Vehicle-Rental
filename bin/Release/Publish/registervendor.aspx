<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="registervendor.aspx.vb" Inherits="Vehicle_Rental.registervendor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rentonwheel: Signup Car Agent</title>
    <link href="style/signupdefault.css" rel="stylesheet" />
     <script src="https://kit.fontawesome.com/a7b98e9319.js"></script>
    <link href="style/reg_ven.css" rel="stylesheet" />
    <script src="Scripts/signup.js"></script>
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
        <td><div class="inputicon"><i class="fas fa-envelope"></i><input type="email" name="email" class="txtbox"  id="emailadd" required="required" runat="server"/></div></td>
        </tr>
                <tr>
          <td><label for="name">Name</label></td>
        <td><div class="inputicon"><i class="fas fa-id-card"></i><input type="text" name="custname" class="txtbox"  id="name1" required="required" runat="server"/></div></td>
        </tr>
         <tr>
             <td><label for="mobileno">Mobile No</label></td>
             <td><div class="inputicon"><i class="fas fa-phone-alt"></i><input type="tel" class="txtbox" id="mobileno" required="required" onkeypress="return isNumberKey(event)" maxlength="10" runat="server"/></div></td>
         </tr>
        <tr>
            <td><label for="ent_password">Password</label> </td>
            <td><div class="inputicon"><i class="fas fa-key"></i><input type="password"  name="ent_pwd" id="ent_pwd" required="required" maxlength="20" minlength="8" class="txtbox" runat="server"/></div></td>
        </tr>
            <tr>
                <td><label for="confirmpassword">Confirm Password</label></td>
                <td><div class="inputicon"><i class="fas fa-key"></i><input type="password" class="txtbox"  name="conf_password" id="conf_pwd" maxlength="20" minlength="8" required="required" runat="server" onkeyup="validatepwd()"/></div></td>
            </tr>
                <tr><td></td><td><div id="pwdconf"></div></td></tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="signupstatus" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                  <tr>
                     <td colspan="2"  ><button type="submit" id="SubmitVendor" runat="server">Submit</button></td>
                 </tr>
                </table>
        </div>
    </form>
</body>
</html>
