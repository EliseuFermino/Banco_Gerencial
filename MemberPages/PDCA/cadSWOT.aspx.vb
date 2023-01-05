Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_PDCA_cadSWOT
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oDb As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim TotalSWOT As Int16

            oVem.AtualizarEstatisticaPrograma(316, Page.User.Identity.Name)
            cboFilial.cboFilial_Visible_Legenda = False

            Enabled_Fields_False()

            ' Descrição de Erro
            lblError.Visible = False

            TotalSWOT = oDb.ExecuteStoredProcedure_Scalar("PDCA.usp_TotalDeSWOT", Conexao.gerProjetos.ConnectionString, "@idFilial", cboFilial.CallFilial)
            If TotalSWOT > 0 Then
                btnNovo.Visible = False
                btnAlterar.Visible = True
                Buscar_SWOT()
            End If

            'Dim idCat As String = Request.QueryString("idCat")
            'If CInt(idCat) > 0 Then
            '    Buscar_ProblemaCausa()

            '    btnNovo.Enabled = False
            '    btnCancel.Enabled = True
            '    btnSave.Enabled = True
            '    Enabled_Fields_True()
            '    txtProblema.Focus()

            'End If


        End If

    End Sub

    Private Sub Enabled_Fields_True()

        oFun.TextBox_Enabled_True(txtForca_1)
        oFun.TextBox_Enabled_True(txtForca_2)
        oFun.TextBox_Enabled_True(txtForca_3)
        oFun.TextBox_Enabled_True(txtForca_4)
        oFun.TextBox_Enabled_True(txtForca_5)
        oFun.TextBox_Enabled_True(txtForca_6)
        oFun.TextBox_Enabled_True(txtForca_7)
        oFun.TextBox_Enabled_True(txtForca_8)
        oFun.TextBox_Enabled_True(txtForca_9)
        oFun.TextBox_Enabled_True(txtForca_10)
        oFun.TextBox_Enabled_True(txtForca_11)
        oFun.TextBox_Enabled_True(txtForca_12)
        oFun.TextBox_Enabled_True(txtForca_13)
        oFun.TextBox_Enabled_True(txtForca_14)
        oFun.TextBox_Enabled_True(txtForca_15)

        oFun.TextBox_Enabled_True(txtFraqueza_1)
        oFun.TextBox_Enabled_True(txtFraqueza_2)
        oFun.TextBox_Enabled_True(txtFraqueza_3)
        oFun.TextBox_Enabled_True(txtFraqueza_4)
        oFun.TextBox_Enabled_True(txtFraqueza_5)
        oFun.TextBox_Enabled_True(txtFraqueza_6)
        oFun.TextBox_Enabled_True(txtFraqueza_7)
        oFun.TextBox_Enabled_True(txtFraqueza_8)
        oFun.TextBox_Enabled_True(txtFraqueza_9)
        oFun.TextBox_Enabled_True(txtFraqueza_10)
        oFun.TextBox_Enabled_True(txtFraqueza_11)
        oFun.TextBox_Enabled_True(txtFraqueza_12)
        oFun.TextBox_Enabled_True(txtFraqueza_13)
        oFun.TextBox_Enabled_True(txtFraqueza_14)
        oFun.TextBox_Enabled_True(txtFraqueza_15)


        oFun.TextBox_Enabled_True(txtOportunidade_1)
        oFun.TextBox_Enabled_True(txtOportunidade_2)
        oFun.TextBox_Enabled_True(txtOportunidade_3)
        oFun.TextBox_Enabled_True(txtOportunidade_4)
        oFun.TextBox_Enabled_True(txtOportunidade_5)
        oFun.TextBox_Enabled_True(txtOportunidade_6)
        oFun.TextBox_Enabled_True(txtOportunidade_7)
        oFun.TextBox_Enabled_True(txtOportunidade_8)
        oFun.TextBox_Enabled_True(txtOportunidade_9)
        oFun.TextBox_Enabled_True(txtOportunidade_10)
        oFun.TextBox_Enabled_True(txtOportunidade_11)
        oFun.TextBox_Enabled_True(txtOportunidade_12)
        oFun.TextBox_Enabled_True(txtOportunidade_13)
        oFun.TextBox_Enabled_True(txtOportunidade_14)
        oFun.TextBox_Enabled_True(txtOportunidade_15)

        oFun.TextBox_Enabled_True(txtAmeaca_1)
        oFun.TextBox_Enabled_True(txtAmeaca_2)
        oFun.TextBox_Enabled_True(txtAmeaca_3)
        oFun.TextBox_Enabled_True(txtAmeaca_4)
        oFun.TextBox_Enabled_True(txtAmeaca_5)
        oFun.TextBox_Enabled_True(txtAmeaca_6)
        oFun.TextBox_Enabled_True(txtAmeaca_7)
        oFun.TextBox_Enabled_True(txtAmeaca_8)
        oFun.TextBox_Enabled_True(txtAmeaca_9)
        oFun.TextBox_Enabled_True(txtAmeaca_10)
        oFun.TextBox_Enabled_True(txtAmeaca_11)
        oFun.TextBox_Enabled_True(txtAmeaca_12)
        oFun.TextBox_Enabled_True(txtAmeaca_13)
        oFun.TextBox_Enabled_True(txtAmeaca_14)
        oFun.TextBox_Enabled_True(txtAmeaca_15)

    End Sub

    Private Sub Enabled_Fields_False()

        oFun.TextBox_Enabled_False(txtForca_1)
        oFun.TextBox_Enabled_False(txtForca_2)
        oFun.TextBox_Enabled_False(txtForca_3)
        oFun.TextBox_Enabled_False(txtForca_4)
        oFun.TextBox_Enabled_False(txtForca_5)
        oFun.TextBox_Enabled_False(txtForca_6)
        oFun.TextBox_Enabled_False(txtForca_7)
        oFun.TextBox_Enabled_False(txtForca_8)
        oFun.TextBox_Enabled_False(txtForca_9)
        oFun.TextBox_Enabled_False(txtForca_10)
        oFun.TextBox_Enabled_False(txtForca_11)
        oFun.TextBox_Enabled_False(txtForca_12)
        oFun.TextBox_Enabled_False(txtForca_13)
        oFun.TextBox_Enabled_False(txtForca_14)
        oFun.TextBox_Enabled_False(txtForca_15)

        oFun.TextBox_Enabled_False(txtFraqueza_1)
        oFun.TextBox_Enabled_False(txtFraqueza_2)
        oFun.TextBox_Enabled_False(txtFraqueza_3)
        oFun.TextBox_Enabled_False(txtFraqueza_4)
        oFun.TextBox_Enabled_False(txtFraqueza_5)
        oFun.TextBox_Enabled_False(txtFraqueza_6)
        oFun.TextBox_Enabled_False(txtFraqueza_7)
        oFun.TextBox_Enabled_False(txtFraqueza_8)
        oFun.TextBox_Enabled_False(txtFraqueza_9)
        oFun.TextBox_Enabled_False(txtFraqueza_10)
        oFun.TextBox_Enabled_False(txtFraqueza_11)
        oFun.TextBox_Enabled_False(txtFraqueza_12)
        oFun.TextBox_Enabled_False(txtFraqueza_13)
        oFun.TextBox_Enabled_False(txtFraqueza_14)
        oFun.TextBox_Enabled_False(txtFraqueza_15)


        oFun.TextBox_Enabled_False(txtOportunidade_1)
        oFun.TextBox_Enabled_False(txtOportunidade_2)
        oFun.TextBox_Enabled_False(txtOportunidade_3)
        oFun.TextBox_Enabled_False(txtOportunidade_4)
        oFun.TextBox_Enabled_False(txtOportunidade_5)
        oFun.TextBox_Enabled_False(txtOportunidade_6)
        oFun.TextBox_Enabled_False(txtOportunidade_7)
        oFun.TextBox_Enabled_False(txtOportunidade_8)
        oFun.TextBox_Enabled_False(txtOportunidade_9)
        oFun.TextBox_Enabled_False(txtOportunidade_10)
        oFun.TextBox_Enabled_False(txtOportunidade_11)
        oFun.TextBox_Enabled_False(txtOportunidade_12)
        oFun.TextBox_Enabled_False(txtOportunidade_13)
        oFun.TextBox_Enabled_False(txtOportunidade_14)
        oFun.TextBox_Enabled_False(txtOportunidade_15)

        oFun.TextBox_Enabled_False(txtAmeaca_1)
        oFun.TextBox_Enabled_False(txtAmeaca_2)
        oFun.TextBox_Enabled_False(txtAmeaca_3)
        oFun.TextBox_Enabled_False(txtAmeaca_4)
        oFun.TextBox_Enabled_False(txtAmeaca_5)
        oFun.TextBox_Enabled_False(txtAmeaca_6)
        oFun.TextBox_Enabled_False(txtAmeaca_7)
        oFun.TextBox_Enabled_False(txtAmeaca_8)
        oFun.TextBox_Enabled_False(txtAmeaca_9)
        oFun.TextBox_Enabled_False(txtAmeaca_10)
        oFun.TextBox_Enabled_False(txtAmeaca_11)
        oFun.TextBox_Enabled_False(txtAmeaca_12)
        oFun.TextBox_Enabled_False(txtAmeaca_13)
        oFun.TextBox_Enabled_False(txtAmeaca_14)
        oFun.TextBox_Enabled_False(txtAmeaca_15)

    End Sub

    Private Sub Clear_Fields()

        oFun.TextBox_ClearField(txtForca_1)
        oFun.TextBox_ClearField(txtForca_2)
        oFun.TextBox_ClearField(txtForca_3)
        oFun.TextBox_ClearField(txtForca_4)
        oFun.TextBox_ClearField(txtForca_5)
        oFun.TextBox_ClearField(txtForca_6)
        oFun.TextBox_ClearField(txtForca_7)
        oFun.TextBox_ClearField(txtForca_8)
        oFun.TextBox_ClearField(txtForca_9)
        oFun.TextBox_ClearField(txtForca_10)
        oFun.TextBox_ClearField(txtForca_11)
        oFun.TextBox_ClearField(txtForca_12)
        oFun.TextBox_ClearField(txtForca_13)
        oFun.TextBox_ClearField(txtForca_13)
        oFun.TextBox_ClearField(txtForca_14)

        oFun.TextBox_ClearField(txtFraqueza_1)
        oFun.TextBox_ClearField(txtFraqueza_2)
        oFun.TextBox_ClearField(txtFraqueza_3)
        oFun.TextBox_ClearField(txtFraqueza_4)
        oFun.TextBox_ClearField(txtFraqueza_5)
        oFun.TextBox_ClearField(txtFraqueza_6)
        oFun.TextBox_ClearField(txtFraqueza_7)
        oFun.TextBox_ClearField(txtFraqueza_8)
        oFun.TextBox_ClearField(txtFraqueza_9)
        oFun.TextBox_ClearField(txtFraqueza_10)
        oFun.TextBox_ClearField(txtFraqueza_11)
        oFun.TextBox_ClearField(txtFraqueza_12)
        oFun.TextBox_ClearField(txtFraqueza_13)
        oFun.TextBox_ClearField(txtFraqueza_13)
        oFun.TextBox_ClearField(txtFraqueza_14)

        oFun.TextBox_ClearField(txtOportunidade_1)
        oFun.TextBox_ClearField(txtOportunidade_2)
        oFun.TextBox_ClearField(txtOportunidade_3)
        oFun.TextBox_ClearField(txtOportunidade_4)
        oFun.TextBox_ClearField(txtOportunidade_5)
        oFun.TextBox_ClearField(txtOportunidade_6)
        oFun.TextBox_ClearField(txtOportunidade_7)
        oFun.TextBox_ClearField(txtOportunidade_8)
        oFun.TextBox_ClearField(txtOportunidade_9)
        oFun.TextBox_ClearField(txtOportunidade_10)
        oFun.TextBox_ClearField(txtOportunidade_11)
        oFun.TextBox_ClearField(txtOportunidade_12)
        oFun.TextBox_ClearField(txtOportunidade_13)
        oFun.TextBox_ClearField(txtOportunidade_13)
        oFun.TextBox_ClearField(txtOportunidade_14)

        oFun.TextBox_ClearField(txtAmeaca_1)
        oFun.TextBox_ClearField(txtAmeaca_2)
        oFun.TextBox_ClearField(txtAmeaca_3)
        oFun.TextBox_ClearField(txtAmeaca_4)
        oFun.TextBox_ClearField(txtAmeaca_5)
        oFun.TextBox_ClearField(txtAmeaca_6)
        oFun.TextBox_ClearField(txtAmeaca_7)
        oFun.TextBox_ClearField(txtAmeaca_8)
        oFun.TextBox_ClearField(txtAmeaca_9)
        oFun.TextBox_ClearField(txtAmeaca_10)
        oFun.TextBox_ClearField(txtAmeaca_11)
        oFun.TextBox_ClearField(txtAmeaca_12)
        oFun.TextBox_ClearField(txtAmeaca_13)
        oFun.TextBox_ClearField(txtAmeaca_13)
        oFun.TextBox_ClearField(txtAmeaca_14)

    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
        btnNovo.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True
        Clear_Fields()
        Enabled_Fields_True()
        txtForca_1.Focus()
    End Sub

    Protected Sub btnAlterar_Click(sender As Object, e As EventArgs) Handles btnAlterar.Click
        btnAlterar.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True
        Enabled_Fields_True()
        txtForca_1.Focus()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True
        btnAlterar.Enabled = True
        If btnNovo.Visible = True Then Clear_Fields()
        Enabled_Fields_False()
    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click



        If btnAlterar.Visible = False Then

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 1, "@descSWOT", txtForca_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 2, "@descSWOT", txtForca_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 3, "@descSWOT", txtForca_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 4, "@descSWOT", txtForca_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 5, "@descSWOT", txtForca_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 6, "@descSWOT", txtForca_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 7, "@descSWOT", txtForca_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 8, "@descSWOT", txtForca_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 9, "@descSWOT", txtForca_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 10, "@descSWOT", txtForca_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 11, "@descSWOT", txtForca_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 12, "@descSWOT", txtForca_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 13, "@descSWOT", txtForca_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 14, "@descSWOT", txtForca_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 15, "@descSWOT", txtForca_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 1, "@descSWOT", txtFraqueza_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 2, "@descSWOT", txtFraqueza_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 3, "@descSWOT", txtFraqueza_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 4, "@descSWOT", txtFraqueza_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 5, "@descSWOT", txtFraqueza_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 6, "@descSWOT", txtFraqueza_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 7, "@descSWOT", txtFraqueza_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 8, "@descSWOT", txtFraqueza_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 9, "@descSWOT", txtFraqueza_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 10, "@descSWOT", txtFraqueza_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 11, "@descSWOT", txtFraqueza_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 12, "@descSWOT", txtFraqueza_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 13, "@descSWOT", txtFraqueza_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 14, "@descSWOT", txtFraqueza_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 15, "@descSWOT", txtFraqueza_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 1, "@descSWOT", txtOportunidade_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 2, "@descSWOT", txtOportunidade_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 3, "@descSWOT", txtOportunidade_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 4, "@descSWOT", txtOportunidade_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 5, "@descSWOT", txtOportunidade_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 6, "@descSWOT", txtOportunidade_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 7, "@descSWOT", txtOportunidade_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 8, "@descSWOT", txtOportunidade_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 9, "@descSWOT", txtOportunidade_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 10, "@descSWOT", txtOportunidade_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 11, "@descSWOT", txtOportunidade_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 12, "@descSWOT", txtOportunidade_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 13, "@descSWOT", txtOportunidade_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 14, "@descSWOT", txtOportunidade_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 15, "@descSWOT", txtOportunidade_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 1, "@descSWOT", txtAmeaca_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 2, "@descSWOT", txtAmeaca_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 3, "@descSWOT", txtAmeaca_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 4, "@descSWOT", txtAmeaca_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 5, "@descSWOT", txtAmeaca_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 6, "@descSWOT", txtAmeaca_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 7, "@descSWOT", txtAmeaca_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 8, "@descSWOT", txtAmeaca_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 9, "@descSWOT", txtAmeaca_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 10, "@descSWOT", txtAmeaca_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 11, "@descSWOT", txtAmeaca_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 12, "@descSWOT", txtAmeaca_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 13, "@descSWOT", txtAmeaca_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 14, "@descSWOT", txtAmeaca_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 15, "@descSWOT", txtAmeaca_15.Text, "@idFilial", cboFilial.CallFilial)

            oVem.UserMsgBox(Me, "SWOT foi salvo com sucesso!!!")
        Else
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 1, "@descSWOT", txtForca_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 2, "@descSWOT", txtForca_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 3, "@descSWOT", txtForca_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 4, "@descSWOT", txtForca_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 5, "@descSWOT", txtForca_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 6, "@descSWOT", txtForca_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 7, "@descSWOT", txtForca_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 8, "@descSWOT", txtForca_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 9, "@descSWOT", txtForca_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 10, "@descSWOT", txtForca_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 11, "@descSWOT", txtForca_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 12, "@descSWOT", txtForca_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 13, "@descSWOT", txtForca_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 14, "@descSWOT", txtForca_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 1, "@idOrdem", 15, "@descSWOT", txtForca_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 1, "@descSWOT", txtFraqueza_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 2, "@descSWOT", txtFraqueza_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 3, "@descSWOT", txtFraqueza_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 4, "@descSWOT", txtFraqueza_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 5, "@descSWOT", txtFraqueza_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 6, "@descSWOT", txtFraqueza_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 7, "@descSWOT", txtFraqueza_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 8, "@descSWOT", txtFraqueza_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 9, "@descSWOT", txtFraqueza_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 10, "@descSWOT", txtFraqueza_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 11, "@descSWOT", txtFraqueza_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 12, "@descSWOT", txtFraqueza_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 13, "@descSWOT", txtFraqueza_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 14, "@descSWOT", txtFraqueza_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 2, "@idOrdem", 15, "@descSWOT", txtFraqueza_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 1, "@descSWOT", txtOportunidade_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 2, "@descSWOT", txtOportunidade_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 3, "@descSWOT", txtOportunidade_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 4, "@descSWOT", txtOportunidade_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 5, "@descSWOT", txtOportunidade_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 6, "@descSWOT", txtOportunidade_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 7, "@descSWOT", txtOportunidade_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 8, "@descSWOT", txtOportunidade_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 9, "@descSWOT", txtOportunidade_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 10, "@descSWOT", txtOportunidade_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 11, "@descSWOT", txtOportunidade_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 12, "@descSWOT", txtOportunidade_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 13, "@descSWOT", txtOportunidade_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 14, "@descSWOT", txtOportunidade_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 3, "@idOrdem", 15, "@descSWOT", txtOportunidade_15.Text, "@idFilial", cboFilial.CallFilial)

            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 1, "@descSWOT", txtAmeaca_1.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 2, "@descSWOT", txtAmeaca_2.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 3, "@descSWOT", txtAmeaca_3.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 4, "@descSWOT", txtAmeaca_4.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 5, "@descSWOT", txtAmeaca_5.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 6, "@descSWOT", txtAmeaca_6.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 7, "@descSWOT", txtAmeaca_7.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 8, "@descSWOT", txtAmeaca_8.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 9, "@descSWOT", txtAmeaca_9.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 10, "@descSWOT", txtAmeaca_10.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 11, "@descSWOT", txtAmeaca_11.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 12, "@descSWOT", txtAmeaca_12.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 13, "@descSWOT", txtAmeaca_13.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 14, "@descSWOT", txtAmeaca_14.Text, "@idFilial", cboFilial.CallFilial)
            oDb.ExecuteStoredProcedure("PDCA.usp_InsertUpdate_SWOT", Conexao.gerProjetos.ConnectionString, "@idSWOT", 4, "@idOrdem", 15, "@descSWOT", txtAmeaca_15.Text, "@idFilial", cboFilial.CallFilial)

            oVem.UserMsgBox(Me, "SWOT foi atualizado com sucesso!!!")
        End If

        ' End If

        ' Descrição de Erro
        lblError.Text = oDb.varDesc

        Enabled_Fields_False()
        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True
        btnAlterar.Enabled = True

    End Sub

    Private Sub Buscar_SWOT()
        Buscar_SWOT_Det(txtForca_1, 1, 1)
        Buscar_SWOT_Det(txtForca_2, 1, 2)
        Buscar_SWOT_Det(txtForca_3, 1, 3)
        Buscar_SWOT_Det(txtForca_4, 1, 4)
        Buscar_SWOT_Det(txtForca_5, 1, 5)
        Buscar_SWOT_Det(txtForca_6, 1, 6)
        Buscar_SWOT_Det(txtForca_7, 1, 7)
        Buscar_SWOT_Det(txtForca_8, 1, 8)
        Buscar_SWOT_Det(txtForca_9, 1, 9)
        Buscar_SWOT_Det(txtForca_10, 1, 10)
        Buscar_SWOT_Det(txtForca_11, 1, 11)
        Buscar_SWOT_Det(txtForca_12, 1, 12)
        Buscar_SWOT_Det(txtForca_13, 1, 13)
        Buscar_SWOT_Det(txtForca_14, 1, 14)
        Buscar_SWOT_Det(txtForca_15, 1, 15)

        Buscar_SWOT_Det(txtFraqueza_1, 2, 1)
        Buscar_SWOT_Det(txtFraqueza_2, 2, 2)
        Buscar_SWOT_Det(txtFraqueza_3, 2, 3)
        Buscar_SWOT_Det(txtFraqueza_4, 2, 4)
        Buscar_SWOT_Det(txtFraqueza_5, 2, 5)
        Buscar_SWOT_Det(txtFraqueza_6, 2, 6)
        Buscar_SWOT_Det(txtFraqueza_7, 2, 7)
        Buscar_SWOT_Det(txtFraqueza_8, 2, 8)
        Buscar_SWOT_Det(txtFraqueza_9, 2, 9)
        Buscar_SWOT_Det(txtFraqueza_10, 2, 10)
        Buscar_SWOT_Det(txtFraqueza_11, 2, 11)
        Buscar_SWOT_Det(txtFraqueza_12, 2, 12)
        Buscar_SWOT_Det(txtFraqueza_13, 2, 13)
        Buscar_SWOT_Det(txtFraqueza_14, 2, 14)
        Buscar_SWOT_Det(txtFraqueza_15, 2, 15)

        Buscar_SWOT_Det(txtOportunidade_1, 3, 1)
        Buscar_SWOT_Det(txtOportunidade_2, 3, 2)
        Buscar_SWOT_Det(txtOportunidade_3, 3, 3)
        Buscar_SWOT_Det(txtOportunidade_4, 3, 4)
        Buscar_SWOT_Det(txtOportunidade_5, 3, 5)
        Buscar_SWOT_Det(txtOportunidade_6, 3, 6)
        Buscar_SWOT_Det(txtOportunidade_7, 3, 7)
        Buscar_SWOT_Det(txtOportunidade_8, 3, 8)
        Buscar_SWOT_Det(txtOportunidade_9, 3, 9)
        Buscar_SWOT_Det(txtOportunidade_10, 3, 10)
        Buscar_SWOT_Det(txtOportunidade_11, 3, 11)
        Buscar_SWOT_Det(txtOportunidade_12, 3, 12)
        Buscar_SWOT_Det(txtOportunidade_13, 3, 13)
        Buscar_SWOT_Det(txtOportunidade_14, 3, 14)
        Buscar_SWOT_Det(txtOportunidade_15, 3, 15)

        Buscar_SWOT_Det(txtAmeaca_1, 4, 1)
        Buscar_SWOT_Det(txtAmeaca_2, 4, 2)
        Buscar_SWOT_Det(txtAmeaca_3, 4, 3)
        Buscar_SWOT_Det(txtAmeaca_4, 4, 4)
        Buscar_SWOT_Det(txtAmeaca_5, 4, 5)
        Buscar_SWOT_Det(txtAmeaca_6, 4, 6)
        Buscar_SWOT_Det(txtAmeaca_7, 4, 7)
        Buscar_SWOT_Det(txtAmeaca_8, 4, 8)
        Buscar_SWOT_Det(txtAmeaca_9, 4, 9)
        Buscar_SWOT_Det(txtAmeaca_10, 4, 10)
        Buscar_SWOT_Det(txtAmeaca_11, 4, 11)
        Buscar_SWOT_Det(txtAmeaca_12, 4, 12)
        Buscar_SWOT_Det(txtAmeaca_13, 4, 13)
        Buscar_SWOT_Det(txtAmeaca_14, 4, 14)
        Buscar_SWOT_Det(txtAmeaca_15, 4, 15)
    End Sub

    Sub Buscar_SWOT_Det(ByVal iText As TextBox, ByVal idSWOT As Byte, ByVal idOrdem As Byte)
        'ByVal idSWOT As Byte, ByVal idOrdem As Byte
        iText.Text = oDb.ExecuteStoredProcedure_Scalar("PDCA.usp_Buscar_SWOT", Conexao.gerProjetos.ConnectionString, "@idFilial", cboFilial.CallFilial, "@idSWOT", idSWOT, "idOrdem", idOrdem)
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Dim TotalSWOT As Int16
        Atualizar()

        TotalSWOT = oDb.ExecuteStoredProcedure_Scalar("PDCA.usp_TotalDeSWOT", Conexao.gerProjetos.ConnectionString, "@idFilial", cboFilial.CallFilial)

        If TotalSWOT > 0 Then
            btnNovo.Visible = False
            btnAlterar.Visible = True
            btnAlterar.Enabled = True
        Else
            btnNovo.Visible = True
            btnAlterar.Visible = False
            btnNovo.Enabled = True
        End If

    End Sub


    Sub Atualizar()
        Clear_Fields()
        Buscar_SWOT()
    End Sub

End Class
