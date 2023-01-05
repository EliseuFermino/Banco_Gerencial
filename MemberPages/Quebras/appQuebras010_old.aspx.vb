Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_appQuebras010_old
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect

    Private Sub CreateSession()

        If Me.cboMercadologico.opcaoTotalChecked = True Then Session("sOPCAO") = 1
        If Me.cboMercadologico.opcaoDeptoChecked = True Then Session("sOPCAO") = 2
        If Me.cboMercadologico.opcaoSecaoChecked = True Then Session("sOPCAO") = 3
        If Me.cboMercadologico.opcaoGrupoChecked = True Then Session("sOPCAO") = 4
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then Session("sOPCAO") = 5

        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal

    End Sub

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        Dim oVem As New VendaEmpresaMes
        Call CreateSession()


        If Me.cboMercadologico.Visible_Depto = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallDepto

        If Me.cboMercadologico.Visible_Secao = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSecao

        If Me.cboMercadologico.Visible_Grupo = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallGrupo

        If Me.cboMercadologico.Visible_cboSubgrupo = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSubgrupo



        'Mostrar Sell Out
        If Me.chkMostrar_SellOut.Checked = True Then
            Me.grid.Columns.Item("bandSellOut").Visible = True
        Else
            Me.grid.Columns.Item("bandSellOut").Visible = False
        End If

        'Mostrar Margem Final
        If Me.chkMostrar_MargemFinal.Checked = True Then
            Me.grid.Columns.Item("bandMargemFinal").Visible = True
        Else
            Me.grid.Columns.Item("bandMargemFinal").Visible = False
        End If

        'Mostrar Sobras - Agenda 51
        If Me.chkMostrar_Sobras.Checked = True Then
            Me.grid.Columns.Item("bandAgenda51").Visible = True
        Else
            Me.grid.Columns.Item("bandAgenda51").Visible = False
        End If

        'Mostrar Sobras - Agenda 52
        If Me.chkMostrar_Faltas.Checked = True Then
            Me.grid.Columns.Item("bandAgenda52").Visible = True
        Else
            Me.grid.Columns.Item("bandAgenda52").Visible = False
        End If


        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            'Me.grid.DataSourceID = "dsTotal"
            Me.grid.Columns.Item("lista").Caption = "Total"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(108, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Total - Exibe todos os departamento
            'Me.grid.DataSourceID = "dsDepto"
            Me.grid.Columns.Item("lista").Caption = "Departamento"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(107, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            ' Me.grid.DataSourceID = "dsSecao"
            Me.grid.Columns.Item("lista").Caption = "Seção"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(106, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            ' Me.grid.DataSourceID = "dsGrupo"
            Me.grid.Columns.Item("lista").Caption = "Grupo"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(105, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            '  Me.grid.DataSourceID = "dsSubgrupo"
            Me.grid.Columns.Item("lista").Caption = "Familia"

            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(104, User.Identity.Name)
        End If

        Me.grid.Visible = True
        Me.grid.DataBind()
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de quebra Loja a Loja"

    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback

        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            ' Me.grid.DataSourceID = "dsTotal"
            Me.grid.Columns.Item("lista").Caption = "Total"
            Me.grid.Settings.ShowFilterRow = False
        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Total - Exibe todos os departamento
            ' Me.grid.DataSourceID = "dsDepto"
            Me.grid.Columns.Item("lista").Caption = "Departamento"
            Me.grid.Settings.ShowFilterRow = False
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            ' Me.grid.DataSourceID = "dsSecao"
            Me.grid.Columns.Item("lista").Caption = "Seção"
            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            '  Me.grid.DataSourceID = "dsGrupo"
            Me.grid.Columns.Item("lista").Caption = "Grupo"
            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            '  Me.grid.DataSourceID = "dsSubgrupo"
            Me.grid.Columns.Item("lista").Caption = "Familia"

            Me.grid.Settings.ShowFilterRow = False

        End If

        grid.DataBind()
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0
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
        On Error Resume Next

        If e.DataColumn.FieldName = "p23" Or
            e.DataColumn.FieldName = "pD" Or
            e.DataColumn.FieldName = "qD" Or
            e.DataColumn.FieldName = "vD" Or
            e.DataColumn.FieldName = "qQ" Or
            e.DataColumn.FieldName = "vQ" Or
            e.DataColumn.FieldName = "v23" Or
            e.DataColumn.FieldName = "v52" Or
            e.DataColumn.FieldName = "q23" Or
            e.DataColumn.FieldName = "q52" Or
            e.DataColumn.FieldName = "pQ" Or
            e.DataColumn.FieldName = "p52" Or
            e.DataColumn.FieldName = "p51" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        'Band Perdas
        If e.DataColumn.FieldName = "CFTV" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Antena" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "PPP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Call CreateSession()
            Session("sOPCAO") = 1
            Me.grid.Visible = True
            Me.grid.DataBind()
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("lista"))
        If NomeColuna = "Empresa Total" Then
            e.Row.BackColor = System.Drawing.Color.LightGreen
            e.Row.Font.Bold = True
        End If

    End Sub


End Class
