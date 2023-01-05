
Partial Class MemberPages_Manutencao_SizeTable_gerVendaItem
    Inherits System.Web.UI.Page

    Dim myYear As Int16


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            myYear = Year(Now())
            Session("sANO") = myYear
            GridView1.DataBind()
            grid_gerManager.DataBind()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            myYear = Year(Now())
            CType(Master.FindControl("lblTitle"), Label).Text = "Size Table - Databases"

        End If
    End Sub
End Class
