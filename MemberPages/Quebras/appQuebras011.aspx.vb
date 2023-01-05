Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Quebras_appQuebras011
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Dim vAno_Inicial As Integer = DateAndTime.Year(cboPeriodo.CallDiaInicial)
        Dim vAno_Final As Integer = DateAndTime.Year(cboPeriodo.CallDiaFinal)

        Dim vMes_Inicial As Byte = DateAndTime.Month(cboPeriodo.CallDiaInicial)
        Dim vMes_Final As Byte = DateAndTime.Month(cboPeriodo.CallDiaFinal)

        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal

        If vAno_Inicial <> vAno_Final Then
            divInformation.Visible = True
            Exit Sub
        ElseIf vMes_Inicial <> vMes_Final Then
            divInformation.Visible = True
            Exit Sub
        Else

            Dim varOpcao As Byte
            If Me.cboMercadologico.opcaoTotalChecked = True Then varOpcao = 1
            If Me.cboMercadologico.opcaoDeptoChecked = True Then varOpcao = 2
            If Me.cboMercadologico.opcaoSecaoChecked = True Then varOpcao = 3
            If Me.cboMercadologico.opcaoGrupoChecked = True Then varOpcao = 4
            If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varOpcao = 5

            Session("sOPCAO") = varOpcao

            If rndOpcaoMesAnterior.Checked = True Then Session("sMES_ANO_ANTERIOR") = 1
            If rndOpcaoAnoAnterior.Checked = True Then Session("sMES_ANO_ANTERIOR") = 2

            Select Case varOpcao
                Case 2 ' Departamento
                    Session("sMERCADOLOGICO") = Me.cboMercadologico.CallDepto
                Case 3  ' Seção
                    Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSecao
                Case 4  ' Grupo
                    Session("sMERCADOLOGICO") = Me.cboMercadologico.CallGrupo
                Case 5  ' Subgrupo
                    Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSubgrupo
            End Select

            If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
                Me.grid.Columns.Item("Lista").Caption = "Departamento"
                oVem.AtualizarEstatisticaPrograma(201, User.Identity.Name)
            End If

            If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
                Me.grid.Columns.Item("Lista").Caption = "Seção"
                oVem.AtualizarEstatisticaPrograma(202, User.Identity.Name)
            End If

            If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
                Me.grid.Columns.Item("Lista").Caption = "Grupo"
                oVem.AtualizarEstatisticaPrograma(203, User.Identity.Name)
            End If

            If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
                Me.grid.Columns.Item("Lista").Caption = "Familia"
                oVem.AtualizarEstatisticaPrograma(204, User.Identity.Name)
            End If

            If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
                Me.grid.Columns.Item("Lista").Caption = "Item"
                oVem.AtualizarEstatisticaPrograma(205, User.Identity.Name)
            End If

            Call MudarLegenda()

            Me.grid.Visible = True
            Me.grid.DataBind()
            Me.chartPercentual.DataBind()
            Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(200, User.Identity.Name)
  
            Session("sOPCAO") = 1
            Session("sMERCADOLOGICO") = 1
            Session("sMES_ANO_ANTERIOR") = 1    '1=Mes   2=Ano
            Me.rndOpcaoMesAnterior.Checked = True
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo Agenda 23 - por Nivel de Mercadológico - PGR200"
        CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações da agenda 23 do Ano Atual e Ano Anterior. Há ainda informações de meta de venda e margem e ainda há a diferença e o % de Crescimento da agenda 23."

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        'Calculo da Margem 
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo da Percentual Agenda 23 - Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAT", "vlrAT", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo da Percentual Agenda 23 - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAA", "vlrAA", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo da Percentual Agenda 23 - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "vlrDif")
        oFun.Grid_RedIsNegative(e, "percMargem")

        oFun.Grid_RedIsNegative(e, "qtdeAT")
        oFun.Grid_RedIsNegative(e, "vlrAT")
        oFun.Grid_RedIsNegative(e, "qtdeAA")
        oFun.Grid_RedIsNegative(e, "vlrAA")
        oFun.Grid_RedIsNegative(e, "vlrDif")
        oFun.Grid_RedIsNegative(e, "percAT")
        oFun.Grid_RedIsNegative(e, "percAA")

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
           
            Me.cboSize.CallSize = 100
        End If
    End Sub

    Private Sub MudarLegenda()
        oFun.Grid_ColumnTitle(grid, "bandVenda", "Venda e Margem " & Year(Me.cboPeriodo.CallDiaFinal))
        oFun.Grid_ColumnTitle(grid, "bandAgendaAT", "Agenda 23 - " & MonthName(Month(cboPeriodo.CallDiaFinal)) & "/" & Year(Me.cboPeriodo.CallDiaFinal))
        If rndOpcaoMesAnterior.Checked = True Then
            oFun.Grid_ColumnTitle(grid, "bandAgendaAA", "Agenda 23 - " & MonthName(Month(DateAdd(DateInterval.Month, -1, cboPeriodo.CallDiaFinal))) & "/" & Year(DateAdd(DateInterval.Month, -1, Me.cboPeriodo.CallDiaFinal)))
        Else
            oFun.Grid_ColumnTitle(grid, "bandAgendaAA", "Agenda 23 - " & MonthName(Month(cboPeriodo.CallDiaFinal)) & "/" & Year(DateAdd(DateInterval.Year, -1, Me.cboPeriodo.CallDiaFinal)))
        End If


    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

   
End Class
