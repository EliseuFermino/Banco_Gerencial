Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVendaPorFornecedor
    Inherits System.Web.UI.Page

    Private vlrVendaAT As Decimal = 0
    Private vlrVendaAA As Decimal = 0
    Private QtdeAT As Decimal = 0
    Private QtdeAA As Decimal = 0
    Private percCrescQtde As Decimal = 0
    Private percCrescLucro As Decimal = 0
    Private percCresc As Decimal = 0
    Private percMargemAA As Decimal = 0
    Private percMargemAT As Decimal = 0
    Private difMargem As Decimal = 0
    Private percMargemSellOutAA As Decimal = 0
    Private percMargemSellOutAT As Decimal = 0
    Private difMargemSellOut As Decimal = 0

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(70, User.Identity.Name)
            Session("sUSUARIO") = User.Identity.Name

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Fornecedor - PGR70"
        End If

    End Sub

#End Region

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrVendaAT = 0
            vlrVendaAA = 0
            QtdeAT = 0
            QtdeAA = 0
            percCrescQtde = 0
            percCrescLucro = 0
            percCresc = 0
            percMargemAT = 0
            percMargemAA = 0
            difMargem = 0
            percMargemSellOutAA = 0
            percMargemSellOutAT = 0
            difMargemSellOut = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                vlrVendaAT += Convert.ToDecimal(e.GetValue("vlrVendaAT"))
                vlrVendaAA += Convert.ToDecimal(e.GetValue("vlrVendaAA"))
                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))

                QtdeAT += Convert.ToDecimal(e.GetValue("QtdeAT"))
                QtdeAA += Convert.ToDecimal(e.GetValue("QtdeAA"))
                percCrescQtde += Convert.ToDecimal(e.GetValue("percCrescQtde"))
                percCrescLucro += Convert.ToDecimal(e.GetValue("percCrescLucro"))

                percMargemAA += Convert.ToDecimal(e.GetValue("percMargemAA"))
                percMargemAT += Convert.ToDecimal(e.GetValue("percMargemAT"))
                difMargem += Convert.ToDecimal(e.GetValue("difMargem"))

                percMargemSellOutAA += Convert.ToDecimal(e.GetValue("percMargemSellOutAA"))
                percMargemSellOutAT += Convert.ToDecimal(e.GetValue("percMargemSellOutAT"))
                difMargemSellOut += Convert.ToDecimal(e.GetValue("difMargemSellOut"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAT" Then e.TotalValue = vlrVendaAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAA" Then e.TotalValue = vlrVendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAT" Then e.TotalValue = QtdeAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAA" Then e.TotalValue = QtdeAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescQtde" Then e.TotalValue = percCrescQtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescLucro" Then e.TotalValue = percCrescLucro

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAA" Then e.TotalValue = percMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAT" Then e.TotalValue = percMargemAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargem" Then e.TotalValue = difMargem

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellOutAA" Then e.TotalValue = percMargemSellOutAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellOutAT" Then e.TotalValue = percMargemSellOutAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargemSellOut" Then e.TotalValue = difMargemSellOut
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percMargemAT")
        oFun.Grid_RedIsNegative(e, "percCrescQtde")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difMargemSellOut")
        oFun.Grid_RedIsNegative(e, "percMargemAA")
        oFun.Grid_RedIsNegative(e, "percCrescLucro")
        oFun.Grid_RedIsNegative(e, "percMargemMA")

        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Dim varOpcao As Byte
        If Me.cboMercadologico.opcaoTotalChecked = True Then varOpcao = 1
        If Me.cboMercadologico.opcaoDeptoChecked = True Then varOpcao = 2
        If Me.cboMercadologico.opcaoSecaoChecked = True Then varOpcao = 3
        If Me.cboMercadologico.opcaoGrupoChecked = True Then varOpcao = 4
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varOpcao = 5

        Session("sUSUARIO") = User.Identity.Name
        Session("sOPCAO") = varOpcao

        Session("sMERCADOLOGICO") = 1
        If Me.cboMercadologico.Visible_Depto = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallDepto
        If Me.cboMercadologico.Visible_Secao = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSecao
        If Me.cboMercadologico.Visible_Grupo = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallGrupo
        If Me.cboMercadologico.Visible_cboSubgrupo = True Then Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSubgrupo

        clData_gerManager.uspFornecedorAnalise("SLV.AtualizarAnaliseVendaFornecedor", Me.txtFornecedor.CallFornecedor, Me.cboPeriodo.CallDiaInicial, Me.cboPeriodo.CallDiaFinal, Session("sUSUARIO"), Me.chkCNPJ_Principal.Value, varOpcao, Session("sMERCADOLOGICO"))

        Me.grid.Visible = True


        'Oculta / Exibe Cabeçalho
        If Me.chkFixarCabecalho.Checked = False Then
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        Else
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        End If

        'Oculta / Exibe Margem
        If Me.chkExibirMargem.Checked = True Then
            Me.grid.Columns("bandMargem").Visible = True
            Me.grid.Columns("bandMargemComSellOut").Visible = True
        Else
            Me.grid.Columns("bandMargem").Visible = False
            Me.grid.Columns("bandMargemComSellOut").Visible = False
        End If

        Call ChangeCaptions()

        Me.grid.DataBind()
    End Sub

    Private Sub ChangeCaptions()
        Dim myAno As Int32
        myAno = Year(Me.cboPeriodo.CallDiaFinal)
        Me.grid.Columns("QtdeAA").Caption = myAno - 1
        Me.grid.Columns("QtdeAT").Caption = myAno

        Me.grid.Columns("vlrVendaAA").Caption = myAno - 1
        Me.grid.Columns("vlrVendaAT").Caption = myAno

        Me.grid.Columns("percMargemAA").Caption = myAno - 1
        Me.grid.Columns("percMargemAT").Caption = myAno

        Me.grid.Columns("percMargemSellOutAA").Caption = myAno - 1
        Me.grid.Columns("percMargemSellOutAT").Caption = myAno

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

End Class
