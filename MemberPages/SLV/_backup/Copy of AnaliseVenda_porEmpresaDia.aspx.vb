Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVenda_PorSecaoEmpresaDia
    Inherits System.Web.UI.Page

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        If Me.rndFilial.Checked = True Then
            clData_gerManager.uspSecaoDiasFilial("SLV.AtualizarAnaliseVendaSecaoEmpresaDia", Me.cboFilial.CallFilial, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)
        ElseIf Me.rndEmpresa.Checked = True Then
            clData_gerManager.uspSecaoDiasFilial("SLV.AtualizarAnaliseVendaSecaoEmpresaDia", "99", Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)
        Else
            clData_gerManager.uspSecaoDiasFilial("SLV.AtualizarAnaliseVendaSecaoEmpresaDia", "98", Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)
        End If

        Me.optSLV.Panel1_Visible = True
        Me.optSLV.Panel2_Visible = True
        Me.optSLV.Panel3_Visible = True
        Me.optSLV.Panel4_Visible = True

        Me.optSLV.chkMA_Visible = True  'Mes Anterior
        Me.optSLV.chkAA_Visible = True  'Ano Anterior
        Me.optSLV.chkMeta_Visible = True    'Meta

        Me.optSLV.chkCrescVenda_Visible = True
        Me.optSLV.chkCrescQtde_Visible = True
        Me.optSLV.chkCrescLucro_Visible = True

        Me.optSLV.chkPartAT_Visible = True
        Me.optSLV.chkPartAA_Visible = True
        Me.optSLV.chkPartMA_Visible = True
        Me.optSLV.chkLucroMA_Visible = True
        Me.optSLV.chkLucroAA_Visible = True
        Me.optSLV.chkLucroAT_Visible = True

        Session("sUSUARIO") = User.Identity.Name

        Me.grid.Visible = True
        Me.grid.DataBind()

        Call OcultarColunas()
        
    End Sub

    Private Sub OcultarColunas()
        Dim myMes As Byte
        myMes = Me.cboDia.CallDiaInicial.Month
        If myMes = 1 Then
            Me.grid.Columns.Item("QtdeMA").Visible = False
            Me.grid.Columns.Item("vlrVendaMA").Visible = False
            Me.grid.Columns.Item("percMargemMA").Visible = False
        Else
            Me.grid.Columns.Item("QtdeMA").Visible = True
            Me.grid.Columns.Item("vlrVendaMA").Visible = True
            Me.grid.Columns.Item("percMargemMA").Visible = True
        End If
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(74, User.Identity.Name)

            Dim oProjeto As New Projeto
            Dim Depto As String
            Depto = Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))
            Select Case Depto
                Case "Loja"
                    Me.rndFilial.Checked = True
                    Me.cboFilial.Visible = True
                    Me.rndMesmas.Visible = False
                    Me.rndEmpresa.Visible = False
                    Me.rndFilial.Visible = False
                Case Else
                    Me.cboFilial.Visible = False
            End Select
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas - Todas Seções"
    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next
        If e.Column.FieldName = "percAtingMetaVlr" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMeta"))
            Dim vRealVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAT"))
            If vRealVenda <> 0 Then
                e.Value = ((vRealVenda / vMetaVenda) * 100) - 100
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difPercMargem" Then
            Dim vMetaPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargemMeta"))
            Dim vRealPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargemAT"))
            If vRealPercMargem <> 0 Then
                e.Value = vRealPercMargem - vMetaPercMargem
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "percAtingAg23" Then
            Dim vMetaAg23 As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg23Meta"))
            Dim vRealAg23 As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg23"))

            If vRealAg23 = 0 Then
                e.Value = 0
            ElseIf vMetaAg23 = 0 Then
                e.Value = 0
            Else
                e.Value = vMetaAg23 - vRealAg23
            End If
        End If

        If e.Column.FieldName = "percCrescAg23" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAT"))
            Dim vRealAg23 As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg23"))

            If vRealAg23 = 0 Then
                e.Value = 0
            ElseIf vVenda = 0 Then
                e.Value = 0
            Else
                e.Value = ((vRealAg23 / vVenda) * 100)
            End If
        End If



    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "percAtingMetaVlr" Or
            e.DataColumn.FieldName = "percAtingAg23" Or
            e.DataColumn.FieldName = "percCrescAg23" Or
            e.DataColumn.FieldName = "difPercMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescQtde" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If



        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("descSecao"))

        Select Case NomeColuna
            Case "Depto 1", "Depto 2", "Depto 3", "Depto 4", "Depto 5"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "Total"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select

    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub rndFilial_CheckedChanged(sender As Object, e As EventArgs) Handles rndFilial.CheckedChanged
        If Me.rndFilial.Checked = True Then
            Me.cboFilial.Visible = True
        End If
    End Sub

    Protected Sub rndEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles rndEmpresa.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
        End If
    End Sub

    Protected Sub rndMesmas_CheckedChanged(sender As Object, e As EventArgs) Handles rndMesmas.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkAAChecked(sender As Object, e As EventArgs) Handles optSLV.chkAAChecked
        If Me.optSLV.chkAA_Checked = True Then
            Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkCrescimentoChecked(sender As Object, e As EventArgs) Handles optSLV.chkCrescimentoChecked
        If Me.optSLV.chkCrescimento_Checked = True Then
            Me.grid.Columns.Item("bandCrescimento").Visible = True
        Else
            Me.grid.Columns.Item("bandCrescimento").Visible = False
        End If
    End Sub

    'Private Sub ExibirMesAnterior()
    '    Me.grid.Columns.Item("QtdeMA").Visible = True
    '    Me.grid.Columns.Item("vlrVendaMA").Visible = True
    '    Me.grid.Columns.Item("percMargemMA").Visible = True
    '    Me.grid.Columns.Item("vlrMargemMA").Visible = True
    '    Me.grid.Columns.Item("percPartMA").Visible = True

    '    Me.optSLV.chkMA_Checked = True
    '    Me.optSLV.chkMA_Visible = True
    '    Me.optSLV.chkPartMA_Checked = True
    '    Me.optSLV.chkPartMA_Enabled = True
    '    Me.optSLV.chkLucroMA_Checked = True
    '    Me.optSLV.chkLucroMA_Enabled = True
    'End Sub

    'Private Sub OcultarMesAnterior()
    '    Me.grid.Columns.Item("QtdeMA").Visible = False
    '    Me.grid.Columns.Item("vlrVendaMA").Visible = False
    '    Me.grid.Columns.Item("percMargemMA").Visible = False
    '    Me.grid.Columns.Item("percPartMA").Visible = False
    '    Me.grid.Columns.Item("vlrMargemMA").Visible = False
    'End Sub

    Protected Sub optSLV_chkCrescLucroChecked(sender As Object, e As EventArgs) Handles optSLV.chkCrescLucroChecked
        If Me.optSLV.chkCrescLucro_Checked = True Then   '
            Me.grid.Columns.Item("percCrescLucro").Visible = True
        Else
            Me.grid.Columns.Item("percCrescLucro").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkCrescQtdeChecked(sender As Object, e As EventArgs) Handles optSLV.chkCrescQtdeChecked
        If Me.optSLV.chkCrescQtde_Checked = True Then   '
            Me.grid.Columns.Item("percCrescQtde").Visible = True
        Else
            Me.grid.Columns.Item("percCrescQtde").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkCrescVendaChecked(sender As Object, e As EventArgs) Handles optSLV.chkCrescVendaChecked
        If Me.optSLV.chkCrescVenda_Checked = True Then   '
            Me.grid.Columns.Item("percCresc").Visible = True
        Else
            Me.grid.Columns.Item("percCresc").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkLucroAAChecked(sender As Object, e As EventArgs) Handles optSLV.chkLucroAAChecked
        If Me.optSLV.chkLucroAA_Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemAA").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemAA").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkLucroATChecked(sender As Object, e As EventArgs) Handles optSLV.chkLucroATChecked
        If Me.optSLV.chkLucroAT_Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemAT").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemAT").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkLucroMAChecked(sender As Object, e As EventArgs) Handles optSLV.chkLucroMAChecked
        If Me.optSLV.chkLucroMA_Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemMA").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemMA").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkMAChecked(sender As Object, e As EventArgs) Handles optSLV.chkMAChecked
        If Me.optSLV.chkMA_Checked = True Then
            Me.grid.Columns.Item("bandMesAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandMesAnterior").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkMetaChecked(sender As Object, e As EventArgs) Handles optSLV.chkMetaChecked
        If Me.optSLV.chkMeta_Checked = True Then   '
            Me.grid.Columns.Item("bandMetas").Visible = True
        Else
            Me.grid.Columns.Item("bandMetas").Visible = False
        End If
    End Sub


    Protected Sub optSLV_chkPartAAChecked(sender As Object, e As EventArgs) Handles optSLV.chkPartAAChecked
        If Me.optSLV.chkPartAA_Checked = True Then   '
            Me.grid.Columns.Item("percPartAA").Visible = True
        Else
            Me.grid.Columns.Item("percPartAA").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkPartATChecked(sender As Object, e As EventArgs) Handles optSLV.chkPartATChecked
        If Me.optSLV.chkPartAT_Checked = True Then   '
            Me.grid.Columns.Item("percPartAT").Visible = True
        Else
            Me.grid.Columns.Item("percPartAT").Visible = False
        End If
    End Sub

    Protected Sub optSLV_chkPartMAChecked(sender As Object, e As EventArgs) Handles optSLV.chkPartMAChecked
        If Me.optSLV.chkPartMA_Checked = True Then   '
            Me.grid.Columns.Item("percPartMA").Visible = True
        Else
            Me.grid.Columns.Item("percPartMA").Visible = False
        End If
    End Sub



    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If
    End Sub
End Class
