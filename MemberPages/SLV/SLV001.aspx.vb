Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_SLV_SLV001
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect


    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Dim varOpcao As Byte
        Dim oVem As New VendaEmpresaMes
        If Me.cboMercadologico.opcaoTotalChecked = True Then varOpcao = 1
        If Me.cboMercadologico.opcaoDeptoChecked = True Then varOpcao = 2
        If Me.cboMercadologico.opcaoSecaoChecked = True Then varOpcao = 3
        If Me.cboMercadologico.opcaoGrupoChecked = True Then varOpcao = 4
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varOpcao = 5

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal
        Session("sOPCAO") = varOpcao

        If Me.cboMercadologico.Visible_Depto = True Then
            Session("sDEPTO") = Me.cboMercadologico.CallDepto
        Else
            Session("sDEPTO") = 1
        End If

        If Me.cboMercadologico.Visible_Secao = True Then
            Session("sSECAO") = Me.cboMercadologico.CallSecao
        Else
            Session("sSECAO") = 1
        End If

        If Me.cboMercadologico.Visible_Grupo = True Then
            Session("sGRUPO") = Me.cboMercadologico.CallGrupo
        Else
            Session("sGRUPO") = 1
        End If

        If Me.cboMercadologico.Visible_cboSubgrupo = True Then
            Session("sSUBGRUPO") = Me.cboMercadologico.CallSubgrupo
        Else
            Session("sSUBGRUPO") = 1
        End If

 
        'Exibir Ano Anterior
        If Me.chkMostrar_AA.Checked = True Then
            Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        End If

        'Exibir Ano Atual
        If Me.chkMostrar_AT.Checked = True Then
            Me.grid.Columns.Item("bandAnoAtual").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAtual").Visible = False
        End If

        'Exibir CAI
        If Me.chkMostrar_CAI.Checked = True Then
            Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = True
            Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = True
        Else
            Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
            Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
        End If


        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            Me.grid.Columns.Item("descId").Caption = "Departamento"
            Me.grid.Columns.Item("bandFornecedor").Visible = False
            Me.grid.Columns.Item("bandMeta").Visible = True
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid.Columns.Item("descId").Caption = "Seção"
            Me.grid.Columns.Item("bandFornecedor").Visible = False
            Me.grid.Columns.Item("bandMeta").Visible = True
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(138, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.Columns.Item("descId").Caption = "Grupo"
            Me.grid.Columns.Item("bandFornecedor").Visible = False
            Me.grid.Columns.Item("bandMeta").Visible = False
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(139, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.Columns.Item("descId").Caption = "Familia"
            Me.grid.Columns.Item("bandFornecedor").Visible = False
            Me.grid.Columns.Item("bandMeta").Visible = False
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(140, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            Me.grid.Columns.Item("descId").Caption = "Item"
            Me.grid.Columns.Item("bandFornecedor").Visible = True
            Me.grid.Columns.Item("bandMeta").Visible = False
            Me.grid.Settings.ShowFilterRow = True
            oVem.AtualizarEstatisticaPrograma(141, User.Identity.Name)
        End If

        Me.grid.Visible = True
        Me.grid.DataBind()
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Nivel de Mercadológico - PGR137"
        CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."

    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            Me.grid.Columns.Item("descId").Caption = "Item"
            Me.grid.Columns.Item("bandFornecedor").Visible = True
            Me.grid.Columns.Item("bandMeta").Visible = False
            Me.grid.Settings.ShowFilterRow = True
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        'Calculo da Margem Total do Ano Atual
        If e.Item.FieldName = "pmAT" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAT")
            Dim vlrMargemAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mAT")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vMargemAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemAT))

            If vVendaAT > 0 Then
                e.TotalValue = vMargemAT / vVendaAT * 100
            End If
        End If

        'Calculo da Margem Total do Ano Anterior
        If e.Item.FieldName = "pmAA" Then
            Dim vlrVendaAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAA")
            Dim vlrMargemAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mAA")

            Dim vVendaAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAA))
            Dim vMargemAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemAA))

            If vVendaAA > 0 Then
                e.TotalValue = vMargemAA / vVendaAA * 100
            End If
        End If

        'Calculo da Margem Total - Meta
        If e.Item.FieldName = "pmm" Then
            Dim vlrVendaMeta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mv")
            Dim vlrMargemMeta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mm")

            Dim vVendaMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaMeta))
            Dim vMargemMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemMeta))

            If vVendaMeta > 0 Then
                e.TotalValue = vMargemMeta / vVendaMeta * 100
            End If
        End If

        'Calculo do Crescimento em Reais - R$
        If e.Item.FieldName = "percCresc" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAT")
            Dim vlrVendaAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAA")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vVendaAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAA))

            If vVendaAT > 0 Then
                e.TotalValue = vVendaAT / vVendaAA * 100 - 100
            End If
        End If

        'Calculo do Crescimento em Volume
        If e.Item.FieldName = "percCrescQtde" Then
            Dim vlrQtdeAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("qAT")
            Dim vlrQtdeAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("qAA")

            Dim vQtdeAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrQtdeAT))
            Dim vQtdeAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrQtdeAA))

            If vQtdeAT > 0 Then
                e.TotalValue = vQtdeAT / vQtdeAA * 100 - 100
            End If
        End If

        'Calculo do Crescimento em Lucro
        If e.Item.FieldName = "percCrescLucro" Then
            Dim vlrLucroAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mAT")
            Dim vlrLucroAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mAA")

            Dim vLucroAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrLucroAT))
            Dim vLucroAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrLucroAA))

            If vLucroAT > 0 Then
                e.TotalValue = vLucroAT / vLucroAA * 100 - 100
            End If
        End If


        If e.Item.FieldName = "difPercMargem" Then
            Dim Meta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("pmm")
            Dim Realizado As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("pmAT")

            Dim vMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Meta))
            Dim vRealizado As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Realizado))

            If vRealizado > 0 Then
                e.TotalValue = vRealizado - vMeta
            End If
        End If


        If e.Item.FieldName = "percAtingMetaVlr" Then
            Dim Meta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("mv")
            Dim Realizado As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAT")

            Dim vMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Meta))
            Dim vRealizado As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Realizado))

            If vRealizado > 0 Then
                e.TotalValue = (((vRealizado / vMeta) * 100) - 100)
            End If
        End If

        'Calculo do CAI - Ano Atutal
        If e.Item.FieldName = "percCAI_AT" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAT")
            Dim vlrCaiAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("cAT")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vCaiAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrCaiAT))

            If vVendaAT > 0 Then
                e.TotalValue = vCaiAT / vVendaAT * 100
            End If
        End If

        'Calculo do CAI - Ano Anterior
        If e.Item.FieldName = "percCAI_AA" Then
            Dim vlrVendaAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vAA")
            Dim vlrCaiAA As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("cAA")

            Dim vVendaAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAA))
            Dim vCaiAA As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrCaiAA))

            If vVendaAA > 0 Then
                e.TotalValue = vCaiAA / vVendaAA * 100
            End If
        End If


    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next
        If e.Column.FieldName = "percAtingMetaVlr" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mv"))
            Dim vRealVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            If vRealVenda <> 0 Then
                e.Value = ((vRealVenda / vMetaVenda) * 100) - 100
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difPercMargem" Then
            Dim vMetaPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("pmm"))
            Dim vRealPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("pmAT"))
            If vRealPercMargem <> 0 Then
                e.Value = vRealPercMargem - vMetaPercMargem
            Else
                e.Value = 0
            End If
        End If

        ' Margem - percentual Ano Atual
        If e.Column.FieldName = "pmAT" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAT"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Margem - percentual Ano Anterior
        If e.Column.FieldName = "pmAA" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAA"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAA"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Venda
        If e.Column.FieldName = "percCresc" Then
            Dim VendaAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            Dim VendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAA"))
            If VendaAT <> 0 Then
                e.Value = (((VendaAT / VendaAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Quantidade
        If e.Column.FieldName = "percCrescQtde" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("qAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("qAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Lucro
        If e.Column.FieldName = "percCrescLucro" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Percentual CAI - AT
        If e.Column.FieldName = "percCAI_AT" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            Dim cAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("cAT"))
            If vlrAT <> 0 Then
                e.Value = ((cAT / vlrAT) * 100)
            Else
                e.Value = 0
            End If
        End If

        ' Percentual CAI - AA
        If e.Column.FieldName = "percCAI_AA" Then
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAA"))
            Dim cAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("cAA"))
            If vlrAA <> 0 Then
                e.Value = ((cAA / vlrAA) * 100)
            Else
                e.Value = 0
            End If
        End If
       

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        Dim col = TryCast(e.Column, GridViewDataColumn)
        If col Is Nothing Then
            Return
        End If

        Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim fieldName As String = col.FieldName
        Dim value As Decimal

        If e.IsTotalFooter Then
            Dim item = g.TotalSummary(fieldName)
            If item Is Nothing Then
                Return
            End If
            value = CDec(g.GetTotalSummaryValue(item))
        Else
            Dim item = g.GroupSummary(fieldName)
            If item Is Nothing Then
                Return
            End If

            value = CDec(g.GetGroupSummaryValue(e.VisibleIndex, item))
        End If

        If value < 0 Then
            e.Cell.ForeColor = Drawing.Color.Red
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        If e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "percAtingMetaVlr" Or
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

        If e.DataColumn.FieldName = "pmAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "pmAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vAA" Then
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

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja Then
                Me.chkMostrar_CAI.Visible = False
            Else
                Me.cboFilial.CallFilial = 3
            End If
        End If
    End Sub

End Class
