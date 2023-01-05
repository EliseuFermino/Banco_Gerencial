Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_viewOrcamentoVendasSecao
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oOrc As New Orcamento

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim Ano As Int32
            Dim oVem As New VendaEmpresaMes
            Dim oSetor As New MyFunction

            oVem.AtualizarEstatisticaPrograma(79, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Me.cboMes.CallMes = 1
            cboMes.Visible_Ano = False

            Ano = Me.cboAno.CallAno

            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            Session("sUSER") = User.Identity.Name


            Call AtualizarLegendas()


            If oOrc.DefinirPosicao(cboAno.CallAno, 1) = True Then
                cboPosicao.CallPosicao = 3
            Else
                Me.cboPosicao.CallPosicao = 1   '1=Loja    3=Definitivo
            End If


        End If
    End Sub

    Private Sub AtualizarLegendas()
        oFun.Grid_ColumnTitle(grid, "Grupo_Ano3", "Histórico " & Me.cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(grid, "Grupo_Ano2", "Histórico " & Me.cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "Grupo_Ano1", "Histórico " & Me.cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "Grupo_Meta", "Meta " & Me.cboAno.CallAno)

        oFun.Grid_ColumnTitle(grid, "CrescMeta", Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2))
        oFun.Grid_ColumnTitle(grid, "CrescAA", Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2))
        oFun.Grid_ColumnTitle(grid, "CrescAA1", Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2))

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "CrescA3_A4")
        oFun.Grid_RedIsNegative(e, "CrescA2_A3")
        oFun.Grid_RedIsNegative(e, "CrescA1_A2")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("Descricao"))

        Select Case NomeColuna
            Case "Departamento 1", "Departamento 2", "Departamento 3", "Departamento 4", "Departamento 5"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "Total"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
    End Sub


    Private Sub Atualizar()
        clData_gerManager.usp6_TM("uspBackPage_VendaSecaoOriginalLoja_Atualiza", "@Ano", "@idFilial", "@Mes", "@userName", "@idTipoSecao", "@idPosicao", Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.cboMes.CallMes, User.Identity.Name, 1, Me.cboPosicao.CallPosicao, 2400)
        Me.grid.DataBind()
        Call AtualizarLegendas()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        Select Case Me.cboPosicao.CallPosicao
            Case 1, 2   'Lojas e Adminsitação
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento da Loja - Vendas - PGR79 "
            Case 3
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento - Vendas - PGR79  "
            Case 4  'Comercial
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento do Comercial - Vendas - PGR79  "
        End Select

    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call Atualizar()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then Me.cboFilial.Visible_cboCorporacao = False

            Call Atualizar()
        End If
    End Sub
End Class
