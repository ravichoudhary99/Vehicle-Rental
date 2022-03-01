Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class carvendorprofile
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("login.aspx")
        ElseIf Session("Loggedinuserid") IsNot Nothing Then
            If Session("usertype") = "caragent" Then
                Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
                Dim connection As New SqlConnection(connstr)
                connection.Open()
                Dim loguserid As Integer = Session("Loggedinuserid")
                Dim ncmd As String = "select Name from userlogin_info where User_ID=" & loguserid
                Dim nacmd As New SqlCommand(ncmd, connection)
                FormView1.DataSource = nacmd.ExecuteReader()
                FormView1.DataBind()
                nacmd.Dispose()
                connection.Close()
                connection.Open()
                Dim dlquery As String = "SELECT Username, MobileNo, Name from userlogin_info where User_ID=" & loguserid
                Dim dlcmd As New SqlCommand(dlquery, connection)
                DataList1.DataSource = dlcmd.ExecuteReader()
                DataList1.DataBind()
                dlcmd.Dispose()
                connection.Close()
                Dim regvehquery As String = " Select * from vehicleinfo where UserID=" & loguserid
                Dim regcmd As New SqlCommand(regvehquery, connection)
                connection.Open()
                DataList2.DataSource = regcmd.ExecuteReader()
                DataList2.DataBind()
                regcmd.Dispose()
                connection.Close()
                Dim upcomingquery As String = "select booking_id, customeruserid,vehicle_reg_no,PickupDate,PickupTime from booking where owneruserid=" & loguserid & " and Booking_Status='Booked'"
                Dim upcmd As New SqlCommand(upcomingquery, connection)
                connection.Open()
                DataList3.DataSource = upcmd.ExecuteReader()
                DataList3.DataBind()
                upcmd.Dispose()
                connection.Close()
                Dim actbookquery As String = "select booking_id, customeruserid,vehicle_reg_no,PickupDate,PickupTime from booking where owneruserid=" & loguserid & " and Booking_Status='Active'"
                Dim actcmd As New SqlCommand(actbookquery, connection)
                connection.Open()
                DataList4.DataSource = actcmd.ExecuteReader()
                DataList4.DataBind()
                actcmd.Dispose()
                connection.Close()
                Dim compquery As String = "select booking_id, customeruserid,vehicle_reg_no,PickupDate,PickupTime from booking where owneruserid=" & loguserid & " and Booking_Status='Completed'"
                Dim compcmd As New SqlCommand(compquery, connection)
                connection.Open()
                DataList5.DataSource = compcmd.ExecuteReader()
                DataList5.DataBind()
                compcmd.Dispose()
                connection.Close()
                Dim canquery As String = "select booking_id, customeruserid,vehicle_reg_no,PickupDate,PickupTime from booking where owneruserid=" & loguserid & " and Booking_Status='Cancelled'"
                Dim cancmd As New SqlCommand(canquery, connection)
                connection.Open()
                DataList6.DataSource = cancmd.ExecuteReader()
                DataList6.DataBind()
                cancmd.Dispose()
                connection.Close()
            End If
        Else
            Response.Redirect("home.aspx")
        End If
    End Sub
    Protected Sub Chgpwd_ServerClick(sender As Object, e As EventArgs) Handles chgpwd.ServerClick
        Dim oldpassword As String = odpwd.Value
        Dim newpwd As String = nwpwd.Value
        Dim conpwd As String = cnwpwd.Value
        If newpwd = conpwd Then
            Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
            Dim connection As New SqlConnection(connstr)
            connection.Open()
            Dim loguserid As Integer = Session("Loggedinuserid")
            Dim lookpwdquery As String = "select Userpwd from userlogin_info where User_ID=" & loguserid
            Dim lookpwdcmd As New SqlCommand(lookpwdquery, connection)
            Dim lookoldpwd As String = lookpwdcmd.ExecuteScalar()
            lookpwdcmd.Dispose()
            connection.Close()
            If lookoldpwd = oldpassword Then
                connection.Open()
                Dim pwdupdatequery As String = "update userlogin_info set Userpwd=" & newpwd & "where User_ID=" & loguserid
                Dim pwdupdatecmd As New SqlCommand(pwdupdatequery, connection)
                Try
                    pwdupdatecmd.ExecuteNonQuery()
                    Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Password has been changed successfully. Kindly login with new password.')", True)
                    pwdupdatecmd.Dispose()
                    connection.Close()
                Catch ex As Exception
                    Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Password isn't updated.')", True)
                End Try
            Else
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Entered current password is wrong.')", True)
            End If
        Else
            Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('New password and confirm password are not same.')", True)
        End If
    End Sub
    Function RandomName()
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        Static r As New Random
        Dim chactersInString As Integer = r.Next(8, 10)
        Dim sb As New StringBuilder
        For i As Integer = 1 To chactersInString
            Dim idx As Integer = r.Next(0, s.Length)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
    Protected Sub AddCar_ServerClick(sender As Object, e As EventArgs) Handles AddCar.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        Dim userid As String = Session("Loggedinuserid")
        Dim checkalready As String = "Select Registration_No from vehicleinfo where Registration_No='" & Reg_no.Value & "'"
        Dim checkcmd As New SqlCommand(checkalready, connection)
        connection.Open()
        Dim lookregistration As String = checkcmd.ExecuteScalar()
        checkcmd.Dispose()
        connection.Close()
        If lookregistration Is Nothing Then
            Dim regno As String = Reg_no.Value
            Dim modelname As String = Request.Form("ModelName")
            Dim brandname As String = Request.Form("BrandName")
            Dim segment As String = segmentt.Value
            Dim fueltyp As String = fueltype.Value
            Dim tranmissiontype As String = transtype.Value
            Dim seatcapa As Integer = Convert.ToInt32(seatcap.Value)
            Dim Minimumkm As Integer = minkm.Value
            Dim Minimumprice As Integer = minprice.Value
            Dim Picklocation As String = pickuploc.Value
            Dim PickupLocalit As String = pickuplocality.Value
            Dim Pickcity As String = Cty.Value
            Dim filename1 As String = "/UploadFiles/CarOwn/" & userid & "_IMGV" + RandomName() & Path.GetExtension(vphoto.PostedFile.FileName.ToString)
            Dim filename2 As String = "/UploadFiles/CarOwn/" & userid & "_VRC" + RandomName() & Path.GetExtension(vrc.PostedFile.FileName.ToString)
            Dim filename3 As String = "/UploadFiles/CarOwn/" & userid & "_VINS" + RandomName() & Path.GetExtension(vins.PostedFile.FileName.ToString)
            Dim filename4 As String = "/UploadFiles/CarOwn/" & userid & "_PUCC" + RandomName() & Path.GetExtension(vpucc.PostedFile.FileName.ToString)
            Dim addvehiclequery As String = "Insert into vehicleinfo values ('" & regno & "'," & userid & ",'" & modelname & "','" & brandname & "','" & segment & "','" & fueltyp & "','" & tranmissiontype & "'," & seatcapa & "," & Minimumkm & "," & Minimumprice & ",'" & Picklocation & "','" & PickupLocalit & "','" & Pickcity & "','" & filename1 & "','" & filename2 & "','" & filename3 & "','" & filename4 & "','/Images/" & modelname & ".gif','NO')"
            Try
                Dim addvehiclecmd As New SqlCommand(addvehiclequery, connection)
                connection.Open()
                addvehiclecmd.ExecuteNonQuery()
                vphoto.PostedFile.SaveAs(Server.MapPath(filename1))
                vrc.PostedFile.SaveAs(Server.MapPath(filename2))
                vins.PostedFile.SaveAs(Server.MapPath(filename3))
                vpucc.PostedFile.SaveAs(Server.MapPath(filename4))
                addvehiclecmd.Dispose()
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Vehicle added successfully. Within 24 hours vehicle will available for booking.')", True)
                connection.Close()
            Catch ex As Exception
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Some error occured!')", True)
            End Try
        End If
    End Sub
    Protected Sub DataList2_ItemCommand(sender As Object, e As DataListCommandEventArgs) Handles DataList2.ItemCommand
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        If e.CommandName = "ActiveCar" Then
            Dim query As String = "Update vehicleinfo set availstatus='YES' where Registration_No='" & e.CommandArgument.ToString() & "'"
            Dim cmd As New SqlCommand(query, connection)
            connection.Open()
            Try
                cmd.ExecuteNonQuery()
                cmd.Dispose()
                connection.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try
            Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Status updated!')", True)
        End If
        If e.CommandName = "OfflineCar" Then
            Dim query1 As String = "Update vehicleinfo set availstatus='NO' where Registration_No='" & e.CommandArgument.ToString() & "'"
            Dim cmd1 As New SqlCommand(query1, connection)
            connection.Open()
            Try
                cmd1.ExecuteNonQuery()
                cmd1.Dispose()
                connection.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try
            Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Status updated!')", True)
        End If
    End Sub
    Protected Sub DataList3_ItemCommand(sender As Object, e As DataListCommandEventArgs) Handles DataList3.ItemCommand
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        If e.CommandName = "ViewDetails" Then
            Session("customerid") = e.CommandArgument.ToString()
            Response.Redirect("userdetails.aspx")
        End If
        If e.CommandName = "CancelCar" Then
            Dim query As String = "update booking set Booking_Status='Cancelled' where Booking_ID=" & e.CommandArgument.ToString()
            Dim cmd As New SqlCommand(query, connection)
            connection.Open()
            Try
                cmd.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Booking cancelled!')", True)
                cmd.Dispose()
                connection.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try

        End If
        If e.CommandName = "PickCarr" Then
            Dim query1 As String = "update booking set Booking_Status='Active' where Booking_ID=" & e.CommandArgument.ToString()
            Dim cmd1 As New SqlCommand(query1, connection)
            connection.Open()
            Try
                cmd1.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Car picked!')", True)
                cmd1.Dispose()
                connection.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try

        End If
    End Sub
    Protected Sub DataList4_ItemCommand(sender As Object, e As DataListCommandEventArgs) Handles DataList4.ItemCommand
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        If e.CommandName = "ViewDetails" Then
            Session("customerid") = e.CommandArgument.ToString()
            Response.Redirect("userdetails.aspx")
        End If
        If e.CommandName = "CompleteRide" Then
            Dim query As String = "update booking set Booking_Status='Completed' where Booking_ID=" & e.CommandArgument.ToString()
            Dim cmd As New SqlCommand(query, connection)
            connection.Open()
            Try
                cmd.ExecuteNonQuery()
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Ride completed!')", True)
                cmd.Dispose()
                connection.Close()
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try

        End If
    End Sub
End Class