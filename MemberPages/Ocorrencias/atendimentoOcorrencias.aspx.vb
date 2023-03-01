﻿
Imports System.Activities.Expressions
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Security.Cryptography
Imports System.Windows.Forms
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports DevExpress.Mvvm.POCO
Imports DevExpress.Utils
Imports DevExpress.Web
Imports DevExpress.Web.ASPxHtmlEditor.Internal
Imports DevExpress.Xpf.Editors.Helpers
Imports DevExpress.Xpf.Editors.Native.TypedStyles
Imports DevExpress.Xpf.Map.Native
Imports DevExpress.XtraBars.Alerter
Imports DevExpress.XtraCharts.Native
Imports DevExpress.XtraDiagram.Base
Imports DevExpress.XtraExport.Helpers
Imports DevExpress.XtraSpreadsheet.Model
Imports DevExpress.XtraTreeList

Partial Class MemberPages_Ocorrencias_atendimentoOcorrencias
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaGrid()

            carregaSelects()

        End If
    End Sub

    Protected Sub carregaGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim data As SqlDataReader
        Dim adapter As New SqlDataAdapter
        Dim parameter As New SqlParameter
        Dim query As String = "Select ID From tblOcorrenciasGestores Where UserName = @User"
        Dim command As SqlCommand = New SqlCommand(query, con)

        grvDados.Columns(0).Visible = True

        con.Open()

        With command.Parameters
            .Add(New SqlParameter("@User", User.Identity.Name.ToString()))
        End With
        command.Connection = con
        adapter.SelectCommand = command
        data = command.ExecuteReader()

        If data.HasRows Then
            query = "Select ID, Convert(varchar,Data_Requisicao,103) As Data_Requisicao, Solicitante, idSetor, Assunto, b.FilialLista As Unidade From gerTemp.dbo.tblOcorrencias A Join gerCadastros.Cadastros.tblCadFiliais B On A.idFilial = b.Filial Where Status Not In ('Finalizado','Improcedente') Order By Data_Requisicao Asc"
            btnAtend.Visible = True
        Else
            query = "Select ID, Convert(varchar,Data_Requisicao,103) As Data_Requisicao, Solicitante, idSetor, Assunto, b.FilialLista As Unidade From gerTemp.dbo.tblOcorrencias A Join gerCadastros.Cadastros.tblCadFiliais B On A.idFilial = b.Filial Where Status Not In ('Finalizado','Improcedente') And Solicitante = '" + User.Identity.Name.ToString() + "' Order By Data_Requisicao Asc"
            btnAtend.Visible = False
        End If

        command.Dispose()
        data.Close()

        command = New SqlCommand(query, con)

        Dim idr As IDataReader = command.ExecuteReader()
        grvDados.DataSource = idr
        grvDados.DataBind()

        For i As Integer = 0 To grvDados.Rows.Count - 1
            If grvDados.Rows(i).Cells(0).Text.ToString() = lblID.InnerText Then
                grvDados.Rows(i).BackColor = System.Drawing.ColorTranslator.FromHtml(“#FFC0C0”)
            End If
        Next

        grvDados.Columns(0).Visible = False

        con.Close()
        idr.Close()
        command.Dispose()

    End Sub

    Private Sub carregaSelects()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim selectSQL As String = "SELECT Filial ,RTRIM(FilialLista) AS nomeFilial FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE (IdLojasCDs=1 or isAtacarejo = 1) and Filial not in (100) ORDER BY nomeFilial"
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            selUnidade.DataSource = cmd.ExecuteReader()
            selUnidade.DataTextField = "nomeFilial"
            selUnidade.DataValueField = "Filial"

            'Activate the binding.
            selUnidade.DataBind()

            con.Close()

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try

        selUnidade.Items.Insert(0, New ListItem("", ""))
        selUnidade.SelectedIndex = 0

        selStatus.Items.Clear()
        selStatus.Items.Insert(0, New ListItem("", ""))
        selStatus.Items.Insert(1, New ListItem("Em Análise", "Em Análise"))
        selStatus.Items.Insert(2, New ListItem("Aguardando Orçamento/Aprovação", "Aguardando Orçamento/Aprovação"))
        selStatus.Items.Insert(3, New ListItem("Em Atendimento", "Em Atendimento"))
        selStatus.Items.Insert(4, New ListItem("Improcedente", "Improcedente"))
        selStatus.Items.Insert(5, New ListItem("Finalizado", "Finalizado"))
        selStatus.SelectedIndex = 0

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim adapter As New SqlDataAdapter
        Dim parameter As New SqlParameter
        Dim Mountquery As String = "Select ID, Convert(varchar,Data_Requisicao,103) As Data_Requisicao, Solicitante, idSetor, Assunto, b.FilialLista As Unidade From gerTemp.dbo.tblOcorrencias A Join gerCadastros.Cadastros.tblCadFiliais B On A.idFilial = b.Filial Where 1=1 "
        Dim command As SqlCommand

        If daterange.Value.Length > 0 Then

            Mountquery += " And Data_Requisicao Between Convert(datetime,'" & Split(daterange.Value, " à ", 0)(0).ToString() & "',103) and Convert(datetime,'" & Split(daterange.Value, " à ", 0)(1).ToString() & "',103) "
        End If

        If selUnidade.Value.Length > 0 Then
            Mountquery += " And idFilial = '" & selUnidade.Value.ToString() & "' "
        End If

        If selStatus.Value.Length > 0 Then
            Mountquery += " And Status In ('" & selStatus.Value.ToString() & "') "
        Else
            Mountquery += " And Status Not In ('Finalizado','Improcedente') "
        End If

        Mountquery += " Order By Data_Requisicao Asc"

        grvDados.Columns(0).Visible = True

        con.Open()
        command = New SqlCommand(Mountquery, con)
        Dim idr As IDataReader = command.ExecuteReader()
        grvDados.DataSource = idr
        grvDados.DataBind()

        grvDados.Columns(0).Visible = False
        divDetalhes.Visible = False

        con.Close()
        idr.Close()
        command.Dispose()

        divDesc.Focus()

    End Sub

    Protected Sub Details_Click(sender As Object, e As EventArgs)
        Dim idRowSelected = DirectCast(sender, System.Web.UI.WebControls.Button).CommandName

        lblID.InnerText = idRowSelected

        carregaGrid()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim query As String = "Select ID, Data_Requisicao, Solicitante, b.nomeSetor As Setor, Descricao, Status, Classificacao, Upload, Observacao, convert(decimal(10,2),Custo) As Custo, Isnull(Upload_Atendimento,'') Upload_Atendimento From gerTemp.dbo.tblOcorrencias a Join gerCadastros.dbo.[tblCadSetor] b On a.idSetor = b.idSetor Where Id = @id "

        con.Open()

        Dim data As SqlDataReader
        Dim adapter As New SqlDataAdapter
        Dim parameter As New SqlParameter
        Dim command As SqlCommand = New SqlCommand(query, con)
        With command.Parameters
            .Add(New SqlParameter("@id", idRowSelected.ToString()))
        End With
        command.Connection = con
        adapter.SelectCommand = command
        data = command.ExecuteReader()
        While data.Read
            If data.HasRows = True Then
                divDetalhes.Visible = True
                lblSol.InnerText = data(2).ToString()
                lblSetor.InnerText = data(3).ToString()
                divDesc.InnerHtml = Server.HtmlDecode(data(4).ToString())
                ddlStatusAtend.SelectedValue = data(5).ToString()
                lblStatus.InnerText = data(5).ToString()
                ddlClassifcAtend.SelectedValue = data(6).ToString()

                divImgs.InnerText = ""
                Dim imgs() As String = Split(data(7), ";", -1)

                ' Iterate through the list by using nested loops.
                For Each complilaImgs In imgs
                    If complilaImgs.ToString() <> "" Then
                        divImgs.InnerHtml += "<a href='imgs\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
                    End If
                Next

                CKEditor1.Text = data(8).ToString()

                If CKEditor1.Text.Length() < 137 Then
                    CKEditor1.Text = "<p style='text-align: center;'><span style='font-size: 20px;'><strong>Registro de Atendimento</strong></span></p><ul><li>&nbsp;</li></ul>"
                End If

                txtCusto.Attributes.Add("Text", data(9).ToString())

                txtCusto.Value = data(9)


                divArquivosAtend.InnerText = ""

                Dim imgsAtend() As String = Split(data(10), ";", -1)

                ' Iterate through the list by using nested loops.
                For Each complilaImgs In imgsAtend
                    If complilaImgs.ToString() <> "" Then
                        divArquivosAtend.InnerHtml += "<a href='imgs_atend\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
                    End If
                Next

            Else
                divDetalhes.Visible = False
            End If
        End While

        con.Close()
        command.Dispose()
    End Sub

    Protected Sub btnChange_Click(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim rowsAffected As Integer
        Dim arquivo = ""

        If uploadImage.PostedFiles.Count > 0 Then

            For Each i In uploadImage.PostedFiles

                'Se quiser colocar uma trava com tamanho dá pra usar esse campo
                'Dim size = i.ContentLength

                If i.ContentLength > 0 Then
                    Dim SaveLocation As String = Server.MapPath("imgs_atend\") & "" & i.FileName

                    If arquivo <> "" Then
                        arquivo += ";" & i.FileName
                    Else
                        arquivo = i.FileName
                    End If

                    Try
                        i.SaveAs(SaveLocation)
                        'Me.lblStatus.InnerText = "The file has been uploaded."
                    Catch Exc As Exception
                        'lblStatus.InnerText = "Error: " & Exc.Message
                    End Try
                End If
            Next
        End If

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("UPDATE tblOcorrencias Set  Classificacao = @classif , Status = @status , Matricula_Atendente = @atendente , Observacao = @obs , Custo = @custo , Upload_Atendimento = @upload , Data_Atendimento = Getdate() WHERE ID = @id", con)

                cmd.Parameters.Add("@classif", SqlDbType.VarChar).Value = ddlClassifcAtend.SelectedValue
                cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = ddlStatusAtend.SelectedValue
                cmd.Parameters.Add("@atendente", SqlDbType.VarChar).Value = User.Identity.Name.ToString()
                cmd.Parameters.Add("@custo", SqlDbType.Money).Value = txtCusto.Value.TryConvertToDecimal()
                cmd.Parameters.Add("@upload", SqlDbType.VarChar).Value = arquivo
                cmd.Parameters.Add("@obs", SqlDbType.VarChar).Value = CKEditor1.Text
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblID.InnerText

                con.Open()
                rowsAffected = cmd.ExecuteNonQuery()
                con.Close()
                cmd.Dispose()

            End Using
        End Using

        carregaGrid()

        lblStatus.InnerText = ddlStatusAtend.SelectedValue

        divDetalhes.Visible = False

    End Sub

End Class
