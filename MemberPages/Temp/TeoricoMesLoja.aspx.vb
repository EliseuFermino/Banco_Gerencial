Imports DevExpress.Web

Partial Class MemberPages_TeoricoMesLoja1
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(63, User.Identity.Name)
            Call CreateSessions()
            Me.txtIE.Text = Me.cboGrupo.CallGrupo
            Session("sGRUPO") = Me.cboGrupo.CallGrupo
            If Me.cboFilial.IsLoja = True Then
                Me.Button1.Visible = False
                Me.cboGrupo.Visible = False
                Me.btnExcel.Visible = False
            End If
        End If
     
    End Sub

    Private Sub CreateSessions()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sGRUPO") = Me.txtIE.Text
    End Sub

    Private Sub AtualizarGrids()
        Me.dsGrupoMes.DataBind()
        Me.dsPorGrupo.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call AtualizarGrids()
    End Sub

    Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_chkEmpresaChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.chkEmpresaChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_chkLojasChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.chkLojasChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_chkRegiaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.chkRegiaoChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_chkRegionalChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.chkRegionalChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_chkSuperHiperChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.chkSuperHiperChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call AtualizarGrids()
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

        If e.Item.FieldName = "descConta" Then
            e.TotalValue = "Resultado Final =>"
        End If
    End Sub

    Protected Sub gridGrupoMes_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridGrupoMes.HtmlDataCellPrepared
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

        If e.DataColumn.FieldName = "vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percOri" Then
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
                e.Row.BackColor = System.Drawing.Color.PaleGreen
                e.Row.Font.Bold = True
            Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "39", "51", "10", "50", "80"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "7", "3", "40", "42", "79", "13"
                e.Row.BackColor = System.Drawing.Color.Gainsboro
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
            Me.gridGrupoMes.Columns.Item("Real A.A.").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Real A.A.").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Real A.A.").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percRealAA" Then
            Me.gridGrupoMes.Columns.Item("% Rea AA").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("% Rea AA").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("% Rea AA").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrOri" Then
            Me.gridGrupoMes.Columns.Item("Meta Ori").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Meta Ori").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Meta Ori").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percOri" Then
            Me.gridGrupoMes.Columns.Item("% Ori").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("% Ori").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("% Ori").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrRev" Then
            Me.gridGrupoMes.Columns.Item("Meta Rev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Meta Rev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Meta Rev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percRev" Then
            Me.gridGrupoMes.Columns.Item("% Rev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("% Rev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("% Rev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "vlrReal" Then
            Me.gridGrupoMes.Columns.Item("Realizado").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Realizado").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Realizado").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "percReal" Then
            Me.gridGrupoMes.Columns.Item("% Rea").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("% Rea").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("% Rea").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "difVlrRev" Then
            Me.gridGrupoMes.Columns.Item("Dif. Vlr").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Dif. Vlr").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Dif. Vlr").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "difPercRev" Then
            Me.gridGrupoMes.Columns.Item("Dif. %").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridGrupoMes.Columns.Item("Dif. %").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridGrupoMes.Columns.Item("Dif. %").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "descConta" Then
            Me.gridGrupoMes.Columns.Item("Descrição").FooterCellStyle.Font.Bold = True
        End If
    End Sub

    Protected Sub gridUltimaLinhaTodosMeses_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridUltimaLinhaTodosMeses.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "percRealAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percReal" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "difPercRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub gridResultadoOperacional_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridResultadoOperacional.HtmlDataCellPrepared
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

        If e.DataColumn.FieldName = "vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percOri" Then
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
    End Sub


    Protected Sub cboGrupo_ListGrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo.ListGrupoChanged
        Me.txtIE.Text = Me.cboGrupo.CallGrupo
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
    End Sub

    Protected Sub gridPorGrupo_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridPorGrupo.HtmlDataCellPrepared
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

        If e.DataColumn.FieldName = "vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percOri" Then
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

        If e.DataColumn.FieldName = "idGrupo" Then
            If Convert.ToDouble(e.CellValue) = 12 Then
                e.DataColumn.CellStyle.BorderTop.BorderWidth = 10
            End If
        End If
    End Sub

    Protected Sub gridPorGrupo_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridPorGrupo.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "199"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "198"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "200", "201", "202", "203", "210", "211", "212"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "204", "205", "206", "214"
                e.Row.BackColor = System.Drawing.Color.Gainsboro
            Case "207", "208", "215"
                e.Row.BackColor = System.Drawing.Color.LightGreen
            Case "240"
                e.Row.BackColor = System.Drawing.Color.LightPink
                e.Row.Font.Bold = True
            Case "99"
                e.Row.BackColor = System.Drawing.Color.MediumSpringGreen
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

    Protected Sub btnExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcel.Click
        Me.ExporterExcel1.WriteXlsToResponse()

    End Sub
End Class
