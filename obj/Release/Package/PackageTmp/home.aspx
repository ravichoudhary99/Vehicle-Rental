<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" EnableEventValidation="false" CodeBehind="home.aspx.vb" Inherits="Vehicle_Rental.home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <link href="style/home.css" rel="stylesheet" >
    <script src="Scripts/citieslocal.js"></script>
    <script src="Scripts/searchquery.js"></script>
</asp:Content>

        <asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
            <div class="total-div">
            <div class="upperpart">

                <div class="booking">
                    <table border="0" class="booking-table">
                        <tr>
                        <th colspan="2"> Book it now!</th>
                        </tr>
                        <tr>
                            <td colspan="1" class="label">
                                <label class="text-wh">Select City:<span style="color:red;"><strong>*</strong></span> </label>
                            </td>
                             <td colspan="1">
                                  <select onchange="print_local('locality', this.selectedIndex);" id="Cty" name ="City"  class="select"  required></select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="label">
                                <label class="text-wh">Select Locality<span style="color:red;"><strong>*</strong></span> </label>
                            </td>
                            <td colspan="1">
                                <select id ="locality" name="locality" class="select" required></select>
                                <script>print_city("Cty");</script>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="label">
                                <label for="date">Enter the date: </label></td>
                            <td>
                                <input class="select" id="date1" type="date" runat="server" required/><br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1" class="label">
                                <label for="time">Enter the time: </label></td>
                            <td>
                                <input class="select" id="time1" type="time" runat="server" required/><br />
                            </td>
                        </tr>
                         <tr>
                            <td colspan="2">
                                <input id="CarSearchbtn" type="button" value="Search" class="submit-but" runat="server"/>
                            <td>
                        </tr>
                    </table>
                </div>
            </div>
            <div >
                <h1 style="padding:5px;margin-left:25px;">How It's Work ?</h1>
                <div class="aa">
                    <div class="icon-container">
                        
                          <div class="icon icon-fill"><img src="Images/card-black.png" class="imgw" /></div>                        
                          <div class="icon icon-enter"><img src="Images/pickup.png" class="imgw" /></div>
                          <div class="icon icon-expand"> <img src="Images/wheel.png" class="imgw" /></div>
                          <div class="icon icon-collapse"><img src="Images/rotate-img.png" class="imgw" /></div>
                    </div>
                    <div class="text-container">
                        
                          <div class="text"><h2>Book & pay</h2><p>Pick your favourite car, time and place</p></div>                        
                          <div class="text"><h2>Pickup Vehicle</h2><p>Pickup the svehicle form give location</p></div>
                          <div class="text"><h2>Drive</h2><p>Enjoy your RentOnWheel self drive</p></div>
                          <div class="text"><h2>Return</h2><p>Get the car back to return location</p></div>
                    </div>
                </div>
            </div>
         </div>
        </asp:Content>
