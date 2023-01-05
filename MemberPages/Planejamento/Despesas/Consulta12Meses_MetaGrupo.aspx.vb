Imports DevExpress.Web

Partial Class Consulta12Meses_MetaGrupo
    Inherits System.Web.UI.Page

    Private vOri_01 As Decimal = 0
    Private vOri_02 As Decimal = 0
    Private vOri_03 As Decimal = 0
    Private vOri_04 As Decimal = 0
    Private vOri_05 As Decimal = 0
    Private vOri_06 As Decimal = 0
    Private vOri_07 As Decimal = 0
    Private vOri_08 As Decimal = 0
    Private vOri_09 As Decimal = 0
    Private vOri_10 As Decimal = 0
    Private vOri_11 As Decimal = 0
    Private vOri_12 As Decimal = 0
    Private vOri_99 As Decimal = 0
    Private vRea_99 As Decimal = 0
    Private vRea_AA As Decimal = 0

    Private pOri_01 As Decimal = 0
    Private pOri_02 As Decimal = 0
    Private pOri_03 As Decimal = 0
    Private pOri_04 As Decimal = 0
    Private pOri_05 As Decimal = 0
    Private pOri_06 As Decimal = 0
    Private pOri_07 As Decimal = 0
    Private pOri_08 As Decimal = 0
    Private pOri_09 As Decimal = 0
    Private pOri_10 As Decimal = 0
    Private pOri_11 As Decimal = 0
    Private pOri_12 As Decimal = 0
    Private pOri_99 As Decimal = 0
    Private pRea_99 As Decimal = 0
    Private pRea_AA As Decimal = 0

    Private perCrescAA As Decimal = 0
    Private perCrescAT As Decimal = 0



    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(171, User.Identity.Name)
            Me.ASPxGridView1.Visible = False

            Dim varAno As Int16
            varAno = Year(DateAdd(DateInterval.Month, -5, DateAndTime.Now())) + 1
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboSize.SelectedValue = 100

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            cboPosicao.CallPosicao = 3

        End If
    End Sub

    'Private Sub AtualizarTitulo()
    '    Me.ASPxGridView1.Caption = "Meta por Subgrupo Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
    'End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        If Me.cboFilial.CallCorporacao = 199 Then
            Me.cboFilial.CallFilial = 99
        Else
            Me.cboFilial.CallFilial = 3
            Me.cboFilial.Enabled_cboFilial = True
        End If
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = Me.cboFilial.CallFilial

        Session("sPOSICAO") = Me.cboPosicao.CallPosicao

        Me.ASPxGridView1.Visible = True
        Me.ASPxGridView1.DataBind()

    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vOri_01 = 0
            vOri_02 = 0
            vOri_03 = 0
            vOri_04 = 0
            vOri_05 = 0
            vOri_06 = 0
            vOri_07 = 0
            vOri_08 = 0
            vOri_09 = 0
            vOri_10 = 0
            vOri_11 = 0
            vOri_12 = 0
            vOri_99 = 0
            vRea_99 = 0
            vRea_AA = 0

            pOri_01 = 0
            pOri_02 = 0
            pOri_03 = 0
            pOri_04 = 0
            pOri_05 = 0
            pOri_06 = 0
            pOri_07 = 0
            pOri_08 = 0
            pOri_09 = 0
            pOri_10 = 0
            pOri_11 = 0
            pOri_12 = 0
            pOri_99 = 0
            pRea_99 = 0
            pRea_AA = 0

            perCrescAA = 0
            perCrescAT = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 7777 Then
                vOri_01 += Convert.ToDecimal(e.GetValue("vOri_01"))
                vOri_02 += Convert.ToDecimal(e.GetValue("vOri_02"))
                vOri_03 += Convert.ToDecimal(e.GetValue("vOri_03"))
                vOri_04 += Convert.ToDecimal(e.GetValue("vOri_04"))
                vOri_05 += Convert.ToDecimal(e.GetValue("vOri_05"))
                vOri_06 += Convert.ToDecimal(e.GetValue("vOri_06"))
                vOri_07 += Convert.ToDecimal(e.GetValue("vOri_07"))
                vOri_08 += Convert.ToDecimal(e.GetValue("vOri_08"))
                vOri_09 += Convert.ToDecimal(e.GetValue("vOri_09"))
                vOri_10 += Convert.ToDecimal(e.GetValue("vOri_10"))
                vOri_11 += Convert.ToDecimal(e.GetValue("vOri_11"))
                vOri_12 += Convert.ToDecimal(e.GetValue("vOri_12"))
                vOri_99 += Convert.ToDecimal(e.GetValue("vOri_99"))
                vRea_99 += Convert.ToDecimal(e.GetValue("vRea_99"))
                vRea_AA += Convert.ToDecimal(e.GetValue("vRea_AA"))

                pOri_01 += Convert.ToDecimal(e.GetValue("pOri_01"))
                pOri_02 += Convert.ToDecimal(e.GetValue("pOri_02"))
                pOri_03 += Convert.ToDecimal(e.GetValue("pOri_03"))
                pOri_04 += Convert.ToDecimal(e.GetValue("pOri_04"))
                pOri_05 += Convert.ToDecimal(e.GetValue("pOri_05"))
                pOri_06 += Convert.ToDecimal(e.GetValue("pOri_06"))
                pOri_07 += Convert.ToDecimal(e.GetValue("pOri_07"))
                pOri_08 += Convert.ToDecimal(e.GetValue("pOri_08"))
                pOri_09 += Convert.ToDecimal(e.GetValue("pOri_09"))
                pOri_10 += Convert.ToDecimal(e.GetValue("pOri_10"))
                pOri_11 += Convert.ToDecimal(e.GetValue("pOri_11"))
                pOri_12 += Convert.ToDecimal(e.GetValue("pOri_12"))
                pOri_99 += Convert.ToDecimal(e.GetValue("pOri_99"))
                pRea_99 += Convert.ToDecimal(e.GetValue("pRea_99"))
                pRea_AA += Convert.ToDecimal(e.GetValue("pRea_AA"))

                perCrescAA += Convert.ToDecimal(e.GetValue("perCrescAA"))
                perCrescAT += Convert.ToDecimal(e.GetValue("perCrescAT"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_01" Then e.TotalValue = vOri_01
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_02" Then e.TotalValue = vOri_02
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_03" Then e.TotalValue = vOri_03
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_04" Then e.TotalValue = vOri_04
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_05" Then e.TotalValue = vOri_05
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_06" Then e.TotalValue = vOri_06
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_07" Then e.TotalValue = vOri_07
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_08" Then e.TotalValue = vOri_08
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_09" Then e.TotalValue = vOri_09
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_10" Then e.TotalValue = vOri_10
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_11" Then e.TotalValue = vOri_11
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_12" Then e.TotalValue = vOri_12
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_99" Then e.TotalValue = vOri_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vRea_99" Then e.TotalValue = vRea_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vRea_AA" Then e.TotalValue = vRea_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_01" Then e.TotalValue = pOri_01
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_02" Then e.TotalValue = pOri_02
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_03" Then e.TotalValue = pOri_03
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_04" Then e.TotalValue = pOri_04
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_05" Then e.TotalValue = pOri_05
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_06" Then e.TotalValue = pOri_06
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_07" Then e.TotalValue = pOri_07
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_08" Then e.TotalValue = pOri_08
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_09" Then e.TotalValue = pOri_09
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_10" Then e.TotalValue = pOri_10
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_11" Then e.TotalValue = pOri_11
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_12" Then e.TotalValue = pOri_12
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_99" Then e.TotalValue = pOri_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pRea_99" Then e.TotalValue = pRea_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pRea_AA" Then e.TotalValue = pRea_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescAA" Then e.TotalValue = perCrescAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescAT" Then e.TotalValue = perCrescAT
        End If

        'Me.Label1.Text = oVem.varDesc
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "vOri_01" Or
           e.DataColumn.FieldName = "vOri_02" Or
           e.DataColumn.FieldName = "vOri_03" Or
           e.DataColumn.FieldName = "vOri_04" Or
           e.DataColumn.FieldName = "vOri_05" Or
           e.DataColumn.FieldName = "vOri_06" Or
           e.DataColumn.FieldName = "vOri_07" Or
           e.DataColumn.FieldName = "vOri_08" Or
           e.DataColumn.FieldName = "vOri_09" Or
           e.DataColumn.FieldName = "vOri_10" Or
           e.DataColumn.FieldName = "vOri_11" Or
           e.DataColumn.FieldName = "vOri_12" Or
           e.DataColumn.FieldName = "vOri_99" Or
           e.DataColumn.FieldName = "vRea_99" Or
           e.DataColumn.FieldName = "vRea_AA" Or
           e.DataColumn.FieldName = "pOri_01" Or
           e.DataColumn.FieldName = "pOri_02" Or
           e.DataColumn.FieldName = "pOri_03" Or
           e.DataColumn.FieldName = "pOri_04" Or
           e.DataColumn.FieldName = "pOri_05" Or
           e.DataColumn.FieldName = "pOri_06" Or
           e.DataColumn.FieldName = "pOri_07" Or
           e.DataColumn.FieldName = "pOri_08" Or
           e.DataColumn.FieldName = "pOri_09" Or
           e.DataColumn.FieldName = "pOri_10" Or
           e.DataColumn.FieldName = "pOri_11" Or
           e.DataColumn.FieldName = "pOri_12" Or
           e.DataColumn.FieldName = "pOri_99" Or
           e.DataColumn.FieldName = "pRea_99" Or
           e.DataColumn.FieldName = "pRea_AA" Or
           e.DataColumn.FieldName = "perCrescAA" Or
           e.DataColumn.FieldName = "perCrescAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "idGrupo" Then
            If e.CellValue = "7777" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If IsPostBack Then
            Me.ASPxGridView1.Columns.Item("bandOrcamento").Caption = "Orçamento " & Me.cboAno.CallAno
            Me.ASPxGridView1.Columns.Item("bandRealizado").Caption = "Realizado " & Me.cboAno.CallAno - 1
            Me.ASPxGridView1.Columns.Item("bandRealizadoAA").Caption = "Realizado " & Me.cboAno.CallAno - 2
            Me.ASPxGridView1.Columns.Item("perCrescAA").Caption = Right(Me.cboAno.CallAno, 2) - 1 & " x " & Right(Me.cboAno.CallAno, 2) - 2
            Me.ASPxGridView1.Columns.Item("perCrescAT").Caption = Right(Me.cboAno.CallAno, 2) & " x " & Right(Me.cboAno.CallAno, 2) - 1

            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Despesas 12 Meses - por Grupo e Filial - PGR171'"


        End If

    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "ASPxGridView1"
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged

        Call Atualizar()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Dim gridWith As Int16
        Dim gridHeight As Int16

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = 1000
            gridHeight = 400
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeight = 400 * 195 / 100
                gridWith = 1000 * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeight = 400 * 145 / 100
                gridWith = 1000 * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeight = 400 * 175 / 100
                gridWith = 1000 * 175 / 100
            Else
                gridHeight = 400 * Me.cboSize.SelectedValue / 100
                gridWith = 1000 * Me.cboSize.SelectedValue / 100
            End If

        End If

        Me.ASPxGridView1.Width = gridWith
        Me.ASPxGridView1.Settings.VerticalScrollableHeight = gridHeight
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                Me.cboFilial.Visible_cboCorporacao = False
                Me.cboPosicao.Visible = False
            End If
            Atualizar()
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "7777"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
            Case "1"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Call Atualizar()
    End Sub
End Class
