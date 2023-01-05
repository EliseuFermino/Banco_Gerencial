Imports DevExpress.Web

Partial Class MemberPages_Vendas_RankingMes_OLD
    Inherits System.Web.UI.Page

    Private vlrMeta As Decimal = 0
    Private vlrRea As Decimal = 0
    Private percPart_vlrRea As Decimal = 0
    Private vlrMA As Decimal = 0
    Private vlrAA1 As Decimal = 0
    Private vlrAA2 As Decimal = 0
    Private vlrAA3 As Decimal = 0
    Private percCresc_RealMeta As Decimal = 0
    Private percMA As Decimal = 0
    Private percCresc_RealAA1 As Decimal = 0
    Private percCresc_RealAA3 As Decimal = 0
    Private percCresc_RealAA2 As Decimal = 0
    Private vlrMetaAnual As Decimal = 0
    Private percCresc_MetaAnual As Decimal = 0
    Private percMargMeta As Decimal = 0
    Private percMargReal As Decimal = 0
    Private percMargemDif As Decimal = 0
    Private percMargCheia As Decimal = 0

    Dim oFun As New Funcoes
    Dim oTime As New myDateTimes

#Region " Variaveis Ultima Linha"


    Private Qtde_AA As Decimal = 0
    Private vlrVenda_AA As Decimal = 0

    Private Qtde_AT As Decimal = 0
    Private vlrVenda_AT As Decimal = 0

    Private percMargem_AA As Decimal = 0
    Private percMargem_AT As Decimal = 0
    Private percPart_AA As Decimal = 0
    Private percPart_AT As Decimal = 0

    Private percCresc_Venda As Decimal = 0
    Private percCresc_Qtde As Decimal = 0
    Private percCresc_Lucro As Decimal = 0


    Private percMargemSellout_AT As Decimal = 0
    Private percMargemFinal_AT As Decimal = 0

    Private percMargemSellout_AA As Decimal = 0
    Private percMargemFinal_AA As Decimal = 0


#End Region

    Sub BuscaTitulo()
        If Me.cboAno.CallAno = Year(DateAndTime.Now()) And Me.cboMes.CallMes = Month(DateAndTime.Now()) Then
            If Month(DateAndTime.Now()) < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            End If
        Else
            If Month(DateAndTime.Now()) < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & GetLastDayOfMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & GetLastDayOfMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            End If
        End If

    End Sub

    Public Function GetLastDayOfMonth(ByVal intMonth As Byte, ByVal intYear As Int16) As Date
        GetLastDayOfMonth = DateSerial(intYear, intMonth + 1, 0)
    End Function

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrMeta = 0
            vlrRea = 0
            percPart_vlrRea = 0
            vlrMA = 0
            vlrAA1 = 0
            vlrAA2 = 0
            vlrAA3 = 0
            percCresc_RealMeta = 0
            percMA = 0
            percCresc_RealAA1 = 0
            percCresc_RealAA3 = 0
            percCresc_RealAA2 = 0
            vlrMetaAnual = 0
            percCresc_MetaAnual = 0
            percMargMeta = 0
            percMargReal = 0
            percMargemDif = 0
            percMargCheia = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 253 Then
                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))
                vlrRea += Convert.ToDecimal(e.GetValue("vlrRea"))
                percPart_vlrRea += Convert.ToDecimal(e.GetValue("percPart_vlrRea"))
                vlrMA += Convert.ToDecimal(e.GetValue("vlrMA"))
                vlrAA1 += Convert.ToDecimal(e.GetValue("vlrAA1"))
                vlrAA2 += Convert.ToDecimal(e.GetValue("vlrAA2"))
                vlrAA3 += Convert.ToDecimal(e.GetValue("vlrAA3"))
                percCresc_RealMeta += Convert.ToDecimal(e.GetValue("percCresc_RealMeta"))
                percMA += Convert.ToDecimal(e.GetValue("percMA"))
                percCresc_RealAA1 += Convert.ToDecimal(e.GetValue("percCresc_RealAA1"))
                percCresc_RealAA3 += Convert.ToDecimal(e.GetValue("percCresc_RealAA3"))
                percCresc_RealAA2 += Convert.ToDecimal(e.GetValue("percCresc_RealAA2"))
                vlrMetaAnual += Convert.ToDecimal(e.GetValue("vlrMetaAnual"))
                percCresc_MetaAnual += Convert.ToDecimal(e.GetValue("percCresc_MetaAnual"))
                percMargMeta += Convert.ToDecimal(e.GetValue("percMargMeta"))
                percMargReal += Convert.ToDecimal(e.GetValue("percMargReal"))
                percMargemDif += Convert.ToDecimal(e.GetValue("percMargemDif"))
                percMargCheia += Convert.ToDecimal(e.GetValue("percMargCheia"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRea" Then e.TotalValue = vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_vlrRea" Then e.TotalValue = percPart_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMA" Then e.TotalValue = vlrMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA1" Then e.TotalValue = vlrAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA2" Then e.TotalValue = vlrAA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA3" Then e.TotalValue = vlrAA3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealMeta" Then e.TotalValue = percCresc_RealMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMA" Then e.TotalValue = percMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA1" Then e.TotalValue = percCresc_RealAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA3" Then e.TotalValue = percCresc_RealAA3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA2" Then e.TotalValue = percCresc_RealAA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaAnual" Then e.TotalValue = vlrMetaAnual
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_MetaAnual" Then e.TotalValue = percCresc_MetaAnual
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargMeta" Then e.TotalValue = percMargMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargReal" Then e.TotalValue = percMargReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemDif" Then e.TotalValue = percMargemDif
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargCheia" Then e.TotalValue = percMargCheia
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "251", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
            Case "253"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "254"
                e.Row.BackColor = System.Drawing.Color.LightSteelBlue
                e.Row.Font.Bold = True
            Case "6099"
                e.Row.BackColor = System.Drawing.Color.PeachPuff
                e.Row.Font.Bold = True
            Case "255"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(82, User.Identity.Name)
            Me.chkFixarCabecalho.Checked = True
            Me.cboMes.AutoPostBack = True
            Me.cboAno.AutoPostBack = True

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            If Month(DateAndTime.Now()) = 1 Then
                If Day(DateAndTime.Now()) > 7 Then
                    Me.cboAno.CallAno = Year(Now())
                Else
                    Me.cboAno.CallAno = Year(Now()) - 1
                End If
            Else
                Me.cboAno.CallAno = Year(Now())
            End If


            'cboMes.CallMes = 4

            Me.cboSize.CallSize = 100

            'Session("sANO") = Me.cboAno.CallAno
            'Session("sMES") = Me.cboMes.CallMes
            Session("sMES_ANTERIOR") = 2

            Call MudarLegendaAnos()
            Call BuscaTitulo()
            mySession()

            oFun.Grid_Column_BorderRight(gridSecao, "percCresc_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(gridSecao, "percCresc_Venda", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(gridSecao, "percMargemFinal_AT", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(gridSecao, "percPart_AT", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas Mensal - PGR82"

        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Month(DateAndTime.Now()) = 1 Then
                If DateAndTime.Now().Day > 7 Then
                    Session("sMES") = Me.cboMes.CallMes
                Else
                    Session("sMES") = 12
                End If
            Else
                If DateAndTime.Now().Day > 7 Then
                    Session("sMES") = Me.cboMes.CallMes
                Else
                    Session("sMES") = Me.cboMes.CallMes - 1
                End If
            End If
            cboMes.CallMes = Session("sMES")

            Atualizar()
            oFun.Grid_OrderByColumn(gridSecao, "percCresc_Venda", DevExpress.Data.ColumnSortOrder.Ascending)
        End If
    End Sub

#End Region

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked
        If Me.chkFixarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = True
        Else
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Private Sub Atualizar()
        mySession()
        gridSecao.DataBind()
        Me.ASPxGridView1.DataBind()

        gridRegional.DataBind()
        gridItensMaisVendidos.DataBind()
        gridItensVolumeMaisVendidos.DataBind()
        gridItensMaisVendidosLucro.DataBind()
        gridItemMenosVendidos.DataBind()
        grafParticipacaoCidade.DataBind()
        grafPaticipacaoCidade_Percentual.DataBind()
        grafParticipacaoRegiao.DataBind()
        grafPaticipacaoRegiao_Percentual.DataBind()

        Call BuscaTitulo()
    End Sub


    Private Sub MudarLegendaAnos()
        Me.ASPxGridView1.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        Me.ASPxGridView1.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        Me.ASPxGridView1.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        ' REGIONAL ----
        gridRegional.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        gridRegional.Columns.Item("vlrAA1").Caption = Me.cboAno.CallAno - 1
        gridRegional.Columns.Item("vlrAA2").Caption = Me.cboAno.CallAno - 2
        gridRegional.Columns.Item("vlrAA3").Caption = Me.cboAno.CallAno - 3

        gridRegional.Columns.Item("percCresc_RealAA1").Caption = Me.cboAno.CallAno - 1
        gridRegional.Columns.Item("percCresc_RealAA2").Caption = Me.cboAno.CallAno - 2
        gridRegional.Columns.Item("percCresc_RealAA3").Caption = Me.cboAno.CallAno - 3

    End Sub

    Protected Sub gridItensMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Protected Sub gridItemMenosVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItemMenosVendidos.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Protected Sub gridItensMaisVendidosLucro_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidosLucro.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Protected Sub gridItensVolumeMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensVolumeMaisVendidos.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Private Sub ItensNegativeRed(e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub

    Private Sub mySession()
        Dim myDiaInicial As Date
        Dim myDiaFinal As Date

        If DateTime.Today.AddDays(-1).Month = cboMes.CallMes Then
            myDiaFinal = DateAndTime.Today.AddDays(-1)
        Else
            myDiaFinal = oTime.GetLastDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno)
        End If

        myDiaInicial = oTime.GetFirstDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno)

        Session("sDATA_INICIAL") = myDiaInicial
        Session("sDATA_FINAL") = myDiaFinal
        Session("sFILIAL") = 99
        Session("sMESMOSDIAS") = 1
    End Sub

    Protected Sub gridSecao_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridSecao.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

    Protected Sub gridSecao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridSecao.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")
        oFun.Grid_RedIsNegative(e, "percMargem_AA")

        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")

        oFun.Grid_RedIsNegative(e, "difValorMetaAg23")
        oFun.Grid_RedIsNegative(e, "percAtingMetaAg23")

    End Sub


    Protected Sub gridSecao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridSecao.CustomSummaryCalculate

        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            Qtde_AA = 0
            vlrVenda_AA = 0

            Qtde_AT = 0
            vlrVenda_AT = 0

            percMargem_AA = 0
            percMargem_AT = 0
            percPart_AA = 0
            percPart_AT = 0

            percCresc_Venda = 0
            percCresc_Qtde = 0
            percCresc_Lucro = 0

            percMargemSellout_AT = 0
            percMargemFinal_AT = 0

            percMargemSellout_AA = 0
            percMargemFinal_AA = 0


        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idSecao"))
            If myFilter = 799 Then
                Qtde_AA += Convert.ToDecimal(e.GetValue("Qtde_AA"))
                vlrVenda_AA += Convert.ToDecimal(e.GetValue("vlrVenda_AA"))

                Qtde_AT += Convert.ToDecimal(e.GetValue("Qtde_AT"))
                vlrVenda_AT += Convert.ToDecimal(e.GetValue("vlrVenda_AT"))


                percMargem_AA += Convert.ToDecimal(e.GetValue("percMargem_AA"))
                percMargem_AT += Convert.ToDecimal(e.GetValue("percMargem_AT"))
                percPart_AA += Convert.ToDecimal(e.GetValue("percPart_AA"))
                percPart_AT += Convert.ToDecimal(e.GetValue("percPart_AT"))

                percCresc_Venda += Convert.ToDecimal(e.GetValue("percCresc_Venda"))
                percCresc_Qtde += Convert.ToDecimal(e.GetValue("percCresc_Qtde"))
                percCresc_Lucro += Convert.ToDecimal(e.GetValue("percCresc_Lucro"))

                percMargemSellout_AT += Convert.ToDecimal(e.GetValue("percMargemSellout_AT"))
                percMargemFinal_AT += Convert.ToDecimal(e.GetValue("percMargemFinal_AT"))

                percMargemSellout_AA += Convert.ToDecimal(e.GetValue("percMargemSellout_AA"))
                percMargemFinal_AA += Convert.ToDecimal(e.GetValue("percMargemFinal_AA"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde_AA" Then e.TotalValue = Qtde_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVenda_AA" Then e.TotalValue = vlrVenda_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde_AT" Then e.TotalValue = Qtde_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVenda_AT" Then e.TotalValue = vlrVenda_AT


            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargem_AA" Then e.TotalValue = percMargem_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargem_AT" Then e.TotalValue = percMargem_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_AA" Then e.TotalValue = percPart_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_AT" Then e.TotalValue = percPart_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Venda" Then e.TotalValue = percCresc_Venda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Qtde" Then e.TotalValue = percCresc_Qtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Lucro" Then e.TotalValue = percCresc_Lucro

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellout_AT" Then e.TotalValue = percMargemSellout_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemFinal_AT" Then e.TotalValue = percMargemFinal_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellout_AA" Then e.TotalValue = percMargemSellout_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemFinal_AA" Then e.TotalValue = percMargemFinal_AA

        End If


    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        lblOBS.Text = " Session(sANO): " & Session("sANO") &
                      " Session(sMES): " & Session("sMES")

        ASPxGridView1.DataBind()

        'Call MudarLegendaAnos()
        'Call Atualizar()
    End Sub

    Protected Sub gridRegional_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridRegional.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percCresc_RealMeta", "vlrRea", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percMA", "vlrRea", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percCresc_RealAA1", "vlrRea", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percCresc_RealAA2", "vlrRea", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percCresc_RealAA3", "vlrRea", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percCresc_MetaAnual", "vlrRea", "vlrMetaAnual", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percMargMeta", "vlrMargMeta", "vlrMetaAnual", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percMargReal", "vlrMargReal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridRegional, "percMargemDif", "percMargReal", "percMargMeta", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub gridRegional_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridRegional.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")
    End Sub

    Protected Sub gridRegional_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridRegional.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboSizeRegional_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSizeRegional.SelectedIndexChanged_cboSize
        oFun.Grid_Size(gridRegional, cboSizeRegional.CallSize)
    End Sub

    Protected Sub cboSizeSecao_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSizeSecao.SelectedIndexChanged_cboSize
        oFun.Grid_Size(gridSecao, cboSizeSecao.CallSize)
    End Sub
End Class
