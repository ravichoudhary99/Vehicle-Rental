Public Class regisuccess
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        useridd.Text = Session("userid")
        userpwdd.Text = Session("password")
    End Sub

End Class