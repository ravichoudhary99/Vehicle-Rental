Public Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Loggedinuserid") Is Nothing Then
            Response.Redirect("home.aspx")
        End If
    End Sub
    Protected Sub logout_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles logout.ServerClick
        System.Threading.Thread.Sleep(800)
        Session.Clear()
        Session.RemoveAll()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("home.aspx", True)
    End Sub
End Class