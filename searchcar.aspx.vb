Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        If Session("Loggedinuserid") IsNot Nothing Then
            connection.Open()
            Dim City As String = Session("city")
            Dim Plocal As String = Session("Locality")
            Dim query = "Select * from vehicleinfo where PickupCity='" & City & "' And PickupLocality LIKE '%" & Plocal & "%' And availstatus ='Yes'"
            Dim cmd As New SqlCommand(query, connection)
            Try
                DataList1.DataSource = cmd.ExecuteReader()
                DataList1.DataBind()
                cmd.Dispose()

                connection.Close()
            Catch ex As Exception

            End Try
        ElseIf Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("home.aspx")
        End If
    End Sub

    Protected Sub DataList1_ItemCommand(sender As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        If e.CommandName = "BookCar" Then
            Dim commandArgs() As String = e.CommandArgument.ToString.Split(",")
            Session("VehicleNo") = commandArgs(0)
            Session("Locality") = commandArgs(1)
            Response.Redirect("bookconfirm.aspx")
        End If
    End Sub

    Protected Sub RefineSearch_ServerClick(sender As Object, e As EventArgs) Handles RefineSearch.ServerClick
    End Sub
End Class
