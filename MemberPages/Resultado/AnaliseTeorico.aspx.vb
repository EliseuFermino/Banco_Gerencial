Imports DevExpress.Web

Partial Class MemberPages_Resultado_AnaliseTeorico
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(207, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMes.CallMes = Month(DateAndTime.Now()) - 1
            Me.cboSize.SelectedValue = 100
            Call OcultarExibir_Performance(False)
            Call MudarTitulo()
        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

        If Me.rndAno.Checked = True Then Session("sANO_MA") = 1
        If Me.rndMes.Checked = True Then Session("sANO_MA") = 2

        Me.ASPxGridView1.DataBind()
        MudarTitulo()
    End Sub

    Private Sub MudarTitulo()

        Dim nomeMesAnterior As String = Left(MonthName(cboMes.CallMes - 1), 3)

        If Me.rndAno.Checked = True Then
            oFun.Grid_ColumnTitle(ASPxGridView1, "vlrG47AA", cboAno.CallAno - 1)
            oFun.Grid_ColumnTitle(ASPxGridView1, "vlrG47AT", cboAno.CallAno)
        End If

        If rndMes.Checked = True Then
            oFun.Grid_ColumnTitle(ASPxGridView1, "vlrG47AA", nomeMesAnterior & "-" & cboAno.CallAno)
            oFun.Grid_ColumnTitle(ASPxGridView1, "vlrG47AT", Left(cboMes.CallMesDesc, 3) & "-" & cboAno.CallAno)
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "Margem" Or
            e.DataColumn.FieldName = "OperComl" Or
            e.DataColumn.FieldName = "Despesa" Or
            e.DataColumn.FieldName = "percCrescVenda" Or
            e.DataColumn.FieldName = "percCrescDespesa" Or
            e.DataColumn.FieldName = "difCresc" Or
            e.DataColumn.FieldName = "Pessoal" Or
            e.DataColumn.FieldName = "ResOper" Or
            e.DataColumn.FieldName = "Ultima" Or
           e.DataColumn.FieldName = "Quebra" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            Else
                e.Cell.ForeColor = System.Drawing.Color.Blue
            End If
        End If

        If e.DataColumn.FieldName = "percCrescVenda" Or
            e.DataColumn.FieldName = "percCrescDespesa" Or
            e.DataColumn.FieldName = "vlrG47AA" Or
            e.DataColumn.FieldName = "vlrG47AT" Or
            e.DataColumn.FieldName = "percG47AA" Or
            e.DataColumn.FieldName = "percG47AT" Or
            e.DataColumn.FieldName = "difG47" Or
            e.DataColumn.FieldName = "percDifG47" Or
            e.DataColumn.FieldName = "difCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            Else
                e.Cell.ForeColor = System.Drawing.Color.Black
            End If
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise Teórico - PGR207"
        End If
    End Sub


    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes

            If Me.rndAno.Checked = True Then Session("sANO_MA") = 1
            If Me.rndMes.Checked = True Then Session("sANO_MA") = 2

            Me.ASPxGridView1.DataBind()
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Dim gridWith As Int16
        Dim gridHeight As Int16
        Dim vlrWith As Int16
        Dim vlrHeight As Int16

        vlrHeight = 400
        vlrWith = 1000

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = vlrWith
            gridHeight = vlrHeight
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeight = vlrHeight * 195 / 100
                gridWith = vlrWith * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeight = vlrHeight * 145 / 100
                gridWith = vlrWith * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeight = vlrHeight * 175 / 100
                gridWith = vlrWith * 175 / 100
            Else
                gridHeight = vlrHeight * Me.cboSize.SelectedValue / 100
                gridWith = vlrWith * Me.cboSize.SelectedValue / 100
            End If

        End If

        Me.ASPxGridView1.Width = gridWith
        Me.ASPxGridView1.Settings.VerticalScrollableHeight = gridHeight
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "199"
                e.Row.BackColor = System.Drawing.Color.PaleGreen
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

    Protected Sub cboOpcao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboOpcao.SelectedIndexChanged
        Select Me.cboOpcao.SelectedValue
            Case 1  'Análise
                Call OcultarExibir_Analise(True)
                Call OcultarExibir_Performance(False)
            Case 2  'Performance
                Call OcultarExibir_Performance(True)
                Call OcultarExibir_Analise(False)
            Case 3  'Todos
                Call OcultarExibir_Analise(True)
                Call OcultarExibir_Performance(True)
        End Select
    End Sub

    Private Sub OcultarExibir_Analise(ByVal iTrueFalse As Boolean)
        With Me.ASPxGridView1.Columns
            .Item("Margem").Visible = iTrueFalse
            .Item("Quebra").Visible = iTrueFalse
            .Item("OperComl").Visible = iTrueFalse
            .Item("Despesa").Visible = iTrueFalse
            .Item("Pessoal").Visible = iTrueFalse
            .Item("ResOper").Visible = iTrueFalse
            .Item("Ultima").Visible = iTrueFalse
        End With
    End Sub

    Private Sub OcultarExibir_Performance(ByVal iTrueFalse As Boolean)
        With Me.ASPxGridView1.Columns
            .Item("bandPerformance").Visible = iTrueFalse
        End With
    End Sub

End Class
