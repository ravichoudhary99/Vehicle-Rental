Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Security
Public Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Protected Sub CarSearchbtn_ServerClick(ByVal sender As Object, e As EventArgs) Handles CarSearchbtn.ServerClick
        If Session("Loggedinuserid") Is Nothing Then
            Page.ClientScript.RegisterStartupScript(GetType(Page), "Script", "openlogin()", True)
        ElseIf Session("Loggedinuserid") IsNot Nothing Then
            Session("city") = Request.Form("City")
            Session("Locality") = Request.Form("locality")
            Session("Date") = date1.Value
            Session("Time") = time1.Value
            If Session("city") IsNot Nothing Then
                Response.Redirect("searchcar.aspx")
            Else
                Page.ClientScript.RegisterStartupScript(GetType(Page), "Alert", "alert('Search details missing!')", True)
            End If
        End If

    End Sub
End Class