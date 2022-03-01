<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="carvendorprofile.aspx.vb" Inherits="Vehicle_Rental.carvendorprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
    <link href="style/vendorprofilecss.css" rel="stylesheet" />
    <script src="Scripts/carmodel.js"></script>
	<style type="text/css">		
	 .Linkbuttondesign{
		 text-decoration:none;
	 }
		.car-component{
			display: flex;
			flex-direction: column;

		}
		.car-component .car-policies{
			box-shadow: 0 0 6px 0 hsla(0,0%,66%,.5);
		    border: 1px solid #e1e1e1;
		    font-size: 12px;
		    color: #8d97a1;
		    background: #fff;
		    position: relative;
		    margin: 11px 0;
		}
		.car-component .car-item{
			position: relative;
    		display: flex;
		}
		.car-component .car-item .car-img{
			flex: 0 0 168px;
		    background-repeat: no-repeat;
		    background-position: 50%;
		    background-size: 100%;
		}

		.car-component .car-item .details{
			display: flex;
		    flex: 2;
		    flex-direction: column;
		    justify-content: center;
		    border-right: .5px dotted rgba(0,0,0,.1);
		    border-left: .5px dotted rgba(0,0,0,.1);
		}	

		.car-component .car-item .details .features{
			display: flex;
		    justify-content: flex-start;
		    margin-left: 20px;
		}

		.car-component .car-item .details .features .feature{
			margin-right: 30px;
		    display: flex;
		    align-items: center;
		}		

.car-component .car-item .number{
	background-position: 0px 0;
    height: 15px;
    width: 26px;
    display: inline-block;
    background-image: url('../Images/number.png');
    background-repeat: no-repeat;
    background-size: 25px;
		}		

.car-component .car-item .seater{
	background-position: 0px 0;
    height: 20px;
    width: 20px;
    display: inline-block;
    background-image:url('../Images/seat.png');
    background-repeat: no-repeat;
    background-size: 20px;
		}
.car-component .car-item .datetime{
	background-position: 0px 0;
    height: 20px;
    width: 20px;
    display: inline-block;
    background-repeat: no-repeat;
    background-size: 20px;
		}

	        .car-component .car-item .transmission {
	            background-position: 0px 0;
	            height: 20px;
	            width: 20px;
	            display: inline-block;
	            background-image: url('../Images/transmission.png');
	            background-repeat: no-repeat;
	            background-size: 20px;
	        }

	        .car-component .car-item .fuel {
	            background-position: -2px 0;
	            height: 20px;
	            width: 22px;
	            display: inline-block;
	            background-image: url('../Images/fuel.png');
	            background-repeat: no-repeat;
	            background-size: 20px;
	        }

	        .car-component .car-item .z-points {
	            border-left: 1px solid #c5c5c5;
	            padding-left: 15px;
	            display: flex;
	        }	
		.ai-c {
    			align-items: center;
			  }

	    .car-component .car-item .z-points .age-val {
	        font-weight: 600;
	        font-size: 14px;
	        color: #8d97a1;
	        margin-left: 4px;
	    }

	    .divider {
	        border-top: 1px dotted hsla(0,0%,77%,.5);
	        width: 100%;
	        margin: 5px 0 0px;
	    }

	.car-component .car-item .lacation-selector{
		padding: 50px 20px 18px;
    position: relative;
    cursor: pointer;
    display: flex;
    justify-content: center;
    flex-direction: column;
	}

.car-item .car-book {
    flex: 0 0 195px;
    display: flex;
}
.car-item .car-amount {
    display: flex;
    flex-grow: 1;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 100%;
    padding: 14px 10px 16px 8px;
    position: relative;
    }

.car-item .car-amount .price {
    font-size: 30px;
    color: #f7dc5f;
    font-weight: 600;
}


.car-item .car-amount .price sup {
    font-size: 16px;
    font-weight: 400;
    margin-right: -6px;
    color: #f7dc5f;
}

.car-item .car-amount .per-km {
    font-size: 12px;
    color: #000;
    opacity: .54;
}

.car-item .car-amount .cancel {
    width: 112px;
    height: 32px;
    margin-top: 20px;
    padding: 6px 10px;
    background-color: #f7dc5f;
    color: #fff;
    outline: none;
    border: 0;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: .6px;
    border-radius: 6px;
    cursor: pointer;
}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <div class="personal-details-page">
		<div class="profilecontain">
		<div class="tabs inner">
			<div class="profile-name">
                <asp:FormView ID="FormView1" runat="server">
					<ItemTemplate>
				Hi, <label><%#Eval("Name") %></label>
						</ItemTemplate>
					</asp:FormView>
			</div>
			<div class="tab-icon-content " onclick="tabevt(event, 'MyProfile')">
				<div class="icon"><img src="Images/profile.png" style="height: 30px; width: 30px;"></div>
				<div class="content">My Profile</div>
			</div>
			<div class="tab-icon-content " onclick="tabevt(event, 'MyBooking')">
				<div class="icon"><img src="Images/book.png" style="height: 30px; width: 30px;"></div>
				<div class="content">My Booking</div>
			</div>
			<div class="tab-icon-content " onclick="tabevt(event, 'Password')">
				<div class="icon"><img src="Images/chgpwd.png" style="height: 30px; width: 30px;"></div>
				<div class="content">Change Password</div>
			</div>
			<div class="tab-icon-content " onclick="tabevt(event, 'Vehicle')">
				<div class="icon"><img src="Images/images.png" style="height: 30px; width: 30px;"></div>
				<div class="content">Vehicle</div>
			</div>
			<div class="tab-icon-content " onclick="tabevt(event, 'LogOut')">
				<div class="icon"><img src="Images/logoff.png" style="height: 30px; width: 30px;"></div>
				<div class="content" onclick="window.location.href ='logout.aspx';">Log Out</div>
			</div>
		</div>
		<div class="inner acc-detail">
			<div id="MyProfile" class="tabcontent active">
				<asp:DataList ID="DataList1" runat="server">
					<ItemTemplate>
 				<div class="pro-detail-upper">
 					<div class="profile-pic a1">
 						<img src="Images/profile.png" style="height: 120px;width: 120px; ">
 						<img src="Images/add.png" class="add">
 					</div>
 					<div class="user-id a1">
 						<div class="user-detail"><label><%#Eval("Name") %></label></div>
 							<div class="user-info">
	 							<div class="user-info-tab">
	 								<span>Total Distance : <label>0 Km</label>  </span>
	 							</div>
 								<div class="user-info-tab">
 									<span>Total Hour: <label>0 Hr.</label>  </span>
 								</div>
 							</div>
 					</div>
 				</div>
				<div class="pro-detail-lower">
 					<div class="user-detail-section">
 						<div class="personal-info-section">
 						<div class="header">personal information</div>
	 						<div class="personal-info">
		 						<div class="info-row">
		 							<div class="info-row-text">
		 								<div class="left-side">Full Name</div>
		 								<div class="right-side" style="text-transform: capitalize;"><%#Eval("Name") %></div>
		 							</div>
		 							<div class="info-row-icons">
		 								<span class="trigger">
		 									<img src="Images/lock.png" alt="lock"> 										
		 								</span>
		 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                					 						</div>
                                <div Class="info-row">
		 							<div Class="info-row-text">
		 								<div Class="left-side">Email Id</div>
		 								<div Class="right-side"><%#Eval("Username") %></div>
		 							</div>
		 							<div Class="info-row-icons pointer">EDIT</div>
		 						</div>
		 						<div Class="info-row">
		 							<div Class="info-row-text">
		 								<div Class="left-side">Mobile Number</div>
		 								<div Class="right-side"><%#Eval("MobileNo") %></div>
		 							</div>
		 								<div Class="info-row-icons">UPDATE</div>
		 						</div>
		 					</div>
		 					<div Class="important-note">
		 						<div> Please ensure you carry the following When you come To pick up your vehicle:</div>
		 						<li> Original driving license</li>
		 						<li> Alternate govt. ID proof</li>
		 					</div>
 						</div>
 					</div>
 				</div>
						</ItemTemplate>
			</asp:DataList>
			</div>

					

			<div id = "MyBooking" Class="tabcontent">
			 <div Class="all-booking">
				<div Class="inner-block">
					<!-- booking tabs-->
						<div Class="tabbed">
						    <input type = "radio" name="tabs" id="tab-nav-1" checked>
						    <Label for="tab-nav-1">Upcoming</label>
						    <input type = "radio" name="tabs" id="tab-nav-2">
						    <Label for="tab-nav-2">Active</label>
						    <input type = "radio" name="tabs" id="tab-nav-3">
						    <Label for="tab-nav-3">Completed</label>
						    <input type = "radio" name="tabs" id="tab-nav-4">
						    <Label for="tab-nav-4">Cancelled</label>
						    <div Class="tab-block">
						      <div Class="booking-tabs">    
								  <ASP:DataList ID = "DataList3" runat="server" OnItemCommand="DataList3_ItemCommand" EnableViewState="true">
										<ItemTemplate>
                                                                            <div Class="car-listing">
									<div Class="car-component">
										<div Class="car-policies">
										<div Class="car-item">
											<div Class="car-img" style=""><img src="Images/license.png" /></div>
											<div Class="details">
												<h3> Customer ID : <%#Eval("CustomerUserID") %>  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewDetails" CommandArgument='<%#Eval("CustomerUserID")%>'>View More Details</asp:LinkButton> </a></h3>
												<div Class="features">
													<div Class="feature">
														<span Class="number feature-image"></span>
														<span> <%#Eval("vehicle_reg_no") %></span>								
													</div>
													<div class="feature">
														<span class="datetime feature-image"></span>
														<span><%#Eval("PickupDate") %> &ensp;&ensp;<%#Eval("PickupTime") %></span></div>
													<div class="feature">
														<span class="number feature-image"></span>
														<span>BookingID : <%#Eval("Booking_ID") %></span>								
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector"></div>
												<!-- -->
											</div>

											<div class="car-book">
												<div class="car-amount">
						          					<button type="button" name="CancelBook" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="CancelCar" CommandArgument='<%#Eval("Booking_ID")%>' CssClass="Linkbuttondesign">Cancel</asp:LinkButton></button>
													<button type="button" name="PickupCarr" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton2" runat="server" CommandName="PickCarr" CommandArgument='<%#Eval("Booking_ID")%>' CssClass="Linkbuttondesign">Pickup</asp:LinkButton></button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
								</div>
											</ItemTemplate>
										</asp:DataList>

						      </div>
						      <div class="booking-tabs"><ASP:DataList ID = "DataList4" runat="server" OnItemCommand="DataList4_ItemCommand" EnableViewState="true">
										<ItemTemplate>
                                                                            <div Class="car-listing">
									<div Class="car-component">
										<div Class="car-policies">
										<div Class="car-item">
											<div Class="car-img" style=""><img src="Images/license.png" /></div>
											<div Class="details">
												<h3> Customer ID : <%#Eval("CustomerUserID") %>  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewDetails" CommandArgument='<%#Eval("CustomerUserID")%>'>View More Details</asp:LinkButton> </a></h3>
												<div Class="features">
													<div Class="feature">
														<span Class="number feature-image"></span>
														<span> <%#Eval("vehicle_reg_no") %></span>								
													</div>
													<div class="feature">
														<span class="datetime feature-image"></span>
														<span><%#Eval("PickupDate") %> &ensp;&ensp;<%#Eval("PickupTime") %></span></div>
													<div class="feature">
														<span class="number feature-image"></span>
														<span>BookingID : <%#Eval("Booking_ID") %></span>								
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector"></div>
												<!-- -->
											</div>

											<div class="car-book">
												<div class="car-amount">
						          					<button type="button" name="CompleteRide" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="CompleteRide" CommandArgument='<%#Eval("Booking_ID")%>' CssClass="Linkbuttondesign">CompleteRide</asp:LinkButton></button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
								</div>
											</ItemTemplate>
										</asp:DataList></div>
						      <div class="booking-tabs"><ASP:DataList ID = "DataList5" runat="server" OnItemCommand="DataList4_ItemCommand" EnableViewState="true">
										<ItemTemplate>
                                                                            <div Class="car-listing">
									<div Class="car-component">
										<div Class="car-policies">
										<div Class="car-item">
											<div Class="car-img" style=""><img src="Images/license.png" /></div>
											<div Class="details">
												<h3> Customer ID : <%#Eval("CustomerUserID") %>  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewDetails" CommandArgument='<%#Eval("CustomerUserID")%>'>View More Details</asp:LinkButton> </a></h3>
												<div Class="features">
													<div Class="feature">
														<span Class="number feature-image"></span>
														<span> <%#Eval("vehicle_reg_no") %></span>								
													</div>
													<div class="feature">
														<span class="datetime feature-image"></span>
														<span><%#Eval("PickupDate") %> &ensp;&ensp;<%#Eval("PickupTime") %></span></div>
													<div class="feature">
														<span class="number feature-image"></span>
														<span>BookingID : <%#Eval("Booking_ID") %></span>								
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector"></div>
												<!-- -->
											</div>

											<div class="car-book">
												<div class="car-amount">
						          					Ride Completed
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
								</div>
											</ItemTemplate>
										</asp:DataList></div>
						      <div class="booking-tabs"><ASP:DataList ID = "DataList6" runat="server" OnItemCommand="DataList4_ItemCommand" EnableViewState="true">
										<ItemTemplate>
                                                                            <div Class="car-listing">
									<div Class="car-component">
										<div Class="car-policies">
										<div Class="car-item">
											<div Class="car-img" style=""><img src="Images/license.png" /></div>
											<div Class="details">
												<h3> Customer ID : <%#Eval("CustomerUserID") %>  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewDetails" CommandArgument='<%#Eval("CustomerUserID")%>'>View More Details</asp:LinkButton> </a></h3>
												<div Class="features">
													<div Class="feature">
														<span Class="number feature-image"></span>
														<span> <%#Eval("vehicle_reg_no") %></span>								
													</div>
													<div class="feature">
														<span class="datetime feature-image"></span>
														<span><%#Eval("PickupDate") %> &ensp;&ensp;<%#Eval("PickupTime") %></span></div>
													<div class="feature">
														<span class="number feature-image"></span>
														<span>BookingID : <%#Eval("Booking_ID") %></span>								
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector"></div>
												<!-- -->
											</div>

											<div class="car-book">
												<div class="car-amount">
						          					Cancelled
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
								</div>
											</ItemTemplate>
										</asp:DataList></div>
						    </div>
						  </div>

				</div>
			 </div>
			</div>

			<div id="Password" class="tabcontent">
			  <div class="chg-pass-block">
			  	<div class="container-password">
			  		<div class="change-password-section">
			  			<h1>Change Password</h1>
			  			<div class="password-block">
			  				<div class="password-info">Ensure your account safety by choosing a secure password that is easy to remember but difficult to guess for others
			  				</div>
			  				<div class="password-container">
			  					<div class="form-input-block">
			  						<label class="input-label">Current password</label>
			  						<div class="forget-password-section">
			  							<div class="forget-password">FORGOT PASSWORD?</div>
			  						</div>
			  						<input class="input-box" type="password"  id="odpwd" maxlength="20" minlength="8" runat="server" name="oldPassword" placeholder="Enter current password"/>
			  					</div>
			  					<div class="form-input-block">
			  						<label class="input-label">New Password</label>
			  						<input class="input-box" type="password"  id="nwpwd" maxlength="20" minlength="8"  runat="server" name="NewPassword" placeholder="Enter New password"/>
			  					</div>
			  					<div class="form-input-block">
			  						<label class="input-label">Confirm password</label>
			  						
			  						<input class="input-box" type="password"  id="cnwpwd" maxlength="20" minlength="8" runat="server" name="oldPassword" placeholder="Confirm password"/>
			  					</div>
			  					<div class="btn-block">
			  						<input type="button" class="primary-button" runat="server" Value="Change Password" id="chgpwd"/>
			  					</div>
			  				</div>
			  			</div>
			  		</div>
			  		<div class="change-password-image-section">
			  			<img src="Images/change_password.png" class="img-class" alt="icon">
			  		</div>
			  	</div>
			  </div>
			</div>

			<div id="Vehicle" class="tabcontent">
				<div class="vehicle-detail">
					<div class="inner-block">
						<!-- vehicle tabs-->
						<div class="vehicle-tabbed">
						    <input type="radio" name="tabs" id="vehicle-tab-nav-1" checked>
						    <label for="vehicle-tab-nav-1">Registered Vehicle</label>
						    <input type="radio" name="tabs" id="vehicle-tab-nav-2"  class="asize" onclick="size();">
						    <label for="vehicle-tab-nav-2">New Vehicle</label>
						    
						    <div class="vehicle-tab-block">
								<div class="vehicle-tabs">
                                    <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList2_ItemCommand" EnableViewState="true">
										<ItemTemplate>
							    <div class="car-listing">
									<div class="car-component">
										<div class="car-policies">
										<div class="car-item">
											<div class="car-img" style=""><img alt="" src='<%#Eval("Image_Vechicle") %>' width="200px" height="150px"/></div>
											<div class="details">
												<h3><%#Eval("Model") %></h3>
												<div class="features">
													<div class="feature">
														<span class="number feature-image"></span>
														<span><%#Eval("Registration_No") %></span>								
													</div>
													<div class="feature">
														<span class="seater feature-image"></span>
														<span><%#Eval("SeatingCap") %> Seater</span>								
													</div>
													<div class="feature">
														<span class="transmission feature-image"></span>
														<span><%#Eval("TransmissionType") %></span>								
													</div>
													<div class="feature">
														<span class="fuel feature-image"></span>
														<span><%#Eval("FuelType") %></span>								
													</div>
													<div class="z-points age-limit d-f ai-c">
														<span>Active Status :</span>
														 <span class="age-val"> <%#Eval("availstatus") %> </span>
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
														<%#Eval("MinPrice", "{0:N2}") %>
						          					</div> 
						          					<div class="per-km">
						          						Excess <strong>Rs12/km</strong>
						          					</div> 

						          					<button type="button" name="ActiveCar" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ActiveCar" CommandArgument='<%#Eval("Registration_No")%>' CssClass="Linkbuttondesign">Active</asp:LinkButton></button>
													<button type="button" name="ActiveCar" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton2" runat="server" CommandName="OfflineCar" CommandArgument='<%#Eval("Registration_No")%>' CssClass="Linkbuttondesign">Offline</asp:LinkButton></button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
								</div>
											</ItemTemplate>
										</asp:DataList>
									</div>
							    <div class="vehicle-tabs">
							      	<div class="form-block">
							      		<div class="form-left-block">
							      			<div class="header">
								 				<div>Vehicle Information</div>
								 			</div>
								 			<div class="password-block">
								  				<div class="password-info"></div>
								  				<div class="password-container">
								  					<div class="form-input-block">
								  						<label class="input-label">Registration Number</label>
								  						<input class="input-box" type="text"  id="Reg_no" maxlength="10" placeholder="Registration Number" value="" runat="server" required="required">
								  					</div>
								  					<div class="form-input-block">
								  						<label class="input-label">Brand</label>
														   <select onchange="print_model('model', Brand.selectedIndex);" id="Brand" name ="BrandName"  class="input-box" ></select>
								  						<label class="input-label">Model</label>
								  						 <select id ="model" name="ModelName" class="input-box"></select>
														<script>print_brand("Brand");</script>
								  					</div>
													  <div class="form-input-block">
														  <label class="input-label">Segment</label><br />
														  <select id="segmentt" name="segment" class="input-box" runat="server" required>
															  <option value="Select">Select</option>
															  <option value="HatchBack">HatchBack</option>
															  <option value="Sedan">Sedan</option>
															  <option value="SUV">SUV</option>
															  <option value="MUV">MUV</option>
														  </select>
														  </div>
													   <div class="form-input-block">
														  <label class="input-label">Fuel Type</label><br />
														  <select id="fueltype" name="fueltype" class="input-box" runat="server" required>
															  <option value="Select">Select Type</option>
															  <option value="Petrol">Petrol</option>
															  <option value="Diesel">Diesel</option>
														  </select>
														  </div>
													  <div class="form-input-block">
														  <table><tr><td><label class="input-label">Transmission Type</label></td><td><label class="input-label">Seating Capacity</label></td></tr>
															  <tr><td> <select id="transtype" name="transtype" class="input-box" runat="server" required>
															  <option value="Select">Select Transmission</option>
															  <option value="Automatic">Automatic</option>
															  <option value="Manual">Manual</option>
														  </select></td>
																  <td><input class="input-box" type="number"  id="seatcap" maxlength="1" placeholder="Seating Capacity" value="" runat="server" required></td></tr>
														  </table>
								  					</div>
														   <div class="form-input-block">
								  						<label class="input-label">Minimum Price & Kilometer</label>
															   <table><tr><td><input class="input-box" type="number"  id="minprice" maxlength="5" placeholder="Minimum Price" value="" runat="server" required/></td>
																   <td><input class="input-box" type="number"  id="minkm" maxlength="5" placeholder="Minimum K.M." value="" runat="server" required/></td>
															          </tr></table>
															   
								  					</div>
														  <div class="form-input-block">
															  <fieldset>
																  <legend>Pickup Location</legend>
																  <label class="input-label">Pickup City</label>
																<select id="Cty" name ="City"  class="input-box" runat="server" required>
																	<option value="">Select City</option>
																	<option value="Jodhpur">Jodhpur</option>
																</select>
																  <label class="input-label">Pickup Locality</label>
																   <select id ="pickuplocality" name="Locality" class="input-box" runat="server" required>
																	   <option value="">Select Loaclity</option>
																	   <option value="KBHB">KBHB</option>
																	   <option value="Sardarpura">Sardarpura</option>
																   </select>
																   <input class="input-box" type="text"  id="pickuploc" maxlength="100" placeholder="Pickup Location" value="" runat="server" required/>
                                                                 
															  </fieldset> 
														  </div>
														  <div class="form-input-block">
															  <fieldset>
																  <legend>Upload Files</legend>
																  <table>
																	  <tr>
																		  <td><label>Upload Vehicle Photo</label></td>
																		  <td><input type="file" id="vphoto" runat="server" accept="Image/*" required/></td>
																	  </tr>
																	  <tr>
																  <td><label>Upload Registration Certificate</label></td>
																		  <td><input type="file" id="vrc" runat="server" accept="Image/*"  required/></td>
																  </tr>
																	  <tr>
																		  <td><label>Upload Insurance</label></td>
																		  <td><input type="file" id="vins" runat="server" accept="Image/*"  required/></td>
																	  </tr>
																	  <tr>
																		  <td><label>Upload PUCC</label></td>
																		  <td><input type="file" id="vpucc" runat="server" accept="Image/*"  required/></td>
																	  </tr>
																	  </table>
															  </fieldset>
														  </div>
								  					<div class="btn-block">
								  						<button class="primary-button" runat="server" id="AddCar">Add Car</button>
								  					</div>
								  				</div>
								  			</div>
							      		</div>
							      	</div>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<script>
        function tabevt(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tab-icon-content");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.acc h3').click(function () {
            $(this).next('.content1').slideToggle();
            $(this).parent().toggleClass('active');
            $(this).parent().siblings().children('.content1').slideUp();
            $(this).parent().siblings().removeClass('active');
        });
    });
     </script>


</asp:Content>
