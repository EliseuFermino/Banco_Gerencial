Imports DevExpress.Web
Partial Class MemberPages_Posto_Postos_Resumo_Estoque
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ' oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False


        End If

    End Sub


    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

    End Sub

    Private Sub Atualizar()
        mySession()
        'oFun.Grid_Title(grid, "Titulo do Formulário")
        Me.grid205.DataBind()
        Me.grid206.DataBind()
    End Sub



    Protected Sub cboPanel_Callback1(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Protected Sub grid205_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid205.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid205, "acum_perc_Diferenca", "acum_Diferenca_Volume", "acum_vlrVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid206_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid206.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid206, "acum_perc_Diferenca", "acum_Diferenca_Volume", "acum_vlrVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid211_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid211.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid211, "acum_perc_Diferenca", "acum_Diferenca_Volume", "acum_vlrVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid205_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid205.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "acum_Diferenca_Volume")

        If e.DataColumn.FieldName = "acum_perc_Diferenca" Then

            ' SINAIS NEGATIVOS -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > -0.98999999999999999 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) > -0.59999999999999998 Then
                e.Cell.BackColor = Drawing.Color.Yellow
                e.Cell.ForeColor = Drawing.Color.Black
            End If

            If Convert.ToDecimal(e.CellValue) > -0.20000000000000001 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If

            ' SINAIS POSITIVO -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > 0.0 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) = 0.0 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If
        End If

    End Sub

    Protected Sub grid206_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid206.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "acum_Diferenca_Volume")

        If e.DataColumn.FieldName = "acum_perc_Diferenca" Then

            ' SINAIS NEGATIVOS -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > -0.98999999999999999 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) > -0.59999999999999998 Then
                e.Cell.BackColor = Drawing.Color.Yellow
                e.Cell.ForeColor = Drawing.Color.Black
            End If

            If Convert.ToDecimal(e.CellValue) > -0.20000000000000001 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If

            ' SINAIS POSITIVO -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > 0.0 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) = 0.0 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If
        End If

    End Sub

    Protected Sub grid211_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid211.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "acum_Diferenca_Volume")

        If e.DataColumn.FieldName = "acum_perc_Diferenca" Then

            ' SINAIS NEGATIVOS -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > -0.98999999999999999 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) > -0.59999999999999998 Then
                e.Cell.BackColor = Drawing.Color.Yellow
                e.Cell.ForeColor = Drawing.Color.Black
            End If

            If Convert.ToDecimal(e.CellValue) > -0.20000000000000001 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If

            ' SINAIS POSITIVO -----------------------------------------------------
            If Convert.ToDecimal(e.CellValue) > 0.0 Then
                e.Cell.BackColor = Drawing.Color.Red
                e.Cell.ForeColor = Drawing.Color.White
            End If

            If Convert.ToDecimal(e.CellValue) = 0.0 Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
            End If
        End If

    End Sub
End Class
