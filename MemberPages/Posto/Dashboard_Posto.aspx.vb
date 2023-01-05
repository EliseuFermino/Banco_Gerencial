
Partial Class MemberPages_Posto_Dashboard_Posto
    Inherits System.Web.UI.Page

    Dim oDat As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(311, Page.User.Identity.Name)
            cboDia.CallDia = DateAndTime.Today.AddDays(-1)
            BuscarDados()
        End If

    End Sub

    Sub BuscarDados()

        ' COMBUSTIVEIS
        Preencher_Itens(9, lbl_Qtde_09, lbl_Vlr_09)
        Preencher_Itens(10, lbl_Qtde_10, lbl_Vlr_10)
        Preencher_Itens(11, lbl_Qtde_11, lbl_Vlr_11)
        Preencher_Itens(641, lbl_Qtde_641, lbl_Vlr_641)
        Preencher_Itens(12, lbl_Qtde_12, lbl_Vlr_12)
        Preencher_Itens(13, lbl_Qtde_13, lbl_Vlr_13)

        '---- OUTROS
        Preencher_Itens(26, lbl_Qtde_26, lbl_Vlr_26)
        Preencher_Itens(33, lbl_Qtde_33, lbl_Vlr_33)
        Preencher_Itens(32, lbl_Qtde_32, lbl_Vlr_32)
        Preencher_Itens(3, lbl_Qtde_3, lbl_Vlr_3)
        Preencher_Itens(25, lbl_Qtde_25, lbl_Vlr_25)
        Preencher_Itens(30, lbl_Qtde_30, lbl_Vlr_30)

        ' TOTALIZADORES
        Preencher_Totalizador(99, lbl_Qtde_Total_Combustiveis, lbl_Valor_Total_Combustiveis)
        Preencher_Totalizador(1, lbl_Qtde_Total_Gasolina, lbl_Valor_Total_Gasolina)
        Preencher_Totalizador(2, lbl_Qtde_Total_Diesel, lbl_Valor_Total_Diesel)
        Preencher_Totalizador(98, lbl_Qtde_Total_Outros, lbl_Valor_Total_Outros)
        Preencher_Totalizador(100, lbl_Qtde_Total_Geral, lbl_Valor_Total_Geral)

        ' CALCULOAS
        Calcular()

    End Sub

    Private Sub Preencher_Itens(ByVal codItem As Int16, ByVal Qtde As Label, ByVal Vlr As Label)
        BuscarDados_Det(codItem)
        Qtde.Text = CDbl(oDat.qtde).ToString("n0")
        Vlr.Text = CDbl(oDat.vlr).ToString("n0")
    End Sub

    Private Sub Preencher_Totalizador(ByVal codItem As Int16, ByVal Qtde As Label, ByVal Vlr As Label)
        BuscarDados_Totalizadores(codItem)
        Qtde.Text = CDbl(oDat.qtde).ToString("n0")
        Vlr.Text = CDbl(oDat.vlr).ToString("n0")
    End Sub

    Private Sub BuscarDados_Det(ByVal iPosto_Cod As String)
        oDat.Posto_BuscarDados("Posto.usp_Buscar", Conexao.Vendas_tr,
                                    "@Posto_Cod", iPosto_Cod,
                                    "@Dia", cboDia.CallDia,
                                    "@Posto_Filial", 1)
        'lblError.Text = oDat.varDesc
    End Sub

    Private Sub BuscarDados_Totalizadores(ByVal iPosto_Cod As String)
        oDat.Posto_BuscarDados("Posto.usp_Buscar_Dia_Totalizadores", Conexao.Vendas_tr,
                                    "@Posto_Cod", iPosto_Cod,
                                    "@Dia", cboDia.CallDia,
                                    "@Posto_Filial", 1)
        'lblError.Text = oDat.varDesc
    End Sub

    Private Sub Calcular_Crescimento(ByVal perc_Crescimento As Label, Valor As Label)
        If Valor.Text = 0 Then
            perc_Crescimento.Text = "0,00"
        Else
            perc_Crescimento.Text = ((Valor.Text / lbl_Valor_Total_Geral.Text) * 100).ToString("n2")
        End If

    End Sub

    Private Sub Calcular()

        Calcular_Crescimento(perc_Total_Combustiveis, lbl_Valor_Total_Combustiveis)
        Calcular_Crescimento(perc_Total_Gasolina, lbl_Valor_Total_Gasolina)
        Calcular_Crescimento(perc_Total_Diesel, lbl_Valor_Total_Diesel)
        Calcular_Crescimento(perc_Total_Outros, lbl_Valor_Total_Outros)

        Calcular_Crescimento(perc_09, lbl_Vlr_09)
        Calcular_Crescimento(perc_10, lbl_Vlr_10)
        Calcular_Crescimento(perc_11, lbl_Vlr_11)
        Calcular_Crescimento(perc_641, lbl_Vlr_641)
        Calcular_Crescimento(perc_12, lbl_Vlr_12)
        Calcular_Crescimento(perc_13, lbl_Vlr_13)

        Calcular_Crescimento(perc_26, lbl_Vlr_26)
        Calcular_Crescimento(perc_33, lbl_Vlr_33)
        Calcular_Crescimento(perc_32, lbl_Vlr_32)
        Calcular_Crescimento(perc_3, lbl_Vlr_3)
        Calcular_Crescimento(perc_25, lbl_Vlr_25)
        Calcular_Crescimento(perc_30, lbl_Vlr_30)

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        BuscarDados()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        BuscarDados()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        BuscarDados()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim userName As String
        userName = LCase(Page.User.Identity.Name)

        Select Case userName
            Case "eliseu", "eder", "joanir", "adailton"
                Response.Redirect("~/MemberPages/Default_Direction.aspx")
            Case Else
                Response.Redirect("~/MemberPages/menuPrincipal.aspx")
        End Select
    End Sub
End Class
