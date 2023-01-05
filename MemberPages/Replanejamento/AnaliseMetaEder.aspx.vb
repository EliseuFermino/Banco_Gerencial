Imports DevExpress.Web
Imports Microsoft.VisualBasic

Partial Class MemberPages_Replanejamento_AnaliseMetaEder
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Variaveis Ultima Linha"

    Private vlrRea_Ano_AA As Decimal = 0
    Private vlrRea_Mes_Ant As Decimal = 0
    Private vlrMeta As Decimal = 0
    Private percCresc_Ano_AA As Decimal = 0
    Private percCresc_Mes_Ant As Decimal = 0

#End Region


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(383, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Metas para Replanejamento - PGR383"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()

        oFun.Grid_ColumnTitle(grid, "vlrMeta", "Meta " & cboAno.CallAno & "<br>" & cboMes.CallMesDesc)
        oFun.Grid_ColumnTitle(grid, "vlrRea_Ano_AA", "Real " & cboAno.CallAno - 1 & "<br>" & cboMes.CallMesDesc)

        If cboMes.CallMes = 1 Then
            oFun.Grid_ColumnTitle(grid, "vlrRea_Mes_Ant", "Real " & cboAno.CallAno - 1 & "<br>" & MonthName(12))
        Else
            oFun.Grid_ColumnTitle(grid, "vlrRea_Mes_Ant", "Real " & cboAno.CallAno & "<br>" & MonthName(cboMes.CallMes - 1))
        End If


        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRea_Ano_AA = 0
            vlrRea_Mes_Ant = 0
            vlrMeta = 0
            percCresc_Ano_AA = 0
            percCresc_Mes_Ant = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As String = Convert.ToString(e.GetValue("descSecao"))
            If myFilter = "Total Geral" Then

                vlrRea_Ano_AA += Convert.ToDecimal(e.GetValue("vlrRea_Ano_AA"))
                vlrRea_Mes_Ant += Convert.ToDecimal(e.GetValue("vlrRea_Mes_Ant"))
                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))
                percCresc_Ano_AA += Convert.ToDecimal(e.GetValue("percCresc_Ano_AA"))
                percCresc_Mes_Ant += Convert.ToDecimal(e.GetValue("percCresc_Mes_Ant"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRea_Ano_AA" Then e.TotalValue = vlrRea_Ano_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRea_Mes_Ant" Then e.TotalValue = vlrRea_Mes_Ant
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Ano_AA" Then e.TotalValue = percCresc_Ano_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Mes_Ant" Then e.TotalValue = percCresc_Mes_Ant
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_Mes_Ant")
        oFun.Grid_RedIsNegative(e, "percCresc_Ano_AA")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total 1-Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total 2-Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total 3-Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total 4-Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total 5-Eletrodomésticos", Drawing.Color.LightGray, True)
    End Sub

   
End Class

