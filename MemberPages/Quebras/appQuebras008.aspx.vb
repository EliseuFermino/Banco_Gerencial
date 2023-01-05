Imports DevExpress.Web

Partial Class MemberPages_Quebras_appQuebras008
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub cbPanel_Dados_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_Dados.Callback
        'Threading.Thread.Sleep(1500)

        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sFORNECEDOR") = Me.txtFornecedor.CallFornecedor

        Me.grid1.Visible = True
        Me.grid1.DataBind()
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(131, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra Loja a Loja - por Fornecedor - PGR131"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            wucSize.CallSize = 100
        End If
    End Sub

#End Region

#Region " grid"

    Protected Sub grid1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid1.HtmlFooterCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("FilialLista"))
        If NomeColuna = "00 - Empresa Total" Then
            e.Row.BackColor = System.Drawing.Color.LightGreen
            e.Row.Font.Bold = True
        End If
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemCheia")
        oFun.Grid_RedIsNegative(e, "Qtde52")
        oFun.Grid_RedIsNegative(e, "Qtde23")
        oFun.Grid_RedIsNegative(e, "vlrAg52")
        oFun.Grid_RedIsNegative(e, "vlrAg23")
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "QtdeQuebra")
        oFun.Grid_RedIsNegative(e, "vlrDiv")
        oFun.Grid_RedIsNegative(e, "QtdeDiv")

        'Band Perdas
        If e.DataColumn.FieldName = "CFTV" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Antena" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "PPP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

    End Sub

    Protected Sub grid1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid1.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percCresc", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargemCheia", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

#End Region

    Protected Sub wucSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles wucSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid1, wucSize.CallSize)
    End Sub
End Class
