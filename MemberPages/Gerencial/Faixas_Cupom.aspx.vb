Imports DevExpress.Web

Partial Class MemberPages_Gerencial_Faixas_Cupom
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(399, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cupons de Vendas por Faixas - PGR399"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboFilial.CallFilial = 3
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        grid.DataBind()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub



End Class
