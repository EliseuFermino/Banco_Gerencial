Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_Analise_Lojas_Orcamento_Venda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(429, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now()) + 1

            Me.cboAno.AnoInicial = 2022
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise do Orçamento de Vendas da Loja - PGR429"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Dim oPro As New Projeto
       
        Session("sANO") = cboAno.CallAno


    End Sub

    Private Sub Atualizar()
        mySession()
        Me.gridAnalise.DataBind()
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub


End Class


