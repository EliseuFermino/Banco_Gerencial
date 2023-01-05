
Partial Class MemberPages_RH_Faixas_Supervisor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub cboRegiao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboRegiao.SelectedIndexChanged
        Session("sREGIAO") = cboRegiao.Text
        grid.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVen As New VendaEmpresaMes
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(346, User.Identity.Name)


        End If

    End Sub

    Private Sub Atualizar()
        Session("sREGIAO") = cboRegiao.Text
        Session("sREGIONAL") = cboRegional.Value
        grid.DataBind()


    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboRegional.SelectedIndex = 0
            cboRegiao.SelectedIndex = 0

        End If
    End Sub

    Protected Sub cboRegional_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboRegional.SelectedIndexChanged
        On Error Resume Next
        cboRegiao.DataBind()
        cboRegiao.SelectedIndex = 0
        Atualizar()

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Atualizar()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Consulta de Faixa Salarial - Regional - PGR346"
        End If
    End Sub

    ' 

End Class
