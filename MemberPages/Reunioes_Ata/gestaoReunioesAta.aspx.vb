
Imports System.Data
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports CKEditor
Imports DevExpress.DataAccess.Sql
Imports DevExpress.Utils.Extensions
Imports DevExpress.Xpf.Editors.Helpers
Imports DevExpress.Xpo.Exceptions
Imports DevExpress.XtraReports.Design
Imports DevExpress.XtraRichEdit.API.Native
Imports DevExpress.XtraSpreadsheet.Model


Partial Class MemberPages_Reunioes_Ata_gestaoReunioesAta
    Inherits System.Web.UI.Page

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Private vFilial As Int16
    Dim oProj As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaSelects()

            If (Session("sISLOJA") Is Nothing) Then
                Session_Departamento()
            End If

            If (Session("sISLOJA")) Then
                selLocalConsulta.Disabled = True
                selLocalConsulta.Value = Session("sFILIAL")
            Else
                selLocalConsulta.Disabled = False
            End If


        End If
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            ' Dim oVem As New VendaEmpresaMes
            'oVem.AtualizarEstatisticaPrograma(436, User.Identity.Name)

        End If
    End Sub

    Private Sub Session_Departamento()
        vDepartamento = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
        vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
        vIsLoja = oProj.Isloja
        'vIsRegional = oProj.IsRegional
        'lblError.Text = vDepartamento

        Session("sDEPARTAMENTO") = vDepartamento
        Session("sFILIAL") = vFilial
        Session("sISLOJA") = vIsLoja

    End Sub

    Protected Sub carregaGrid()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim adapter As New SqlDataAdapter
        Dim parameter As New SqlParameter
        Dim Mountquery As String = "Select ID, Autor, Titulo, Assunto,Convert(varchar,Data,103) As Data, a.Tipo, b.FilialLista as Unidade, Arquivo From gerTemp.dbo.[tblRegistroAta] A Join gerCadastros.Cadastros.tblCadFiliais B On A.idFilial = b.Filial Where 1=1 "
        Dim command As SqlCommand
        Dim data As SqlDataReader
        Dim query As String = "Select Username From Gertemp.dbo.[vw_OcorrenciaGestores] Where UserName = @User"
        command = New SqlCommand(query, con)

        grvDados.Columns(0).Visible = True

        con.Open()

        With command.Parameters
            .Add(New SqlParameter("@User", User.Identity.Name.ToString()))
        End With
        command.Connection = con
        adapter.SelectCommand = command
        data = command.ExecuteReader()

        If Session("sISLOJA") Then
            Mountquery += " And Acesso In (99) "
        Else
            Mountquery += " And Acesso In ('99') "
        End If

        command.Dispose()
        data.Close()

        If daterange.Value.Length > 0 Then
            Mountquery += " And Data Between Convert(datetime,'" & Split(daterange.Value, " à ", 0)(0).ToString() & " 00:00',103) and Convert(datetime,'" & Split(daterange.Value, " à ", 0)(1).ToString() & " 23:59',103) "
        End If

        If selLocalConsulta.Value.Length > 0 Then
            Mountquery += " And idFilial In ('" & selLocalConsulta.Value.ToString() & "') "
        End If

        Mountquery += " Order By Data Asc"

        command = New SqlCommand(Mountquery, con)
        Dim idr As IDataReader = command.ExecuteReader()
        grvDados.DataSource = idr
        grvDados.DataBind()

        grvDados.Columns(0).Visible = False

        con.Close()
        idr.Close()
        command.Dispose()

    End Sub

    Private Sub carregaSelects()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCadastrosConnectionString").ConnectionString
        Dim selectSQL As String = "SELECT Filial ,RTRIM(FilialLista) AS nomeFilial FROM Cadastros.tblCadFiliaisLista WHERE (IdLojasCDs=1 or isAtacarejo = 1) ORDER BY Filial"

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(selectSQL)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        selLocal.DataSource = ds.Tables(0)
                        selLocal.DataTextField = "nomeFilial"
                        selLocal.DataValueField = "Filial"
                        selLocal.DataBind()
                        selAcesso.DataSource = ds.Tables(0)
                        selAcesso.DataTextField = "nomeFilial"
                        selAcesso.DataValueField = "Filial"
                        selAcesso.DataBind()
                        selLocalConsulta.DataSource = ds.Tables(0)
                        selLocalConsulta.DataTextField = "nomeFilial"
                        selLocalConsulta.DataValueField = "Filial"
                        selLocalConsulta.DataBind()
                    End Using
                End Using
            End Using
        End Using

        selLocal.Items.Insert(0, New ListItem("", ""))
        selLocal.SelectedIndex = 0

        selAcesso.Items.Insert(0, New ListItem("Todas as lojas", "99"))

        selLocalConsulta.Items.Insert(0, New ListItem("", ""))
        selLocalConsulta.SelectedIndex = 0
    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

        carregaGrid()

    End Sub

    Protected Sub btnNovaAta_Click(sender As Object, e As EventArgs)
        divNovaAta.Visible = True
        divVoltar.Visible = True
        divMenu.Visible = False
        divConsulta.Visible = False
    End Sub

    Protected Sub btnConsulta_Click(sender As Object, e As EventArgs)
        divMenu.Visible = False
        divNovaAta.Visible = False
        divVoltar.Visible = True
        divConsulta.Visible = True
    End Sub

    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs)
        divMenu.Visible = True
        divVoltar.Visible = False
        divNovaAta.Visible = False
        divConsulta.Visible = False
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

        Dim autor = User.Identity.Name.ToUpper()
        Dim titulo = lblTitulo.Value
        Dim assunto = lblAssunto.Value
        Dim dataAta = lblData.Value
        Dim tipo = selTipo.Value
        Dim idFilial = selLocal.Value
        Dim acesso = ""
        Dim arquivo = ""
        Dim count = 1
        Dim tipoArquivo = ""

        For Each itens In selAcesso.Items()
            If (itens.Selected = True) Then
                If (acesso <> "") Then
                    acesso += ";" & itens.Value
                Else
                    acesso = itens.Value
                End If

                If (itens.Value = "99") Then
                    Exit For
                End If
            End If
        Next

        If (titulo = "" Or assunto = "" Or dataAta = "" Or tipo = "" Or idFilial = "" Or acesso = "" Or FileUpload.FileContent.Length = 0) Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCampos();", True)
            Return
        End If

        If FileUpload.PostedFiles.Count > 0 Then
            For Each i In FileUpload.PostedFiles
                'Se quiser colocar uma trava com tamanho dá pra usar esse campo
                'Dim size = i.ContentLength


                If i.ContentLength > 0 Then
                    If (i.FileName.Contains(".docx")) Then
                        tipoArquivo = ".docx"
                    ElseIf (i.FileName.Contains(".doc")) Then
                        tipoArquivo = ".doc"
                    ElseIf (i.FileName.Contains(".png")) Then
                        tipoArquivo = ".png"
                    ElseIf (i.FileName.Contains(".jpge")) Then
                        tipoArquivo = ".jpge"
                    ElseIf (i.FileName.Contains(".pdf")) Then
                        tipoArquivo = ".pdf"
                    ElseIf (i.FileName.Contains(".xlsx")) Then
                        tipoArquivo = ".xlsx"
                    ElseIf (i.FileName.Contains(".xls")) Then
                        tipoArquivo = ".xls"
                    ElseIf (i.FileName.Contains(".txt")) Then
                        tipoArquivo = ".txt"
                    ElseIf (i.FileName.Contains(".zip")) Then
                        tipoArquivo = ".zip"
                    ElseIf (i.FileName.Contains(".rar")) Then
                        tipoArquivo = ".rar"
                    ElseIf (i.FileName.Contains(".bmp")) Then
                        tipoArquivo = ".bmp"
                    End If

                    Dim data = Now.ToString()
                    Dim SaveLocation As String = Server.MapPath("Arquivos\") & "" & Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "_" & count.ToString() & tipoArquivo

                    If arquivo <> "" Then
                        arquivo += ";" & Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "_" & count.ToString() & tipoArquivo
                    Else
                        arquivo = Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "_" & count.ToString() & tipoArquivo
                    End If

                    Try
                        i.SaveAs(SaveLocation)
                    Catch Exc As Exception
                        'lblStatus.InnerText = "Error: " & Exc.Message
                    End Try
                End If
                count = count + 1
            Next
        End If

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Dim query As String = "INSERT INTO [dbo].[tblRegistroAta] ([Autor],[Titulo],[Assunto],[Data],[Tipo],[idFilial],[Acesso],[Arquivo]) Values (@Autor,@Titulo,@Assunto,@Data,@Tipo,@idFilial,@Acesso,@Arquivo)"
            Using cmd As SqlCommand = New SqlCommand(query)

                Try
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@Autor", autor.ToString())
                    cmd.Parameters.AddWithValue("@Titulo", titulo.ToString())
                    cmd.Parameters.AddWithValue("@Assunto", assunto.ToString())
                    cmd.Parameters.AddWithValue("@Data", dataAta.TryConvertToDateTime())
                    cmd.Parameters.AddWithValue("@Tipo", tipo.ToString())
                    cmd.Parameters.AddWithValue("@idFilial", idFilial.ToString())
                    cmd.Parameters.AddWithValue("@Acesso", acesso.ToString())
                    cmd.Parameters.AddWithValue("@Arquivo", arquivo.ToString())

                    con.Open()
                    cmd.ExecuteNonQuery()
                Catch ex As Exception

                End Try

                con.Close()

            End Using
        End Using

        lblTitulo.Value = ""
        lblAssunto.Value = ""
        lblData.Value = ""
        selTipo.SelectedIndex = 0
        selLocal.SelectedIndex = 0
        selAcesso.Value = ""

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)
    End Sub

    Protected Sub btnExcluir_Click(sender As Object, e As EventArgs)
        Dim idRowSelected = DirectCast(sender, System.Web.UI.WebControls.Button)
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim query = ""
        Dim arquivos = ""
        Using con As SqlConnection = New SqlConnection(constr)
            query = "Execute SP_REUNIOES_ATA_DELETE @ID , @USUARIO , @ARQUIVOS OUTPUT "
            Using cmd As SqlCommand = New SqlCommand(query)

                cmd.Connection = con
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = idRowSelected.CommandName.ToString()
                cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar, 25).Value = User.Identity.Name.ToUpper()
                cmd.Parameters.Add("@ARQUIVOS", SqlDbType.VarChar, 250)
                cmd.Parameters("@ARQUIVOS").Direction = ParameterDirection.Output

                con.Open()
                cmd.ExecuteNonQuery()

                arquivos = cmd.Parameters("@ARQUIVOS").Value

            End Using
            con.Close()
        End Using

        Dim imgs() As String = Split(arquivos, ";", -1)

        For Each complilaImgs In imgs
            If complilaImgs.ToString() <> "" Then
                Try
                    My.Computer.FileSystem.DeleteFile(Server.MapPath("Arquivos\") & complilaImgs.ToString())
                Catch ex As Exception

                End Try
            End If
        Next

        carregaGrid()

        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alertExcluir();", True)
    End Sub

    Protected Sub grvDados_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim imgs() As String = Split(e.Row.Cells(6).Text, ";", -1)
            Dim compil = ""

            For Each complilaImgs In imgs
                If complilaImgs.ToString() <> "" Then
                    compil += "<a href='Arquivos\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
                End If
            Next
            e.Row.Cells(6).Text = Server.HtmlDecode(compil)

        End If
    End Sub
End Class
