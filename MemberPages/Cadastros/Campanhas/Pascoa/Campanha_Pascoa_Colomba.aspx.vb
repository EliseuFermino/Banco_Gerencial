Imports DevExpress.Web

Partial Class MemberPages_Campanha_Pascoa_Colomba
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Variables"

    Private VendaAA As Decimal = 0
    Private Meta As Decimal = 0
    Private Real As Decimal = 0

    Private QtdeAA As Decimal = 0
    Private Qtde As Decimal = 0
    Private percCresQtde As Decimal = 0
    Private VendaAA1 As Decimal = 0
    Private Venda As Decimal = 0
    Private percCresVenda As Decimal = 0
    Private MargemAA As Decimal = 0
    Private Margem As Decimal = 0
    Private Dif As Decimal = 0
    Private LucroAA As Decimal = 0
    Private Lucro As Decimal = 0
    Private percCresLucro As Decimal = 0
    Private QtdeEstoque As Decimal = 0
    Private TotalQuilos As Decimal = 0
    Private vlrEstoque As Decimal = 0

    Private numClienteAA As Decimal = 0
    Private numCliente As Decimal = 0
    Private difCliente As Decimal = 0
#End Region

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(99, User.Identity.Name)
            Session("sCAMPANHA") = 1
            Me.cboAno.AutoPostBack = True

            Me.cboAno.AnoInicial = Year(Now()) - 3
            Me.cboAno.AnoFinal = Year(Now())
            If Month(Now()) < 2 Then
                Me.cboAno.CallAno = Year(Now()) - 1
                Session("sANO") = Year(Now()) - 1
            Else
                Me.cboAno.CallAno = Year(Now())
                Session("sANO") = Year(Now())
            End If

            Session("sCAMPANHA") = 1
            Session("sCOD") = 4 'Colomba
            Session("sFILIAL") = 99
            oVem.Campanha_BuscarPeriodo(1, Year(Now()))

            Me.lblTitulo.Text = "Período Acumulado:  " & Year(Now()) - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & "."
            Me.lblTitulo1.Text = "" & Year(Now()) & ": " & oVem.Dia3 & " a " & oVem.Dia4 & "."

            Call myLegendas()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Colombas " & Me.cboAno.CallAno & " - PGR99"
    End Sub

#End Region

#Region " Meus Scipts"

    Private Sub myLegendas()

        Dim anoAT As Int16, anoAA As Int16
        anoAT = Me.cboAno.CallAno
        anoAA = Me.cboAno.CallAno - 1

        oFun.Grid_Title(Me.ASPxGridView1, "Análise de Colombas " & anoAT)
        oFun.Grid_Title(Me.gridMeta, "Comparativo - Colomba - Meta x Realizado " & anoAT)
        oFun.Grid_Title(Me.gridTodosItens, "Colombas - Todos os Itens - " & anoAT)

        'Colunas
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "QtdeAA", anoAA)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "Qtde", anoAT)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "Venda", anoAT)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "VendaAA", anoAA)

        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "Margem", anoAT)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "MargemAA", anoAA)

        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "Lucro", anoAT)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "LucroAA", anoAA)

        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "numCliente", anoAT)
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "numClienteAA", anoAA)

        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "bandMargem", "Margem com Sell-Out")
        oFun.Grid_ColumnTitle(Me.ASPxGridView1, "bandLucro", "Lucro")

        oFun.Grid_ColumnTitle(Me.gridMeta, "VendaAA", anoAA)
        oFun.Grid_ColumnTitle(Me.gridMeta, "Meta", "Meta " & anoAT)

    End Sub

#End Region

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call myLegendas()
    End Sub

    Protected Sub ChkLucratividade_CheckedChanged(sender As Object, e As EventArgs) Handles ChkLucratividade.CheckedChanged
        If Me.ChkLucratividade.Checked = True Then
            Me.ASPxGridView1.Columns.Item("bandLucro").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("bandLucro").Visible = False
        End If
    End Sub

#Region " ASPXGridViewe1"

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresQtde")
        oFun.Grid_RedIsNegative(e, "percCresVenda")
        oFun.Grid_RedIsNegative(e, "Dif")
        oFun.Grid_RedIsNegative(e, "percCresLucro")
        oFun.Grid_RedIsNegative(e, "difCliente")

    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
                e.Row.Font.Bold = True
            Case "255", "240"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        On Error Resume Next
        Dim myDate As String
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            VendaAA = 0
            Meta = 0
            Real = 0

            QtdeAA = 0
            Qtde = 0
            percCresQtde = 0
            VendaAA1 = 0
            Venda = 0
            percCresVenda = 0
            MargemAA = 0
            Margem = 0
            Dif = 0
            LucroAA = 0
            Lucro = 0
            percCresLucro = 0
            QtdeEstoque = 0
            TotalQuilos = 0
            vlrEstoque = 0

            numClienteAA = 0
            numCliente = 0
            difCliente = 0

        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                VendaAA += Convert.ToDecimal(e.GetValue("VendaAA"))
                Meta += Convert.ToDecimal(e.GetValue("Meta"))
                Real += Convert.ToDecimal(e.GetValue("Real"))

                QtdeAA += Convert.ToDecimal(e.GetValue("QtdeAA"))
                Qtde += Convert.ToDecimal(e.GetValue("Qtde"))
                percCresQtde += Convert.ToDecimal(e.GetValue("percCresQtde"))
                VendaAA1 += Convert.ToDecimal(e.GetValue("VendaAA"))
                Venda += Convert.ToDecimal(e.GetValue("Venda"))
                percCresVenda += Convert.ToDecimal(e.GetValue("percCresVenda"))
                MargemAA += Convert.ToDecimal(e.GetValue("MargemAA"))
                Margem += Convert.ToDecimal(e.GetValue("Margem"))
                Dif += Convert.ToDecimal(e.GetValue("Dif"))
                LucroAA += Convert.ToDecimal(e.GetValue("LucroAA"))
                Lucro += Convert.ToDecimal(e.GetValue("Lucro"))
                percCresLucro += Convert.ToDecimal(e.GetValue("percCresLucro"))
                QtdeEstoque += Convert.ToDecimal(e.GetValue("QtdeEstoque"))
                TotalQuilos += Convert.ToDecimal(e.GetValue("TotalQuilos"))
                vlrEstoque += Convert.ToDecimal(e.GetValue("vlrEstoque"))

                numClienteAA += Convert.ToDecimal(e.GetValue("numClienteAA"))
                numCliente += Convert.ToDecimal(e.GetValue("numCliente"))
                difCliente += Convert.ToDecimal(e.GetValue("difCliente"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAA" Then e.TotalValue = QtdeAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde" Then e.TotalValue = Qtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresQtde" Then e.TotalValue = percCresQtde

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAA" Then e.TotalValue = VendaAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Venda" Then e.TotalValue = Venda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresVenda" Then e.TotalValue = percCresVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "MargemAA" Then e.TotalValue = MargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Margem" Then e.TotalValue = Margem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dif" Then e.TotalValue = Dif
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "LucroAA" Then e.TotalValue = LucroAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Lucro" Then e.TotalValue = Lucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresLucro" Then e.TotalValue = percCresLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeEstoque" Then e.TotalValue = QtdeEstoque
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "TotalQuilos" Then e.TotalValue = TotalQuilos
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrEstoque" Then e.TotalValue = vlrEstoque

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numCliente" Then e.TotalValue = numCliente
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numClienteAA" Then e.TotalValue = numClienteAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difCliente" Then e.TotalValue = difCliente
        End If

    End Sub


#End Region

#Region " gridMeta"

    Protected Sub gridMeta_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMeta.CustomSummaryCalculate
        On Error Resume Next
        Dim myDate As String
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            VendaAA = 0
            Meta = 0
            Real = 0
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As String = Convert.ToString(e.GetValue("Descricao"))
            If myFilter = "Empresa Total" Then
                VendaAA += Convert.ToDecimal(e.GetValue("VendaAA"))
                Meta += Convert.ToDecimal(e.GetValue("Meta"))
                Real += Convert.ToDecimal(e.GetValue("Real"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAA" Then e.TotalValue = VendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Meta" Then e.TotalValue = Meta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Real" Then e.TotalValue = Real
        End If

        If e.IsTotalSummary Then
            If summary.FieldName = "Part" Then
                Dim Meta As Decimal = Convert.ToDecimal(gridMeta.GetTotalSummaryValue(gridMeta.TotalSummary("Meta")))
                Dim Real As Decimal = Convert.ToDecimal(gridMeta.GetTotalSummaryValue(gridMeta.TotalSummary("Real")))
                e.TotalValue = ((Real / Meta) * 100)
            End If


        End If

        oFun.Grid_Footer_Calculate(sender, e, Me.gridMeta, "percCresc", "Real", "VendaAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub gridMeta_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridMeta.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")

    End Sub

    Protected Sub gridMeta_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMeta.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub


#End Region

#Region " gridTodosItens"

    Protected Sub gridTodosItens_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTodosItens.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, Me.gridTodosItens, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gridTodosItens_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridTodosItens.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "qtdeEstoque")
        oFun.Grid_RedIsNegative(e, "TotalQuilos")
        oFun.Grid_RedIsNegative(e, "vlrEstoque")

    End Sub

#End Region

End Class