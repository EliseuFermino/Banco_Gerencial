Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_viewOri_MetaVendaAnoSecao
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Private vlrMeta As Decimal = 0

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno + 1
            Me.cboAno.CallAno = varAno + 1

            Me.cboAno.AutoPostBack = False


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Meta Original de Venda por Seção - Ano - PGR251"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Meta de Venda por Seção - Empresa")
        Me.grid.DataBind()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrMeta = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = e.GetValue("descSecao")
            If myFilter = "Total" Then
                vlrMeta = Convert.ToDecimal(e.GetValue("vlrSecao"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrSecao" Then e.TotalValue = vlrMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart" Then e.TotalValue = 100.0
        End If


    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 5", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total", Drawing.Color.LightGreen, True)

    End Sub

End Class

