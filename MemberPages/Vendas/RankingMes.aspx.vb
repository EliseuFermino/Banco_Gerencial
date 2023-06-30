
Imports DevExpress.Web

Partial Class MemberPages_Vendas_RankingMes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oTime As New myDateTimes
    Dim oVem As New VendaEmpresaMes

#Region " Page "



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(82, User.Identity.Name)

            If Month(DateAndTime.Now()) = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2 Or DateAndTime.Now.Day = 3) Then

                Me.cboAno.CallAno = myDateTimes.YearToday() - 1
                Me.cboMes.CallMes = 12

            Else
                Me.cboAno.CallAno = Year(Now())
                Me.cboMes.CallMes = Month(DateAndTime.Now())
            End If

            oFun.Grid_Title(gridRegional, "Ranking por Regional")

            Session("sMES_ANTERIOR") = 2

            'lblError.Visible = True
            'lblError.Text = " Session(sANO): " & Session("sANO") &
            '          " - Session(sMES): " & Session("sMES") &
            '          " - Session(sMES_ANTERIOR): " & Session("sMES_ANTERIOR") &
            '          " - Session(sMATRICULA): " & Session("sMATRICULA")

        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            cboMes.Visible_Ano = False

            If Month(DateAndTime.Now()) = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2 Or DateAndTime.Now.Day = 3) Then

                Me.cboAno.CallAno = myDateTimes.YearToday() - 1
                Me.cboMes.CallMes = 12

            Else
                Me.cboAno.CallAno = Year(Now())
                Me.cboMes.CallMes = Month(DateAndTime.Now())
            End If

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes

            ' Atualiza Grids
            ASPxGridView1.DataBind()
            gridRegional.DataBind()
            gridItensMaisVendidos.DataBind()
            gridItensVolumeMaisVendidos.DataBind()
            gridTotalizador.DataBind()

            BuscaTitulo()
            MudarLegendaAnos()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas Mensal - PGR82"

        End If

    End Sub

#End Region



    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        lblError.Text = " Session(sANO): " & Session("sANO") &
                      " - Session(sMES): " & Session("sMES") &
                      " - Session(sMES_ANTERIOR): " & Session("sMES_ANTERIOR") &
                      " - Session(sMATRICULA): " & Session("sMATRICULA")

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

       
        'gridSecao.DataBind()

        BuscaTitulo()
        MudarLegendaAnos()

    End Sub


#Region " ASPxGridView1 "

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub

    Protected Sub gridTotalizador_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridTotalizador.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "251", "250", "6027", "6037", "799"
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


#End Region

#Region " ASPxGridView_Regional "

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

#End Region

    Protected Sub gridItensMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Protected Sub gridItensVolumeMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensVolumeMaisVendidos.HtmlDataCellPrepared
        ItensNegativeRed(e)
    End Sub

    Sub BuscaTitulo()
        Dim vMes As Byte = Session("sMES")
        If Me.cboAno.CallAno = Session("sANO") And Me.cboMes.CallMes = vMes Then
            If vMes < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            End If
        Else
            If vMes < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & oTime.GetLastDayOfMonth_baseYearMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & oTime.GetLastDayOfMonth_baseYearMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            End If
        End If

    End Sub

    Private Sub ItensNegativeRed(e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Private Sub MudarLegendaAnos()
        ' TOTALIZADOR ----
        Me.gridTotalizador.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        Me.gridTotalizador.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        Me.gridTotalizador.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        Me.gridTotalizador.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        Me.gridTotalizador.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        Me.gridTotalizador.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        Me.gridTotalizador.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        ' LOJAS ----
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

    Private Sub mySession()
        Dim myDiaInicial As Date
        Dim myDiaFinal As Date

        If DateTime.Today.AddDays(-1).Month = cboMes.CallMes Then
            myDiaFinal = DateAndTime.Today.AddDays(-1)
        Else
            myDiaFinal = oTime.GetLastDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno)
        End If

        myDiaInicial = myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno)

        Session("sDATA_INICIAL") = myDiaInicial
        Session("sDATA_FINAL") = myDiaFinal
        Session("sFILIAL") = 99
        Session("sMESMOSDIAS") = 1
    End Sub

End Class
