Imports DevExpress.Web



Partial Class MemberPages_Replanejamento_webReplanPartic
    Inherits System.Web.UI.Page

    Dim oVEM As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        On Error Resume Next

        If Not IsPostBack Then
            Dim oMF As New MyFunction
            cboAno.AutoPostBack = True
            cboFilial.AutoPostBack = True


            oVEM.AtualizarEstatisticaPrograma(20, User.Identity.Name)   '20 - CMV Replanejamento Vendas

            Dim meuDia As Date = "01/10/2022"
            cboMes.Date = meuDia
            cboAno.CallAno = Year(meuDia)


                cboAno.AnoInicial = Year(Now()) - 3
                cboAno.AnoFinal = Year(Now()) + 1

                cboFilial.Visible_cboCorporacao = False
                grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible

                oFun.Grid_Column_BorderLeft(grid, "vlrHistAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "vlrHistM4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "vlrHistM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "vlrHistM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "vlrHistM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid, "vlrMeta", Drawing.Color.Gray, BorderStyle.Solid, 2)

                oFun.Grid_Column_BorderLeft(grid, "percPartM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid, "percPartM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "percPartM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "percPartAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

                oFun.Grid_Column_BorderLeft(grid, "percCrescM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid, "percCrescM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "percCrescM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid, "percCrescAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

                ' -------

                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrHistAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrHistM4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrHistM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrHistM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrHistM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "vlrMeta", Drawing.Color.Gray, BorderStyle.Solid, 2)

                oFun.Grid_Column_BorderLeft(grid_Departamento, "percPartM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percPartM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percPartM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percPartAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

                oFun.Grid_Column_BorderLeft(grid_Departamento, "percCrescM1", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percCrescM2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percCrescM3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
                oFun.Grid_Column_BorderLeft(grid_Departamento, "percCrescAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

                ' ---------

                Session("sANO") = cboAno.CallAno
                Session("sMES") = cboMes.Date.Month
                Session("sFILIAL") = cboFilial.CallFilial

                grid.DataBind()

                AlterarCabecalhos()
                AlterarCabecalhos_Departamento()

                oFun.Grid_Title(grid, "Meta de Venda por Seção")
                oFun.Grid_Title(grid_Departamento, "Meta de Venda por Departamento")



            End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete, cbPanel.Callback
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 2 - Participação - PGR20"

        End If

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.Date.Month
        Session("sFILIAL") = cboFilial.CallFilial


        grid.DataBind()
        grid_Departamento.DataBind()
        'AlterarCabecalhos()
        LiberarSalvar()

    End Sub

    Private Sub AlterarCabecalhos()

        'vlrHistAA.Text = RetornaNomeMes(cboMes.CallMes) & "/" & cboAno.CallAno - 1
        oFun.Grid_ColumnTitle(grid, "vlrHistAA", RetornaNomeMes(cboMes.Date.Month) & "/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percPartAA", RetornaNomeMes(cboMes.Date.Month) & "/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percCrescAA", RetornaNomeMes(cboMes.Date.Month) & " " & Right(cboAno.CallAno, 2) & " x " & Right(cboAno.CallAno - 1, 2))

        Select Case cboMes.Date.Month
            Case 1
                oFun.Grid_ColumnTitle(grid, "vlrHistM4", RetornaNomeMes(9) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM3", RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM2", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM1", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)



            Case 2
                oFun.Grid_ColumnTitle(grid, "vlrHistM4", RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM3", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM2", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM1", RetornaNomeMes(1) & "/" & cboAno.CallAno)
            Case 3
                oFun.Grid_ColumnTitle(grid, "vlrHistM4", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM3", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid, "vlrHistM2", RetornaNomeMes(1) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "vlrHistM1", RetornaNomeMes(2) & "/" & cboAno.CallAno)
            Case Else
                oFun.Grid_ColumnTitle(grid, "vlrHistM4", RetornaNomeMes(cboMes.Date.Month - 4) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "vlrHistM3", RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "vlrHistM2", RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "vlrHistM1", RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)

                grid.Columns("vlrHistM1").ToolTip = "A Venda do mês de " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " é uma Projeção de Vendas, Venda Realizada até ontem e Meta de Venda até o final do mês."



                oFun.Grid_ColumnTitle(grid, "percPartM1", RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "percPartM2", RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid, "percPartM3", RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)

                grid.Columns("percPartM1").ToolTip = "A Participação de Vendas do mês de " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " esta sobre a Projeção de Vendas, Venda Realizada até ontem e Meta de Venda até o final do mês."

                oFun.Grid_ColumnTitle(grid, "percCrescM1", RetornaNomeMes(cboMes.Date.Month - 1) & " x " & RetornaNomeMes(cboMes.Date.Month - 2))
                oFun.Grid_ColumnTitle(grid, "percCrescM2", RetornaNomeMes(cboMes.Date.Month - 2) & " x " & RetornaNomeMes(cboMes.Date.Month - 3))
                oFun.Grid_ColumnTitle(grid, "percCrescM3", RetornaNomeMes(cboMes.Date.Month - 3) & " x " & RetornaNomeMes(cboMes.Date.Month - 4))

                grid.Columns("percCrescM1").ToolTip = "O Percentual de Crescimento de Venda " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " esta calculado na Projeção de Vendas  (Venda Realizada até ontem e Meta de Venda até o final do mês) sobre a Venda Realizada de " & RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno & "."

        End Select



        'Me.lblTitulo_MetaGrupo.Text = "Meta " & RetornaNomeMes(Me.cboMes.CallMes) & "/" & Me.cboAno.CallAno
    End Sub


    Private Sub AlterarCabecalhos_Departamento()

        'vlrHistAA.Text = RetornaNomeMes(cboMes.CallMes) & "/" & cboAno.CallAno - 1
        oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistAA", RetornaNomeMes(cboMes.Date.Month) & "/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid_Departamento, "percPartAA", RetornaNomeMes(cboMes.Date.Month) & "/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid_Departamento, "percCrescAA", RetornaNomeMes(cboMes.Date.Month) & " " & Right(cboAno.CallAno, 2) & " x " & Right(cboAno.CallAno - 1, 2))

        Select Case cboMes.Date.Month
            Case 1
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM4", RetornaNomeMes(9) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM3", RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM2", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM1", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)



            Case 2
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM4", RetornaNomeMes(10) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM3", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM2", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM1", RetornaNomeMes(1) & "/" & cboAno.CallAno)
            Case 3
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM4", RetornaNomeMes(11) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM3", RetornaNomeMes(12) & "/" & cboAno.CallAno - 1)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM2", RetornaNomeMes(1) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM1", RetornaNomeMes(2) & "/" & cboAno.CallAno)
            Case Else
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM4", RetornaNomeMes(cboMes.Date.Month - 4) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM3", RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM2", RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "vlrHistM1", RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)

                grid_Departamento.Columns("vlrHistM1").ToolTip = "A Venda do mês de " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " é uma Projeção de Vendas, Venda Realizada até ontem e Meta de Venda até o final do mês."



                oFun.Grid_ColumnTitle(grid_Departamento, "percPartM1", RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "percPartM2", RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno)
                oFun.Grid_ColumnTitle(grid_Departamento, "percPartM3", RetornaNomeMes(cboMes.Date.Month - 3) & "/" & cboAno.CallAno)

                grid_Departamento.Columns("percPartM1").ToolTip = "A Participação de Vendas do mês de " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " esta sobre a Projeção de Vendas, Venda Realizada até ontem e Meta de Venda até o final do mês."

                oFun.Grid_ColumnTitle(grid_Departamento, "percCrescM1", RetornaNomeMes(cboMes.Date.Month - 1) & " x " & RetornaNomeMes(cboMes.Date.Month - 2))
                oFun.Grid_ColumnTitle(grid_Departamento, "percCrescM2", RetornaNomeMes(cboMes.Date.Month - 2) & " x " & RetornaNomeMes(cboMes.Date.Month - 3))
                oFun.Grid_ColumnTitle(grid_Departamento, "percCrescM3", RetornaNomeMes(cboMes.Date.Month - 3) & " x " & RetornaNomeMes(cboMes.Date.Month - 4))

                grid_Departamento.Columns("percCrescM1").ToolTip = "O Percentual de Crescimento de Venda " & RetornaNomeMes(cboMes.Date.Month - 1) & "/" & cboAno.CallAno & " esta calculado na Projeção de Vendas  (Venda Realizada até ontem e Meta de Venda até o final do mês) sobre a Venda Realizada de " & RetornaNomeMes(cboMes.Date.Month - 2) & "/" & cboAno.CallAno & "."

        End Select



        'Me.lblTitulo_MetaGrupo.Text = "Meta " & RetornaNomeMes(Me.cboMes.CallMes) & "/" & Me.cboAno.CallAno
    End Sub


    Private Function RetornaNomeMes(ByVal Mes As Byte) As String

        Select Case Mes
            Case 1
                RetornaNomeMes = "Jan"
            Case 2
                RetornaNomeMes = "Fev"
            Case 3
                RetornaNomeMes = "Mar"
            Case 4
                RetornaNomeMes = "Abr"
            Case 5
                RetornaNomeMes = "Mai"
            Case 6
                RetornaNomeMes = "Jun"
            Case 7
                RetornaNomeMes = "Jul"
            Case 8
                RetornaNomeMes = "Ago"
            Case 9
                RetornaNomeMes = "Set"
            Case 10
                RetornaNomeMes = "Out"
            Case 11
                RetornaNomeMes = "Nov"
            Case 12
                RetornaNomeMes = "Dez"
            Case Else
                RetornaNomeMes = "Ver"
        End Select

    End Function




    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM1", "vlrHistM1", "vlrHistM2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM2", "vlrHistM2", "vlrHistM3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM3", "vlrHistM3", "vlrHistM4", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA", "vlrMeta", "vlrHistAA", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub grid_Departamento_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Departamento.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM1", "vlrHistM1", "vlrHistM2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM2", "vlrHistM2", "vlrHistM3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescM3", "vlrHistM3", "vlrHistM4", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescAA", "vlrMeta", "vlrHistAA", Funcoes.CalculateType.Growth)
    End Sub


    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescM1")
        oFun.Grid_RedIsNegative(e, "percCrescM2")
        oFun.Grid_RedIsNegative(e, "percCrescM3")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
    End Sub

    Protected Sub grid_Departamento_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Departamento.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescM1")
        oFun.Grid_RedIsNegative(e, "percCrescM2")
        oFun.Grid_RedIsNegative(e, "percCrescM3")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Departamento_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid_Departamento.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub LiberarSalvar()

        Select Case User.Identity.Name
            Case "Eliseu", "Jesuli"
                grid.SettingsDataSecurity.AllowEdit = True

            Case Else
                oVEM.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Session("sMES"), Me.cboFilial.CallFilial)
                If oVEM.LiberaParticipacao = True Then
                    grid.SettingsDataSecurity.AllowEdit = True
                    grid.DataBind()
                Else
                    grid.SettingsDataSecurity.AllowEdit = False
                    grid.DataBind()
                End If
        End Select

    End Sub


    Protected Sub grid_BatchUpdate(sender As Object, e As DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs) Handles grid.BatchUpdate
        grid_Departamento.DataBind()
    End Sub
End Class
