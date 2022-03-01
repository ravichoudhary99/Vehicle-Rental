Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.Web.UI.Page
Public Class Site1
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Loggedinuserid") Is Nothing Then
            loggedinbtn.Visible = "False"
            loginpop.Visible = "True"
        End If
        If Session("Loggedinuserid") IsNot Nothing Then
            If Session("usertype") = "caragent" Then
                loggedinbtn.Visible = "False"
                loginpop.Visible = "True"
            Else
                loggedinbtn.Visible = "True"
                loginpop.Visible = "False"
            End If

        End If
        HiddenField1.Value = Session("Loggedinuserid")
    End Sub
    Protected Sub Logbttn_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Logbttn.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        connection.Open()
        Dim userid As String
        Dim lookusrtype As String
        Dim query As String = "select User_ID from userlogin_info where Username='" & logemail.Value & "' AND Userpwd='" & logpwd.Value & "'"
        Dim cmd As New SqlCommand(query, connection)
        Try
            userid = cmd.ExecuteScalar()
            cmd.Dispose()
            connection.Close()

            If userid Is Nothing Then
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Incorrect login credentials. Please try with valid details')", True)
            End If
            If userid IsNot Nothing Then
                Dim query1 As String = "Select Usertype from userlogin_info where Username='" & logemail.Value & "'"
                Dim cmd1 As New SqlCommand(query1, connection)
                connection.Open()
                lookusrtype = cmd1.ExecuteScalar()
                Session("usertype") = lookusrtype
                If lookusrtype = "carrent" Then
                    Session("Loggedinuserid") = userid
                    Response.Redirect("home.aspx")
                ElseIf lookusrtype = "caragent" Then
                    Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('You are not allowed to login here.')", True)
                End If
            End If
        Catch ex As Exception

        End Try

    End Sub
End Class