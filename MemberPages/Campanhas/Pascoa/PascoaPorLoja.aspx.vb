Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Pascoa_PascoaPorLoja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(278, User.Identity.Name)

            Dim varAno As Int32
            Dim UltimoDiaPascoa As Date
            Dim DiaFinalPascoa As Date 'É o ultimo dia de pascoa em que a Raquel atualiza o estoque. Por exemplo, a pascoa em abril foi 05/04/2015, 
            'o ultimo dia de venda foi 04/04/2014, a Raquel vai te passar uma posição do estoque que sobrou no dia 06/04/2015.
            'Então esse é DiaFinalPascoa
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2018
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False

            UltimoDiaPascoa = #3/31/2018#

            If DateAndTime.Now().Date.AddDays(-1) >= UltimoDiaPascoa Then
                oFun.Grid_Title(grid, "Posição Atualizada até " & UltimoDiaPascoa)
            Else
                oFun.Grid_Title(grid, "Posição Atualizada até " & DateAndTime.Now().Date.AddDays(-1))
            End If


            oFun.Grid_Column_Wrap(grid, "nomeProduto", DevExpress.Utils.DefaultBoolean.False)
            oFun.Grid_Column_Wrap(grid, "nomeFornecedor", DevExpress.Utils.DefaultBoolean.False)


            oFun.Grid_ColumnFormat(grid, "L_99", "Total Empresa", "Total Empresa", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_3", "Loja 3-Santa", "Santa Felicidade", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_4", "Loja 4-Lapa", "Lapa", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_5", "Loja 5-Araucária", "Araucária", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_6", "Loja 6-Pinheirinho", "Pinheirinho", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_7", "Loja 7-Hauer", "hauer", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_8", "Loja 8-Paranaguá", "Paranaguá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_9", "Loja 9-Londrina", "Londrina", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_10", "Loja 10-Campo", "Campo Comprido", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_11", "Loja 11-São", "São Bráz", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_13", "Loja 13-Sitio", "Sitio Cercado", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_14", "Loja 14-São José", "São José dos Pinhais", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_15", "Loja 15-Apucarana", "Apucarana", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_17", "Loja 17-Ahú", "Ahú", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_18", "Loja 18-P.G. Centro", "Ponta Grossa Centro", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_19", "Loja 19-P.G. Nova", "Ponta Grossa Nova", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_20", "Loja 20-Maringá", "Maringá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_21", "Loja 21-Nilo", "Nilo Peçanha", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_22", "Loja 22-Champagnat", "Champagnat", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_23", "Loja 23-Araucária", "Araucária Nova", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_24", "Loja 24-Santa", "Santa Cândida", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_25", "Loja 25-Paranaguá", "Paranaguá Nova", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_26", "Loja 26-Torres", "Torres", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_27", "Loja 27-Novo Mundo", "Novo Mundo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_28", "Loja 28-Cristo Rei", "Cristo Rei", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_29", "Loja 29-Água Verde", "Água Verde", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_30", "Loja 30-Fazenda", "Fazenda Rio Grande", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_31", "Loja 31-Campo", "Campo Largo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_32", "Loja 32-P.G.Uvar", "Ponta Grossa Uvaranas", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_33", "Loja 33-S.J.Pinhais", "São José dos Pinhais", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_34", "Loja 34-Brasilia", "Brasilia", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_36", "Loja 36-Castro", "Castro", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_37", "Loja 37-Cajuru", "Cajuru", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_38", "Loja 38-Colombo", "Colombo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_39", "Loja 39-Pinhas", "Pinhas", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_40", "Loja 40-Maringá", "Maringá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_42", "Loja 42-P.G.Carvalho",  "Ponta Grossa Carvalho", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_43", "Loja 43-Almirante", "Almirante Tamandaré", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_44", "Loja 44-P.G.Oficinas", "Ponta Grossa Oficinas", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_45", "Loja 45-Araucária", "Araucária Costeira", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_46", "Loja 46-C.Largo", " Campo Largo Hiper", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_47", "Loja 47-Pinhais", "Pinhais - Av. Irai", Funcoes.CasaDecimais.Nenhuma)
            'oFun.Grid_ColumnFormat(grid, "L_46", "Loja 46-Campo", "Campo Largo", 70, Funcoes.CasaDecimais.Nenhuma)



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Pascoa Loja à Loja - PGR278"
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
        Session("sTIPO") = cboTipo.Value

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        If cboTipo.Value = 3 Then
            oFun.Grid_Footer_Visible(grid, False)
        Else
            oFun.Grid_Footer_Visible(grid, True)

        End If

        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_DataBound(sender As Object, e As EventArgs) Handles grid.DataBound
        If cboTipo.Value = 3 Then
            oFun.Grid_Decimals(grid, "L_3", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_4", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_5", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_6", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_7", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_8", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_9", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_10", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_11", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_13", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_14", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_15", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_17", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_18", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_19", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_20", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_21", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_22", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_23", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_24", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_25", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_26", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_27", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_28", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_29", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_30", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_31", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_32", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_33", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_34", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_36", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_37", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_38", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_39", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_40", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_42", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_43", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_44", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_45", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_46", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_47", Funcoes.CasaDecimais.Duas)


            oFun.Grid_Decimals(grid, "L_99", Funcoes.CasaDecimais.Duas)
        Else
            oFun.Grid_Decimals(grid, "L_3", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_4", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_5", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_6", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_7", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_8", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_9", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_10", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_11", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_13", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_14", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_15", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_17", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_18", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_19", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_20", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_21", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_22", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_23", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_24", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_25", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_26", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_27", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_28", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_29", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_30", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_31", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_32", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_33", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_34", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_36", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_37", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_38", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_39", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_40", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_42", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_43", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_44", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_45", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_46", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_47", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_99", Funcoes.CasaDecimais.Nenhuma)
        End If
    End Sub

End Class
