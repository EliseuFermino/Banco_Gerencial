Imports System.Net
Imports System.IO
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports System.Windows.Forms.HtmlElement
Imports DevExpress.XtraReports.Design
Imports System.Activities.Expressions
Imports DevExpress.CodeParser
Imports DevExpress.Xpo.Exceptions
Imports DevExpress.XtraRichEdit.Layout.Engine

Partial Class MemberPages_Ocorrencias_registroOcorrencias
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            lblMatricula.Value = User.Identity.Name.ToUpper()

        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim dtReq = Now()
        Dim matricula = User.Identity.Name.ToUpper()
        Dim setor = lblSetor.Value

        Dim desc = CKEditor1.Text
        Dim classificacao = ""
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
                        Dim SaveLocation As String = Server.MapPath("imgs\") & "" & i.FileName

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

            Dim query As String = "INSERT INTO [dbo].[tblOcorrencias] ([Data_Requisicao] ,[Matricula] ,[Solicitante] ,[Setor] ,[Gravidade]  ,[Urgencia]  ,[Tendencia] ,[Descricao], [Classificacao] ,[Upload] ,[Status]) VALUES (GETDATE(), @Matricula, @Solicitante, @Setor, @Gravidade, @Urgencia, @Tendencia, @Descricao, @Classificacao, @Upload, @Status)"
            Using cmd As SqlCommand = New SqlCommand(query)

                cmd.Connection = con
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

            Me.divSucesso.Visible = True
            Me.divOcorrencia.Visible = False
            Me.divCarregamento.Visible = False

        End Using

    End Sub

End Class
