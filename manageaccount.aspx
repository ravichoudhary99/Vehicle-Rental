<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="manageaccount.aspx.vb" Inherits="Vehicle_Rental.manageaccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/profileview.css" rel="stylesheet" />
	<style type="text/css">		
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
			flex: 0 0 141px;
    background-repeat: no-repeat;
    background-position: 50%;
    background-size: 100%;
    background-image: url(../Images/suzuki-swift-maruti.png);
		}

	        .car-component .car-item .details {
	            display: flex;
	            flex: 2;
	            flex-direction: column;
	            justify-content: center;
	            border-right: .5px dotted rgba(0,0,0,.1);
	            border-left: .5px dotted rgba(0,0,0,.1);
	        }

	            .car-component .car-item .details .features {
	                display: flex;
	                justify-content: flex-start;
	                margin-left: 20px;
	            }

		.car-component .car-item .details .features .feature{
			    margin-right: 30px;
    display: flex;
    align-items: center;
    width: 60px;
		}

	        .car-component .car-item .number {
	            background-position: 0px 0;
	            height: 15px;
	            width: 26px;
	            display: inline-block;
	            background-image: url('../Images/number.png');
	            background-repeat: no-repeat;
	            background-size: 25px;
	        }

	        .car-component .car-item .seater {
	            background-position: 0px 0;
	            height: 20px;
	            width: 20px;
	            display: inline-block;
	            background-image: url('../Images/seat.png');
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

		.car-component .car-item .z-points{
				border-left: 1px solid #c5c5c5;
    			padding-left: 15px;
 	 		    display:flex;
				      width: 250px;
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
    flex: 0 0 137px;
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
			<div class="tab-icon-content " onclick="tabevt(event, 'LogOut')">
				<div class="icon"><img src="Images/logoff.png" style="height: 30px; width: 30px;"></div>
				<div class="content" onclick="window.location.href ='logout.aspx';">Log Out</div>
			</div>
		</div>
		<div class="inner acc-detail">
			 
			<div id="MyProfile" class="tabcontent">
				<asp:DataList ID="ProfileDL" runat="server">
					<ItemTemplate>
 				<div class="pro-detail-upper">
 					<div class="profile-pic a1">
 						<img src="<%#Eval("photo") %>" style="height: 120px;width: 120px; ">
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
		 								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		 							</div>
		 							<div class="info-row">
		 								<div class="info-row-text">
		 									<div class="left-side">Email Id</div>
		 									<div class="right-side"><%#Eval("Username") %></div>
		 								</div>
		 								<div class="info-row-icons pointer">EDIT</div>
		 							</div>
		 							<div class="info-row">
		 								<div class="info-row-text">
		 									<div class="left-side">Mobile Number</div>
		 									<div class="right-side"><%#Eval("MobileNo") %></div>
		 								</div>
		 								<div class="info-row-icons">UPDATE</div>
		 							</div>
		 						</div>
		 						<div class="important-note">
		 							<div>Please ensure you carry the following when you come to pick up your vehicle:</div>
		 							<li>Original driving license</li>
		 							<li>Alternate govt. ID proof</li>
		 						</div>
 						</div>

 						<div class="license-detail-section">
 							<div class="header">
 								<div>License-Details</div>
 							</div>
 							<div class="license-detail">
 								<div class="license-image-block">
 									<div class="empty-license-image">
 										<div class="no-license-image">
 											<img src="<%#Eval("dl") %>" alt="license" style="height: 160px; width: 248px;">
 										</div>
 									</div>
 								</div>
 							</div>
 						</div>
 						
 					</div>
 				</div>
						</ItemTemplate>
					</asp:DataList>
			</div>
			
			<div id="MyBooking" class="tabcontent">
			 <div class="all-booking">
				<div class="top-tab-line">
					<!-- booking tabs-->
						<div class="tabbed">
						    <input type="radio" name="tabs" id="tab-nav-1" checked>
						    <label for="tab-nav-1">Upcoming</label>
						    <input type="radio" name="tabs" id="tab-nav-2">
						    <label for="tab-nav-2">Active</label>
						    <input type="radio" name="tabs" id="tab-nav-3">
						    <label for="tab-nav-3">Completed</label>
						    <input type="radio" name="tabs" id="tab-nav-4">
						    <label for="tab-nav-4">Cancelled</label>
						    <div class="tab-block">
						      <div class="booking-tabs">
                                  <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" EnableViewState="true">
									  <ItemTemplate>
								  <div class="car-listing">
									<div class="car-component">
										<div class="car-policies">
										<div class="car-item">
											<div class="car-img" style=""></div>
											<div class="details">
												<h3>'<%#Eval("Model")%></h3>
												<div class="features">
													<div class="feature">
														<span class="number feature-image"></span>
														<span>'<%#Eval("Vehicle_Reg_no")%></span>								
													</div>
													<div class="feature">
														<span class="seater feature-image"></span>
														<span>'<%#Eval("SeatingCap")%> Seater</span>								
													</div>
													<div class="feature">
														<span class="transmission feature-image"></span>
														<span>'<%#Eval("TransmissionType")%></span>								
													</div>
													<div class="feature">
														<span class="fuel feature-image"></span>
														<span>'<%#Eval("FuelType")%></span>								
													</div>
													<div class="z-points age-limit d-f ai-c">
														<span>Booking ID</span>
														 <span class="age-val">'<%#Eval("Booking_ID")%> </span>
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector">
													<div style="font-size:20px;">Pickup Location : <%#Eval("PickupLoc")%> ,<%#Eval("PickupLocality")%>,<%#Eval("PickupCity")%> </div>
												</div>
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
						          					<button type="button" name="CancelBook" class="cancel" runat="server"  >
                                                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="CancelCar" CommandArgument='<%#Eval("Booking_ID")%>' CssClass="Linkbuttondesign">Cancel</asp:LinkButton></button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
									  </div>
									  </ItemTemplate>
									  </asp:DataList>
								
</div>
						      <div class="booking-tabs"><asp:DataList ID="DataList2" runat="server">
									  <ItemTemplate>
								  <div class="car-listing">
									<div class="car-component">
										<div class="car-policies">
										<div class="car-item">
											<div class="car-img" style=""></div>
											<div class="details">
												<h3>'<%#Eval("Model")%></h3>
												<div class="features">
													<div class="feature">
														<span class="number feature-image"></span>
														<span>'<%#Eval("Vehicle_Reg_no")%></span>								
													</div>
													<div class="feature">
														<span class="seater feature-image"></span>
														<span>'<%#Eval("SeatingCap")%> Seater</span>								
													</div>
													<div class="feature">
														<span class="transmission feature-image"></span>
														<span>'<%#Eval("TransmissionType")%></span>								
													</div>
													<div class="feature">
														<span class="fuel feature-image"></span>
														<span>'<%#Eval("FuelType")%></span>								
													</div>
													<div class="z-points age-limit d-f ai-c">
														<span>Booking ID</span>
														 <span class="age-val">'<%#Eval("Booking_ID")%> </span>
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector">
													<div style="font-size:20px;">Pickup Location : <%#Eval("PickupLoc")%> ,<%#Eval("PickupLocality")%>,<%#Eval("PickupCity")%> </div>
												</div>
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
						          					<button type="button" name="CancelBook" class="cancel" runat="server"  >
                                                        Ride is on</button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
									  </div>
									  </ItemTemplate>
									  </asp:DataList></div>
						      <div class="booking-tabs"><asp:DataList ID="DataList3" runat="server">
									  <ItemTemplate>
								  <div class="car-listing">
									<div class="car-component">
										<div class="car-policies">
										<div class="car-item">
											<div class="car-img" style=""></div>
											<div class="details">
												<h3>'<%#Eval("Model")%></h3>
												<div class="features">
													<div class="feature">
														<span class="number feature-image"></span>
														<span>'<%#Eval("Vehicle_Reg_no")%></span>								
													</div>
													<div class="feature">
														<span class="seater feature-image"></span>
														<span>'<%#Eval("SeatingCap")%> Seater</span>								
													</div>
													<div class="feature">
														<span class="transmission feature-image"></span>
														<span>'<%#Eval("TransmissionType")%></span>								
													</div>
													<div class="feature">
														<span class="fuel feature-image"></span>
														<span>'<%#Eval("FuelType")%></span>								
													</div>
													<div class="z-points age-limit d-f ai-c">
														<span>Booking ID</span>
														 <span class="age-val">'<%#Eval("Booking_ID")%> </span>
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector">
													<div style="font-size:20px;">Pickup Location : <%#Eval("PickupLoc")%> ,<%#Eval("PickupLocality")%>,<%#Eval("PickupCity")%> </div>
												</div>
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
						          					<button type="button" name="CancelBook" class="cancel" runat="server"  >
                                                        Completed</button>
						          				</div>
						          			</div>
										</div>
										</div>
									</div>
									  </div>
									  </ItemTemplate>
									  </asp:DataList></div>
						      <div class="booking-tabs"><asp:DataList ID="DataList4" runat="server">
									  <ItemTemplate>
								  <div class="car-listing">
									<div class="car-component">
										<div class="car-policies">
										<div class="car-item">
											<div class="car-img" style=""></div>
											<div class="details">
												<h3>'<%#Eval("Model")%></h3>
												<div class="features">
													<div class="feature">
														<span class="number feature-image"></span>
														<span>'<%#Eval("Vehicle_Reg_no")%></span>								
													</div>
													<div class="feature">
														<span class="seater feature-image"></span>
														<span>'<%#Eval("SeatingCap")%> Seater</span>								
													</div>
													<div class="feature">
														<span class="transmission feature-image"></span>
														<span>'<%#Eval("TransmissionType")%></span>								
													</div>
													<div class="feature">
														<span class="fuel feature-image"></span>
														<span>'<%#Eval("FuelType")%></span>								
													</div>
													<div class="z-points age-limit d-f ai-c">
														<span>Booking ID</span>
														 <span class="age-val">'<%#Eval("Booking_ID")%> </span>
													</div>
												</div>
												<div class="divider"></div>
												<div class="lacation-selector">
													<div style="font-size:20px;">Pickup Location : <%#Eval("PickupLoc")%> ,<%#Eval("PickupLocality")%>,<%#Eval("PickupCity")%> </div>
												</div>
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
						          					<button type="button" name="CancelBook" class="cancel" runat="server"  >
                                                        Cancelled</button>
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
			  						<input class="input-box" type="password" autocomplete="off" id="odpwd" maxlength="20" minlength="8" runat="server" name="oldPassword" placeholder="Enter current password"/>
			  					</div>
			  					<div class="form-input-block">
			  						<label class="input-label">New Password</label>
			  						<input class="input-box" type="password" autocomplete="off" id="nwpwd" maxlength="20" minlength="8"  runat="server" name="NewPassword" placeholder="Enter New password"/>
			  					</div>
			  					<div class="form-input-block">
			  						<label class="input-label">Confirm password</label>
			  						
			  						<input class="input-box" type="password" autocomplete="off" id="cnwpwd" maxlength="20" minlength="8" runat="server" name="oldPassword" placeholder="Confirm password"/>
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
</asp:Content>
