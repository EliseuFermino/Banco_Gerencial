Imports DevExpress.Web

Partial Class MemberPages_RankingMesComprador_OLD
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

    Dim oFun As New Funcoes

    Sub BuscaTitulo()
        If Me.cboAno.CallAno = Year(DateAndTime.Now()) And Me.cboMes.CallMes = Month(DateAndTime.Now()) Then
            If Month(DateAndTime.Now()) < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
            End If
        Else
            If Month(DateAndTime.Now()) < 10 Then
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado por Comprador - Período de 01/0" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & GetLastDayOfMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            Else
                Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado por Comprador - Período de 01/" & Me.cboMes.CallMes & "/" & Me.cboAno.CallAno & " à " & GetLastDayOfMonth(Me.cboMes.CallMes, Me.cboAno.CallAno) & "."
            End If
        End If

    End Sub

    Public Function GetLastDayOfMonth(ByVal intMonth As Byte, ByVal intYear As Int16) As Date
        GetLastDayOfMonth = DateSerial(intYear, intMonth + 1, 0)
    End Function

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(110, User.Identity.Name)
            Me.chkFixarCabecalho.Checked = True
            Me.cboMes.AutoPostBack = True

            Me.cboMes.CallMes = Month(Now().AddDays(-3))

            Me.cboAno.AnoInicial = 2013
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())


            'Mudar Legendas

            Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

            Me.ASPxGridView1.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

            Me.ASPxGridView1.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
            Me.ASPxGridView1.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
            Me.ASPxGridView1.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

            Me.ASPxGridView1.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
            Me.ASPxGridView1.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
            Me.ASPxGridView1.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

            Me.chkAnoAnterior.Text = "Exibir " & Me.cboAno.CallAno - 2 & " e " & Me.cboAno.CallAno - 3

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes

            Call BuscaTitulo()
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            wucSize.CallSize = 100
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas Mensal por Comprador - PGR110"
        End If

    End Sub



#End Region

    Protected Sub chkAnoAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkAnoAnterior.CheckedChanged

        If Me.chkAnoAnterior.Checked = True Then
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA3").Visible = True
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA2").Visible = True
            Me.ASPxGridView1.Columns.Item("vlrAA3").Visible = True
            Me.ASPxGridView1.Columns.Item("vlrAA2").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA3").Visible = False
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA2").Visible = False
            Me.ASPxGridView1.Columns.Item("vlrAA3").Visible = False
            Me.ASPxGridView1.Columns.Item("vlrAA2").Visible = False
        End If
    End Sub

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked

        If Me.chkFixarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        Else
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        End If
    End Sub

    Private Sub Atualizar()
        Me.ASPxGridView1.DataBind()
        Call BuscaTitulo()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        'Mudar Legendas

        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        Me.ASPxGridView1.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        Me.ASPxGridView1.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        Me.ASPxGridView1.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        Me.chkAnoAnterior.Text = "Exibir " & Me.cboAno.CallAno - 3

        'Detail View
        'gridView.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        'gridView.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        'gridView.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        'gridView.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        'gridView.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        'gridView.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        'gridView.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Protected Sub chkMetaMes_CheckedChanged(sender As Object, e As EventArgs) Handles chkMetaMes.CheckedChanged
        oFun.CheckBoxStatusExibir(chkMetaMes, ASPxGridView1, "bandMetaMes")

    End Sub


    Protected Sub chkLucro_CheckedChanged(sender As Object, e As EventArgs) Handles chkLucro.CheckedChanged
        oFun.CheckBoxStatusExibir(chkLucro, ASPxGridView1, "bandLucro")

    End Sub

#Region " Grid por Comprador"

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealMeta", "vlrRea", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMA", "vlrRea", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA1", "vlrRea", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA2", "vlrRea", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA3", "vlrRea", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargMeta", "vlrMargMeta", "vlrMeta", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargReal", "vlrMargReal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemDif", "percMargReal", "percMargMeta", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemSellOut", "LucroSellOut", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemFinal", "vlrMargemFinal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "difMargemSellOut")
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

        Dim NomeColuna As String = e.GetValue("idComprador")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

#End Region

#Region " Grid por Seção"

    Protected Sub ASPxGridView2_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sCOMPRADOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "difMargemSellOut")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)

        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealMeta", "vlrRea", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMA", "vlrRea", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA1", "vlrRea", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA2", "vlrRea", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA3", "vlrRea", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargMeta", "vlrMargMeta", "vlrMeta", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargReal", "vlrMargReal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemDif", "percMargReal", "percMargMeta", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemSellOut", "LucroSellOut", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemFinal", "vlrMargemFinal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub ASPxGridView2_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView2_Load(sender As Object, e As EventArgs)

        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        'Detail View
        gridView.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        gridView.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        gridView.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        'Mosta / Oculta - Meta do Ano
        If Me.chkMetaMes.Checked = True Then
            gridView.Columns.Item("bandMetaMes").Visible = True
        Else
            gridView.Columns.Item("bandMetaMes").Visible = False
        End If

        'Mostra / Oculta - Lucro do Ano
        If Me.chkLucro.Checked = True Then
            gridView.Columns.Item("bandLucro").Visible = True
        Else
            gridView.Columns.Item("bandLucro").Visible = False
        End If

        'Mostra / Oculta - Venda Ano AA2
        If Me.chkAnoAnterior.Checked = True Then
            gridView.Columns.Item("percCresc_RealAA3").Visible = True
            gridView.Columns.Item("vlrAA3").Visible = True
            gridView.Columns.Item("percCresc_RealAA2").Visible = True
            gridView.Columns.Item("vlrAA2").Visible = True
        Else
            gridView.Columns.Item("percCresc_RealAA3").Visible = False
            gridView.Columns.Item("vlrAA3").Visible = False
            gridView.Columns.Item("percCresc_RealAA2").Visible = False
            gridView.Columns.Item("vlrAA2").Visible = False
        End If

        '  oFun.Grid_Size(gridView, wucSize.CallSize - 5)


    End Sub

#End Region

#Region " Grid por Filial"

    Protected Sub gridFiliais_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSECAO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridFiliais_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "difMargemSellOut")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

    End Sub

    Protected Sub gridFiliais_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealMeta", "vlrRea", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMA", "vlrRea", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA1", "vlrRea", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA2", "vlrRea", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percCresc_RealAA3", "vlrRea", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargMeta", "vlrMargMeta", "vlrMeta", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargReal", "vlrMargReal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemDif", "percMargReal", "percMargMeta", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemSellOut", "LucroSellOut", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridView, "percMargemFinal", "vlrMargemFinal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gridFiliais_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gridFiliais_Load(sender As Object, e As EventArgs)
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        'Detail View
        gridView.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        gridView.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        gridView.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        'Mosta / Oculta - Meta do Ano
        If Me.chkMetaMes.Checked = True Then
            gridView.Columns.Item("bandMetaMes").Visible = True
        Else
            gridView.Columns.Item("bandMetaMes").Visible = False
        End If

        'Mostra / Oculta - Lucro do Ano
        If Me.chkLucro.Checked = True Then
            gridView.Columns.Item("bandLucro").Visible = True
        Else
            gridView.Columns.Item("bandLucro").Visible = False
        End If

        'Mostra / Oculta - Venda Ano AA2
        If Me.chkAnoAnterior.Checked = True Then
            gridView.Columns.Item("percCresc_RealAA3").Visible = True
            gridView.Columns.Item("vlrAA3").Visible = True
            gridView.Columns.Item("percCresc_RealAA2").Visible = True
            gridView.Columns.Item("vlrAA2").Visible = True
        Else
            gridView.Columns.Item("percCresc_RealAA3").Visible = False
            gridView.Columns.Item("vlrAA3").Visible = False
            gridView.Columns.Item("percCresc_RealAA2").Visible = False
            gridView.Columns.Item("vlrAA2").Visible = False
        End If

        ' oFun.Grid_Size(gridView, wucSize.CallSize - 9)

    End Sub

#End Region

    Protected Sub wucSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles wucSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, Me.wucSize.CallSize)

    End Sub
End Class
