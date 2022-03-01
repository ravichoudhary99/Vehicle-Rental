<%@ Page Title="Signup Success" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="regisuccess.aspx.vb" Inherits="Vehicle_Rental.regisuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/regisuc.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <div class="registsuccess">
        <p>Registration Successful. Your Login id :
        <asp:Label ID="useridd" runat="server" Text=""></asp:Label> & Password : <asp:Label ID="userpwdd" runat="server" Text=""></asp:Label></p>
        </div>
    <div class="logindivs">
        <p class="clicklog">Click Here for Login </p><br />
        <span class="loginbtn" onclick="openlogin();">Drive Car</span><span class="loginbtn" onclick="window.location.href ='login.aspx';">Car Agent</span>

    </div>
</asp:Content>
