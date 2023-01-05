Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports DevExpress.Web

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Text



Partial Class MemberPages_Checklist_AvariasAnalise
    Inherits System.Web.UI.Page

    Dim oCl As New clDataDb
    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes


    Protected Sub cpPanelImagem_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cpPanelImagem.Callback
        On Error Resume Next

        Dim idProduto As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO")
        Dim idCampanha As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idCampanha")
        Dim numSerie As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "NROSERIE").ToString()

        Session("sPRODUTO") = idProduto
        Session("sCAMPANHA") = idCampanha
        Session("sNUM_SERIE") = numSerie

    End Sub


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(324, cboFilial.nomeUsuario)
            cboFilial.AutoPostBack = True
        End If
        lblError.Visible = True

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Avarias - PGR324"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then
            If cboFilial.IsLoja = True Then
                oCl.ExecuteStoredProcedure_Scalar("dbo.usp_ImportarCampanha_Avaria_pelaLoja", Conexao.gerTran_SLV_str, "idFilial", cboFilial.CallFilial)
                oCl.ExecuteStoredProcedure_Scalar("Campanha.usp_AtualizarCampanhasFromOracle_Avaria_porLoja", Conexao.DW_Condor_One_ConnectionString, "idFilial", cboFilial.CallFilial)
                Session("sFILIAL") = cboFilial.CallFilial
                dsListaCampanha.DataBind()
                opcaoSalvar.Visible = True
                divObservacao.Visible = False
            Else
                Session("sFILIAL") = 3
                opcaoSalvar.Visible = False
                divObservacao.Visible = True
            End If

            If LCase(cboFilial.nomeUsuario) = "ricardo" Or LCase(cboFilial.nomeUsuario) = "eliseu" Then
                btnSalvarRicardo.Visible = True
            Else
                btnSalvarRicardo.Visible = False
            End If

        End If


    End Sub

#End Region

    Private Sub UploadImagem(ByVal oUpload As Object, ByVal idFoto As Byte)
        On Error GoTo HandleErrors

        Dim intLength As Integer
        Dim arrContent As Byte()
        Const maxFileLength As Integer = 409600 ' 400Kb


        If oUpload.PostedFile Is Nothing Then
            lblStatus.Text = "Nenhum arquivo selecionado."
            Exit Sub
        Else
            Dim fileName As String = oUpload.PostedFile.FileName
            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = ext.ToLower

            Dim imgType = oUpload.PostedFile.ContentType
            If ext = ".jpg" Then
            ElseIf ext = ".bmp" Then
            ElseIf ext = ".gif" Then
            ElseIf ext = ".png" Then
            ElseIf ext = "jpg" Then
            ElseIf ext = "bmp" Then
            ElseIf ext = "gif" Then
            ElseIf ext = "png" Then
            Else
                lblStatus.Text = "Somente gif, bmp, png or jpg formatos são válidos."
                Exit Sub
            End If

            intLength = Convert.ToInt32(oUpload.PostedFile.InputStream.Length)


            ReDim arrContent(intLength)

            If intLength > maxFileLength Then
                Beep()
                oVem.UserMsgBox(Me, "A Foto esta muito grande!!! O tamanho da Foto 1 é de " & Math.Round(intLength / 1024, 0) & "KB e o tamanho máximo é " & Math.Round(maxFileLength / 1024, 0) & "Kb")
                lblStatus.Text = "A imagem " & idFoto & " não foi salva. Diminua o tamanho e tente novamente. O tamanho da Foto 1 é de " & Math.Round(intLength / 1024, 0) & "KB e o Tamanho máximo = 400Kb."
                lblStatus.Font.Size = 11
                lblStatus.CssClass = "label label-danger"
                Exit Sub
            Else
                oUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)

                If intLength > 0 Then

                    If Doc2SQLServer(arrContent, idFoto) = True Then
                        lblStatus.Text = "A imagem foi salva com sucesso!!!"
                        UpdateFotos(idFoto)
                        Atualizar_BlocoCampanha()
                        gvDetail.DataBind()
                    Else
                        lblStatus.Text = "Um erro ocorreu ao carregar a imagem... Por favor, tente novamente."
                    End If
                Else
                    lblStatus.Text = "Você não selecionou nenhuma imagem"
                End If
            End If
            
        End If

ExitHere:
        ' Perform cleanup code here.
        ' Disregard errors in this
        ' cleanup code.
        'On Error Resume Next
        ' Perform cleanup code.
        Exit Sub

HandleErrors:
        Select Case Err.Number
            ' Add cases for each
            ' error number you want to trap.
            Case 5
                lblStatus.Font.Size = 11
                lblStatus.CssClass = "label label-danger"

                lblStatus.Text = "Você não selecinou nenhuma foto. A Imagem não foi salva!!!"
            Case Else
                ' Add "last-ditch" error handler.
                'MsgBox("Error: " & Err.Description)
                lblStatus.Text = Err.Number & " - " & Err.Description
        End Select
        Resume ExitHere

    End Sub

    Protected Function Doc2SQLServer(ByVal Content As Byte(), ByVal idFoto As Byte) As Boolean

        Try

            Dim cnn As SqlClient.SqlConnection
            Dim cmd As SqlClient.SqlCommand
            Dim param As SqlClient.SqlParameter
            Dim strSQL As String

            Dim selectedItem As ListEditItem = cboCampanha.SelectedItem
            Dim sCampanha As String = selectedItem.GetValue("idCampanha").ToString()
            Dim sFilial As String = selectedItem.GetValue("nomeFilialLista").ToString()
            Dim idProduto As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO").ToString()
            Dim sNumSerie As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "NROSERIE").ToString()

            strSQL = "Insert Into Campanha.CAMPAVARIA_IMAGE (idFoto, idFilial,foto,SEQUENCIA,CODPRODUTO,NROSERIE) Values(@idFoto, @idFilial, @foto, @SEQUENCIA, @CODPRODUTO, @NROSERIE)"

            cnn = New SqlClient.SqlConnection(Conexao.DW_Condor_One_ConnectionString)
            cmd = New SqlClient.SqlCommand(strSQL, cnn)

            param = New SqlClient.SqlParameter("@foto", SqlDbType.VarBinary)
            param.Value = Content
            cmd.Parameters.Add(param)

            param = New SqlClient.SqlParameter("@idFoto", SqlDbType.TinyInt)
            param.Value = idFoto
            cmd.Parameters.Add(param)

            param = New SqlClient.SqlParameter("@idFilial", SqlDbType.TinyInt)
            param.Value = Left(sFilial, 2)
            cmd.Parameters.Add(param)

            param = New SqlClient.SqlParameter("@SEQUENCIA", SqlDbType.Int)
            param.Value = sCampanha
            cmd.Parameters.Add(param)

            param = New SqlClient.SqlParameter("@CODPRODUTO", SqlDbType.Int)
            param.Value = idProduto
            cmd.Parameters.Add(param)

            param = New SqlClient.SqlParameter("@NROSERIE", SqlDbType.VarChar)
            param.Value = sNumSerie
            cmd.Parameters.Add(param)


            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
            cnn.Dispose()

            Return True

        Catch ex As Exception
            lblError.Text = ex.Message
            Return False
        End Try

    End Function

    Protected Sub btnSalvarImagem_Click(sender As Object, e As EventArgs) Handles btnSalvarImagem.Click



        If chkIncluirImagens.Checked = True Then
            'UploadImagem(upFile1_1, 1)
            'UploadImagem(upFile1_2, 2)
            'UploadImagem(upFile1_3, 3)
            'UploadImagem(upFile1_4, 4)

            'UpdateFotos()
        End If




        '----
        'Atualizar_BlocoCampanha()

        '-----
        'gvDetail.DataBind()

    End Sub

    Private Sub UpdateFotos(ByVal idFoto As Byte)

        If chkIncluirImagens.Checked = True And chkObservacao.Checked = True Then
            oCl.ExecuteStoredProcedure_Scalar("dbo.uspAtulizarFotosAvarias", Conexao.DW_Condor_One_ConnectionString, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"), "numSerie", Session("sNUM_SERIE"), "idFoto", idFoto)
            oCl.ExecuteStoredProcedure("dbo.usp_Avaria_Update_Observacao", Conexao.DW_Condor_One_ConnectionString, "idFilial", cboFilial.CallFilial, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"), "Observacao", txtObservacao.Text)
            lblStatus.Text = "As 'Imagens' e a 'Observação' foram salvas com sucesso!!!"
        ElseIf chkIncluirImagens.Checked = True Then
            oCl.ExecuteStoredProcedure_Scalar("dbo.uspAtulizarFotosAvarias", Conexao.DW_Condor_One_ConnectionString, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"), "numSerie", Session("sNUM_SERIE"), "idFoto", idFoto)
            lblStatus.Text = "As 'Imagens' foram salvas com sucesso!!!"
        ElseIf chkObservacao.Checked = True Then
            oCl.ExecuteStoredProcedure("dbo.usp_Avaria_Update_Observacao", Conexao.DW_Condor_One_ConnectionString, "idFilial", cboFilial.CallFilial, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"), "Observacao", txtObservacao.Text)
            lblStatus.Text = "A 'Observação' foi salva com sucesso!!!"
        End If
        'lblStatus.Text = ""
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
        dsListaCampanha.DataBind()
        cboCampanha.DataBind()

        If cboCampanha.Items.Count - 1 > 0 Then
            cboCampanha.SelectedIndex = 0
        End If


        ' ----
        Atualizar_BlocoCampanha()
        ' ------

        'gvDetail.DataBind()
        'lblStatus.Text = ""

        On Error Resume Next

        gvMaster.DataBind()

        Dim idProduto As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO")
        Dim idCampanha As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idCampanha")
        Dim numSerie As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "NROSERIE").ToString()

        Session("sPRODUTO") = idProduto
        Session("sCAMPANHA") = idCampanha
        Session("sNUM_SERIE") = numSerie

        gvDetail.DataBind()

    End Sub

    Private Sub Atualizar_BlocoCampanha()
        On Error Resume Next
        Dim selectedItem As ListEditItem = cboCampanha.SelectedItem
        Dim sCampanha As String = selectedItem.GetValue("idCampanha").ToString()
        Dim sDiaInicio As String = selectedItem.GetValue("DTAINICIO").ToString()
        Dim sDiaFim As String = selectedItem.GetValue("DTAFIM").ToString()
        Dim sSituacao As String = selectedItem.GetValue("SITUACAO").ToString()

        Session("sCAMPANHA") = sCampanha
        lblNumeroCampanha.Text = sCampanha
        lblDiaInicial.Text = " " + sDiaInicio + " à " + sDiaFim
        btnSituacao.Text = sSituacao

    End Sub

    Protected Sub cboCampanha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCampanha.SelectedIndexChanged
        Atualizar_BlocoCampanha()
    End Sub



    Protected Sub gvMaster_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gvMaster.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "MRGVENDA")
    End Sub

   
    Protected Sub btnSalvarRicardo_Click(sender As Object, e As EventArgs) Handles btnSalvarRicardo.Click
        oCl.ExecuteStoredProcedure_Scalar("Campanha.usp_VistoRicardo", Conexao.DW_Condor_One_ConnectionString, "idCampanha", Session("sCAMPANHA"))
    End Sub

    Protected Sub cbPanelMaster_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelMaster.Callback

        gvMaster.DataBind()
        lblError.Text = " DADOS 2"
        On Error Resume Next

        Dim idProduto As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO")
        Dim idCampanha As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idCampanha")
        Dim numSerie As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "NROSERIE").ToString()

        Session("sPRODUTO") = idProduto
        Session("sCAMPANHA") = idCampanha
        Session("sNUM_SERIE") = numSerie



        gvDetail.DataBind()
    End Sub

    Protected Sub btnSalvarImagem1_Click(sender As Object, e As EventArgs) Handles btnSalvarImagem1.Click
        If chkIncluirImagens.Checked = True Then UploadImagem(upFile1_1, 1)

    End Sub

    Protected Sub btnSalvarImagem2_Click(sender As Object, e As EventArgs) Handles btnSalvarImagem2.Click
        If chkIncluirImagens.Checked = True Then UploadImagem(upFile1_2, 2)

    End Sub

    Protected Sub btnSalvarImagem3_Click(sender As Object, e As EventArgs) Handles btnSalvarImagem3.Click
        If chkIncluirImagens.Checked = True Then UploadImagem(upFile1_3, 3)

    End Sub

    Protected Sub btnSalvarImagem4_Click(sender As Object, e As EventArgs) Handles btnSalvarImagem4.Click
        If chkIncluirImagens.Checked = True Then UploadImagem(upFile1_4, 4)

    End Sub
End Class
