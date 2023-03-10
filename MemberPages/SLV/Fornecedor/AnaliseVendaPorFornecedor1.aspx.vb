
#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Drawing

#End Region

Partial Class MemberPages_SLV_Fornecedor_AnaliseVendaPorFornecedor1
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

    Private vlrImpostosAT As Decimal = 0
    Private vlrImpostosAA As Decimal = 0
 
    Private percCrescCliente As Decimal = 0
    Private difCliente As Decimal = 0
    Private vlrLucroAT As Decimal = 0
    Private vlrLucroAA As Decimal = 0
    Private difVlrLucro As Decimal = 0
    Private percCrescVlrLucro As Decimal = 0

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    'Define Enum Mercadologico
    Private Enum Mercadologicos As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum


#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback



        Dim varOpcao As Byte
        If Mercadologico.Checked_rdTotal = True Then varOpcao = 1
        If Mercadologico.Checked_rdDepartamento = True Then varOpcao = 2
        If Mercadologico.Checked_rdSecao = True Then varOpcao = 3
        If Mercadologico.Checked_rdGrupo = True Then varOpcao = 4
        If Mercadologico.Checked_rdSubgrupo = True Then varOpcao = 5

        CallSession(varOpcao)   'Chamar Sessões

        'lblEliseu.Text = "sUSUARIO: " & Session("sUSUARIO") & _
        '         ".<br /> sMERCADOLOGICO: " & Session("sMERCADOLOGICO") & _
        '         ".<br /> sNOME_MERCADOLOGICO: " & Session("sNOME_MERCADOLOGICO") &
        '         ".<br /> sDIA_INICIAL: " & Session("sDIA_INICIAL") &
        '         ".<br /> sDIA_FINAL: " & Session("sDIA_FINAL") &
        '         ".<br /> sTIPO: " & Session("sTIPO") &
        '         ".<br /> sFORNECEDOR: " & Session("sFORNECEDOR") &
        '         ".<br /> sBASE_CNPJ: " & Session("sBASE_CNPJ")


        Me.grid.Visible = True
        Me.grid.DataBind()

        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")   'Exibir Ano Atual
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")   'Exibir CAI - Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")   'Exibir CAI - Ano Atual

        'Exibir Sell - Out
        'SellOut_ExibirOcultar()

        If varOpcao = 1 Then AtualizarBackground("Análise por Filial - Total", 215)
        If varOpcao = 2 Then AtualizarBackground("Análise por Filial - Departamento: " & Session("sNOME_MERCADOLOGICO"), 216)
        If varOpcao = 3 Then AtualizarBackground("Análise por Filial - Seção: " & Session("sNOME_MERCADOLOGICO"), 217)
        If varOpcao = 4 Then AtualizarBackground("Análise por Filial - Grupo: " & Session("sNOME_MERCADOLOGICO"), 218)
        If varOpcao = 5 Then AtualizarBackground("Análise por Filial - Familia: " & Session("sNOME_MERCADOLOGICO"), 219)
        'If varOpcao = 6 Then AtualizarBackground("Ranking por Item: " & Session("sNOME_MERCADOLOGICO"), 220) 'por Item

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        ChangeCaptions()

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0


    End Sub


#End Region

#Region " Functions"

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession(ByVal iOpcao As Byte)
        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sTIPO") = iOpcao
        Session("sFORNECEDOR") = txtFornecedor.CallFornecedor
        Session("sBASE_CNPJ") = chkCNPJ_Principal.CheckState

        'If Me.chkMostrar_MesmosDias.Checked = True Then
        '    Session("sMESMOSDIAS") = 2  'Mesmos Dias
        'Else
        '    Session("sMESMOSDIAS") = 1  'Normal
        'End If

    End Sub

#End Region

#Region " grid"

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

            vlrImpostosAT = 0
            vlrImpostosAA = 0
          
            percCrescCliente = 0
            difCliente = 0
            vlrLucroAT = 0
            vlrLucroAA = 0
            difVlrLucro = 0
            percCrescVlrLucro = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                vlrVendaAT += Convert.ToDecimal(e.GetValue("vlrVendaAT"))
                vlrVendaAA += Convert.ToDecimal(e.GetValue("vlrVendaAA"))
                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))

                vlrImpostosAT += Convert.ToDecimal(e.GetValue("vlrImpostosAT"))
                vlrImpostosAA += Convert.ToDecimal(e.GetValue("vlrImpostosAA"))

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

                
                percCrescCliente += Convert.ToDecimal(e.GetValue("percCrescCliente"))
                difCliente += Convert.ToDecimal(e.GetValue("difCliente"))

                vlrLucroAA += Convert.ToDecimal(e.GetValue("vlrLucroAA"))
                vlrLucroAT += Convert.ToDecimal(e.GetValue("vlrLucroAT"))
                percCrescVlrLucro += Convert.ToDecimal(e.GetValue("percCrescVlrLucro"))
                difVlrLucro += Convert.ToDecimal(e.GetValue("difVlrLucro"))

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

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrImpostosAT" Then e.TotalValue = vlrImpostosAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrImpostosAA" Then e.TotalValue = vlrImpostosAA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAA" Then e.TotalValue = percMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAT" Then e.TotalValue = percMargemAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargem" Then e.TotalValue = difMargem

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellOutAA" Then e.TotalValue = percMargemSellOutAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellOutAT" Then e.TotalValue = percMargemSellOutAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargemSellOut" Then e.TotalValue = difMargemSellOut

          
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescCliente" Then e.TotalValue = percCrescCliente
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difCliente" Then e.TotalValue = difCliente

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroAA" Then e.TotalValue = vlrLucroAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroAT" Then e.TotalValue = vlrLucroAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescVlrLucro" Then e.TotalValue = percCrescVlrLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVlrLucro" Then e.TotalValue = difVlrLucro

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
        oFun.Grid_RedIsNegative(e, "percCrescCliente")
        oFun.Grid_RedIsNegative(e, "percCrescVlrLucro")
        oFun.Grid_RedIsNegative(e, "difVlrLucro")
        oFun.Grid_RedIsNegative(e, "difCliente")

        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.LawnGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)
            Mercadologico.Checked_rdTotal = True
            Session("sTIPO") = 1   'Total
            Session("sMERCADOLOGICO") = 1   'Total
            CallSession(1)   'Chamar Sessões

            txtFornecedor.CNPJ_Principal_Visible = False

            ChangeCaptions()
            AtualizarBackground("Análise por Filial - Total", 215)
            cboSize.CallSize = 100

            oFun.Grid_Column_BorderRight(grid, "difMargemSellOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescVlrLucro", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difVlrLucro", Drawing.Color.Gray, BorderStyle.Dashed, 1)



            Me.grid.DataBind()
            oVem.AtualizarEstatisticaPrograma(70, User.Identity.Name)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Fornecedor - PGR70"
        End If
    End Sub

    Private Sub ChangeCaptions()
        Dim myAno As Int32
        myAno = Year(Me.cboDia.CallDiaFinal)

        oFun.Grid_ColumnTitle(grid, "QtdeAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "QtdeAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrVendaAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrVendaAT", myAno)

        oFun.Grid_ColumnTitle(grid, "percMargemAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemAT", myAno)

        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrLucroAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrLucroAT", myAno)



    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub btnExcel_ExporterRenderBrick(sender As Object, e As EventArgs) Handles btnExcel.ExporterRenderBrick
        Dim myAno As Int32
        myAno = Year(Me.cboDia.CallDiaFinal)

        oFun.Exporter_ColumnTitle(e, "QtdeAA", myAno - 1)
        oFun.Exporter_ColumnTitle(e, "QtdeAT", myAno)

        oFun.Exporter_ColumnTitle(e, "vlrVendaAA", myAno - 1)
        oFun.Exporter_ColumnTitle(e, "vlrVendaAT", myAno)

        oFun.Exporter_ColumnTitle(e, "percMargemAA", myAno - 1)
        oFun.Exporter_ColumnTitle(e, "percMargemAT", myAno)

        oFun.Exporter_ColumnTitle(e, "percMargemSellOutAA", myAno - 1)
        oFun.Exporter_ColumnTitle(e, "percMargemSellOutAT", myAno)

        oFun.Exporter_ColumnTitle(e, "vlrLucroAA", myAno - 1)
        oFun.Exporter_ColumnTitle(e, "vlrLucroAT", myAno)



        'Formatar Dados
        oFun.Exporter_RedIsNegative(e, "percCrescQtde")
        oFun.Exporter_RedIsNegative(e, "percCresc")
        'oFun.Exporter_RedIsNegative(e, "percCrescLucro")

   

    End Sub


End Class
