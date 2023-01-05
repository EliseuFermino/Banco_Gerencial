Imports DevExpress.Web

Partial Class MemberPages_TeoricoMesLoja_Old
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(63, User.Identity.Name)

            'Me.txtIE.Text = Me.cboGrupo.CallGrupo
            'Session("sGRUPO") = Me.cboGrupo.CallGrupo
            Me.cboFilial.AutoPostBack = True

            Me.cboGrupo.Text = 1

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            If DateAndTime.Month(Now()) = 1 Then
                Me.cboAno.CallAno = DateAndTime.Year(Now()) - 1
                Me.cboMes.CallMes = 12
            Else
                Me.cboMes.CallMes = Month(Now()) - 1
            End If

            Me.optResultados.chkAnoAnterior_Checked = True
            Me.optResultados.chkMetaRevista_Checked = True
            Me.optResultados.chkRealizado_Checked = True
            Me.optResultados.chkDiferencas_Checked = True
            Me.optResultados.chkCrescimento_Checked = True
        End If
    End Sub


    Private Sub CreateSessions()

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        ' Session("sGRUPO") = Me.txtIE.Text
    End Sub

    Private Sub AtualizarGrids()
        Me.dsGrupoMes.DataBind()

        If Me.cboMes.rndMes_Checked = True Then
            Me.cboMes.PreencherMes()
        Else
            Me.cboMes.PreencherPeriodo()
        End If
        Me.gridGrupoMes.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call AtualizarGrids()
    End Sub

    Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call AtualizarGrids()
        Call MudarTitulo()
    End Sub

    Private Sub MudarTitulo()
        Me.gridGrupoMes.SettingsText.Title = "Teórico de " & Me.cboMes.CallMesDesc
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        If Me.cboFilial.CallCorporacao = 3 Then
            Me.cboFilial.CallFilial = 3
        ElseIf Me.cboFilial.CallCorporacao = 199 Then
            Me.cboFilial.CallFilial = 199
        End If

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.dsGrupoMes.DataBind()
    End Sub

    'Protected Sub cboFilial_ListCorporacaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListCorporacaoChanged
    '     Session("sFILIAL") = Me.cboFilial.CallFilial
    '     Me.dsGrupoMes.DataBind()
    '  End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.dsGrupoMes.DataBind()
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
        Dim oBI As New BI
        oBI.BI_Buscar_UltimaLinhaTeorico(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)

        If e.Item.FieldName = "vlrRealAA" Then
            e.TotalValue = Convert.ToDecimal(oBI.vlrReaAA)
        End If

        If e.Item.FieldName = "percRealAA" Then
            e.TotalValue = Convert.ToDecimal(oBI.percReaAA)
        End If

        If e.Item.FieldName = "vlrReal" Then
            e.TotalValue = Convert.ToDecimal(oBI.vlrRea)
        End If

        If e.Item.FieldName = "percReal" Then
            e.TotalValue = Convert.ToDecimal(oBI.percRea)
        End If

        If e.Item.FieldName = "vlrRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.vlrRev)
        End If

        If e.Item.FieldName = "percRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.percRev)
        End If

        If e.Item.FieldName = "vlrOri" Then
            e.TotalValue = Convert.ToDecimal(oBI.vlrOri)
        End If

        If e.Item.FieldName = "percOri" Then
            e.TotalValue = Convert.ToDecimal(oBI.percOri)
        End If

        If e.Item.FieldName = "difVlrRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.vlrDifRev)
        End If

        If e.Item.FieldName = "difPercRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.percDifRev)
        End If

        If e.Item.FieldName = "percCresc" Then
            e.TotalValue = Convert.ToDecimal(oBI.percCresc)
        End If

        If e.Item.FieldName = "descConta" Then
            e.TotalValue = "Resultado Final =>"
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridGrupoMes.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "vlrRealAA" Or
           e.DataColumn.FieldName = "vlrRealMA" Or
           e.DataColumn.FieldName = "percRealAA" Or
           e.DataColumn.FieldName = "percRealMA" Or
           e.DataColumn.FieldName = "vlrReal" Or
           e.DataColumn.FieldName = "percReal" Or
           e.DataColumn.FieldName = "vlrOri" Or
           e.DataColumn.FieldName = "percOri" Or
           e.DataColumn.FieldName = "vlrRev" Or
           e.DataColumn.FieldName = "percRev" Or
           e.DataColumn.FieldName = "difVlrRev" Or
           e.DataColumn.FieldName = "difPercRev" Or
           e.DataColumn.FieldName = "percCresc" Or
           e.DataColumn.FieldName = "percCrescMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc" Or
           e.DataColumn.FieldName = "percCrescMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            Else
                e.Cell.ForeColor = System.Drawing.Color.Blue
            End If
        End If

        If e.DataColumn.FieldName = "idGrupo" Then
            If Convert.ToDouble(e.CellValue) = 12 Then
                e.DataColumn.CellStyle.BorderTop.BorderWidth = 10
            End If
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridGrupoMes.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "1", "4", "47"
                e.Row.BackColor = System.Drawing.Color.Honeydew
                e.Row.Font.Bold = True
            Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "39", "51", "10", "50", "80"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "7", "3", "40", "42", "79", "13"
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

        If e.Item.FieldName = "difVlrRev" Then
            Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "difPercRev" Then
            Me.gridGrupoMes.Columns.Item("difPercRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("difPercRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("difPercRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "descConta" Then
            Me.gridGrupoMes.Columns.Item("descConta").FooterCellStyle.Font.Bold = True
            Me.gridGrupoMes.Columns.Item("descConta").FooterCellStyle.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Resultado Teórico - por Mês e Acumulado"
        End If

    End Sub

    Protected Sub chkVerTudo_CheckedChanged(sender As Object, e As EventArgs) Handles chkVerTudo.CheckedChanged
        If Me.chkVerTudo.Checked = False Then
            gridGrupoMes.Settings.ShowVerticalScrollBar = False
        Else
            gridGrupoMes.Settings.ShowVerticalScrollBar = True
        End If
    End Sub


    Protected Sub optResultados_chkAnoAnterior_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkAnoAnterior_CheckedChanged_RE
        If Me.optResultados.chkAnoAnterior_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_AnoAnterior").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_AnoAnterior").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkCrescimento_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkCrescimento_CheckedChanged_RE
        If Me.optResultados.chkCrescimento_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_Crescimento").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_Crescimento").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkDiferencas_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkDiferencas_CheckedChanged_RE
        If Me.optResultados.chkDiferencas_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_Diferencas").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_Diferencas").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkMesAnterior_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkMesAnterior_CheckedChanged_RE
        If Me.optResultados.chkMesAnterior_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_MesAnterior").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_MesAnterior").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkMetaOriginal_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkMetaOriginal_CheckedChanged_RE
        If Me.optResultados.chkMetaOriginal_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_MetaOriginal").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_MetaOriginal").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkMetaRevista_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkMetaRevista_CheckedChanged_RE
        If Me.optResultados.chkMetaRevista_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_MetaRevista").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_MetaRevista").Visible = False
        End If
    End Sub

    Protected Sub optResultados_chkRealizado_CheckedChanged_RE(sender As Object, e As EventArgs) Handles optResultados.chkRealizado_CheckedChanged_RE
        If Me.optResultados.chkRealizado_Checked = True Then
            Me.gridGrupoMes.Columns.Item("band_Realizado").Visible = True
        Else
            Me.gridGrupoMes.Columns.Item("band_Realizado").Visible = False
        End If
    End Sub

    Protected Sub cboMes_rndMesChanged(sender As Object, e As EventArgs) Handles cboMes.rndMesChanged
        Me.cboMes.CallMes = Month(Now()) - 1
        Session("sMES") = Me.cboMes.CallMes
        Call AtualizarGrids()
        Call MudarTitulo()
    End Sub

    Protected Sub cboMes_rndPeriodoChanged(sender As Object, e As EventArgs) Handles cboMes.rndPeriodoChanged
        Me.cboMes.CallMes = 14
        Session("sMES") = Me.cboMes.CallMes
        Call AtualizarGrids()
        Call MudarTitulo()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()

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
        If e.DataColumn.FieldName = "vlrRealAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percRealAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrReal" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percReal" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "difVlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "difPercRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                theDiv.Visible = False
                ' Me.Button1.Visible = False
                'Me.cboGrupo.Visible = False
                ' Me.btnExcel.Visible = False
            End If

            Call CreateSessions()
            Call MudarTitulo()
            Call AtualizarGrids()

        End If

    End Sub
End Class
