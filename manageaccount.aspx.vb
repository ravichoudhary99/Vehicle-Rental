Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class manageaccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("home.aspx")
        ElseIf Session("Loggedinuserid") IsNot Nothing Then
            Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
            Dim connection As New SqlConnection(connstr)
            connection.Open()
            Dim loguserid As Integer = Session("Loggedinuserid")
            Dim query As String = "Select Name from userlogin_info where User_ID=" & loguserid
            Dim query1 As String = "SELECT userlogin_info.Username, userlogin_info.MobileNo, userlogin_info.Name, rentcustinfo.dl, rentcustinfo.photo from userlogin_info INNER JOIN rentcustinfo ON userlogin_info.User_ID=rentcustinfo.userid where userid=" & loguserid
            Dim cmd As New SqlCommand(query, connection)
            Dim cmd1 As New SqlCommand(query1, connection)
            FormView1.DataSource = cmd.ExecuteReader()
            FormView1.DataBind()
            cmd.Dispose()
            connection.Close()
            connection.Open()
            ProfileDL.DataSource = cmd1.ExecuteReader()
            ProfileDL.DataBind()
            cmd1.Dispose()
            connection.Close()
            connection.Open()
            Dim upcomingquery As String = "select vehicleinfo.model,vehicleinfo.SeatingCap,vehicleinfo.TransmissionType,vehicleinfo.PickupLoc,vehicleinfo.PickupLocality,vehicleinfo.PickupCity, vehicleinfo.FuelType,booking.Booking_ID,vehicleinfo.MinPrice, booking.vehicle_reg_no from vehicleinfo INNER JOIN booking ON vehicleinfo.Registration_No=vehicle_reg_no where customeruserid=" & Session("Loggedinuserid") & " And Booking_Status='Booked'"
            Dim upcmd As New SqlCommand(upcomingquery, connection)
            DataList1.DataSource = upcmd.ExecuteReader()
            DataList1.DataBind()
            upcmd.Dispose()
            connection.Close()
            connection.Open()
            Dim activequery As String = "select vehicleinfo.model,vehicleinfo.SeatingCap,vehicleinfo.TransmissionType,vehicleinfo.PickupLoc,vehicleinfo.PickupLocality,vehicleinfo.PickupCity, vehicleinfo.FuelType,booking.Booking_ID,vehicleinfo.MinPrice, booking.vehicle_reg_no from vehicleinfo INNER JOIN booking ON vehicleinfo.Registration_No=vehicle_reg_no where customeruserid=" & Session("Loggedinuserid") & " And Booking_Status='Active'"
            Dim activecmd As New SqlCommand(activequery, connection)
            DataList2.DataSource = activecmd.ExecuteReader()
            DataList2.DataBind()
            activecmd.Dispose()
            connection.Close()
            connection.Open()
            Dim compquery As String = "select vehicleinfo.model,vehicleinfo.SeatingCap,vehicleinfo.TransmissionType,vehicleinfo.PickupLoc,vehicleinfo.PickupLocality,vehicleinfo.PickupCity, vehicleinfo.FuelType,booking.Booking_ID,vehicleinfo.MinPrice, booking.vehicle_reg_no from vehicleinfo INNER JOIN booking ON vehicleinfo.Registration_No=vehicle_reg_no where customeruserid=" & Session("Loggedinuserid") & " And Booking_Status='Completed'"
            Dim compcmd As New SqlCommand(compquery, connection)
            DataList3.DataSource = compcmd.ExecuteReader()
            DataList3.DataBind()
            activecmd.Dispose()
            connection.Close()
            connection.Open()
            Dim canquery As String = "select vehicleinfo.model,vehicleinfo.SeatingCap,vehicleinfo.TransmissionType,vehicleinfo.PickupLoc,vehicleinfo.PickupLocality,vehicleinfo.PickupCity, vehicleinfo.FuelType,booking.Booking_ID,vehicleinfo.MinPrice, booking.vehicle_reg_no from vehicleinfo INNER JOIN booking ON vehicleinfo.Registration_No=vehicle_reg_no where customeruserid=" & Session("Loggedinuserid") & " And Booking_Status='Cancelled'"
            Dim cancmd As New SqlCommand(canquery, connection)
            DataList4.DataSource = cancmd.ExecuteReader()
            DataList4.DataBind()
            activecmd.Dispose()
            connection.Close()

        End If
    End Sub
    Protected Sub chgpwd_ServerClick(sender As Object, e As EventArgs) Handles chgpwd.ServerClick
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
    Protected Sub DataList1_ItemCommand(sender As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        If e.CommandName = "CancelCar" Then
            Dim query As String = "Update booking set Booking_Status='Cancelled' where Booking_ID='" & e.CommandArgument.ToString() & "'"
            Dim cmd As New SqlCommand(query, connection)
            connection.Open()
            Try
                cmd.ExecuteNonQuery()
                cmd.Dispose()
                connection.Close()
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Cancelled!')", True)
                Response.Redirect(Request.Url.AbsoluteUri)
            Catch ex As Exception

            End Try

        End If
    End Sub
End Class