
Partial Class MemberPages_RH_Faixas_Isis
    Inherits System.Web.UI.Page

    Protected Sub cboRegiao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboRegiao.SelectedIndexChanged
        Session("sREGIAO") = cboRegiao.Text
        grid.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVen As New VendaEmpresaMes
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(345, User.Identity.Name)

            cboRegiao.Text = "APUCARANA"
            

        End If



    End Sub

   

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sREGIAO") = "APUCARANA"
            grid.DataBind()

        End If
    End Sub
End Class
