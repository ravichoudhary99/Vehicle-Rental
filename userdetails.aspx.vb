Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class userdetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("login.aspx")
        ElseIf Session("Loggedinuserid") IsNot Nothing Then
            If Session("usertype") = "caragent" Then
                Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
                Dim connection As New SqlConnection(connstr)
                connection.Open()
                Dim query As String = "select userlogin_info.username,userlogin_info.name,userlogin_info.mobileno,rentcustinfo.dl,rentcustinfo.photo from userlogin_info  INNER JOIN rentcustinfo ON userlogin_info.User_ID=rentcustinfo.userid where userid=" & Session("customerid")
                Dim cmd As New SqlCommand(query, connection)
                DataList1.DataSource = cmd.ExecuteReader()
                DataList1.DataBind()
                cmd.Dispose()
                connection.Close()
            End If
        End If
    End Sub

End Class