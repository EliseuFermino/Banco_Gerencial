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

Partial Class MemberPages_Cadastros_usersControl
    Inherits System.Web.UI.Page

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Dim selects As New preencheSelects
    Private vFilial As Int16
    Dim oProj As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If (Session("sISLOJA") Is Nothing) Then
                Session_Departamento()
            End If

            carregaSelects()

            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "hiddenInit();", True)

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

        'If selLocalConsulta.Value.Length > 0 Then
        '    Mountquery += " And idFilial In ('" & selLocalConsulta.Value.ToString() & "') "
        'End If

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

        selects.Define_Corporacao(Session("sDEPARTAMENTO"), selTipo)
        Session("sCORPORACAO") = selTipo.SelectedItem.Value

        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

        carregaGrid()

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('find_user');", True)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

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

    Protected Sub selTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selTipo.SelectedIndexChanged

        Session("sCORPORACAO") = selTipo.SelectedItem.Value
        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('new_user');", True)

    End Sub

End Class
