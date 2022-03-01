<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="userdetails.aspx.vb" Inherits="Vehicle_Rental.userdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		table.ctable {
  margin: 50px 0 0 35px;
    display: flex;
    width: 900px;
    height: 924px;
    border-radius: 50px;
    border-style: dotted;
    box-shadow: 13px 16px 27px #eef0f3;
    font-family: cursive;
}

        tr.rows {
            line-height: 35px;
            text-align: center; /* border: hidden; */
        }

        tr {
            border: hidden;
        }

        th {
            width: 1%;
            line-height: 80px;
            font-size: xxx-large;
            font-style: normal;
            text-decoration: solid;
            font-weight: 700;
        }

td {
	    margin: 2px 39px;
    padding: 8px 10px;
}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <div class=details>
        <asp:DataList ID="DataList1" runat="server">
			<ItemTemplate>
				<table border="0" class=ctable>
					<th colspan="2">Customer details</th>
					<tr class="rows">
						<td>Customer Name</td>
						<td><%#Eval("Name") %></td>
					</tr>
					<tr class="rows">
						<td>Moblie number</td>
						<td><%#Eval("MobileNo") %></td>
					</tr>
					<tr class="rows">
						<td>e-Mail ID</td>
						<td><%#Eval("Username") %></td>
					</tr>
					<tr class="rows">
						<td>Customer Photo</td>
						<td><img src='<%#Eval("photo") %>' height="200px" widht="150px"/></td>
					</tr>
					<tr class="rows">
						<td>DL Copy </td>
						<td><img src='<%#Eval("dl") %>' height="400px" width="600px"/></td>
					</tr>
				</table>

		</ItemTemplate>
				</asp:DataList>
			</div>

</asp:Content>
