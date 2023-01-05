Imports DevExpress.Web

Partial Class MemberPages_viewDRE
    Inherits System.Web.UI.Page

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

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(169, User.Identity.Name)

            Me.cboFilial.AutoPostBack = True
            Me.cboAno.AutoPostBack = False

            ' Me.cboGrupo.Text = 1
            cboPosicao.AutoPostBack = False
            cboMes.AutoPostBack_cboMes = False

            Me.cboAno.AnoInicial = 2019
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now()) + 1

            If DateAndTime.Month(Now()) = 1 Then
                Me.cboAno.CallAno = DateAndTime.Year(Now()) - 1
                Me.cboMes.CallMes = 12
            Else
                Me.cboMes.CallMes = Month(Now()) - 1
            End If

            'cboPosicao.CallPosicao = 1

            If Me.cboFilial.IsLoja = True Then
                theDiv.Visible = False
                Me.cboFilial.Visible_cboCorporacao = False
                ' Me.Button1.Visible = False
                'Me.cboGrupo.Visible = False
                ' Me.btnExcel.Visible = False
            Else
                Me.cboFilial.CallFilial = 3
            End If
            Session("sFILIAL") = Me.cboFilial.CallFilial

        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            
            Call mySession()

            Call MudarTitulo()
            Call AtualizarGrids()

            Me.chkMostrarCabecalho.Checked = True
            gridGrupoMes.Settings.ShowVerticalScrollBar = True

            'cboPosicao.CallPosicao = 3

        End If
    End Sub

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sPOSICAO") = cboPosicao.CallPosicao

        lblOBS.Visible = False
        lblOBS.Text = "Ano " & Session("sANO") & " Mes: " & Session("sMES") & " FILIAL:  " & Session("sFILIAL") & " Posicao: " & Session("sPOSICAO")
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            AtualizarGrids()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            oFun.Grid_ColumnTitle(gridGrupoMes, "band_AnoAnterior", "Orçamento " & cboAno.CallAno)
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - DRE Analitica - PGR169"
        End If

    End Sub


#End Region

    Private Sub AtualizarGrids()

        Me.Grafico24Meses_UltimaLinha.DataBind()
        Me.GraficoUltimaLinha_Quadrimestres.DataBind()
        Me.GraficoUltimaLinha_Acumulado.DataBind()
        Me.gridGrupoMes.DataBind()
    End Sub

    'Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
    '    Session("sANO") = Me.cboAno.CallAno
    '    Call AtualizarGrids()
    'End Sub

    'Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged
    '    Session("sMES") = Me.cboMes.CallMes
    '    Call AtualizarGrids()
    '    Call MudarTitulo()
    'End Sub

    Private Sub MudarTitulo()
        Me.gridGrupoMes.SettingsText.Title = "Teórico de " & Me.cboMes.CallMesDesc
    End Sub

    'Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
    '    If Me.cboFilial.CallCorporacao = 3 Then
    '        Me.cboFilial.CallFilial = 3
    '    ElseIf Me.cboFilial.CallCorporacao = 199 Then
    '        Me.cboFilial.CallFilial = 199
    '    End If

    'End Sub

    'Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
    '    Session("sFILIAL") = Me.cboFilial.CallFilial

    'End Sub

    Protected Sub gridGrupoMes_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gridGrupoMes.CustomCallback

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
        End If

        If e.Item.FieldName = "descConta" Then
            e.TotalValue = "Resultado Final =>"
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridGrupoMes.HtmlDataCellPrepared
       
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
        oFun.Grid_RedIsNegative(e, "percCresc")
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
            Case "1", "47"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
            Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "39", "51", "10", "50", "80", "12", "95"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "7", "3", "40", "42", "79", "13"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "14"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "53", "4"
                e.Row.BackColor = System.Drawing.Color.LightPink




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

    Protected Sub gridGrupoMes_SummaryDisplayText(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewSummaryDisplayTextEventArgs) Handles gridGrupoMes.SummaryDisplayText
        If e.Item.FieldName = "vlrRealAA" Then
            Me.gridGrupoMes.Columns.Item("vlrRealAA").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("vlrRealAA").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("vlrRealAA").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percRealAA" Then
            Me.gridGrupoMes.Columns.Item("percRealAA").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("percRealAA").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("percRealAA").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrOri" Then
            Me.gridGrupoMes.Columns.Item("vlrOri").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percOri" Then
            Me.gridGrupoMes.Columns.Item("percOri").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("percOri").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("percOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrRev" Then
            Me.gridGrupoMes.Columns.Item("vlrRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percRev" Then
            Me.gridGrupoMes.Columns.Item("percRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("percRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("percRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrReal" Then
            Me.gridGrupoMes.Columns.Item("vlrReal").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("vlrReal").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("vlrReal").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percReal" Then
            Me.gridGrupoMes.Columns.Item("percReal").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("percReal").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("percReal").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percCresc" Then
            Me.gridGrupoMes.Columns.Item("percCresc").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "descConta" Then
            Me.gridGrupoMes.Columns.Item("descConta").FooterCellStyle.Font.Bold = True
            Me.gridGrupoMes.Columns.Item("descConta").FooterCellStyle.ForeColor = Drawing.Color.Blue
        End If
    End Sub



    Protected Sub cboMes_rndMesChanged(sender As Object, e As EventArgs) Handles cboMes.rndMesChanged
        Me.cboMes.CallMes = Month(Now()) - 1
        Call MudarTitulo()
    End Sub

    Protected Sub cboMes_rndPeriodoChanged(sender As Object, e As EventArgs) Handles cboMes.rndPeriodoChanged

        Call MudarTitulo()
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



    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        mySession()

        oFun.Grid_ColumnTitle(gridGrupoMes, "band_AnoAnterior", "Orçamento " & cboAno.CallAno)

        If Me.chkMostrarCabecalho.Checked = False Then
            gridGrupoMes.Settings.ShowVerticalScrollBar = False
        Else
            gridGrupoMes.Settings.ShowVerticalScrollBar = True
        End If

        'Exibe / Oculta Meta Original
        If Me.chkVerOriginal.Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_MetaOriginal").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_MetaOriginal").Visible = False
        End If

        'Exibe / Oculta Meta Revista
        If Me.chkVerRevista.Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_MetaRevista").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_MetaRevista").Visible = False
        End If

        'Exibe / Oculta Realizado
        If Me.chkVerRealizado.Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_Realizado").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_Realizado").Visible = False
        End If

        Me.gridGrupoMes.DataBind()
        Me.Grafico24Meses_UltimaLinha.DataBind()
        Me.GraficoUltimaLinha_Quadrimestres.DataBind()
        Me.GraficoUltimaLinha_Acumulado.DataBind()

    End Sub


End Class
