Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class registervendor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub SubmitVendor_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitVendor.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        connection.Open()
        Dim emaillookup As String
        Dim mobilelookup As String
        Dim emailAddress As String = emailadd.Value
        Dim password As String = ent_pwd.Value
        Dim mobile_no As String = mobileno.Value
        Dim lookcmd As String = "select User_ID from userlogin_info where Username='" & emailAddress & "'"
        Dim cmd As New SqlCommand(lookcmd, connection)
        mobilelookup = cmd.ExecuteScalar()
        cmd.Dispose()
        connection.Close()
        connection.Open()
        Dim lookcmd1 As String = "select User_ID from userlogin_info where MobileNo='" & mobile_no & "'"
        Dim cmd2 As New SqlCommand(lookcmd1, connection)
        emaillookup = cmd2.ExecuteScalar()
        cmd2.Dispose()
        connection.Close()
        If mobilelookup Is Nothing And emaillookup Is Nothing Then
            Dim signupcmd As String = "insert into userlogin_info (Username,Userpwd,Name,MobileNo,Usertype) values('" & emailAddress & "','" & password & "','" & name1.Value & "','" & mobile_no & "','caragent')"
            Dim cmd1 As New SqlCommand(signupcmd, connection)
            Try
                connection.Open()
                If cmd1.ExecuteNonQuery() Then
                    cmd1.Dispose()
                    Session("userid") = emailAddress
                    Session("password") = password
                    Response.Redirect("regisuccess.aspx")
                Else
                    signupstatus.Text = "Unsuccessful Attempt. Please Try Again."
                End If
            Catch ex As Exception
            End Try
        Else
            signupstatus.Text = "Your are already registered with us. Kindly use Login option."
        End If
    End Sub

End Class