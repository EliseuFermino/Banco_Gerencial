Imports DevExpress.Web

Partial Class MemberPages_Gerencial_AnaliseHora_SemPascoa
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(208, User.Identity.Name)

            Me.cboMes.AutoPostBack = True
            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True
            Me.cboFilial.cboFilial_Visible_Legenda = False

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(Now())

            Call RotinaInicio()
            Call MudarTitualo()

        End If
    End Sub

    Private Sub RotinaInicio()
        Session("sUSUARIO") = User.Identity.Name
        Session("sANO") = cboAno.CallAno
        Session("sFILIAL") = 99
        Session("sLOJA_CORP") = 2

        Me.cboMes.CallMes = Month(Now())
        Me.cboAno.CallAno = Year(Now())
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Dim varStatus, varFilial As Byte
        If Me.rndEmpresa.Checked = True Then
            varStatus = 2
        Else
            varStatus = 1
        End If

        If Me.cboFilial.Visible = True Then
            varFilial = Me.cboFilial.CallFilial
        Else
            varFilial = 99
        End If

        'clData_gerManager.usp5("Vendas.uspAtualizarAnaliseHora_SemPascoa", "@ano", "@mes", "@usuario", "LojaCorp", "idFilial", Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name, varStatus, varFilial)
        Me.ASPxGridView1.DataBind()
        Me.gridLojaLoja.DataBind()
        Me.gridSecao.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call MudarTitualo()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

            oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "clrCresc", "vlrAnoAtual", "vlrAnoAnterior", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "clrCresc")
        oFun.Grid_RedIsNegative(e, "vlrDiferenca")

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call RotinaInicio()
            Call Atualizar()
            Me.ASPxGridView1.DataBind()
            Me.gridLojaLoja.DataBind()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise Vendas por Hora Sem Páscoa - PGR208"
    End Sub

    Protected Sub rndEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles rndEmpresa.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
            Call Atualizar()
        End If
    End Sub

    Protected Sub rndFilial_CheckedChanged(sender As Object, e As EventArgs) Handles rndFilial.CheckedChanged
        If Me.rndFilial.Checked = True Then
            Me.cboFilial.Visible = True
            Call Atualizar()
        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

 

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call RotinaInicio()
        Call Atualizar()
        Me.ASPxGridView1.DataBind()

    End Sub

    Private Sub MudarTitualo()
        Me.ASPxGridView1.Columns("vlrAnoAnterior").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns("vlrAnoAtual").Caption = Me.cboAno.CallAno

        Me.gridLojaLoja.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        Me.gridLojaLoja.Columns("vlr2").Caption = Me.cboAno.CallAno

        Me.gridSecao.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        Me.gridSecao.Columns("vlr2").Caption = Me.cboAno.CallAno

    End Sub

    Protected Sub gridLojaLoja_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridLojaLoja.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, gridLojaLoja, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)
    End Sub

   
    Protected Sub gridLojaLoja_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridLojaLoja.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")
    End Sub

    Protected Sub gridLojaLoja_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridLojaLoja.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridSecao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridSecao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")
    End Sub

    Protected Sub gridSecao_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridSecao.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Depto. Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridSecao, e, "Descricao", "Total", Drawing.Color.LightGreen, True)

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboMes.CallMes = Session("sMES")
        End If
    End Sub
End Class
