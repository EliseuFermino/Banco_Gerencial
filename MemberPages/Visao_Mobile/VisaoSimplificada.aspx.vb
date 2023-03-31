
Imports DevExpress.Web

Partial Class MemberPages_Visao_Mobile_VisaoSimplificada
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oPro As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            '#Region "Acompanhamento"
            Session("sMERCADOLOGICO") = 1
            Session("sOPCAO") = 1
            Session("sFILIAL") = 99
            Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))

            If DateAndTime.Now.Month = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2) Then
                If CInt(DateAndTime.Now.Hour) > 9 Then
                    Session("sDIA") = Me.cboDia.CallDia.Date
                Else
                    Session("sDIA") = myDateTimes.GetFirstDayOfYear_baseYear(myDateTimes.YearToday()).AddDays(-1)
                End If

            Else
                If CInt(DateAndTime.Now.Hour) > 9 Then
                    'If CInt(DateAndTime.Now.Hour) > 7 Then
                    Session("sDIA") = Me.cboDia.CallDia.Date
                Else
                    Session("sDIA") = Me.cboDia.CallDia.Date.AddDays(-1)
                End If
            End If

            Me.cboDia.CallDia = Session("sDIA")

            Session("sUSUARIO") = LCase(Page.User.Identity.Name)
            '#End Region

            '#Region "Analise Hora"
            Me.cboMes.AutoPostBack = False
            Me.cboAno.AutoPostBack = False
            Me.cboFilial.cboFilial_AutoPostBack = False
            Me.cboFilial.cboFilial_Visible_Legenda = False
            Me.cboSemana.AutoPostBack = False

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Call RotinaInicio()
            Call MudarTitulo()

            '#End Region
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            '#Region "Analise Hora"
            If DateAndTime.Now.Hour >= 10 And DateAndTime.Now.Hour <= 24 Then
                Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek + 1
            Else
                Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek
            End If
            Call Atualizar()
        End If
    End Sub

#Region "Eventos Acompanhamento"

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        gridRankingTotal.DataBind()
        ASPxGridView1.DataBind()

        'Session("sFILIAL_LUCRO_NEGATIVO") = cboFilial_ItensLucroNegativo.CallFilial
        'grid_Top30_Lucro_Negativo.DataBind()
        'gridRankingTotal.DataBind()

    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "percAting", "100", "20", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")
        oFun.Grid_RedIsNegative(e, "percRealMargemClube")
        oFun.Grid_RedIsNegative(e, "vlrRealMargem")

        If e.DataColumn.FieldName = "percRealMargemClube" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "percRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If


    End Sub

    Protected Sub gridRankingTotal_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridRankingTotal.HtmlDataCellPrepared

        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")
        oFun.Grid_RedIsNegative(e, "percRealMargemClube")
        oFun.Grid_RedIsNegative(e, "vlrRealMargem")

        If e.DataColumn.FieldName = "percRealMargemClube" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "percRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "251", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "240", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "253", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "254", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "255", Drawing.Color.LightGreen, True)

        ' ATACAREJO
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6027", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6037", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6099", Drawing.Color.PeachPuff, True)

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Session("sDIA") = Me.cboDia.CallDia
        Session("sFILIAL") = 99

        Me.ASPxGridView1.DataBind()

    End Sub

#End Region

#Region "Analise Hora"

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

    Private Sub RotinaInicio()

        Dim vMes As Byte

        If DateAndTime.Now.Hour >= 10 And DateAndTime.Now.Hour <= 24 Then
            Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek + 1
        Else
            Me.cboSemana.CallSemana = DateAndTime.Now.DayOfWeek
        End If

        If DateAndTime.Now.Day = 1 Then
            vMes = Month(DateAndTime.Now().AddDays(-1))
        Else
            vMes = Month(DateAndTime.Now())
        End If

        Session("sMES") = vMes
        cboMes.CallMes = Session("sMES")

        Session("sUSUARIO") = User.Identity.Name
        Session("sANO") = cboAno.CallAno
        Session("sLOJA_CORP") = 99
        Session("sMESMOSDIAS") = 1
        Session("sUSUARIO") = "Controladoria"

    End Sub

    Private Sub AtualizarAnaliseHora()
        Dim varStatus, varFilial As Byte
        If Me.rndEmpresa.Checked = True Then
            varStatus = 2
        Else
            varStatus = 1
        End If

        If Me.cboFilial.Visible = True Then
            varFilial = Me.cboFilial.CallFilial
            Session("sFILIAL") = varFilial
        Else
            varFilial = 99
            Session("sFILIAL") = 99
        End If

        Session("sMES") = cboMes.CallMes
        Session("sANO") = cboAno.CallAno
        Session("sLOJA_CORP") = 99
        Session("sMESMOSDIAS") = 1
        Session("sUSUARIO") = "Controladoria"
        Session("sDIASEMANA") = Me.cboSemana.CallSemana


        Me.ASPxGridView2.DataBind()
        Me.grid.DataBind()

    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView2.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView2, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")
    End Sub

    Protected Sub rndEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles rndEmpresa.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
            Call AtualizarAnaliseHora()
        End If
    End Sub

    Protected Sub rndFilial_CheckedChanged(sender As Object, e As EventArgs) Handles rndFilial.CheckedChanged
        If Me.rndFilial.Checked = True Then
            Me.cboFilial.Visible = True
            Call AtualizarAnaliseHora()
        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call AtualizarAnaliseHora()
    End Sub

    Private Sub MudarTitulo()
        Me.ASPxGridView2.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView2.Columns("vlr2").Caption = Me.cboAno.CallAno
    End Sub

    Protected Sub ASPxGridView2_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView2.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboPanel2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel2.Callback

        Session("sDIASEMANA") = Me.cboSemana.CallSemana

        Call MudarTitulo()
        Call AtualizarAnaliseHora()

        Me.ASPxGridView1.DataBind()
        Me.grid.DataBind()

    End Sub

#End Region

#Region "Botões Menu"
    Protected Sub btnSair_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/MemberPages/SLV/PrincipalSLV.aspx")
    End Sub

    Protected Sub btnMenu_1_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = True
        divAcomp.Visible = False
        divAcumulado.Visible = False
        divMenu_1.Visible = False
        divMenu_2.Visible = True
        divMenu_3.Visible = True
        divMenu_4.Visible = True
    End Sub

    Protected Sub btnMenu_2_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = True
        divAcumulado.Visible = False
        divMenu_1.Visible = True
        divMenu_2.Visible = False
        divMenu_3.Visible = True
        divMenu_4.Visible = True
    End Sub

    Protected Sub btnMenu_3_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = False
        divAcumulado.Visible = True
        divMenu_1.Visible = True
        divMenu_2.Visible = True
        divMenu_3.Visible = False
        divMenu_4.Visible = True
    End Sub

    Protected Sub btnMenu_4_Click(sender As Object, e As EventArgs)

    End Sub

#End Region

End Class
