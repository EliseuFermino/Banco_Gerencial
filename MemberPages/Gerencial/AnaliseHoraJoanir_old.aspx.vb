Imports DevExpress.Web

Partial Class MemberPages_Gerencial_AnaliseHoraJoanir
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub grid_CustomCellStyle(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotCustomCellStyleEventArgs) Handles grid.CustomCellStyle
        If e.ColumnValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value OrElse e.RowValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            Return
        End If
        If Convert.ToInt32(e.Value) < 0.0 Then
            e.CellStyle.ForeColor = System.Drawing.Color.Red
        Else
            e.CellStyle.ForeColor = System.Drawing.Color.Blue
        End If

        If e.RowIndex Mod 2 = 0 Then
            Return
        End If

        If e.ColumnValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value AndAlso e.RowValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            e.CellStyle.BackColor = Drawing.Color.WhiteSmoke
        End If

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(81, User.Identity.Name)

            Me.cboMes.AutoPostBack = True
            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True
            Me.cboFilial.cboFilial_Visible_Legenda = False
            Me.cboSemana.AutoPostBack = True

            Me.cboAno.AnoInicial = 2009
            Me.cboAno.AnoFinal = Year(Now())

            Call RotinaInicio()
            Call MudarTitualo()

        End If
    End Sub

    Private Sub RotinaInicio()
        Session("sUSUARIO") = User.Identity.Name
        Session("sMES") = Month(DateAdd(DateInterval.Day, 0, DateAndTime.Now()))
        Session("sFILIAL") = 99

        If DateAndTime.Now.Hour >= 10 And DateAndTime.Now.Hour <= 24 Then
            Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek + 1
        Else
            Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek
        End If

        Session("sDIASEMANA") = Me.cboSemana.CallSemana
        Me.cboMes.CallMes = Month(Now())
        Me.cboAno.CallAno = Year(Now())
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Dim varStatus, varFilial As Byte
        If Me.rndEmpresa.Checked = True Then
            varStatus = 2
        Else
            varStatus = 1
        End If

        If Me.cboFilial.Visible = True Then
            varFilial = Me.cboFilial.CallFilial
        Else
            varFilial = 99
        End If

        Session("sANO") = cboAno.CallAno
        Session("sFILIAL") = 99

        'clData_gerManager.usp5("Vendas.uspAtualizarAnaliseHora", "@ano", "@mes", "@usuario", "LojaCorp", "idFilial", Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name, varStatus, varFilial)
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call MudarTitualo()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "clrCresc", "vlrAnoAtual", "vlrAnoAnterior", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub gridLojaLoja_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridLojaLoja.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridLojaLoja, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub gridLojaLoja_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridLojaLoja.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")

    End Sub

    Protected Sub gridSecao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridSecao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "clrCresc")
        oFun.Grid_RedIsNegative(e, "vlrDiferenca")

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' cboMes.CallMes = Month(DateAdd(DateInterval.Day, -1, DateAndTime.Now()))

            Dim host As String = HttpContext.Current.Request.Url.Host

            If host = "200.150.68.29" Then
                lnkAcompanhamento.PostBackUrl = "~/MemberPages/Vendas/VendaAcompanhamentoJoanir.aspx"
            Else
                lnkAcompanhamento.PostBackUrl = "~/MemberPages/Vendas/VendaAcompanhamento.aspx"
            End If

            cboMes.CallMes = Month(DateAdd(DateInterval.Day, 0, DateAndTime.Now()))
            Call Atualizar()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise Vendas por Hora"
        End If

    End Sub

    Protected Sub rndEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles rndEmpresa.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
            Call Atualizar()
        End If
    End Sub

    Protected Sub rndFilial_CheckedChanged(sender As Object, e As EventArgs) Handles rndFilial.CheckedChanged
        If Me.rndFilial.Checked = True Then
            Me.cboFilial.Visible = True
            Call Atualizar()
        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub cboSemana_ListSemanaChanged(sender As Object, e As EventArgs) Handles cboSemana.ListSemanaChanged
        Session("sDIASEMANA") = Me.cboSemana.CallSemana
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call RotinaInicio()
        Call Atualizar()
        Me.ASPxGridView1.DataBind()
        Me.grid.DataBind()
        gridSecao.DataBind()
        gridLojaLoja.DataBind()
    End Sub

    Private Sub MudarTitualo()
        Me.ASPxGridView1.Columns("vlrAnoAnterior").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns("vlrAnoAtual").Caption = Me.cboAno.CallAno

        gridLojaLoja.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        gridLojaLoja.Columns("vlr2").Caption = Me.cboAno.CallAno

        gridSecao.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        gridSecao.Columns("vlr2").Caption = Me.cboAno.CallAno
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If DateAndTime.Now.Hour >= 10 And DateAndTime.Now.Hour <= 24 Then
                Me.cboSemana.CallSemanaDesc = DateAndTime.Now.DayOfWeek + 1
            Else
                Me.cboSemana.CallSemanaDesc = DateAndTime.Now.DayOfWeek
            End If
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridLojaLoja_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridLojaLoja.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridSecao_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridSecao.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Total", Drawing.Color.LightGreen, True)

    End Sub

    Protected Sub dsLojaLoja_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles dsLojaLoja.Selecting

    End Sub
End Class
