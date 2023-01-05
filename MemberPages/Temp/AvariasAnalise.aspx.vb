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

    Protected Sub cpPanelImagem_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cpPanelImagem.Callback
        On Error Resume Next

        Dim idProduto As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO").ToString()
        Session("sPRODUTO") = idProduto

        gvDetail.DataBind()

    End Sub


    Protected Sub cbPanelMaster_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelMaster.Callback
        On Error Resume Next


        gvMaster.DataBind()
        gvDetail.DataBind()

        Dim selectedItem As ListEditItem = cboCampanha.SelectedItem
        Dim sCampanha As String = selectedItem.GetValue("idCampanha").ToString()
        Session("sCAMPANHA") = sCampanha


        Session("sPRODUTO") = lblHost.Text

        'lblError.Text = Session("sCAMPANHA") & " - " & Session("sPRODUTO")
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(324, cboFilial.nomeUsuario)
            cboFilial.AutoPostBack = True

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Avarias - PGR324"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Label1.Text = cboFilial.CallFilial
            If cboFilial.IsLoja = True Then
                oCl.ExecuteStoredProcedure_Scalar("dbo.usp_ImportarCampanha_Avaria_pelaLoja", Conexao.gerTran_SLV_str, "idFilial", cboFilial.CallFilial)
                oCl.ExecuteStoredProcedure_Scalar("Campanha.usp_AtualizarCampanhasFromOracle_Avaria_porLoja", Conexao.DW_Condor_One_ConnectionString, "idFilial", cboFilial.CallFilial)
                Session("sFILIAL") = cboFilial.CallFilial
                dsListaCampanha.DataBind()
                opcaoSalvar.Visible = True
            Else
                Session("sFILIAL") = 99
                opcaoSalvar.Visible = False
            End If

        End If
    End Sub

#End Region

    Private Sub UploadImagem(ByVal oUpload As Object, ByVal idFoto As Byte)
        On Error Resume Next
        Dim intLength As Integer
        Dim arrContent As Byte()

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

            oUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)



            If Doc2SQLServer(arrContent, idFoto) = True Then
                lblStatus.Text = "A imagem foi salva com sucesso!!!"
            Else
                lblStatus.Text = "Um erro ocorreu ao carregar a imagem... Por favor, tente novamente."
            End If

        End If
    End Sub

    Protected Function Doc2SQLServer(ByVal Content As Byte(), ByVal idFoto As Byte) As Boolean

        Try

            Dim cnn As Data.SqlClient.SqlConnection
            Dim cmd As Data.SqlClient.SqlCommand
            Dim param As Data.SqlClient.SqlParameter
            Dim strSQL As String

            Dim selectedItem As ListEditItem = cboCampanha.SelectedItem
            Dim sCampanha As String = selectedItem.GetValue("idCampanha").ToString()
            Dim sFilial As String = selectedItem.GetValue("nomeFilialLista").ToString()
            Dim idProduto As Integer = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CODPRODUTO").ToString()

            strSQL = "Insert Into Campanha.CAMPAVARIA_IMAGE (idFoto, idFilial,foto,SEQUENCIA,CODPRODUTO) Values(@idFoto, @idFilial, @foto, @SEQUENCIA, @CODPRODUTO)"

            cnn = New Data.SqlClient.SqlConnection(Conexao.DW_Condor_One_ConnectionString)
            cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)

            param = New Data.SqlClient.SqlParameter("@foto", Data.SqlDbType.VarBinary)
            param.Value = Content
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idFoto", Data.SqlDbType.TinyInt)
            param.Value = idFoto
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idFilial", Data.SqlDbType.TinyInt)
            param.Value = Left(sFilial, 2)
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@SEQUENCIA", Data.SqlDbType.Int)
            param.Value = sCampanha
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@CODPRODUTO", Data.SqlDbType.Int)
            param.Value = idProduto
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

        UploadImagem(upFile1_1, 1)
        UploadImagem(upFile1_2, 2)
        UploadImagem(upFile1_3, 3)
        UploadImagem(upFile1_4, 4)

        UpdateFotos()

        Dim selectedItem As ListEditItem = cboCampanha.SelectedItem
        Dim sCampanha As String = selectedItem.GetValue("idCampanha").ToString()
        Dim sDiaInicio As String = selectedItem.GetValue("DTAINICIO").ToString()
        Dim sDiaFim As String = selectedItem.GetValue("DTAFIM").ToString()
        Dim sSituacao As String = selectedItem.GetValue("SITUACAO").ToString()

        lblNumeroCampanha.Text = sCampanha
        lblDiaInicial.Text = " " + sDiaInicio + " à " + sDiaFim
        btnSituacao.Text = sSituacao

        gvDetail.DataBind()

        

    End Sub

    Private Sub UpdateFotos()

        oCl.ExecuteStoredProcedure_Scalar("dbo.uspAtulizarFotosAvarias", Conexao.DW_Condor_One_ConnectionString, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"))

        oCl.ExecuteStoredProcedure("dbo.usp_Avaria_Update_Observacao", Conexao.DW_Condor_One_ConnectionString, "idFilial", cboFilial.CallFilial, "idCampanha", Session("sCAMPANHA"), "idProduto", Session("sPRODUTO"), "Observacao", txtObservacao.Text)

    End Sub


 
  
    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
        Label1.Text = cboFilial.CallFilial
        dsListaCampanha.DataBind()

    End Sub
End Class
