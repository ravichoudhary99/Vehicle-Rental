Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class login
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LoginBtn_Click(sender As Object, e As EventArgs) Handles LoginBtn.Click
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        connection.Open()
        Dim userid As String
        Dim lookusrtype As String
        Dim query As String = "select User_ID from userlogin_info where Username='" & emailid.Value & "' AND Userpwd='" & pwd.Value & "'"
        Dim cmd As New SqlCommand(query, connection)
        Try
            userid = cmd.ExecuteScalar()
            cmd.Dispose()
            connection.Close()

            If userid Is Nothing Then
                invalidlogin.Visible = True
                invalidlogin.Text = "Invalid username or password. Please Try again."
            End If
            If userid IsNot Nothing Then
                invalidlogin.Visible = False
                Dim query1 As String = "select Usertype from userlogin_info where Username='" & emailid.Value & "'"
                Dim cmd1 As New SqlCommand(query1, connection)
                connection.Open()
                lookusrtype = cmd1.ExecuteScalar()
                Session("usertype") = lookusrtype
                If lookusrtype = "caragent" Then
                    Session("Loggedinuserid") = userid
                    Response.Redirect("carvendorprofile.aspx")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class