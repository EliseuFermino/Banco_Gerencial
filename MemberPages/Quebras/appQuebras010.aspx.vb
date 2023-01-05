Imports DevExpress.Web

Partial Class MemberPages_Quebras_appQuebras010
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oPro As New Projeto
    Dim oVem As New VendaEmpresaMes

    Private Sub CreateSession()

        If Me.cboMercadologico.Checked_rdTotal = True Then Session("sOPCAO") = 1
        If Me.cboMercadologico.Checked_rdDepartamento = True Then Session("sOPCAO") = 2
        If Me.cboMercadologico.Checked_rdSecao = True Then Session("sOPCAO") = 3
        If Me.cboMercadologico.Checked_rdGrupo = True Then Session("sOPCAO") = 4
        If Me.cboMercadologico.Checked_rdSubgrupo = True Then Session("sOPCAO") = 5

    End Sub

    Protected Sub cbPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel1.Callback


        Call CreateSession()

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal


        If Me.cboMercadologico.Checked_rdTotal = True Then    'Total - Exibe todos os departamento
            Me.grid1.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(108, User.Identity.Name)
        End If

        If Me.cboMercadologico.Checked_rdDepartamento = True Then    'Total - Exibe todos os departamento
            Me.grid1.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(107, User.Identity.Name)
        End If

        If Me.cboMercadologico.Checked_rdSecao = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid1.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(106, User.Identity.Name)
        End If

        If Me.cboMercadologico.Checked_rdGrupo = True Then    'Seção - Exibe todos os grupos da seção selecionada 
            Me.grid1.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(105, User.Identity.Name)
        End If

        If Me.cboMercadologico.Checked_rdSubgrupo = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid1.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(104, User.Identity.Name)
        End If

        

        Me.grid1.Visible = True
        Me.grid1.DataBind()
    End Sub

 

    Protected Sub grid1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid1.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percCresc", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargemCheia", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percAg23", "vlrAg23", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percAg51", "vlrAg51", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percAg52", "vlrAg52", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid1, "percDiv", "vlrDiv", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemCheia")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percAg51")
        oFun.Grid_RedIsNegative(e, "percAg52")
        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "Qtde52")
        oFun.Grid_RedIsNegative(e, "Qtde23")
        oFun.Grid_RedIsNegative(e, "vlrAg52")
        oFun.Grid_RedIsNegative(e, "vlrAg23")
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "QtdeQuebra")
        oFun.Grid_RedIsNegative(e, "vlrDiv")
        oFun.Grid_RedIsNegative(e, "QtdeDiv")

        'Band Perdas
        If e.DataColumn.FieldName = "CFTV" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Antena" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "PPP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

    End Sub

    Protected Sub grid1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid1, e, "FilialLista", "00 - Empresa Total", System.Drawing.Color.LightGreen, True)

    End Sub

    Protected Sub grid1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid1.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(131, User.Identity.Name)
            Me.grid1.Visible = True

            oPro.BuscarLocalDoUsuario(LCase(LTrim(RTrim(Page.User.Identity.Name))))
            If oPro.Isloja = True Then
                oFun.Grid_Column_Visible(grid1, "bandVenda", False)
                oFun.Grid_Column_Visible(grid1, "bandLucro", False)
            Else
                oFun.Grid_Column_Visible(grid1, "bandVenda", True)
                oFun.Grid_Column_Visible(grid1, "bandLucro", True)
            End If

            'lblError.Text = oPro.Isloja & " - " & oPro.Depto & " - " & oPro.Filial & " - " & LCase(LTrim(RTrim(Page.User.Identity.Name)))

            Me.grid1.DataBind()
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            'Me.grid1.Visible = True
            'Me.grid1.DataBind()
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call CreateSession()
            Session("sOPCAO") = 1
            Session("sMERCADOLOGICO") = 1


        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra Loja a Loja - PGR405"
    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid1, cboSize.CallSize)
    End Sub
End Class
