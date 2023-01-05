Imports DevExpress.Web.Data
Imports DevExpress.Web
Imports System.ComponentModel

Partial Class MemberPages_Planejamento_Vendas_frmCadVendaGrupoT
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(393, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now()) + 1

            Me.cboAno.AnoInicial = 2019
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            cboFilial.Visible_cboCorporacao = False

            AlterarCabecalhos()

            ' Bordas -----------------------
            oFun.Grid_Column_BorderRight(grid, "nomeGrupo", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percMetaMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "vlrHistAA3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartAA3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescAA3", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "vlrHistM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescM3", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percMargemTotalM1", Drawing.Color.Gray, BorderStyle.Solid, 2)

            divChk_Hist_Valor.Visible = True

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento Comercial - Cadastro de Metas por Grupo - PGR393"
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
        Session("sMES") = Me.cboMes.Date.Month
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = cboSecao.CallSecao
    End Sub

    Private Sub Opcao_Percentual_Valor()
        Dim myPercCresc As GridViewDataColumn = (TryCast(grid.Columns("percCrescAA"), GridViewDataColumn))
        Dim myValorMeta As GridViewDataColumn = (TryCast(grid.Columns("vlrMeta"), GridViewDataColumn))

        If chkPercentual.Checked = True Then
            myPercCresc.Settings.ShowEditorInBatchEditMode = True
            myValorMeta.Settings.ShowEditorInBatchEditMode = False
        Else
            myPercCresc.Settings.ShowEditorInBatchEditMode = False
            myValorMeta.Settings.ShowEditorInBatchEditMode = True
        End If


        If chkHistVlr.Checked = True Then
            grid.Columns("band_Hist_Ano_Valor").Visible = True
            grid.Columns("band_Hist_Mes_Valor").Visible = True
        Else
            grid.Columns("band_Hist_Ano_Valor").Visible = False
            grid.Columns("band_Hist_Mes_Valor").Visible = False
        End If


        If chkHistPerc.Checked = True Then
            grid.Columns("band_Hist_Ano_Percentual").Visible = True
            grid.Columns("band_Hist_Mes_Percentual").Visible = True
        Else
            grid.Columns("band_Hist_Ano_Percentual").Visible = False
            grid.Columns("band_Hist_Mes_Percentual").Visible = False
        End If


        If chkParticipacao.Checked = True Then
            grid.Columns("bandParticipacao_Ano").Visible = True
            grid.Columns("bandParticipacao_Mes").Visible = True
        Else
            grid.Columns("bandParticipacao_Ano").Visible = False
            grid.Columns("bandParticipacao_Mes").Visible = False
        End If

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        On Error Resume Next
        Atualizar()
        AlterarCabecalhos()
        Opcao_Percentual_Valor()


       

    End Sub

    Private Sub Atualizar()
        mySession()
        'oFun.Grid_Title(grid, "Cadastro de Meta de Venda por Grupo - PGR_Holy_Spirit_Help_Me")
        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Private Sub AlterarCabecalhos()

        Dim vMesPassado As Byte = DateAndTime.Now().AddMonths(-1).Month

        'vlrHistAA.Text = RetornaNomeMes(cboMes.CallMes) & "/" & cboAno.CallAno - 1

        ' oFun.Grid_ColumnTitle(grid, "percPartAA", oFun.RetornaNomeMes(cboMes.Date.Month) & "/" & cboAno.CallAno - 1)
        ' oFun.Grid_ColumnTitle(grid, "percCrescAA", oFun.RetornaNomeMes(cboMes.Date.Month) & " " & Right(cboAno.CallAno, 2) & " x " & Right(cboAno.CallAno - 1, 2))


        oFun.Grid_ColumnTitle(grid, "vlrHistAA1", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrHistAA1_Espelho", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrHistAA2", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "vlrHistAA3", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 3)


        oFun.Grid_ColumnTitle(grid, "percPartAA1", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percPartAA2", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "percPartAA3", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 3)

        oFun.Grid_ColumnTitle(grid, "percCrescAA", "% Cresc<br>" & Right(cboAno.CallAno, 2) & " x " & Right(cboAno.CallAno - 1, 2))
        oFun.Grid_ColumnTitle(grid, "percCrescAA1", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & Right(cboAno.CallAno - 1, 2) & " x " & Right(cboAno.CallAno - 2, 2))
        oFun.Grid_ColumnTitle(grid, "percCrescAA2", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & Right(cboAno.CallAno - 2, 2) & " x " & Right(cboAno.CallAno - 3, 2))
        oFun.Grid_ColumnTitle(grid, "percCrescAA3", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & Right(cboAno.CallAno - 3, 2) & " x " & Right(cboAno.CallAno - 4, 2))

        ' Mes -------

        oFun.Grid_ColumnTitle(grid, "vlrHistM1", oFun.RetornaNomeMes(vMesPassado) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrHistM2", oFun.RetornaNomeMes(vMesPassado - 1) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrHistM3", oFun.RetornaNomeMes(vMesPassado - 2) & "<br>" & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(grid, "percPartM1", oFun.RetornaNomeMes(vMesPassado) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percPartM2", oFun.RetornaNomeMes(vMesPassado - 1) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percPartM3", oFun.RetornaNomeMes(vMesPassado - 2) & "<br>" & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(grid, "percCrescM1", oFun.RetornaNomeMes(vMesPassado) & " x " & oFun.RetornaNomeMes(vMesPassado - 1) & " <br> " & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percCrescM2", oFun.RetornaNomeMes(vMesPassado - 1) & " x " & oFun.RetornaNomeMes(vMesPassado - 2) & " <br> " & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percCrescM3", oFun.RetornaNomeMes(vMesPassado - 2) & " x " & oFun.RetornaNomeMes(vMesPassado - 3) & " <br> " & cboAno.CallAno - 1)

        ' Margem
        oFun.Grid_ColumnTitle(grid, "percMargemTotalA1", oFun.RetornaNomeMes(cboMes.Date.Month) & "<br>" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemTotalM1", oFun.RetornaNomeMes(vMesPassado) & "<br>" & cboAno.CallAno - 1)



        'Select Case cboMes.Date.Month
        '    Case 1
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM4", oFun.RetornaNomeMes(9) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM3", oFun.RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM2", oFun.RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM1", oFun.RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)

        '    Case 2
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM4", oFun.RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM3", oFun.RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM2", oFun.RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM1", oFun.RetornaNomeMes(1) & "/" & cboAno.CallAno)
        '    Case 3
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM4", oFun.RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM3", oFun.RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM2", oFun.RetornaNomeMes(1) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM1", oFun.RetornaNomeMes(2) & "/" & cboAno.CallAno)
        '    Case Else
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM4", oFun.RetornaNomeMes(cboMes.Date.Month - 4) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM3", oFun.RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM2", oFun.RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "vlrHistM1", oFun.RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)

        '        oFun.Grid_ColumnTitle(grid, "percPartM1", oFun.RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "percPartM2", oFun.RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
        '        oFun.Grid_ColumnTitle(grid, "percPartM3", oFun.RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)

        '        oFun.Grid_ColumnTitle(grid, "percCrescM1", oFun.RetornaNomeMes(cboMes.Date.Month - 1) & " x " & oFun.RetornaNomeMes(cboMes.Date.Month - 2))
        '        oFun.Grid_ColumnTitle(grid, "percCrescM2", oFun.RetornaNomeMes(cboMes.Date.Month - 2) & " x " & oFun.RetornaNomeMes(cboMes.Date.Month - 3))
        '        oFun.Grid_ColumnTitle(grid, "percCrescM3", oFun.RetornaNomeMes(cboMes.Date.Month - 3) & " x " & oFun.RetornaNomeMes(cboMes.Date.Month - 4))
        'End Select



        'Me.lblTitulo_MetaGrupo.Text = "Meta " & RetornaNomeMes(Me.cboMes.CallMes) & "/" & Me.cboAno.CallAno
    End Sub

    Protected Sub grid_BatchUpdate(sender As Object, e As ASPxDataBatchUpdateEventArgs) Handles grid.BatchUpdate

        AlterarCabecalhos()
        Opcao_Percentual_Valor()

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA", "vlrMeta", "vlrHistAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA1", "vlrHistAA1", "vlrHistAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA2", "vlrHistAA2", "vlrHistAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA3", "vlrHistAA3", "vlrHistAA4", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM1", "vlrHistM1", "vlrHistM2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM2", "vlrHistM2", "vlrHistM3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM3", "vlrHistM3", "vlrHistM4", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotalA1", "vlrMargemTotalA1", "vlrHistAA1", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotalM1", "vlrMargemTotalM1", "vlrHistM1", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaMargemTotal", "vlrMetaMargemTotal", "vlrMeta", Funcoes.CalculateType.ValueOverRevenue)

      
    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "vlrHistAA1_Espelho", "vlrHistAA1", "0", Funcoes.CalculateType.Sum)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCrescAA")
        oFun.Grid_RedIsNegative(e, "percCrescAA1")
        oFun.Grid_RedIsNegative(e, "percCrescAA2")
        oFun.Grid_RedIsNegative(e, "percCrescAA3")

        oFun.Grid_RedIsNegative(e, "percCrescM1")
        oFun.Grid_RedIsNegative(e, "percCrescM2")
        oFun.Grid_RedIsNegative(e, "percCrescM3")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    

End Class

