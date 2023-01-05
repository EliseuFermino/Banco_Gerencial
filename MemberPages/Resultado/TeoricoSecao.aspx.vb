Imports DevExpress.Web

Partial Class MemberPages_TeoricoSecao
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Private vlrRealAA As Decimal = 0
    Private vlrOri As Decimal = 0
    Private vlrRev As Decimal = 0
    Private vlrReal As Decimal = 0
    Private vlrDif As Decimal = 0

    Private percRealAA As Decimal = 0
    Private percOri As Decimal = 0
    Private percRev As Decimal = 0
    Private percReal As Decimal = 0
    Private percDif As Decimal = 0
    Private percCresc As Decimal = 0
    Private percDifReal As Decimal = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(63, User.Identity.Name)

            Me.cboFilial.AutoPostBack = False
            Me.cboAno.AutoPostBack = False
            cboMesInicial.AutoPostBack = False
            cboMesFinal.AutoPostBack = False


            Me.cboGrupo.Text = 1

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now())

            If DateAndTime.Month(Now()) = 1 Then
                Me.cboAno.CallAno = DateAndTime.Year(Now()) - 1
                Me.cboMesInicial.CallMes = 12
            Else
                Me.cboMesInicial.CallMes = Month(Now()) - 1
            End If

        End If
    End Sub

    Private Sub AtualizarGrids()
        Me.gridGrupoMes.DataBind()
        'Me.Grafico24Meses_UltimaLinha.DataBind()
        'Me.GraficoUltimaLinha_Quadrimestres.DataBind()
        'Me.GraficoUltimaLinha_Acumulado.DataBind()

        
        Me.gridGrupoMes.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call AtualizarGrids()
    End Sub


    Private Sub MudarTitulo()
        Me.gridGrupoMes.SettingsText.Title = "Teórico de " & Me.cboMesInicial.CallMesDesc
    End Sub

    'Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
    '    If Me.cboFilial.CallCorporacao = 3 Then
    '        Me.cboFilial.CallFilial = 3
    '    ElseIf Me.cboFilial.CallCorporacao = 199 Then
    '        Me.cboFilial.CallFilial = 199
    '    End If

    'End Sub


    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial

    End Sub

    Protected Sub gridGrupoMes_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gridGrupoMes.CustomCallback
        ' protected void gv_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        '    ASPxGridView grid = sender as ASPxGridView;
        '    string[] param = e.Parameters.Split('|');
        '    if (param[0] == "changeVisibility")
        '        (grid.Columns["commnadColumn"] as GridViewColumn).Visible = false;
        '}

        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        TryCast(grid.Columns("vlrRev"), GridViewColumn).Visible = False



    End Sub

    Protected Sub gridGrupoMes_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles gridGrupoMes.CustomSummaryCalculate

        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            vlrOri = 0
            vlrRev = 0
            vlrReal = 0
            vlrDif = 0

            percRealAA = 0
            percOri = 0
            percRev = 0
            percReal = 0
            percDif = 0
            percCresc = 0
            percDifReal = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 47 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                vlrOri += Convert.ToDecimal(e.GetValue("vlrOri"))
                vlrRev += Convert.ToDecimal(e.GetValue("vlrRev"))
                vlrReal += Convert.ToDecimal(e.GetValue("vlrReal"))
                vlrDif += Convert.ToDecimal(e.GetValue("difVlrRev"))

                percRealAA += Convert.ToDecimal(e.GetValue("percRealAA"))
                percOri += Convert.ToDecimal(e.GetValue("percOri"))
                percRev += Convert.ToDecimal(e.GetValue("percRev"))
                percReal += Convert.ToDecimal(e.GetValue("percReal"))
                percDif += Convert.ToDecimal(e.GetValue("difPercRev"))
                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))
                percDifReal += Convert.ToDecimal(e.GetValue("percDifReal"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrOri" Then e.TotalValue = vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRev" Then e.TotalValue = vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrReal" Then e.TotalValue = vlrReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVlrRev" Then e.TotalValue = vlrDif

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealAA" Then e.TotalValue = percRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percOri" Then e.TotalValue = percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRev" Then e.TotalValue = percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percReal" Then e.TotalValue = percReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difPercRev" Then e.TotalValue = percDif
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percDifReal" Then e.TotalValue = percDifReal
        End If

        If e.Item.FieldName = "descConta" Then
            e.TotalValue = "Resultado Final =>"
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridGrupoMes.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "vlrRealAA")
        oFun.Grid_RedIsNegative(e, "vlrRealMA")
        oFun.Grid_RedIsNegative(e, "percRealAA")
        oFun.Grid_RedIsNegative(e, "percRealMA")
        oFun.Grid_RedIsNegative(e, "vlrReal")
        oFun.Grid_RedIsNegative(e, "percReal")
        oFun.Grid_RedIsNegative(e, "vlrOri")
        oFun.Grid_RedIsNegative(e, "percOri")
        oFun.Grid_RedIsNegative(e, "vlrRev")
        oFun.Grid_RedIsNegative(e, "percRev")
        oFun.Grid_RedIsNegative(e, "difVlrRev")
        oFun.Grid_RedIsNegative(e, "difPercRev")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percDifReal")
        oFun.Grid_RedIsNegative(e, "percCrescMA")

        oFun.Grid_RedIsNegative_ColorPositive(e, "percCresc", Drawing.Color.Blue)
        oFun.Grid_RedIsNegative_ColorPositive(e, "percCrescMA", Drawing.Color.Blue)

        If e.DataColumn.FieldName = "idGrupo" Then
            If Convert.ToDouble(e.CellValue) = 12 Then
                e.DataColumn.CellStyle.BorderTop.BorderWidth = 10
            End If
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridGrupoMes.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gridGrupoMes_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridGrupoMes.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "1", "4"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
            Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "39", "51", "50", "80"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "7", "3", "45", "47", "10", "13"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "14"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True



        End Select
        'LightYellow
        'Lavender
        'LightGoldenrodYellow
        'LightGreen
        'MediumSpringGreen
        'PaleGreen
        'Gainsboro = Cinza Claro
        'Lavender = Roxo Claro
        'LightPink = Rosa Claro
        'LightSalmon = Laranja
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Resultado Teórico - por Mês, Quadrimestre e Acumulado"
        End If

    End Sub

    Private Sub AtualizarTituloTodasAsLojas()
        Me.ASPxGridView1.SettingsText.Title = "Comparativo Loja a Loja da conta " & Me.cboGrupo.Text
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        Call AtualizarTituloTodasAsLojas()
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("idFilial"))
        If NomeColuna = "199" Then
            e.Row.BackColor = System.Drawing.Color.LightGreen
            e.Row.Font.Bold = True
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "vlrRealAA")
        oFun.Grid_RedIsNegative(e, "percRealAA")
        oFun.Grid_RedIsNegative(e, "vlrReal")
        oFun.Grid_RedIsNegative(e, "percReal")
        oFun.Grid_RedIsNegative(e, "vlrRev")
        oFun.Grid_RedIsNegative(e, "percRev")
        oFun.Grid_RedIsNegative(e, "difVlrRev")
        oFun.Grid_RedIsNegative(e, "difPercRev")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
        oFun.Grid_RedIsNegative(e, "vlrDifAA")

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                theDiv.Visible = False
                Me.cboFilial.Visible_cboCorporacao = False
                ' Me.Button1.Visible = False
                'Me.cboGrupo.Visible = False
                ' Me.btnExcel.Visible = False
                'Else
                '    Me.cboFilial.CallFilial = 3
            End If


            Session("sANO") = Me.cboAno.CallAno
            Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
            Session("sMES_FINAL") = Me.cboMesFinal.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial

            Call MudarTitulo()
            Call AtualizarGrids()

            Me.chkMostrarCabecalho.Checked = True
            gridGrupoMes.Settings.ShowVerticalScrollBar = True
        End If

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = 50

        'Fixar Cabeçalho
        oFun.Grid_FixHeader(chkMostrarCabecalho, gridGrupoMes)

        'Exibe / Oculta Meta Original
        oFun.CheckBoxStatusExibir(chkVerOriginal, gridGrupoMes, "band_MetaOriginal")

        'Exibe / Oculta Meta Revista
        oFun.CheckBoxStatusExibir(chkVerRevista, gridGrupoMes, "band_MetaRevista")

        'Exibe / Oculta Realizado
        oFun.CheckBoxStatusExibir(chkVerRealizado, gridGrupoMes, "band_Realizado")

        'Exibe / Oculta Diferenças
        oFun.CheckBoxStatusExibir(chkVerDiferencas, gridGrupoMes, "band_Diferencas")


        'band_Diferencas
        Me.gridGrupoMes.DataBind()
        Me.Grafico24Meses_UltimaLinha.DataBind()
        Me.GraficoUltimaLinha_Quadrimestres.DataBind()
        Me.GraficoUltimaLinha_Acumulado.DataBind()

    End Sub
End Class
