
Partial Class MemberPages_SLV_Secao_VendaSecaoReferenciaCruzadaFilial
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(232, User.Identity.Name)

            mySession()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Seção - Todas as Lojas e Empresa - PGR232"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Me.cboSize.CallSize = 100

            Atualizar()

        End If
    End Sub


#End Region

    Private Sub mySession()

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal

        ' Tipo Dados
        If cboTipoDados.SelectedIndex = 0 Then Session("sTipoDados") = 0 'Vendas
        If cboTipoDados.SelectedIndex = 1 Then Session("sTipoDados") = 1 'Margem Final
        If cboTipoDados.SelectedIndex = 2 Then Session("sTipoDados") = 2 'Numero de Clientes
        If cboTipoDados.SelectedIndex = 3 Then Session("sTipoDados") = 3 'Quantidade

        Select Case cboTipoDados.SelectedIndex
            Case 0
                CasaDecimal_Nenhuma()
            Case 1
                CasaDecimal_DuasCasas()
            Case 2
                CasaDecimal_Nenhuma()
            Case 3
                CasaDecimal_Nenhuma()
        End Select

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback


        Atualizar()

    End Sub

    Private Sub Atualizar()
        
        mySession()
        Me.grid.DataBind()


    End Sub



    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize)
    End Sub

    Private Sub CasaDecimal_DuasCasas()

        oFun.Grid_Decimals(grid, "Loja 3", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 4", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 5", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 6", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 7", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 8", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 9", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "Loja 10", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 11", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 13", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 14", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 15", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 17", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 18", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 19", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "Loja 20", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 21", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 22", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 23", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 24", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 25", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 26", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 27", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 28", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 29", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "Loja 30", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 31", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 32", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 33", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 34", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 36", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 37", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 38", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 39", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "Loja 40", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 41", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 42", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 43", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 44", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 45", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 46", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 47", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 48", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 49", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "Loja 50", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 51", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 52", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 53", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 54", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 55", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 56", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 57", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 58", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "Loja 59", Funcoes.CasaDecimais.Duas)


        oFun.Grid_Decimals(grid, "60", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "603", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "604", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "605", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "606", Funcoes.CasaDecimais.Duas)

    End Sub

    Private Sub CasaDecimal_Nenhuma()

        oFun.Grid_Decimals(grid, "Loja 3", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 5", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 6", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 7", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 8", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 9", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "Loja 10", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 11", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 13", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 14", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 15", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 17", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 18", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 19", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "Loja 20", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 21", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 22", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 23", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 24", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 25", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 26", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 27", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 28", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 29", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "Loja 30", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 31", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 32", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 33", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 34", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 36", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 37", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 38", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 39", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "Loja 40", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 41", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 42", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 43", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 44", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 45", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 46", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 47", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 48", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 49", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 50", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 51", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 52", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 53", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 54", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 55", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 56", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 57", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 58", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "Loja 59", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "vlrTotal", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "60", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "603", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "604", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "605", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "606", Funcoes.CasaDecimais.Nenhuma)



    End Sub

 
End Class
