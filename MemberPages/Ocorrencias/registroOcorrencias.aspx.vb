Imports System.Data.SqlClient
'
Partial Class MemberPages_Ocorrencias_registroOcorrencias
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaLojas()

            carregaSetor()

            If CKEditor1.Text.Length() < 183 Then
                CKEditor1.Text = "<p style='text-align: center;'><span style='font-size: 20px;'><strong>Registro de Ocorr&ecirc;ncia</strong></span></p><ul><li><span style='font-size 14px;'>&nbsp;</span></li></ul>"
            End If

        End If
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(435, User.Identity.Name)


        End If
    End Sub

    Protected Sub carregaLojas()
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
        '
    End Sub

    Protected Sub carregaSetor()
        Dim selectSQL As String = "Select	idSetor, nomeSetor From	gerCadastros.dbo.[tblCadSetor] "
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            selSetor.DataSource = cmd.ExecuteReader()
            selSetor.DataTextField = "nomeSetor"
            selSetor.DataValueField = "idSetor"

            'Activate the binding.
            selSetor.DataBind()

            selSetor.Items.Insert(0, New ListItem("", ""))
            selSetor.SelectedIndex = 0

            con.Close()

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try
        '
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

        divSucesso.Visible = True
        divOcorrencia.Visible = False
        divCarregamento.Visible = False

        Dim matricula = User.Identity.Name.ToUpper()
        Dim setor = selSetor.Value
        Dim assunto = lblAssunto.Value
        Dim unidade = selUnidade.Value
        Dim desc = CKEditor1.Text
        Dim classificacao As String
        Dim arquivo = ""

        Dim calc = ((rdlGravidade.SelectedValue * rdlUrgencia.SelectedValue) * rdlTendencia.SelectedValue)

        If calc <= 25 Then
            classificacao = "Baixa"
        ElseIf calc <= 50 Then
            classificacao = "Média"
        ElseIf calc <= 75 Then
            classificacao = "Média-Alta"
        ElseIf calc <= 100 Then
            classificacao = "Alta"
        Else
            classificacao = "Urgente"
        End If

        'Me.divcarregamento.Visible = True
        Me.divOcorrencia.Visible = False

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            If uploadImage.PostedFiles.Count > 0 Then

                For Each i In uploadImage.PostedFiles

                    'Se quiser colocar uma trava com tamanho dá pra usar esse campo
                    'Dim size = i.ContentLength

                    If i.ContentLength > 0 Then
                        Dim data = Now.ToString()
                        Dim SaveLocation As String = Server.MapPath("imgs_atend\") & "" & Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "." & Split(i.ContentType, "/", -1)(1)

                        If arquivo <> "" Then
                            arquivo += ";" & Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "." & Split(i.ContentType, "/", -1)(1)
                        Else
                            arquivo = Replace(data.Substring(0, 10), "/", "_") & "_" & Replace(data.Substring(11, 5), ":", "_") & "." & Split(i.ContentType, "/", -1)(1)
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

            Dim query As String = "INSERT INTO [dbo].[tblOcorrencias] ([Data_Requisicao] , [Assunto] ,[idFilial], [Matricula] ,[Solicitante], [idSetor] ,[Gravidade]  ,[Urgencia]  ,[Tendencia] ,[Descricao], [Classificacao] ,[Upload] ,[Status]) VALUES (GETDATE(), @Assunto, @Unidade, @Matricula, @Solicitante, @Setor, @Gravidade, @Urgencia, @Tendencia, @Descricao, @Classificacao, @Upload, @Status)"
            Using cmd As SqlCommand = New SqlCommand(query)

                cmd.Connection = con
                cmd.Parameters.AddWithValue("@Assunto", assunto)
                cmd.Parameters.AddWithValue("@Unidade", unidade)
                cmd.Parameters.AddWithValue("@Matricula", matricula)
                cmd.Parameters.AddWithValue("@Solicitante", matricula)
                cmd.Parameters.AddWithValue("@Setor", setor)
                cmd.Parameters.AddWithValue("@Descricao", desc)
                cmd.Parameters.AddWithValue("@Gravidade", rdlGravidade.SelectedValue.ToString())
                cmd.Parameters.AddWithValue("@Urgencia", rdlUrgencia.SelectedValue.ToString())
                cmd.Parameters.AddWithValue("@Tendencia", rdlTendencia.SelectedValue.ToString())
                cmd.Parameters.AddWithValue("@Classificacao", classificacao)
                cmd.Parameters.AddWithValue("@Upload", arquivo)
                cmd.Parameters.AddWithValue("@Status", "Em Análise")

                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()

            End Using
        End Using
    End Sub

End Class
