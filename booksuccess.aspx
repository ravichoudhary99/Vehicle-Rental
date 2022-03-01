<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="booksuccess.aspx.vb" Inherits="Vehicle_Rental.booksuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/logoutpg.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=MuseoModerno:wght@400;500&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
     <div class="cendiv" onclick="window.location.href ='home.aspx';">
    <h1>Congratulations</h1>
        <h2>Booking successful</h2>
         <h3>Please check your booking details in your account under My Booking Section</h3>

<div>
  <img src="Images/tick-gif-6.gif" />
</div>
        </div>
</asp:Content>
