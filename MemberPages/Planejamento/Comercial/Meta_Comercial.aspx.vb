
Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Comercial_Meta_Comercial
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(382, User.Identity.Name)

            Dim varAno As Int32
            varAno = myDateTimes.YearToday()

            Me.cboAno.AnoInicial = 2017
            Me.cboAno.AnoFinal = varAno + 1
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False

            cboMes.AutoPostBack = False
            cboMes.AutoPostBack_MesFinal = False
            cboMes.Visible_cboMes_Final = True

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Meta Comercial - Venda e Margem Final (PDV + SellOut) - PGR382"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Dim varMesAtual As Byte = DateAndTime.Now().Month

            cboSize.CallSize = 100
            mySession()
            cboMes.CallMes = 1
            Session("sMES") = 1

            If varMesAtual = 1 Then
                cboMes.CallMesFinal = 1
                Session("sMES_FINAL") = 1
            Else
                cboMes.CallMesFinal = Month(DateAndTime.Now.AddDays(-1)) - 1
                Session("sMES_FINAL") = Month(DateAndTime.Now.AddDays(-1)) - 1
            End If
            
            ' -----------

            Dim iProj As New Projeto
            If LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "comercial" Then
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            ElseIf LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "gestor_comercial" Then
                Session("sTIPO_LISTA") = 2  ' Gestor_Comercial
                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If

            ' -----------

            Atualizar()

            oFun.Grid_Column_BorderLeft(grid, "vlrMetaVenda", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percAtingMetaVenda", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percAtingMetaLucro", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "difPercMargem", Drawing.Color.Gray, BorderStyle.Solid, 1)
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sMES") = cboMes.CallMes
        Session("sMES_FINAL") = cboMes.CallMesFinal
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        Dim vMesAtual As Byte = Month(DateAndTime.Now())

        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingVendas", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingLucro", "vlrLucroTotal", "vlrMargem", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)


        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)



        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargem", "percMargemFinal", "percMargem", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaVenda", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaLucro", "vlrLucroTotal", "vlrMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaSellOut", "vlrRealSellout", "vlrMetaSellout", Funcoes.CalculateType.Growth)


    End Sub

 
    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next
        oFun.Grid_Calculate(e, "difVendas", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difLucro", "vlrLucroTotal", "vlrMargem", Funcoes.CalculateType.Decrease)
    
        oFun.Grid_Calculate(e, "difPercMargem", "percMargemFinal", "percMargem", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difSellOut", "vlrRealSellout", "vlrMetaSellout", Funcoes.CalculateType.Decrease)

        oFun.Grid_Calculate(e, "percAtingMetaVenda", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "percAtingMetaLucro", "vlrLucroTotal", "vlrMargem", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "difVendas")
        oFun.Grid_RedIsNegative(e, "difLucro")
        oFun.Grid_RedIsNegative(e, "difSellOut")
        oFun.Grid_RedIsNegative(e, "difPercMargem")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVenda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaSellOut")

        ' MARGEM 
        If e.DataColumn.FieldName = "difPercMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "difPercMargem" Then
            If Convert.ToDouble(e.CellValue) > 0 Then
                e.Cell.BackColor = System.Drawing.Color.LightGreen
            End If
        End If


        ' LUCRO 
        If e.DataColumn.FieldName = "difLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "difLucro" Then
            If Convert.ToDouble(e.CellValue) > 0 Then
                e.Cell.BackColor = System.Drawing.Color.LightGreen
            End If
        End If


        ' VENDA
        If e.DataColumn.FieldName = "difVendas" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "difVendas" Then
            If Convert.ToDouble(e.CellValue) > 0 Then
                e.Cell.BackColor = System.Drawing.Color.LightGreen
            End If
        End If

        ' VENDA
        If e.DataColumn.FieldName = "difSellOut" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "difSellOut" Then
            If Convert.ToDouble(e.CellValue) > 0 Then
                e.Cell.BackColor = System.Drawing.Color.LightGreen
            End If
        End If


    End Sub

    
    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

End Class

