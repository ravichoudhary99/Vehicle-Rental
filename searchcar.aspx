<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="searchcar.aspx.vb" Inherits="Vehicle_Rental.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/display.css" rel="stylesheet" />
    <link href="style/vehicledisplay.css" rel="stylesheet" />
    <script src="Scripts/citieslocal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">  
    <nav class="search">
        <div class="inner-search">
            <div class="ser-div">
                <div>
                    <label for="state" class="search-label">City</label>
                </div>
                <div class="search-textbox">
                    <select class="search-select"onchange="print_local('locality', this.selectedIndex);" id="Cty" name ="City"  class="select"></select>
                </div>
            </div>

            <div class="ser-div">
                <div>
                    <label for="city" class="search-label">Locality</label>
                </div>
                <div class="search-textbox">
                   <select class="search-select" id ="locality" name="locality" class="select"></select>
                                <script>print_city("Cty");</script>
                </div>
            </div>
            <div class="ser-div">
                <div>
                    <label for="date" class="search-label">date</label>
                </div>
                <div class="search-textbox">
                    <input type="date" id="date" class="search-select" />
                </div>
            </div>

            <div class="ser-div">
                <div>
                    <label for="time" class="search-label">time</label>
                </div>
                <div class="search-textbox">
                    <input type="time" id="time" class="search-select" />
                </div>
            </div>
            <div class="ser-div">
                <div>
                    <input id="RefineSearch" type="button" value="Search" runat="server"/>
                </div>
            </div>
        </div>
      </nav>

       <div class="search-page">
           <div class="filter" style="float:left;">
               <div class="filter-price">
                   <h5>Price Range</h5>
                  <span> <asp:DropDownList ID="DropDownList1" runat="server" CssClass="filter-price-L "></asp:DropDownList></span> ~
                   <span> <asp:DropDownList ID="DropDownList2" runat="server" CssClass="filter-price-L"></asp:DropDownList></span>
               </div>
               
               <div class="filter-1">
                   <h5>Segment</h5>
                   <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="filter-options">
                       <asp:ListItem Value="Hatchback" >Hatchback</asp:ListItem>
                       <asp:ListItem Value="Sedan">Sedan</asp:ListItem>
                       <asp:ListItem Value="SUV">SUV</asp:ListItem>
                       <asp:ListItem Value="MUV">MUV</asp:ListItem>
                   </asp:CheckBoxList>

               </div>
                     <div class="filter-1">
                   <h5>Brand</h5>
                   <asp:CheckBoxList ID="CheckBoxList4" runat="server" CssClass="filter-options">
                       <asp:ListItem >Maruti</asp:ListItem>
                       <asp:ListItem>Hyundai</asp:ListItem>
                       <asp:ListItem>Mahindra</asp:ListItem>
                       <asp:ListItem>Honda</asp:ListItem>
                       <asp:ListItem>Ford</asp:ListItem>
                       <asp:ListItem>Toyota</asp:ListItem>
                       <asp:ListItem>Nissan</asp:ListItem>
                       <asp:ListItem>Volkswagen</asp:ListItem>
                       <asp:ListItem>Renault</asp:ListItem>
                   </asp:CheckBoxList>

               </div>
                 <div class="filter-1">
                   <h5>Fuel Type</h5>
                   <asp:CheckBoxList ID="CheckBoxList2" runat="server" CssClass="filter-options">
                       <asp:ListItem >Petrol</asp:ListItem>
                       <asp:ListItem>Diesel</asp:ListItem>
                   </asp:CheckBoxList>

               </div>
                 <div class="filter-1">
                   <h5>Transmission Type</h5>
                   <asp:CheckBoxList ID="CheckBoxList3" runat="server" CssClass="filter-options">
                       <asp:ListItem >Manual</asp:ListItem>
                       <asp:ListItem>Auto</asp:ListItem>
                   </asp:CheckBoxList>

               </div>
           
           </div>
         <div class="display-data">
                 <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" EnableViewState="true">
                <ItemTemplate>
                    		<div class="car-listing">
			<div class="car-component">
				<div class="car-policies">
				<div class="car-item">
					<div class="car-img" style="">
                        <img alt="" src='<%#Eval("Image_Dummy") %>' width="200px"/></div>
					<div class="details">
						<h3><%#Eval("Model") %></h3>
						<div class="features">
							<div class="feature">
								<span class="seater feature-image"></span>
								<span><%#Eval("SeatingCap") %></span>								
							</div>
							<div class="feature">
								<span class="transmission feature-image"></span>
								<span><%#Eval("TransmissionType") %></span>								
							</div>
							<div class="feature">
								<span class="fuel feature-image"></span>
								<span><%#Eval("FuelType") %></span>								
							</div>
                            <div class="feature">
								<span class="loca feature-image"></span>
                               
								<span><%#Eval("PickupLocality") %></span>								
							</div>
							<div class="z-points age-limit d-f ai-c">
								<span>AGE LIMIT:</span>
								 <span class="age-val"> 18+ </span>
							</div>
						</div>
						<div class="divider"></div>
						<div class="lacation-selector"></div>
						<!-- -->
					</div>

					<div class="car-book">
						<div class="car-amount">
							<div class="price">
								<sup class="rupee">₹</sup> 
								<%#Eval("MinPrice", "{0:N2}") %> for <%#Eval("MinKM") %> km
          					</div> 
          						<div class="per-km">
          							Excess <strong>Rs12/km</strong>
          						</div>
                                                                                                       
                            <asp:LinkButton ID="LinkButton1" CommandName="BookCar" CommandArgument='<%#Eval("Registration_No") + "," + Eval("PickupLocality") %>' runat="server" CssClass="book-car">Book Now</asp:LinkButton>
                             
                            
          				</div>
          			</div>
				</div>
			</div>
		</div>
                </ItemTemplate>
            </asp:DataList>
         </div>
           </div>
</asp:Content>
