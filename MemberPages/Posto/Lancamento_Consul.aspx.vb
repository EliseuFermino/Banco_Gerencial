

Imports DevExpress.Web

Partial Class MemberPages_Posto_Lancamento_Consul
    Inherits System.Web.UI.Page

    Dim oVen As New VendaEmpresaMes
    Dim oDat As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(347, User.Identity.Name)
            cboDia.SelectedDate = DateAndTime.Now().Date
            BuscarDados()


        End If


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Lançamentos do Posto Consul - PGR347"
        End If
    End Sub


    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        SalvarDados(10, txt_Qtde_10, txt_Venda_10)
        SalvarDados(11, txt_Qtde_11, txt_Venda_11)
        SalvarDados(12, txt_Qtde_12, txt_Venda_12)
        SalvarDados(13, txt_Qtde_13, txt_Venda_13)
        SalvarDados(14, txt_Qtde_14, txt_Venda_14)
        SalvarDados(25, txt_Qtde_25, txt_Venda_25)
        SalvarDados(26, txt_Qtde_26, txt_Venda_26)
        SalvarDados(3, txt_Qtde_3, txt_Venda_3)
        SalvarDados(30, txt_Qtde_30, txt_Venda_30)
        SalvarDados(32, txt_Qtde_32, txt_Venda_32)
        SalvarDados(33, txt_Qtde_33, txt_Venda_33)
        SalvarDados(641, txt_Qtde_641, txt_Venda_641)
        SalvarDados(9, txt_Qtde_9, txt_Venda_9)

        SalvarDados(99, txtNumClientes, txtNumClientes)

        oVen.UserMsgBox(Me, "As Informações Foram Salvas com Sucesso!!!")

    End Sub

    Private Sub LimparCampos()
        Me.txt_Qtde_10.Text = 0
        Me.txt_Qtde_11.Text = 0
        Me.txt_Qtde_12.Text = 0
        Me.txt_Qtde_13.Text = 0
        Me.txt_Qtde_14.Text = 0
        Me.txt_Qtde_25.Text = 0
        Me.txt_Qtde_26.Text = 0
        Me.txt_Qtde_3.Text = 0
        Me.txt_Qtde_30.Text = 0
        Me.txt_Qtde_32.Text = 0
        Me.txt_Qtde_33.Text = 0
        Me.txt_Qtde_641.Text = 0
        Me.txt_Qtde_9.Text = 0

        Me.txt_Venda_10.Text = 0
        Me.txt_Venda_11.Text = 0
        Me.txt_Venda_12.Text = 0
        Me.txt_Venda_13.Text = 0
        Me.txt_Venda_14.Text = 0
        Me.txt_Venda_25.Text = 0
        Me.txt_Venda_26.Text = 0
        Me.txt_Venda_3.Text = 0
        Me.txt_Venda_30.Text = 0
        Me.txt_Venda_32.Text = 0
        Me.txt_Venda_33.Text = 0
        Me.txt_Venda_641.Text = 0
        Me.txt_Venda_9.Text = 0

        txtNumClientes.Text = 0

        txt_Qtde_11.Focus()

    End Sub

    Private Sub BuscarDados()

        BuscarDados_Det(10)
        txt_Qtde_10.Text = oDat.qtde
        txt_Venda_10.Text = oDat.vlr

        BuscarDados_Det(11)
        txt_Qtde_11.Text = oDat.qtde
        txt_Venda_11.Text = oDat.vlr

        BuscarDados_Det(12)
        txt_Qtde_12.Text = oDat.qtde
        txt_Venda_12.Text = oDat.vlr

        BuscarDados_Det(13)
        txt_Qtde_13.Text = oDat.qtde
        txt_Venda_13.Text = oDat.vlr

        BuscarDados_Det(14)
        txt_Qtde_14.Text = oDat.qtde
        txt_Venda_14.Text = oDat.vlr

        BuscarDados_Det(25)
        txt_Qtde_25.Text = oDat.qtde
        txt_Venda_25.Text = oDat.vlr

        BuscarDados_Det(26)
        txt_Qtde_26.Text = oDat.qtde
        txt_Venda_26.Text = oDat.vlr

        BuscarDados_Det(3)
        txt_Qtde_3.Text = oDat.qtde
        txt_Venda_3.Text = oDat.vlr

        BuscarDados_Det(30)
        txt_Qtde_30.Text = oDat.qtde
        txt_Venda_30.Text = oDat.vlr

        BuscarDados_Det(32)
        txt_Qtde_32.Text = oDat.qtde
        txt_Venda_32.Text = oDat.vlr

        BuscarDados_Det(33)
        txt_Qtde_33.Text = oDat.qtde
        txt_Venda_33.Text = oDat.vlr

        BuscarDados_Det(641)
        txt_Qtde_641.Text = oDat.qtde
        txt_Venda_641.Text = oDat.vlr

        BuscarDados_Det(9)
        txt_Qtde_9.Text = oDat.qtde
        txt_Venda_9.Text = oDat.vlr

        BuscarDados_Det(9)
        txt_Qtde_9.Text = oDat.qtde
        txt_Venda_9.Text = oDat.vlr

        BuscarDados_Det(99)
        txtNumClientes.Text = oDat.qtde


    End Sub

    Private Sub SalvarDados(ByVal iPosto_Cod As String, iQtde As ASPxTextBox, iVenda As ASPxTextBox)


        oDat.ExecuteStoredProcedure_Posto("Posto.usp_Insert_Update", Conexao.Vendas_tr,
                                    "@Posto_Cod", iPosto_Cod,
                                    "@Dia", CDate(cboDia.SelectedDate),
                                    "@Posto_Filial", 2,
                                    "@Qtde", iQtde.Text,
                                    "@vlrVenda", iVenda.Text)


        'lblError.Text = oDat.varDesc
    End Sub

    Private Sub BuscarDados_Det(ByVal iPosto_Cod As String)
        oDat.Posto_BuscarDados("Posto.usp_Buscar", Conexao.Vendas_tr,
                                    "@Posto_Cod", iPosto_Cod,
                                    "@Dia", CDate(cboDia.SelectedDate),
                                    "@Posto_Filial", 2)
        'lblError.Text = oDat.varDesc
    End Sub

    Protected Sub cboDia_SelectionChanged(sender As Object, e As EventArgs) Handles cboDia.SelectionChanged
        LimparCampos()
        BuscarDados()
    End Sub

    Protected Sub btnExcluir_Click(sender As Object, e As EventArgs) Handles btnExcluir.Click
        oDat.Posto_ExcluirDados("Posto.usp_Excluir", Conexao.Vendas_tr,
                            "@Posto_Filial", 2,
                            "@Dia", CDate(cboDia.SelectedDate))
        BuscarDados()
        'lblError.Text = oDat.varDesc
    End Sub



End Class
