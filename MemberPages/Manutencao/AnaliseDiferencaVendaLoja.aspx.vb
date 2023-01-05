Imports System.Data

Partial Class MemberPages_Manutencao_AnaliseDiferencaVendaLoja
    Inherits System.Web.UI.Page

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        Dim oFun As New Funcoes
        oFun.Grid_RedIsNegative(e, "vlrDif")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(DateAndTime.Now)
            Me.cboAno.CallAno = Year(DateAndTime.Now)
            Call Atualizar()
            wucObsPrograma.Anotacao1 = "A Atualização da Analise Diaria esta em 10.1.1.18. Va no Banco 'gerTran_Vendas' -> Stored Procedure -> Vendas.usp_BuscarDiferencaEntrePROGRESS_x_SQL14. "
            wucObsPrograma.Anotacao2 = " Edite a Stored e copie o ultimo bloco de codificação e altera apenas o ano."

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then

            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Diferença de Vendas"
        End If

    End Sub


    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()

    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Me.ASPxGridView1.DataBind()
        Me.GridView1.DataBind()
    End Sub
End Class
