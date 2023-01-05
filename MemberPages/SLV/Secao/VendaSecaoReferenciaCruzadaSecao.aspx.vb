
Partial Class MemberPages_SLV_Secao_VendaSecaoReferenciaCruzadaSecao
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(431, User.Identity.Name)

            mySession()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Seção - Todas as Lojas e Empresa - PGR431"
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

        oFun.Grid_Decimals(grid, "1-Seca Pesada", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "2-Seca Salgada", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "3-Seca Doce", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "4-Seca Leve", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "5-Limpeza", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "6-Perfumaria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "7-Bebidas Quentes", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "8-Bebidas Frias", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "9-Saudáveis", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "11-Leite", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "12-Fiambreria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "13-Rotisseria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "14-Frios, Massas", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "15-Laticinios", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "16-Congelados", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "17-Padaria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "18-Confeitaria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "19-Paes, Bolos", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "21-Acougue", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "22-Granjeiros", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "23-Frutas & Hortalicas", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "25-Saudáveis", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "30-Ferragens", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "31-Papelaria", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "32-Casa", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "33-Brinquedos", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "34-Jardins", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "35-Animais", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "36-Musica", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "40-Calcados", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "41-Confeccoes", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "42-Cama", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "49-Puericultura", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "50-Eletrodomesticos", Funcoes.CasaDecimais.Duas)

        oFun.Grid_Decimals(grid, "51-Eletroportateis", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "52-Telefonia", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "53-Informatica", Funcoes.CasaDecimais.Duas)
        oFun.Grid_Decimals(grid, "54-Cine", Funcoes.CasaDecimais.Duas)

    End Sub

    Private Sub CasaDecimal_Nenhuma()

        oFun.Grid_Decimals(grid, "1-Seca Pesada", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "2-Seca Salgada", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "3-Seca Doce", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "4-Seca Leve", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "5-Limpeza", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "6-Perfumaria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "7-Bebidas Quentes", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "8-Bebidas Frias", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "9-Saudáveis", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "11-Leite", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "12-Fiambreria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "13-Rotisseria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "14-Frios, Massas", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "15-Laticinios", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "16-Congelados", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "17-Padaria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "18-Confeitaria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "19-Paes, Bolos", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "21-Acougue", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "22-Granjeiros", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "23-Frutas & Hortalicas", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "25-Saudáveis", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "30-Ferragens", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "31-Papelaria", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "32-Casa", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "33-Brinquedos", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "34-Jardins", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "35-Animais", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "36-Musica", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "40-Calcados", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "41-Confeccoes", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "42-Cama", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "49-Puericultura", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "50-Eletrodomesticos", Funcoes.CasaDecimais.Nenhuma)

        oFun.Grid_Decimals(grid, "51-Eletroportateis", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "52-Telefonia", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "53-Informatica", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_Decimals(grid, "54-Cine", Funcoes.CasaDecimais.Nenhuma)



    End Sub


End Class
