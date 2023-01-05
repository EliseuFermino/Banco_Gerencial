Imports DevExpress.Web

Partial Class MemberPages_Despesas_DashBoard_DespesaLoja_CentroCusto
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Private vlrRealAA As Decimal = 0
    Private percRealMA As Decimal = 0
    Private percRealAA As Decimal = 0
    Private vlrRealMA As Decimal = 0
    Private vlrReal As Decimal = 0
    Private percReal As Decimal = 0
    Private vlrRev As Decimal = 0
    Private percRev As Decimal = 0
    Private difVlrRev As Decimal = 0
    Private difPercRev As Decimal = 0

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Call OcultarSubgrupo()


            Me.cboAno.AutoPostBack = True
            Me.cboFilialNew.AutoPostBack = True

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboMes.CallMes = Month(DateAndTime.Now()) - 1
            Me.cboGrupo.Text = 15   'Pessoal

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
            Session("sFILIAL") = Me.cboFilialNew.CallFilial
            Session("sTIPO") = 1
            Session("sGRUPO") = 15

            If Me.cboFilialNew.IsLoja = True Then Me.btnShowButton.Visible = False

        End If

        If PopupControl.IsCallback Then
            'Intentionally pauses server-side processing, 
            'to demonstrate the Loading Panel functionality.
            Me.ASPxGridView1.DataBind()
            Threading.Thread.Sleep(500)
        End If
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        Session("sGRUPO") = Me.cboGrupo.Value
        Me.chkSubgrupo.Enabled = True
        If Me.cboSubgrupo.Visible = True Then Me.cboSubgrupo.Text = oVem.Buscar_IDSubGrupo(Me.cboGrupo.Value)
    End Sub

    Private Sub OcultarSubgrupo()
        Me.chkSubgrupo.Checked = False
        Me.cboSubgrupo.Visible = False
    End Sub

    Protected Sub chkSubgrupo_CheckedChanged(sender As Object, e As EventArgs) Handles chkSubgrupo.CheckedChanged
        If Me.chkSubgrupo.Checked = True Then
            Me.cboSubgrupo.Visible = True
            Me.cboSubgrupo.DataBind()
            Me.cboSubgrupo.Text = oVem.Buscar_IDSubGrupo(Me.cboGrupo.Value)
            Me.cboGrupo.Enabled = False
            Session("sGRUPO") = Me.cboSubgrupo.Value
            Session("sTIPO") = 2
        Else
            Me.cboSubgrupo.Visible = False
            Me.cboGrupo.Enabled = True
            Session("sGRUPO") = Me.cboGrupo.Value
            Session("sTIPO") = 1
        End If

    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        Session("sGRUPO") = Me.cboSubgrupo.Value
        Me.ASPxGridView1.DataBind()
    End Sub


    Protected Sub gridGrupoMes_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles gridGrupoMes.CustomSummaryCalculate

        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            percRealMA = 0
            percRealAA = 0
            vlrRealMA = 0
            vlrReal = 0
            percReal = 0
            vlrRev = 0
            percRev = 0
            difVlrRev = 0
            difPercRev = 0
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 14 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                percRealMA += Convert.ToDecimal(e.GetValue("percRealMA"))
                percRealAA += Convert.ToDecimal(e.GetValue("percRealAA"))
                vlrRealMA += Convert.ToDecimal(e.GetValue("vlrRealMA"))
                vlrReal += Convert.ToDecimal(e.GetValue("vlrReal"))
                percReal += Convert.ToDecimal(e.GetValue("percReal"))
                vlrRev += Convert.ToDecimal(e.GetValue("vlrRev"))
                percRev += Convert.ToDecimal(e.GetValue("percRev"))
                difVlrRev += Convert.ToDecimal(e.GetValue("difVlrRev"))
                difPercRev += Convert.ToDecimal(e.GetValue("difPercRev"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMA" Then e.TotalValue = percRealMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealAA" Then e.TotalValue = percRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMA" Then e.TotalValue = vlrRealMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrReal" Then e.TotalValue = vlrReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percReal" Then e.TotalValue = percReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRev" Then e.TotalValue = vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRev" Then e.TotalValue = percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVlrRev" Then e.TotalValue = difVlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difPercRev" Then e.TotalValue = difPercRev
        End If

        If e.IsTotalSummary Then
            'Percentual de Crescimento sobre ano anterior AA
            If summary.FieldName = "percCresc" Then
                Dim vlrReal As Decimal = Convert.ToDecimal(gridGrupoMes.GetTotalSummaryValue(gridGrupoMes.TotalSummary("vlrReal")))
                Dim vlrRealAA As Decimal = Convert.ToDecimal(gridGrupoMes.GetTotalSummaryValue(gridGrupoMes.TotalSummary("vlrRealAA")))
                e.TotalValue = (((vlrReal / vlrRealAA) * 100) - 100)
            End If

            'Percentual de Crescimento sobre ano anterior MA
            If summary.FieldName = "percCrescMA" Then
                Dim vlrReal As Decimal = Convert.ToDecimal(gridGrupoMes.GetTotalSummaryValue(gridGrupoMes.TotalSummary("vlrReal")))
                Dim vlrRealMA As Decimal = Convert.ToDecimal(gridGrupoMes.GetTotalSummaryValue(gridGrupoMes.TotalSummary("vlrRealMA")))
                e.TotalValue = (((vlrReal / vlrRealMA) * 100) - 100)
            End If
        End If

        'Ano Anterior
        'If e.Item.FieldName = "vlrRealAA" Then e.TotalValue = dr("vlrRealAA")
        'If e.Item.FieldName = "percRealAA" Then
        '    If dr("percRealAA") = Nothing Then
        '        e.TotalValue = 0
        '    Else
        '        e.TotalValue = dr("percRealAA")
        '    End If
        'End If

    End Sub

    Protected Sub gridGrupoMes_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridGrupoMes.HtmlDataCellPrepared
        On Error Resume Next

        Dim NomeColuna As String = Convert.ToString(e.GetValue("idGrupo"))

        If NomeColuna = "1" Then
            If e.DataColumn.FieldName = "difPercRev" Or
             e.DataColumn.FieldName = "difVlrRev" Then
                If Convert.ToDecimal(e.CellValue) >= 0.0 Then
                    e.Cell.BackColor = System.Drawing.Color.LimeGreen
                Else
                    e.Cell.BackColor = System.Drawing.Color.Tomato
                End If
            End If
        Else
            If e.DataColumn.FieldName = "difPercRev" Or
                e.DataColumn.FieldName = "difVlrRev" Then
                If Convert.ToDecimal(e.CellValue) >= 0.0 Then
                    e.Cell.BackColor = System.Drawing.Color.LimeGreen
                Else
                    e.Cell.BackColor = System.Drawing.Color.Tomato
                End If
            End If
        End If



        If e.DataColumn.FieldName = "vlrRealAA" Or
           e.DataColumn.FieldName = "percRealAA" Or
           e.DataColumn.FieldName = "vlrRealMA" Or
           e.DataColumn.FieldName = "percRealMA" Or
           e.DataColumn.FieldName = "vlrReal" Or
           e.DataColumn.FieldName = "percReal" Or
           e.DataColumn.FieldName = "vlrRev" Or
           e.DataColumn.FieldName = "percRev" Or
            e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "percCrescMA" Then
            If Convert.ToDecimal(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If


        If e.DataColumn.FieldName = "idGrupo" Then
            If Convert.ToDouble(e.CellValue) = 12 Then
                e.DataColumn.CellStyle.BorderTop.BorderWidth = 10
            End If
        End If

        'If e.DataColumn.FieldName = "idGrupo" Then
        '    If e.CellValue = 1 Then
        '        If e.DataColumn.FieldName = "difVlrRev" Then
        '            If Convert.ToDecimal(e.CellValue) > 0 Then
        '                e.Cell.ForeColor = System.Drawing.Color.Green
        '            Else
        '                e.Cell.ForeColor = System.Drawing.Color.Red
        '            End If
        '        End If
        '    End If
        'End If

    End Sub

    Protected Sub gridGrupoMes_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles gridGrupoMes.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("descConta"))

        If NomeColuna = "Venda Bruta" Then
            e.Row.BackColor = System.Drawing.Color.LightGreen
            e.Row.Font.Bold = True
            e.Row.BorderWidth = 2
        End If

        If NomeColuna = "Total das Despesas" Then
            e.Row.BackColor = System.Drawing.Color.Yellow
            e.Row.Font.Bold = True
            e.Row.BorderWidth = 2
        End If

    End Sub

    Protected Sub gridGrupoMes_SummaryDisplayText(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewSummaryDisplayTextEventArgs) Handles gridGrupoMes.SummaryDisplayText
        If e.IsTotalSummary Then
            If e.Item.FieldName = "vlrRealAA" Then
                Me.gridGrupoMes.Columns.Item("vlrRealAA").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("vlrRealAA").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "percRealAA" Then
                Me.gridGrupoMes.Columns.Item("percRealAA").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("percRealAA").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "vlrRev" Then
                Me.gridGrupoMes.Columns.Item("vlrRev").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "percRev" Then
                Me.gridGrupoMes.Columns.Item("percRev").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("percRev").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "vlrReal" Then
                Me.gridGrupoMes.Columns.Item("vlrReal").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("vlrReal").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "percReal" Then
                Me.gridGrupoMes.Columns.Item("percReal").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("percReal").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "difVlrRev" Then
                Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) > 0.0 Then
                    Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.BackColor = Drawing.Color.LimeGreen
                    Me.gridGrupoMes.Columns.Item("difPercRev").FooterCellStyle.BackColor = Drawing.Color.LimeGreen
                Else
                    Me.gridGrupoMes.Columns.Item("difVlrRev").FooterCellStyle.BackColor = Drawing.Color.Tomato
                    Me.gridGrupoMes.Columns.Item("difPercRev").FooterCellStyle.BackColor = Drawing.Color.Tomato
                End If
            End If

            If e.Item.FieldName = "percCresc" Then
                Me.gridGrupoMes.Columns.Item("percCresc").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

            If e.Item.FieldName = "percCrescMA" Then
                Me.gridGrupoMes.Columns.Item("percCrescMA").FooterCellStyle.Font.Bold = True
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridGrupoMes.Columns.Item("percCrescMA").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If

        End If
    End Sub

    Protected Sub ASPxGridView3_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSUBGRUPO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridSub_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sGRUPO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridSub_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next

        If e.DataColumn.FieldName = "vlrRealAA" Or
           e.DataColumn.FieldName = "percRealAA" Or
           e.DataColumn.FieldName = "vlrRealMA" Or
           e.DataColumn.FieldName = "percRealMA" Or
           e.DataColumn.FieldName = "vlrReal" Or
           e.DataColumn.FieldName = "percReal" Or
           e.DataColumn.FieldName = "vlrRev" Or
           e.DataColumn.FieldName = "percRev" Or
            e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "difPercRev" Or
           e.DataColumn.FieldName = "difVlrRev" Then
            If Convert.ToDecimal(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "idGrupo" Then
            If Convert.ToDouble(e.CellValue) = 12 Then
                e.DataColumn.CellStyle.BorderTop.BorderWidth = 10
            End If
        End If
    End Sub

    Protected Sub gridSub_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        Dim oBI As New BI

        oBI.BI_Buscar_Ori_Rev_Real_RealAA(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilialNew.CallFilial, (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue())

        If e.Item.FieldName = "percRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.percRev)
        End If

        If e.Item.FieldName = "percReal" Then
            e.TotalValue = Convert.ToDecimal(oBI.percRea)
        End If

        If e.Item.FieldName = "percRealAA" Then
            e.TotalValue = Convert.ToDecimal(oBI.percReaAA)
        End If

        If e.Item.FieldName = "percRealMA" Then
            e.TotalValue = Convert.ToDecimal(oBI.percReaMA)
        End If

        If e.Item.FieldName = "difPercRev" Then
            e.TotalValue = Convert.ToDecimal(oBI.percDifRev)
        End If

        If e.Item.FieldName = "percCresc" Then
            e.TotalValue = Convert.ToDecimal(oBI.percCresc)
        End If

    End Sub

    Protected Sub gridNota_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSUBGRUPO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Despesas por Grupo, Sub-grupo e Item"
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next


        If e.DataColumn.FieldName = "difPercRev" Or
            e.DataColumn.FieldName = "difVlrRev" Then
            If Convert.ToDecimal(e.CellValue) >= 0.0 Then
                e.Cell.BackColor = System.Drawing.Color.LimeGreen
            Else
                e.Cell.BackColor = System.Drawing.Color.Tomato
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealAA" Or
           e.DataColumn.FieldName = "percRealAA" Or
           e.DataColumn.FieldName = "vlrRealMA" Or
           e.DataColumn.FieldName = "percRealMA" Or
           e.DataColumn.FieldName = "vlrReal" Or
           e.DataColumn.FieldName = "percReal" Or
           e.DataColumn.FieldName = "vlrRev" Or
           e.DataColumn.FieldName = "percRev" Or
            e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "percCrescMA" Then
            If Convert.ToDecimal(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub


    Protected Sub cboFilialNew_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilialNew.ListCorporacaoChanged

        If Me.cboFilialNew.CallCorporacao = 3 Then
            Me.cboFilialNew.CallFilial = 3
        ElseIf Me.cboFilialNew.CallCorporacao = 199 Then
            Me.cboFilialNew.CallFilial = 199
        End If

        Session("sFILIAL") = Me.cboFilialNew.CallFilial
        Me.dsGrupoMes.DataBind()
    End Sub

    Protected Sub cboFilialNew_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilialNew.ListFilialChanged
        Session("sFILIAL") = Me.cboFilialNew.CallFilial
        Me.dsGrupoMes.DataBind()
    End Sub
End Class
