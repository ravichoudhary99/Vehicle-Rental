<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="bookconfirm.aspx.vb" Inherits="Vehicle_Rental.bookconfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/paymentstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
	<asp:FormView ID="PreBookInfo" runat="server">
		<ItemTemplate>
    <div class="payment-section">
			<div class="payment-left-section">
				<div class="left-section-upper">
					<div class="model-detail">
						<div class="car-name"><label><%#Eval("Model") %></label></div>
						<div class="model-img"><img alt="" src='<%#Eval("Image_Dummy") %>' height="100px"/></div>
						<div class="model-features">
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
						</div>
					</div>
					<div class="booking-details">
						<div class="header">
							<span class=left-line></span>
							<span class="header-text">Booking Details</span>
							<span class="right-line"></span>
						</div>
						<div class="part-1">
							<div class="booking-pickup">
                                <%:Session("Date")%>  &ensp;&ensp; <%:Session("Time")%> </div>
							<div class="booking-to"></div>
							<div class="booking-drop"><label>Same Day</label></div>
						</div>
						<div class="city"><label>Jodhpur</label></div>
					</div>
				</div>
				<div class="left-section-lower">
					<div class="important">
						<div class=header>
							<span class="left-line"></span>
							<span class="header-text">Important Details </span>
							<span class="right-line"></span>
						</div>
						<div class="point-section">
							<div class="points">
								<span class="left">CHANGE IN PRICING PLAN:</span>
								<span class="right">The pricing plan (5 kms/hr, without fuel) cannot be changed after the booking is made</span>
								
							</div>
							<div class="points">
								<span class="left">FUEL:</span>
								<span class="right">In case you are returning the car at a lower fuel level than what was received, we will charge a flat Rs 500 refuelling service charge + actual fuel cost to get the tank to the same level as what was received</span>
								
							</div>
							<div class="points">
								<span class="left">TOLLS, PARKING, INTER-STATE TAXES:</span>
								<span class="right">To be paid by you.</span>
								
							</div>
							<div class="points">
								<span class="left">ID VERIFICATION:</span>
								<span class="right">Please keep your original Driving License handy. While delivering the car to you, our executive will verify your original Driving License and ID proof (same as the ones whose details were provided while making the booking). This verification is mandatory. In the unfortunate case where you cannot show these documents, we will not be able to handover the car to you, and it will be treated as a late cancellation (100% of the fare would be payable). Driving license printed on A4 sheet of paper (original or otherwise) will not be considered as a valid document.</span>
								
							</div>
							<div class="points">
								<span class="left">PRE-HANDOVER INSPECTION:</span>
								<span class="right">Please inspect the car (including the fuel gauge and odometer) thoroughly before approving the checklist.</span>
								
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="payment-right-section">
				<div class="fare-details">
					<div class="header flex">
							<span class="left-line"></span>
							<span class="header-text">Fare Details </span>
							<span class="right-line"></span>
						</div>
						<div class="fare-amt-details">
							<span class="left-side">Base Fare</span>
							<span class="right-side"><label>Rs. <%#Eval("MinPrice", "{0:N2}") %></label></span>
						</div>

						<div class="fare-amt-details">
							<span class="left-side">Insurance & GST</span>
							<span class="right-side"><label>Included</label></span>
						</div>

					
						<div class="divide"></div>
						<div class="fare-amt-details">
							<span class="left-side">Total</span>
							<span class="right-side"><label>Rs. <%#Eval("MinPrice", "{0:N2}") %></label></span>
						</div>
						<div class="divide"></div>
						<div class="fare-amt-details">
							<span class="left-side">Kms limit</span>
							<span class="right-side"><label><%#Eval("MinKM") %></label></span>
						</div>
						<div class="fare-amt-details">
							<span class="left-side">Fuel </span>
							<span class="right-side"><label>Excluded</label></span>
						</div>
						<div class="fare-amt-details">
							<span class="left-side">Extra kms charges</span>
							<span class="right-side"><label>Rs. 12/ Per Km.</label></span>
						</div>
						
						</div>
				</div>
			</div>
		
		</div>
				</ItemTemplate>
			</asp:FormView>
	<div style="position:absolute;left:70%; bottom:28%">
				<div class=" but fare-amt-details">
							<input class="promo" id="promocodeval" placeholder="promo-code" type="text" value="" runat="server"/>
                            <input id="Promocode" type="button" value="Apply" runat="server" class="btn-apply" />
						</div>
					<div class="fare-amt-details but">
                        <asp:Label ID="Promomsg" runat="server" Text=""></asp:Label>
					</div>
			<div class="but fare-amt-details">
				
							<div class="loc">
								<label>Payment Terms : Kindly pay amount in cash to car owner.</label><br />
								<button class="btn-conf" runat="server" id="Confbook">Confirm Booking</button>
							</div>
				</div>
		</div>
		
</asp:Content>
