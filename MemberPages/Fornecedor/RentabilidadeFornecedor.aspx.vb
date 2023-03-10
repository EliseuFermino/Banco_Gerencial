
Partial Class MemberPages_Fornecedor_RentabilidadeFornecedor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(277, User.Identity.Name)

            Dim myMonth As Byte = Month(DateAndTime.Now()) - 1

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False

            cboMesInicial.CallMes = myMonth
            cboMesFinal.CallMes = myMonth

            oFun.Grid_Column_BorderRight(grid, "NomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percOperComl", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "CP_Trocas", Drawing.Color.Gray, BorderStyle.Solid, 2)


            oFun.Grid_ColumnFormat(grid, "CP_Fidelidade", "Fidelidade", "Fidelidade do Contas à Pagar", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(grid, "CP_Logistica", "Logistica", "Logistica do Contas à Pagar", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(grid, "CP_Publicidade", "Publicidade", "Publicidade do Contas à Pagar", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(grid, "CP_Trocas", "Trocas", "Trocas do Contas à Pagar", Funcoes.CasaDecimais.Nenhuma, 80)


            cboMesInicial.LabelDescMes = "Mês Inicial"
            cboMesFinal.LabelDescMes = "Mês Final"

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Rentabilidade do Fornecedor - PGR277"
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
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes

        If chkBaseCNPJ.Checked = True Then
            Session("sCNPJ") = 0
        Else
            Session("sCNPJ") = 1
        End If

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.CheckBoxStatusExibir(chkShowAgendas, grid, "bandOperacoes")
        oFun.CheckBoxStatusExibir(chkShowAgendas, grid, "bandTotalFinal")
        oFun.CheckBoxStatusExibir(chkShowAgendas, grid, "bandContasPagar")

        If chkBaseCNPJ.Checked = True Then
            oFun.Grid_Column_Visible(grid, "idFornecedor", False)
            oFun.Grid_Column_Visible(grid, "nomeFornecedor", False)

        Else
            oFun.Grid_Column_Visible(grid, "idFornecedor", True)
            oFun.Grid_Column_Visible(grid, "nomeFornecedor", True)

        End If

        grid.DataBind()
    End Sub



    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percOperComl", "vlrOperComl", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percFornecedor", "vlrLucroFornecedor", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

End Class

