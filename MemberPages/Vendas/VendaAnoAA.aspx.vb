Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendaAnoAA
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(409, User.Identity.Name)

            oFun.Grid_Column_BorderRight(grid, "descFilial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderLeft(grid, "rnk2011", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percCresc2011", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2012", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2013", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2014", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2015", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2016", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2017", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2018", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2019", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2020", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc2021", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "rnk2010", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2011", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2012", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2013", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2014", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2015", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2016", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2017", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2018", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2019", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2020", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "rnk2021", Drawing.Color.Gray, BorderStyle.Dashed, 1)



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Vendas Corrigida 12 Meses - PGR409"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboSize.CallSize = 100
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboMesInicial.Date.Month
        Session("sDIA_FINAL") = cboMesFinal.Date.Month
        Session("sANO_INTEIRO") = 1

        If chkCorrecao.Checked = True Then
            Session("sCORRECAO") = 1
        Else
            Session("sCORRECAO") = 0
        End If


    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()

        If chkCorrecao.Checked = True Then
            Show_Colunas()
        Else
            Hide_Colunas()
        End If


        grid.DataBind()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc2011")
        oFun.Grid_RedIsNegative(e, "percCresc2012")
        oFun.Grid_RedIsNegative(e, "percCresc2013")
        oFun.Grid_RedIsNegative(e, "percCresc2014")
        oFun.Grid_RedIsNegative(e, "percCresc2015")
        oFun.Grid_RedIsNegative(e, "percCresc2016")
        oFun.Grid_RedIsNegative(e, "percCresc2017")
        oFun.Grid_RedIsNegative(e, "percCresc2018")
        oFun.Grid_RedIsNegative(e, "percCresc2019")
        oFun.Grid_RedIsNegative(e, "percCresc2020")
        oFun.Grid_RedIsNegative(e, "percCresc2021")

        oFun.Grid_RedIsNegative(e, "percCrescCorr2010")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2011")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2012")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2013")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2014")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2015")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2016")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2017")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2018")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2019")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2020")
        oFun.Grid_RedIsNegative(e, "percCrescCorr2021")

        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2011", "vlr2011", "vlr2010", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2012", "vlr2012", "vlr2011", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2013", "vlr2013", "vlr2012", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2014", "vlr2014", "vlr2013", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2015", "vlr2015", "vlr2014", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2016", "vlr2016", "vlr2015", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2017", "vlr2017", "vlr2016", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2018", "vlr2018", "vlr2017", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2019", "vlr2019", "vlr2018", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2020", "vlr2020", "vlr2019", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc2021", "vlr2021", "vlr2020", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2010", "vlr2010", "vlr2010c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2011", "vlr2011", "vlr2011c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2012", "vlr2012", "vlr2012c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2013", "vlr2013", "vlr2013c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2014", "vlr2014", "vlr2014c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2015", "vlr2015", "vlr2015c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2016", "vlr2016", "vlr2016c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2017", "vlr2017", "vlr2017c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2018", "vlr2018", "vlr2018c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2019", "vlr2019", "vlr2019c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2020", "vlr2020", "vlr2020c", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescCorr2021", "vlr2021", "vlr2021c", Funcoes.CalculateType.Growth)


        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlr2021", "vlr2011", Funcoes.CalculateType.Growth)

    End Sub

    Private Sub Show_Colunas()
        oFun.Grid_Column_Visible(grid, "vlr2010c", True)
        oFun.Grid_Column_Visible(grid, "vlr2011c", True)
        oFun.Grid_Column_Visible(grid, "vlr2012c", True)
        oFun.Grid_Column_Visible(grid, "vlr2013c", True)
        oFun.Grid_Column_Visible(grid, "vlr2014c", True)
        oFun.Grid_Column_Visible(grid, "vlr2015c", True)
        oFun.Grid_Column_Visible(grid, "vlr2016c", True)
        oFun.Grid_Column_Visible(grid, "vlr2017c", True)
        oFun.Grid_Column_Visible(grid, "vlr2018c", True)
        oFun.Grid_Column_Visible(grid, "vlr2019c", True)
        oFun.Grid_Column_Visible(grid, "vlr2020c", True)
        oFun.Grid_Column_Visible(grid, "vlr2021c", True)

        oFun.Grid_Column_Visible(grid, "percCrescCorr2010", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2011", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2012", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2013", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2014", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2015", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2016", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2017", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2018", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2019", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2020", True)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2021", True)

    End Sub

    Private Sub Hide_Colunas()
        oFun.Grid_Column_Visible(grid, "vlr2010c", False)
        oFun.Grid_Column_Visible(grid, "vlr2011c", False)
        oFun.Grid_Column_Visible(grid, "vlr2012c", False)
        oFun.Grid_Column_Visible(grid, "vlr2013c", False)
        oFun.Grid_Column_Visible(grid, "vlr2014c", False)
        oFun.Grid_Column_Visible(grid, "vlr2015c", False)
        oFun.Grid_Column_Visible(grid, "vlr2016c", False)
        oFun.Grid_Column_Visible(grid, "vlr2017c", False)
        oFun.Grid_Column_Visible(grid, "vlr2018c", False)
        oFun.Grid_Column_Visible(grid, "vlr2019c", False)
        oFun.Grid_Column_Visible(grid, "vlr2020c", False)
        oFun.Grid_Column_Visible(grid, "vlr2021c", False)

        oFun.Grid_Column_Visible(grid, "percCrescCorr2010", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2011", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2012", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2013", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2014", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2015", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2016", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2017", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2018", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2019", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2020", False)
        oFun.Grid_Column_Visible(grid, "percCrescCorr2021", False)

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

End Class

