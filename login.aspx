<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Vehicle_Rental.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rentonwheel: Login</title>
    <link href="style/login.css" rel="stylesheet" />
    <script type="text/javascript">
        function showpwd() {
            var x = document.getElementById("pwd");
           
            if (x.type === "password") {
                document.getElementById("showimg").src = "Images/showpwd2.png";
                x.type = "text";
            } else {
                x.type = "password";
                document.getElementById("showimg").src = "Images/showpwd1.png";
            }
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="main-login">
            <div class="logo">  
                 <img class="img" src="Images/logo1.png" /></div>
            <div class="login-panel">
                <input id="emailid" class="email" placeholder="Email" runat="server" type="email" required="required"/>
            <br />
           <input id="pwd" class="password" placeholder="Password" runat="server" type="password"  required="required"/>
                    <span><img id="showimg" src="Images/showpwd1.png" class="showpwd-design" onclick="showpwd()"/></span>
            &nbsp;<asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="loginbtn-design" Height="34px" Width="151px" />

            <br />
            <div class="label1">
                <asp:Label ID="invalidlogin" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                <asp:Label ID="accountlabel" runat="server" Text="Don't have an account ?"></asp:Label>
            <asp:LinkButton ID="SignUpBtn" runat="server" PostBackUrl="~/signupselect.aspx">Register Now</asp:LinkButton>
                </div>
            </div>
            </div>
    </form>
    <p>
&nbsp;&nbsp;&nbsp;
    </p>
</body>
</html>
