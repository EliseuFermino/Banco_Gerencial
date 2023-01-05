
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_CadMetaPosto
    Inherits System.Web.UI.Page

    Dim oVen As New VendaEmpresaMes
    Dim oDat As New clDataDb
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(312, User.Identity.Name)
            'cboDia.SelectedDate = DateAndTime.Now().Date

            LimparCampos()
           
            BuscarHistorico()
            BuscarDados()

        End If


    End Sub

    Private Sub BuscarHistorico()

        On Error Resume Next

        Dim AnoHist As Int16 = cboAno.CallAno - 1
        Dim MesHist As Byte = cboMes.CallMes


        ' QUANTIDADE
        txt_Hist_Qtde_11.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 11, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_14.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 14, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_641.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 641, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_12.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 12, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_13.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 13, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_9.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 9, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_10.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 10, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_26.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 26, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_33.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 33, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_32.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 32, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_3.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 3, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_25.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 25, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Qtde_30.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Qtde", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 30, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")


        ' VALOR
        txt_Hist_Venda_11.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 11, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_14.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 14, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_641.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 641, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_12.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 12, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_13.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 13, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_9.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 9, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_10.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 10, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_26.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 26, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_33.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 33, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_32.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 32, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_3.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 3, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_25.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 25, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Hist_Venda_30.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_BuscarProdutoMes_Vendas", Conexao.Vendas_tr, "@idFilial", cboFilial.CallFilial, "@CodProduto", 30, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")

        Totalizar_Label(txt_Hist_Qtde_11, txt_Hist_Qtde_14, txt_Hist_Qtde_641, txt_Hist_Qtde_12, txt_Hist_Qtde_13, txt_Hist_Qtde_9, txt_Hist_Qtde_10,
                            txt_Hist_Qtde_26, txt_Hist_Qtde_33, txt_Hist_Qtde_32, txt_Hist_Qtde_3, txt_Hist_Qtde_25, txt_Hist_Qtde_30, lblTotal_HistVolume)

        Totalizar_Label(txt_Hist_Venda_11, txt_Hist_Venda_14, txt_Hist_Venda_641, txt_Hist_Venda_12, txt_Hist_Venda_13, txt_Hist_Venda_9, txt_Hist_Venda_10,
                            txt_Hist_Venda_26, txt_Hist_Venda_33, txt_Hist_Venda_32, txt_Hist_Venda_3, txt_Hist_Venda_25, txt_Hist_Venda_30, lblTotal_HistVenda)

    End Sub

    Private Sub Totalizar_Label(ByVal Label11 As Label, ByVal Label14 As Label, ByVal Label641 As Label, ByVal Label12 As Label,
                                    ByVal Label13 As Label, ByVal Label09 As Label, ByVal Label10 As Label, ByVal Label26 As Label,
                                    ByVal Label33 As Label, ByVal Label32 As Label, ByVal Label03 As Label, ByVal Label25 As Label, ByVal Label30 As Label, ByVal LabelTotal As Label)
        LabelTotal.Text = CDec((CDec(Label11.Text) + CDec(Label14.Text) + CDec(Label641.Text) + CDec(Label12.Text) +
                                    CDec(Label13.Text) + CDec(Label09.Text) + CDec(Label10.Text) + CDec(Label26.Text) +
                                    CDec(Label33.Text) + CDec(Label32.Text) + CDec(Label03.Text) + CDec(Label25.Text) + CDec(Label30.Text))).ToString("n2")
    End Sub

    Private Sub Totalizar_TextBox(ByVal TextBox11 As ASPxTextBox, ByVal TextBox14 As ASPxTextBox, ByVal TextBox641 As ASPxTextBox, ByVal TextBox12 As ASPxTextBox,
                                ByVal TextBox13 As ASPxTextBox, ByVal TextBox09 As ASPxTextBox, ByVal TextBox10 As ASPxTextBox, ByVal TextBox26 As ASPxTextBox,
                                ByVal TextBox33 As ASPxTextBox, ByVal TextBox32 As ASPxTextBox, ByVal TextBox03 As ASPxTextBox, ByVal TextBox25 As ASPxTextBox, ByVal TextBox30 As ASPxTextBox, ByVal TextBoxTotal As Label)
        TextBoxTotal.Text = CDec((CDec(TextBox11.Text) + CDec(TextBox14.Text) + CDec(TextBox641.Text) + CDec(TextBox12.Text) +
                                    CDec(TextBox13.Text) + CDec(TextBox09.Text) + CDec(TextBox10.Text) + CDec(TextBox26.Text) +
                                    CDec(TextBox33.Text) + CDec(TextBox32.Text) + CDec(TextBox03.Text) + CDec(TextBox25.Text) + CDec(TextBox30.Text))).ToString("n2")
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Lançamentos do Posto - PGR327"
        End If
    End Sub



    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Try

            ' ALCOOL ETILICO HD CB SHELL -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 11, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_11.Text, "@Vlr", txt_Venda_11.Text)

            ' ALCOOL ADITIVADO SHELL -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 14, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_14.Text, "@Vlr", txt_Venda_14.Text)

            ' DIESEL B S10 SHELL EVOLUX ADITIVA -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 641, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_641.Text, "@Vlr", txt_Venda_641.Text)

            ' DIESEL B S500 SHELL -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 12, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_12.Text, "@Vlr", txt_Venda_12.Text)

            ' DIESEL B S500 SHELL EVOLUX ADITIV -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 13, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_13.Text, "@Vlr", txt_Venda_13.Text)

            ' GAS TIPO C SHELL -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 9, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_9.Text, "@Vlr", txt_Venda_9.Text)

            ' GAS VPOWER ADITIVADA -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 10, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_10.Text, "@Vlr", txt_Venda_10.Text)

            ' BEBIDAS -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 26, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_26.Text, "@Vlr", txt_Venda_26.Text)

            ' CIGARROS -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 33, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_33.Text, "@Vlr", txt_Venda_33.Text)

            ' FILTROS -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 32, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_32.Text, "@Vlr", txt_Venda_32.Text)

            ' LUBRIFICANTES -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 3, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_3.Text, "@Vlr", txt_Venda_3.Text)

            ' MINIMERCADO -------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 25, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_25.Text, "@Vlr", txt_Venda_25.Text)

            ' SORVETES ---------------------------
            oDat.ExecuteStoredProcedure("Posto.usp_Meta_Insert_ProdutoMes", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 30, "@Ano", cboAno.CallAno, "@Mes", cboMes.CallMes, "@Volume", txt_Qtde_30.Text, "@Vlr", txt_Venda_30.Text)


            'lblError.Text = "Cliente atualizado com sucesso !!"
            oVen.UserMsgBox(Me, "O Lançamento foi salvo com sucesso!!!")

        Catch ex As Exception
            lblError.Text = ex.Message
            oVen.UserMsgBox(Me, ex.Message)

            Beep()
            oVen.UserMsgBox(Me, "PROBLEMA!!! Esse Lançamento não foi salvo. Entre em contato com Eliseu no Ramal 2038 ou no telefone 9671-8959")

        End Try


    End Sub


    Private Sub LimparCampos()


        Me.txt_Hist_Qtde_10.Text = 0
        Me.txt_Hist_Qtde_11.Text = 0
        Me.txt_Hist_Qtde_12.Text = 0
        Me.txt_Hist_Qtde_13.Text = 0
        Me.txt_Hist_Qtde_14.Text = 0
        Me.txt_Hist_Qtde_25.Text = 0
        Me.txt_Hist_Qtde_26.Text = 0
        Me.txt_Hist_Qtde_3.Text = 0
        Me.txt_Hist_Qtde_30.Text = 0
        Me.txt_Hist_Qtde_32.Text = 0
        Me.txt_Hist_Qtde_33.Text = 0
        Me.txt_Hist_Qtde_641.Text = 0
        Me.txt_Hist_Qtde_9.Text = 0

        Me.txt_Hist_Venda_10.Text = 0
        Me.txt_Hist_Venda_11.Text = 0
        Me.txt_Hist_Venda_12.Text = 0
        Me.txt_Hist_Venda_13.Text = 0
        Me.txt_Hist_Venda_14.Text = 0
        Me.txt_Hist_Venda_25.Text = 0
        Me.txt_Hist_Venda_26.Text = 0
        Me.txt_Hist_Venda_3.Text = 0
        Me.txt_Hist_Venda_30.Text = 0
        Me.txt_Hist_Venda_32.Text = 0
        Me.txt_Hist_Venda_33.Text = 0
        Me.txt_Hist_Venda_641.Text = 0
        Me.txt_Hist_Venda_9.Text = 0


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


        txt_percCresc_10.Text = 0
        txt_percCresc_11.Text = 0
        txt_percCresc_12.Text = 0
        txt_percCresc_13.Text = 0
        txt_percCresc_14.Text = 0
        txt_percCresc_25.Text = 0
        txt_percCresc_26.Text = 0
        txt_percCresc_3.Text = 0
        txt_percCresc_30.Text = 0
        txt_percCresc_32.Text = 0
        txt_percCresc_33.Text = 0
        txt_percCresc_641.Text = 0
        txt_percCresc_9.Text = 0

        lbl_Preco_10.Text = 0
        lbl_Preco_11.Text = 0
        lbl_Preco_12.Text = 0
        lbl_Preco_13.Text = 0
        lbl_Preco_14.Text = 0
        lbl_Preco_25.Text = 0
        lbl_Preco_26.Text = 0
        lbl_Preco_3.Text = 0
        lbl_Preco_30.Text = 0
        lbl_Preco_32.Text = 0
        lbl_Preco_33.Text = 0
        lbl_Preco_641.Text = 0
        lbl_Preco_9.Text = 0


        ' txtNumClientes.Text = 0
        lblTotal_MetaVenda.Text = 0
        lblTotal_MetaVolume.Text = 0
        lblTotal_percCresc.Text = 0

        lblTotal_HistVolume.Text = 0
        lblTotal_HistVenda.Text = 0

        txt_Qtde_11.Focus()

    End Sub

    Private Sub BuscarDados()
        On Error Resume Next

        Dim AnoHist As Int16 = cboAno.CallAno
        Dim MesHist As Byte = cboMes.CallMes

        ' QUANTIDADE
        txt_Qtde_11.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 11, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_14.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 14, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_641.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 641, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_12.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 12, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_13.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 13, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_9.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 9, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_10.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 10, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_26.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 26, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_33.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 33, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_32.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 32, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_3.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 3, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_25.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 25, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Qtde_30.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Qtde", Conexao.gerOrcamento, "@idFilial", Session("sFILIAL"), "@CodProduto", 30, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")


        ' VALOR
        txt_Venda_11.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 11, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_14.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 14, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_641.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 641, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_12.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 12, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_13.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 13, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_9.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 9, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_10.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 10, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_26.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 26, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_33.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 33, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_32.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 32, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_3.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 3, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_25.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 25, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")
        txt_Venda_30.Text = CDec(clDataDb.ExecuteStoredProcedure_Scalar("Posto.usp_Meta_Buscar_ProdutoMes_Venda", Conexao.gerOrcamento, "@idFilial", cboFilial.CallFilial, "@CodProduto", 30, "@Ano", AnoHist, "@Mes", MesHist)).ToString("n2")

        Totalizar_TextBox(txt_Qtde_11, txt_Qtde_14, txt_Qtde_641, txt_Qtde_12, txt_Qtde_13, txt_Qtde_9, txt_Qtde_10,
                            txt_Qtde_26, txt_Qtde_33, txt_Qtde_32, txt_Qtde_3, txt_Qtde_25, txt_Qtde_30, lblTotal_MetaVolume)

        Totalizar_TextBox(txt_Venda_11, txt_Venda_14, txt_Venda_641, txt_Venda_12, txt_Venda_13, txt_Venda_9, txt_Venda_10,
                            txt_Venda_26, txt_Venda_33, txt_Venda_32, txt_Venda_3, txt_Venda_25, txt_Venda_30, lblTotal_MetaVenda)


        ' CRESCIMENTO
        CalcularCrescimento(txt_Venda_11, txt_Hist_Venda_11, txt_percCresc_11)
        CalcularCrescimento(txt_Venda_14, txt_Hist_Venda_14, txt_percCresc_14)
        CalcularCrescimento(txt_Venda_641, txt_Hist_Venda_641, txt_percCresc_641)
        CalcularCrescimento(txt_Venda_12, txt_Hist_Venda_12, txt_percCresc_12)
        CalcularCrescimento(txt_Venda_13, txt_Hist_Venda_13, txt_percCresc_13)
        CalcularCrescimento(txt_Venda_9, txt_Hist_Venda_9, txt_percCresc_9)
        CalcularCrescimento(txt_Venda_10, txt_Hist_Venda_10, txt_percCresc_10)
        CalcularCrescimento(txt_Venda_26, txt_Hist_Venda_26, txt_percCresc_26)
        CalcularCrescimento(txt_Venda_33, txt_Hist_Venda_33, txt_percCresc_33)
        CalcularCrescimento(txt_Venda_32, txt_Hist_Venda_32, txt_percCresc_32)
        CalcularCrescimento(txt_Venda_3, txt_Hist_Venda_3, txt_percCresc_3)
        CalcularCrescimento(txt_Venda_25, txt_Hist_Venda_25, txt_percCresc_25)
        CalcularCrescimento(txt_Venda_30, txt_Hist_Venda_30, txt_percCresc_30)

        ' PRECO MEDIO
        lbl_Preco_11.Text = PrecoMedio(txt_Hist_Venda_11, txt_Hist_Qtde_11)
        lbl_Preco_14.Text = PrecoMedio(txt_Hist_Venda_14, txt_Hist_Qtde_14)
        lbl_Preco_641.Text = PrecoMedio(txt_Hist_Venda_641, txt_Hist_Qtde_641)
        lbl_Preco_12.Text = PrecoMedio(txt_Hist_Venda_12, txt_Hist_Qtde_12)
        lbl_Preco_13.Text = PrecoMedio(txt_Hist_Venda_13, txt_Hist_Qtde_13)
        lbl_Preco_9.Text = PrecoMedio(txt_Hist_Venda_9, txt_Hist_Qtde_9)
        lbl_Preco_10.Text = PrecoMedio(txt_Hist_Venda_10, txt_Hist_Qtde_10)
        lbl_Preco_26.Text = PrecoMedio(txt_Hist_Venda_26, txt_Hist_Qtde_26)
        lbl_Preco_33.Text = PrecoMedio(txt_Hist_Venda_33, txt_Hist_Qtde_33)
        lbl_Preco_32.Text = PrecoMedio(txt_Hist_Venda_32, txt_Hist_Qtde_32)
        lbl_Preco_3.Text = PrecoMedio(txt_Hist_Venda_3, txt_Hist_Qtde_3)
        lbl_Preco_25.Text = PrecoMedio(txt_Hist_Venda_25, txt_Hist_Qtde_25)
        lbl_Preco_30.Text = PrecoMedio(txt_Hist_Venda_30, txt_Hist_Qtde_30)

    End Sub

    Function PrecoMedio(vlrVendido As Label, ByVal Volume As Label) As Decimal

        If Volume.Text = 0 Or vlrVendido.Text = 0 Then
            PrecoMedio = 0
        Else
            PrecoMedio = (CDec(vlrVendido.Text) / CDec(Volume.Text)).ToString("n2")
        End If

    End Function


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If IsPostBack Then


        End If

    End Sub

    Private Sub Totalizar_Meta_Volume()
        Totalizar_TextBox(txt_Qtde_11, txt_Qtde_14, txt_Qtde_641, txt_Qtde_12, txt_Qtde_13, txt_Qtde_9, txt_Qtde_10,
                          txt_Qtde_26, txt_Qtde_33, txt_Qtde_32, txt_Qtde_3, txt_Qtde_25, txt_Qtde_30, lblTotal_MetaVolume)
    End Sub

    Private Sub Totalizar_Meta_Venda()
        Totalizar_TextBox(txt_Venda_11, txt_Venda_14, txt_Venda_641, txt_Venda_12, txt_Venda_13, txt_Venda_9, txt_Venda_10,
                          txt_Venda_26, txt_Venda_33, txt_Venda_32, txt_Venda_3, txt_Venda_25, txt_Venda_30, lblTotal_MetaVenda)
    End Sub

    Private Sub CalcularCrescimento(ByVal VendaMeta As ASPxTextBox, ByVal VendaHist As Label, ByVal percCresc As Label)
        If IsNothing(VendaHist) Or VendaHist.Text = 0.0 Then
            percCresc.Text = CDec(0).ToString("n2") & "%"
            Exit Sub
        Else
            percCresc.Text = CDec((((VendaMeta.Text / VendaHist.Text) * 100) - 100)).ToString("n2") & "%"
            If (((VendaMeta.Text / VendaHist.Text) * 100) - 100) < 0.0 Then
                percCresc.ForeColor = Drawing.Color.Red
            End If
        End If

        ' --------------------------------------------------------------------------------------------------------
        ' TOTAL 
        If IsNothing(lblTotal_HistVenda) Or lblTotal_HistVenda.Text = 0.0 Then
            lblTotal_percCresc.Text = CDec(0).ToString("n2") & "%"
            Exit Sub
        Else
            lblTotal_percCresc.Text = CDec((((lblTotal_MetaVenda.Text / lblTotal_HistVenda.Text) * 100) - 100)).ToString("n2") & "%"
            If (((lblTotal_MetaVenda.Text / lblTotal_HistVenda.Text) * 100) - 100) < 0.0 Then
                lblTotal_percCresc.ForeColor = Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub txt_Qtde_11_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_11.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_14.Focus()
    End Sub

    Protected Sub txt_Qtde_14_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_14.TextChanged
        Totalizar_Meta_Volume()

        txt_Qtde_641.Focus()
    End Sub

    Protected Sub txt_Qtde_641_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_641.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_12.Focus()
    End Sub

    Protected Sub txt_Qtde_12_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_12.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_13.Focus()
    End Sub

    Protected Sub txt_Qtde_13_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_13.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_9.Focus()
    End Sub

    Protected Sub txt_Qtde_9_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_9.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_10.Focus()
    End Sub

    Protected Sub txt_Qtde_10_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_10.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_26.Focus()
    End Sub

    Protected Sub txt_Qtde_26_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_26.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_33.Focus()
    End Sub

    Protected Sub txt_Qtde_33_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_33.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_32.Focus()
    End Sub

    Protected Sub txt_Qtde_32_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_32.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_3.Focus()
    End Sub

    Protected Sub txt_Qtde_3_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_3.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_25.Focus()
    End Sub

    Protected Sub txt_Qtde_25_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_25.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_30.Focus()
    End Sub

    Protected Sub txt_Qtde_30_TextChanged(sender As Object, e As EventArgs) Handles txt_Qtde_30.TextChanged
        Totalizar_Meta_Volume()
        txt_Qtde_11.Focus()
    End Sub

    Protected Sub txt_Venda_11_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_11.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_14.Focus()
        CalcularCrescimento(txt_Venda_11, txt_Hist_Venda_11, txt_percCresc_11)

    End Sub

    Protected Sub txt_Venda_14_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_14.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_641.Focus()
        CalcularCrescimento(txt_Venda_14, txt_Hist_Venda_14, txt_percCresc_14)

    End Sub

    Protected Sub txt_Venda_641_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_641.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_12.Focus()
        CalcularCrescimento(txt_Venda_641, txt_Hist_Venda_641, txt_percCresc_641)

    End Sub

    Protected Sub txt_Venda_12_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_12.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_13.Focus()
        CalcularCrescimento(txt_Venda_12, txt_Hist_Venda_12, txt_percCresc_12)

    End Sub

    Protected Sub txt_Venda_13_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_13.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_9.Focus()
        CalcularCrescimento(txt_Venda_13, txt_Hist_Venda_13, txt_percCresc_13)

    End Sub

    Protected Sub txt_Venda_9_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_9.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_10.Focus()
        CalcularCrescimento(txt_Venda_9, txt_Hist_Venda_9, txt_percCresc_9)

    End Sub

    Protected Sub txt_Venda_10_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_10.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_26.Focus()
        CalcularCrescimento(txt_Venda_10, txt_Hist_Venda_10, txt_percCresc_10)

    End Sub

    Protected Sub txt_Venda_26_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_26.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_33.Focus()
        CalcularCrescimento(txt_Venda_26, txt_Hist_Venda_26, txt_percCresc_26)

    End Sub

    Protected Sub txt_Venda_33_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_33.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_32.Focus()
        CalcularCrescimento(txt_Venda_33, txt_Hist_Venda_33, txt_percCresc_33)

    End Sub

    Protected Sub txt_Venda_32_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_32.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_3.Focus()
        CalcularCrescimento(txt_Venda_32, txt_Hist_Venda_32, txt_percCresc_32)

    End Sub

    Protected Sub txt_Venda_3_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_3.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_25.Focus()
        CalcularCrescimento(txt_Venda_3, txt_Hist_Venda_3, txt_percCresc_3)

    End Sub

    Protected Sub txt_Venda_25_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_25.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_30.Focus()
        CalcularCrescimento(txt_Venda_25, txt_Hist_Venda_25, txt_percCresc_25)

    End Sub

    Protected Sub txt_Venda_30_TextChanged(sender As Object, e As EventArgs) Handles txt_Venda_30.TextChanged
        Totalizar_Meta_Venda()
        txt_Venda_11.Focus()
        CalcularCrescimento(txt_Venda_30, txt_Hist_Venda_30, txt_percCresc_30)

    End Sub

  
    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs) Handles btnLimpar.Click
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


        txt_percCresc_10.Text = 0
        txt_percCresc_11.Text = 0
        txt_percCresc_12.Text = 0
        txt_percCresc_13.Text = 0
        txt_percCresc_14.Text = 0
        txt_percCresc_25.Text = 0
        txt_percCresc_26.Text = 0
        txt_percCresc_3.Text = 0
        txt_percCresc_30.Text = 0
        txt_percCresc_32.Text = 0
        txt_percCresc_33.Text = 0
        txt_percCresc_641.Text = 0
        txt_percCresc_9.Text = 0

        ' txtNumClientes.Text = 0
        lblTotal_MetaVenda.Text = 0
        lblTotal_MetaVolume.Text = 0
        lblTotal_percCresc.Text = 0
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        LimparCampos()
        BuscarHistorico()
        BuscarDados()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        LimparCampos()
        BuscarHistorico()
        BuscarDados()
    End Sub
End Class
