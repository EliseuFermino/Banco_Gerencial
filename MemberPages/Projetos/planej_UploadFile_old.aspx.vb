Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class MemberPages_planejUploadArquivo
    Inherits System.Web.UI.Page

    Dim cnnStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"

    Protected Sub btnSubmit_Manutencao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit_Manutencao.Click
        Dim oProjeto As New Projeto
        If MyFile.PostedFile.ContentLength = 0 Then
            UserMsgBox(Me, "Você não selecionou nenhum arquivo.")
            Return
        End If

        lbl.Text = MyFile.PostedFile.FileName

        If Me.ASPxCheckBox1.Checked = False Then
            If File.Exists(oProjeto.CaminhoArquivo(Me.cboProjeto.Value, MyFile.PostedFile.FileName)) Then
                UserMsgBox(Me, "Este arquivo já se encontra no Projeto!!! O arquivo não foi carregado.")
                Return
            Else
                MyFile.PostedFile.SaveAs(oProjeto.CaminhoArquivo(Me.cboProjeto.Value, MyFile.PostedFile.FileName))
            End If
        Else
            If File.Exists(oProjeto.CaminhoArquivo(Me.cboProjeto.Value, MyFile.PostedFile.FileName)) Then
                UserMsgBox(Me, "Este arquivo já se encontra no Projeto!!! O arquivo não foi carregado.")
                Return
            Else
                MyFile.PostedFile.SaveAs(oProjeto.CaminhoArquivo(999, Me.lbl.Text))
            End If
        End If
        Call CarregarArquivos(oProjeto.PathArquivo)

    End Sub

    Private Sub CarregarArquivos(ByVal iCaminhoDiretorio As String)

        Using conn As New SqlConnection(cnnStr)
            Using cmdTest As New SqlCommand("uspProjUploadFile", conn)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@nomeArquivo", Me.txtNomeArquivoAmigavel.Text)
                cmdTest.Parameters.AddWithValue("@linkFile", CStr(Trim(iCaminhoDiretorio & MyFile.PostedFile.FileName)))
                If Me.ASPxCheckBox1.Checked = False Then
                    cmdTest.Parameters.AddWithValue("@idProjeto", Me.cboProjeto.Value)
                Else
                    cmdTest.Parameters.AddWithValue("@idProjeto", 999)
                End If
                cmdTest.Parameters.AddWithValue("@nomeUsuario", CStr(Trim(Me.txtNomeUsuario.Text)))
                cmdTest.Parameters.AddWithValue("@UserName", User.Identity.Name)

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()

                    Me.gridView.DataBind()
                    UserMsgBox(Me, "O arquivo " & MyFile.PostedFile.FileName & " foi carregado com sucesso!!!")

                Catch ex As Exception
                    UserMsgBox(Me, "Módulo: CarregarArquivos - " & ex.Message)
                    UserMsgBox(Me, "Houve um problema. O arquivo " & MyFile.PostedFile.FileName & " não foi carregado.")
                End Try
                conn.Close()
            End Using
        End Using
    End Sub

    Public Sub UserMsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Call DeletarArquivos()
    End Sub

    Private Sub DeletarArquivos()

        Dim filePath As String

        filePath = "C:\inetpub\wwwroot\Intranet\" & Mid(Replace(Me.ASPxTextBox2.Text, "/", "\"), 3)

        Using conn As New SqlConnection(cnnStr)
            Using cmdTest As New SqlCommand("uspProjDeleteFile", conn)
                cmdTest.CommandType = CommandType.StoredProcedure
                '~/Arquivos/Redesenho de Processos/padronização documentos CONDOR.xls
                cmdTest.Parameters.AddWithValue("@idFile", Me.ASPxTextBox1.Text)

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()

                    File.Delete(filePath)

                    Me.gridView.DataBind()
                    UserMsgBox(Me, "O arquivo " & MyFile.PostedFile.FileName & " foi excluido com sucesso!!!")

                Catch ex As Exception
                    UserMsgBox(Me, "Módulo: CarregarArquivos - " & ex.Message)
                    UserMsgBox(Me, "O arquivo " & MyFile.PostedFile.FileName & " não foi excluido. Você deve selecionar um arquivo antes de excluir")
                End Try
                conn.Close()
            End Using
        End Using
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oProjeto As New Projeto
        Dim oVem As New VendaEmpresaMes

        If Not IsPostBack Then oVem.AtualizarEstatisticaPrograma(31, User.Identity.Name)

        Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
            Case 1  'Todos
                Me.cboProjeto.Enabled = True
            Case 2  'Responsável pelo Projeto
                Me.cboProjeto.Enabled = False
            Case 3  'Somente Leitura
                Me.cboProjeto.Enabled = False
        End Select

        Me.cboProjeto.Text = oProjeto.NumeroDoProjeto(User.Identity.Name)
        Me.ASPxCheckBox1.Checked = False
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Me.Exporter1.WriteXlsToResponse()
    End Sub
End Class
