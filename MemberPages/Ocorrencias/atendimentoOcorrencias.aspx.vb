
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Security.Cryptography
Imports System.Windows.Forms
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports DevExpress.Mvvm.POCO
Imports DevExpress.Xpf.Editors.Native.TypedStyles
Imports DevExpress.Xpf.Map.Native
Imports DevExpress.XtraBars.Alerter
Imports DevExpress.XtraCharts.Native
Imports DevExpress.XtraDiagram.Base
Imports DevExpress.XtraExport.Helpers

Partial Class MemberPages_Ocorrencias_atendimentoOcorrencias
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaGrid()

        End If
    End Sub

    Protected Sub carregaGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim query As String = "Select ID, Data_Requisicao, Solicitante, Setor, Status From gerTemp.dbo.tblOcorrencias Where Status Not In ('Finalizado','Improcedente') Order By Data_Requisicao Asc"
        Dim cmd As SqlCommand = New SqlCommand(query)

        cmd.Connection = con
        con.Open()

        Dim idr As IDataReader = cmd.ExecuteReader()
        grvDados.DataSource = idr
        grvDados.DataBind()

        con.Close()
        idr.Close()
        cmd.Dispose()

    End Sub

    Protected Sub Details_Click(sender As Object, e As EventArgs)
        Dim idRowSelected = DirectCast(sender, System.Web.UI.WebControls.Button).CommandName

        lblID.InnerText = idRowSelected

        carregaGrid()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim query As String = "Select ID, Data_Requisicao, Solicitante, Setor, Descricao, Status, Classificacao, Upload, Observacao From gerTemp.dbo.tblOcorrencias Where Id = @id And Status Not In ('Finalizado','Improcedente')"

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
                lblClassif.InnerText = data(6).ToString()
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

                lblAtendente.InnerText = User.Identity.Name.ToUpper()

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

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("UPDATE tblOcorrencias Set  Classificacao = @classif , Status = @status , Matricula_Atendente = @atendente , Observacao = @obs , Data_Atendimento = Getdate() WHERE ID = @id", con)

                cmd.Parameters.Add("@classif", SqlDbType.VarChar).Value = ddlClassifcAtend.SelectedValue
                cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = ddlStatusAtend.SelectedValue
                cmd.Parameters.Add("@atendente", SqlDbType.VarChar).Value = User.Identity.Name.ToString()
                cmd.Parameters.Add("@obs", SqlDbType.VarChar).Value = CKEditor1.Text
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = lblID.InnerText

                con.Open()
                rowsAffected = cmd.ExecuteNonQuery()
                con.Close()
                cmd.Dispose()

            End Using
        End Using

        carregaGrid()

        lblClassif.InnerText = ddlClassifcAtend.SelectedValue

    End Sub

    Protected Sub grvDados_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If (e.Row.Cells(0).Text = lblID.InnerText) Then
            e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml(“#FFC0C0”)
        End If
    End Sub

End Class
