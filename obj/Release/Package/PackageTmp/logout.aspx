<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="logout.aspx.vb" Inherits="Vehicle_Rental.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/logoutpg.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=MuseoModerno:wght@400;500&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <div class="cendiv" onclick="">
    <h1>Logout</h1>
        <h3>Are you sure you want to logut ?</h3>

<div class="circle-loader" id="circleload">
  <div class="checkmark draw" id="checkdraw"></div>
</div>
        </div>

<p align="center"><button id="logout" type="button" class="btn btn-success" ClientIDMode="Static" runat="server">Logout</button></p>
    <script>
            $('#logout').click(function () {
                $('.circle-loader').toggleClass('load-complete');
                $('.checkmark').toggle();
            }); 
    </script>
</asp:Content>
