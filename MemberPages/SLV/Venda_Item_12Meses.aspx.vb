Imports DevExpress.Web

Partial Class MemberPages_SLV_Venda_Item_12Meses
    Inherits System.Web.UI.Page

    Private vlrMeta As Decimal = 0
    Private vlrRea As Decimal = 0
    Private percPart_vlrRea As Decimal = 0
    Private vlrMA As Decimal = 0
    Private vlrAA1 As Decimal = 0
    Private vlrAA2 As Decimal = 0
    Private vlrAA3 As Decimal = 0
    Private percCresc_RealMeta As Decimal = 0
    Private percMA As Decimal = 0
    Private percCresc_RealAA1 As Decimal = 0
    Private percCresc_RealAA3 As Decimal = 0
    Private percCresc_RealAA2 As Decimal = 0
    Private vlrMetaAnual As Decimal = 0
    Private percCresc_MetaAnual As Decimal = 0
    Private percMargMeta As Decimal = 0
    Private percMargReal As Decimal = 0
    Private percMargemDif As Decimal = 0

    Dim oFun As New Funcoes

    Sub BuscaTitulo()

        Me.ASPxGridView1.SettingsText.Title = "Analise por Item 12 Meses e Acumulado "
       
    End Sub

    Public Function GetLastDayOfMonth(ByVal intMonth As Byte, ByVal intYear As Int16) As Date
        GetLastDayOfMonth = DateSerial(intYear, intMonth + 1, 0)
    End Function

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(110, User.Identity.Name)


            Me.cboAno.AnoInicial = myDateTimes.YearToday - 3
            Me.cboAno.AnoFinal = myDateTimes.YearToday
            Me.cboAno.CallAno = myDateTimes.YearToday


            'Mudar Legendas

            Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

            Session("sANO") = Me.cboAno.CallAno
            Session("sSECAO") = cboSecao.CallSecao


            oFun.Grid_Column_BorderRight(ASPxGridView1, "percPart_vlr_m99", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percPart_vlr_m1", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_2", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_3", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_4", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_5", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_6", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_7", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_8", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_9", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_10", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_11", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Vlr_12", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_5", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_6", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_7", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_8", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_9", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_10", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_11", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCresc_Qtde_12", Drawing.Color.Gray, BorderStyle.Dashed, 1)


            wucSize.CallSize = 100
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Vendas por Item 12 Meses por Seção - PGR?"
        End If

    End Sub



#End Region

    Private Sub Atualizar()
        Me.ASPxGridView1.DataBind()
        Call BuscaTitulo()
    End Sub


#Region " Grid por Comprador"

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealMeta", "vlrRea", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMA", "vlrRea", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA1", "vlrRea", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA2", "vlrRea", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_RealAA3", "vlrRea", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargMeta", "vlrMargMeta", "vlrMeta", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargReal", "vlrMargReal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemDif", "percMargReal", "percMargMeta", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemSellOut", "LucroSellOut", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemFinal", "vlrMargemFinal", "vlrRea", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_2", "Qtde_m2", "Qtde_m1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_3", "Qtde_m3", "Qtde_m2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_4", "Qtde_m4", "Qtde_m3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_5", "Qtde_m5", "Qtde_m4", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_6", "Qtde_m6", "Qtde_m5", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_7", "Qtde_m7", "Qtde_m6", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_8", "Qtde_m8", "Qtde_m7", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_9", "Qtde_m9", "Qtde_m8", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_10", "Qtde_m10", "Qtde_m9", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_11", "Qtde_m11", "Qtde_m10", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Qtde_12", "Qtde_m12", "Qtde_m11", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_2", "vlr_m2", "vlr_m1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_3", "vlr_m3", "vlr_m2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_4", "vlr_m4", "vlr_m3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_5", "vlr_m5", "vlr_m4", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_6", "vlr_m6", "vlr_m5", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_7", "vlr_m7", "vlr_m6", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_8", "vlr_m8", "vlr_m7", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_9", "vlr_m9", "vlr_m8", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_10", "vlr_m10", "vlr_m9", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_11", "vlr_m11", "vlr_m10", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc_Vlr_12", "vlr_m12", "vlr_m11", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "difMetaRealMes", "vlrRea", "vlrMetaAnual", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "DifMetaRealDia", "vlrRea", "vlrMeta", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_2")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_3")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_4")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_5")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_6")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_7")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_8")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_9")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_10")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_11")
        oFun.Grid_RedIsNegative(e, "percCresc_Vlr_12")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_2")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_3")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_4")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_5")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_6")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_7")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_8")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_9")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_10")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_11")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_12")

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region

    Protected Sub wucSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles wucSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, Me.wucSize.CallSize)

    End Sub


    Protected Sub cbPanelGrid_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sSECAO") = cboSecao.CallSecao



        Call Atualizar()

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


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Call BuscaTitulo()

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
   
        End If
    End Sub
End Class
