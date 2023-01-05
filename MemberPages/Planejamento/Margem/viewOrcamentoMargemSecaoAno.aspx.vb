Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_viewOrcamentoVendasMargemAno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim Ano As Int32
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(90, User.Identity.Name)

            cboAno.AnoInicial = Year(Now())
            cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Ano = Me.cboAno.CallAno

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True

            Session("sUSER") = User.Identity.Name

            Me.grid.Columns.Item("Grupo_Ano3").Caption = "Histórico " & Ano - 3
            Me.grid.Columns.Item("Grupo_Ano2").Caption = "Histórico " & Ano - 2
            Me.grid.Columns.Item("Grupo_Ano1").Caption = "Histórico " & Ano - 1
            Me.grid.Columns.Item("Grupo_Meta").Caption = "Meta " & Ano

            Me.grid.Columns.Item("CrescMeta").Caption = Right(Ano, 2) & "/" & Right(Ano - 1, 2)
            Me.grid.Columns.Item("CrescAA").Caption = Right(Ano - 1, 2) & "/" & Right(Ano - 2, 2)
            Me.grid.Columns.Item("CrescAA1").Caption = Right(Ano - 2, 2) & "/" & Right(Ano - 3, 2)

            Me.cboPosicao.CallPosicao = 1

            Call Atualizar()

        End If
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "CrescA3_A4" Or e.DataColumn.FieldName = "CrescA2_A3" Or e.DataColumn.FieldName = "CrescA1_A2" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
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

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub

    Private Sub Atualizar()
        clData_gerManager.usp5_TM("uspBackPage_VendaSecaoOriginalLoja_Atualiza_Ano", "@Ano", "@idFilial", "@userName", "@idTipoSecao", "@idPosicao", Me.cboAno.CallAno, Me.cboFilial.CallFilial, User.Identity.Name, 2, Me.cboPosicao.CallPosicao, 2400)
        Me.grid.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento Ano - Margem"
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call Atualizar()
    End Sub
End Class
