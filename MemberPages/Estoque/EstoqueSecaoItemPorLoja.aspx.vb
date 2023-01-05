Imports DevExpress.Web

Partial Class MemberPages_Estoque_PorLoja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(283, User.Identity.Name)

            Dim varAno As Int32

            varAno = Year(Now())


            'If DateAndTime.Now().Date.AddDays(-1) >= UltimoDiaPascoa Then
            '    oFun.Grid_Title(grid, "Posição Atualizada até " & UltimoDiaPascoa)
            'Else
            '    oFun.Grid_Title(grid, "Posição Atualizada até " & DateAndTime.Now().Date.AddDays(-1))
            'End If


            oFun.Grid_Column_Wrap(grid, "nomeProduto", DevExpress.Utils.DefaultBoolean.False)
            'oFun.Grid_Column_Wrap(grid, "nomeFornecedor", DevExpress.Utils.DefaultBoolean.False)


            oFun.Grid_ColumnFormat(grid, "L_99", "Total Empresa", "Total Empresa", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_TotalAtacarejo", "Total Atacarejo", "Total Atacarejo", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_1", "Depósito", "Loja 1 - Depósito Central", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_3", "3-Santa", "Santa Felicidade", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_4", "4-Lapa", "Lapa", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_5", "5-Araucária", "Araucária", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_6", "6-Pinheirinho", "Pinheirinho", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_7", "7-Hauer", "hauer", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_8", "8-Paranaguá", "Paranaguá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_9", "9-Londrina", "Londrina", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_10", "10-Campo", "Campo Comprido", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_11", "11-São", "São Bráz", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_12", "Trocas", "12 - Trocas", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_13", "13-Sitio", "Sitio Cercado", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_14", "14-São José", "São José dos Pinhais", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_15", "15-Apucarana", "Apucarana", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_16", "Ceasa", "16 - Ceasa", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_17", "17-Ahú", "Ahú", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_18", "18-P.G. Centro", "Ponta Grossa Centro", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_19", "19-P.G. Nova", "Ponta Grossa Nova", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_20", "20-Maringá", "Maringá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_21", "21-Nilo", "Nilo Peçanha", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_22", "22-Champagnat", "Champagnat", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_23", "23-Araucária", "Araucária Nova", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_24", "24-Santa", "Santa Cândida", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_25", "25-Paranaguá", "Paranaguá Nova", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_26", "26-Torres", "Torres", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_27", "27-Novo Mundo", "Novo Mundo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_28", "28-Cristo Rei", "Cristo Rei", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_29", "29-Água Verde", "Água Verde", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_30", "30-Fazenda", "Fazenda Rio Grande", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_31", "31-Campo", "Campo Largo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_32", "32-P.G.Uvar", "Ponta Grossa Uvaranas", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_33", "33-S.J.Pinhais", "São José dos Pinhais", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_34", "34-Brasilia", "Brasilia", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_36", "36-Castro", "Castro", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_37", "37-Cajuru", "Cajuru", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_38", "38-Colombo", "Colombo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_39", "39-Pinhas", "Pinhas", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_40", "40-Maringá", "Maringá", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_41", "41-Campo Mourão", "Campo Mourão", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_42", "42-P.G.Carvalho", "Ponta Grossa Carvalho", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_43", "43-Almirante", "Almirante Tamandaré", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_44", "44-P.G.Oficinas", "Ponta Grossa Oficinas", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_45", "45-Araucária", "Araucária Costeira", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_46", "46-Campo", "Campo Largo", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_47", "47-Pinhais", "Pinhais - Av. Irai", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_48", "48-Joinvile", "Joinvile", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_49", "49-Boa Vista", "Boa Vista", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_50", "50 - Santa Quitéria", "Santa Quitéria", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_51", "51 - Joinvile America", "Joinvile America", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_52", "52 - Mafra", "Mafra", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_53", "53 - João Bettega", "João Bettega", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_54", "54 - Derosso", "Derosso", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_55", "55 - Jaragua", "Jaragua", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_56", "56 - Piraquara", "Piraquara", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_57", "57 - Joinvile", "Joinvile", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_ColumnFormat(grid, "L_58", "58 - Pilarzinho", "Pilarzinho", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_59", "59 - Express", "Express", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_603", "603 - Gigante JK", "Gigante JK", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnFormat(grid, "L_604", "604 - Gigante Colombo", "Gigante Colombo", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Column_BorderRight(grid, "descProdutoSubgrupoLista", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "L_TotalAtacarejo", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "L_99", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_1", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_3", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_4", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_5", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_6", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_7", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_8", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_9", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_10", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_11", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_12", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_13", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_14", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_15", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_16", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_17", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_18", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_19", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_20", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_21", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_22", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_23", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_24", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_25", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_26", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_27", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_28", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_29", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_30", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_31", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_32", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_33", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_34", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_36", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_37", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_38", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_39", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_40", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_41", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_42", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_43", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_44", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_45", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_46", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_47", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_48", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_49", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_50", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_51", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_52", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_53", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_54", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_55", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_56", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_57", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_58", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_59", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "L_603", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "L_604", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Posição de Estoque por Filial - PGR283"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSecao.CallSecao = 1
            cboTipo.Text = "Volume em Estoque"
            mySession()

            oFun.Grid_Title(grid, "Posição do Estoque Contábil do Dia " + DateAdd(DateInterval.Day, -1, DateAndTime.Now()).Date)
            cboSize.CallSize = 100
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sTIPO") = cboTipo.Value
        Session("sSECAO") = cboSecao.CallSecao

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

        Select Case cboSize.CallSize
            Case 100
                grid.SettingsPager.PageSize = 18
            Case 110
                grid.SettingsPager.PageSize = 20
            Case 120
                grid.SettingsPager.PageSize = 22
            Case 130
                grid.SettingsPager.PageSize = 23
            Case 140
                grid.SettingsPager.PageSize = 25
            Case 150
                grid.SettingsPager.PageSize = 26
        End Select
        Atualizar()
    End Sub

    Protected Sub grid_DataBound(sender As Object, e As EventArgs) Handles grid.DataBound
        If cboTipo.Value = 3 Then
            oFun.Grid_Decimals(grid, "L_1", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_3", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_4", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_5", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_6", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_7", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_8", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_9", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_10", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_11", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_12", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_13", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_14", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_15", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_16", Funcoes.CasaDecimais.Duas)
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
            oFun.Grid_Decimals(grid, "L_41", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_42", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_43", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_44", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_45", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_46", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_47", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_48", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_49", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_50", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_51", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_52", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_53", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_54", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_55", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_56", Funcoes.CasaDecimais.Duas)
            oFun.Grid_Decimals(grid, "L_57", Funcoes.CasaDecimais.Duas)

            oFun.Grid_Decimals(grid, "L_99", Funcoes.CasaDecimais.Duas)
        Else
            oFun.Grid_Decimals(grid, "L_1", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_3", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_4", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_5", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_6", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_7", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_8", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_9", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_10", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_11", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_12", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_13", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_14", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_15", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_16", Funcoes.CasaDecimais.Nenhuma)
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
            oFun.Grid_Decimals(grid, "L_41", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_42", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_43", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_44", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_45", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_46", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_47", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_48", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_49", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_50", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_51", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_52", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_53", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_54", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_55", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_56", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_57", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_58", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_59", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_603", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_603", Funcoes.CasaDecimais.Nenhuma)

            oFun.Grid_Decimals(grid, "L_99", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "L_TotalAtacarejo", Funcoes.CasaDecimais.Nenhuma)
        End If
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "L_1")
        oFun.Grid_RedIsNegative(e, "L_3")
        oFun.Grid_RedIsNegative(e, "L_4")
        oFun.Grid_RedIsNegative(e, "L_5")
        oFun.Grid_RedIsNegative(e, "L_6")
        oFun.Grid_RedIsNegative(e, "L_7")
        oFun.Grid_RedIsNegative(e, "L_8")
        oFun.Grid_RedIsNegative(e, "L_9")

        oFun.Grid_RedIsNegative(e, "L_10")
        oFun.Grid_RedIsNegative(e, "L_11")
        oFun.Grid_RedIsNegative(e, "L_12")
        oFun.Grid_RedIsNegative(e, "L_13")
        oFun.Grid_RedIsNegative(e, "L_14")
        oFun.Grid_RedIsNegative(e, "L_15")
        oFun.Grid_RedIsNegative(e, "L_16")
        oFun.Grid_RedIsNegative(e, "L_17")
        oFun.Grid_RedIsNegative(e, "L_18")
        oFun.Grid_RedIsNegative(e, "L_19")

        oFun.Grid_RedIsNegative(e, "L_20")
        oFun.Grid_RedIsNegative(e, "L_21")
        oFun.Grid_RedIsNegative(e, "L_22")
        oFun.Grid_RedIsNegative(e, "L_23")
        oFun.Grid_RedIsNegative(e, "L_24")
        oFun.Grid_RedIsNegative(e, "L_25")
        oFun.Grid_RedIsNegative(e, "L_26")
        oFun.Grid_RedIsNegative(e, "L_27")
        oFun.Grid_RedIsNegative(e, "L_28")
        oFun.Grid_RedIsNegative(e, "L_29")

        oFun.Grid_RedIsNegative(e, "L_30")
        oFun.Grid_RedIsNegative(e, "L_31")
        oFun.Grid_RedIsNegative(e, "L_32")
        oFun.Grid_RedIsNegative(e, "L_33")
        oFun.Grid_RedIsNegative(e, "L_34")
        oFun.Grid_RedIsNegative(e, "L_36")
        oFun.Grid_RedIsNegative(e, "L_37")
        oFun.Grid_RedIsNegative(e, "L_38")
        oFun.Grid_RedIsNegative(e, "L_39")

        oFun.Grid_RedIsNegative(e, "L_40")
        oFun.Grid_RedIsNegative(e, "L_41")
        oFun.Grid_RedIsNegative(e, "L_42")
        oFun.Grid_RedIsNegative(e, "L_43")
        oFun.Grid_RedIsNegative(e, "L_44")
        oFun.Grid_RedIsNegative(e, "L_45")
        oFun.Grid_RedIsNegative(e, "L_46")
        oFun.Grid_RedIsNegative(e, "L_47")
        oFun.Grid_RedIsNegative(e, "L_48")
        oFun.Grid_RedIsNegative(e, "L_49")

        oFun.Grid_RedIsNegative(e, "L_50")
        oFun.Grid_RedIsNegative(e, "L_51")
        oFun.Grid_RedIsNegative(e, "L_52")
        oFun.Grid_RedIsNegative(e, "L_53")
        oFun.Grid_RedIsNegative(e, "L_54")
        oFun.Grid_RedIsNegative(e, "L_55")
        oFun.Grid_RedIsNegative(e, "L_56")
        oFun.Grid_RedIsNegative(e, "L_57")
        oFun.Grid_RedIsNegative(e, "L_58")
        oFun.Grid_RedIsNegative(e, "L_59")
        oFun.Grid_RedIsNegative(e, "L_603")
        oFun.Grid_RedIsNegative(e, "L_604")

        oFun.Grid_RedIsNegative(e, "L_99")
        oFun.Grid_RedIsNegative(e, "L_TotalAtacarejo")

    End Sub


End Class
