Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class bookconfirm
    Inherits System.Web.UI.Page
    Dim MinPrice As Double = 0.0
    Dim Amount As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        Dim query As String = "Select * from vehicleinfo where Registration_No='" & Session("VehicleNo") & "'"
        If Session("Loggedinuserid") IsNot Nothing Then
            connection.Open()
            Dim cmd As New SqlCommand(query, connection)
            Try
                PreBookInfo.DataSource = cmd.ExecuteReader()
                PreBookInfo.DataBind()
                cmd.Dispose()
                connection.Close()
            Catch ex As Exception
            End Try
        ElseIf Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("home.aspx")
        End If
    End Sub
    Protected Sub Promocode_ServerClick(sender As Object, e As EventArgs) Handles Promocode.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        Dim query As String = "Select MinPrice from vehicleinfo where Registration_No='" & Session("VehicleNo") & "'"
        connection.Open()
        Dim cmd As New SqlCommand(query, connection)
        Dim price As String = cmd.ExecuteScalar()
        MinPrice = Convert.ToDouble(price)
        cmd.Dispose()
        connection.Close()
        If promocodeval.Value = "NEW100" Then
            Amount = MinPrice - 100
            Promomsg.Text = "Promoapplied"
            Promomsg.ForeColor = System.Drawing.Color.Green
        Else
            Promomsg.Text = "Invalid promo code."
            Promomsg.ForeColor = System.Drawing.Color.Red
        End If
    End Sub
    Protected Sub Confbook_ServerClick(sender As Object, e As EventArgs) Handles Confbook.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        Dim query2 As String = "Select userid from vehicleinfo where Registration_No='" & Session("VehicleNo") & "'"
        Dim cmd2 As New SqlCommand(query2, connection)
        connection.Open()
        Dim ownuserlook As String = cmd2.ExecuteScalar()
        cmd2.Dispose()
        connection.Close()
        Dim query As String = "Insert into booking (CustomerUserID,Vehicle_Reg_No,PickupDate,PickupTime,Booking_Status,owneruserid) values (" & Session("Loggedinuserid") & ",'" & Session("VehicleNo") & "','" & Session("Date") & "','" & Session("Time") & "','Booked'," & ownuserlook & ")"
        connection.Open()
        Dim cmd As New SqlCommand(query, connection)
        Try
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            connection.Close()
            connection.Open()
            Dim query1 As String = "update vehicleinfo Set availstatus='NO' where Registration_No='" & Session("VehicleNo") & "'"
            Dim cmd1 As New SqlCommand(query1, connection)
            cmd1.ExecuteNonQuery()
            cmd1.Dispose()
            Response.Redirect("booksuccess.aspx")
        Catch ex As Exception

        End Try

    End Sub
End Class
