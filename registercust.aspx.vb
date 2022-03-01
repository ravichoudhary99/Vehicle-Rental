Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class registercust
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
    Private Sub SubmitCust_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitCust.ServerClick
        Dim connstr As String = "Data Source=ROHITBISHNOI\SQLEXPRESS;Initial Catalog=vehiclerent;Integrated Security=True"
        Dim connection As New SqlConnection(connstr)
        connection.Open()
        Dim userid As String
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
            Dim signupcmd As String = "insert into userlogin_info (Username,Userpwd,Name,MobileNo,Usertype) values('" & emailAddress & "','" & password & "','" & cname.Value & "','" & mobile_no & "','carrent')"
            Dim cmd1 As New SqlCommand(signupcmd, connection)
            Try
                connection.Open()
                If cmd1.ExecuteNonQuery() Then
                    Dim duquery As String = "select User_ID from userlogin_info where Username='" & emailAddress & "'"
                    Dim ducmd As New SqlCommand(duquery, connection)
                    userid = ducmd.ExecuteScalar()
                    connection.Close()
                    Dim filename1 As String = "/UploadFiles/RentCust/" & userid & "_" + RandomName() & Path.GetExtension(idcard.PostedFile.FileName.ToString)
                    Dim filename2 As String = "/UploadFiles/RentCust/" & userid & "_" + RandomName() & Path.GetExtension(dl.PostedFile.FileName.ToString)
                    Dim filename3 As String = "/UploadFiles/RentCust/" & userid & "_" + RandomName() & Path.GetExtension(photo.PostedFile.FileName.ToString)
                    idcard.PostedFile.SaveAs(Server.MapPath(filename1))
                    dl.PostedFile.SaveAs(Server.MapPath(filename2))
                    photo.PostedFile.SaveAs(Server.MapPath(filename3))
                    connection.Open()
                    Dim filequery As String = "insert into rentcustinfo values('" & userid & "','" & idtype_.Value & "','" & idcardno.Value & "','" & filename1 & "','" & filename2 & "','" & filename3 & "')"
                    Dim filecmd As New SqlCommand(filequery, connection)
                    If filecmd.ExecuteNonQuery() Then
                        Session("userid") = emailAddress
                        Session("password") = password
                        Response.Redirect("regisuccess.aspx")
                    End If
                    filecmd.Dispose()
                End If
                cmd1.Dispose()
                connection.Close()
            Catch ex As Exception
            End Try
        Else
            signupstatus.Text = "Your are already registered with us. Kindly use Login option."
        End If
    End Sub
End Class