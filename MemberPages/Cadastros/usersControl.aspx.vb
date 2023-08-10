Imports System.Data
Imports System.Data.SqlClient
Imports System.Runtime.InteropServices.ComTypes
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports CKEditor
Imports DevExpress.DataAccess.Sql
Imports DevExpress.Utils.Extensions
Imports DevExpress.Xpf.Editors.Helpers
Imports DevExpress.Xpo.Exceptions
Imports DevExpress.XtraCharts.Native
Imports DevExpress.XtraReports.Design
Imports DevExpress.XtraRichEdit.API.Native
Imports DevExpress.XtraSpreadsheet.Model
Imports System.Configuration
Imports DevExpress.DocumentServices.ServiceModel.DataContracts
Imports DevExpress.Xpf.Grid
Imports DevExpress.PivotGrid.Criteria
Imports DevExpress.XtraCharts.Designer
Imports DevExpress.XtraReports.Service.Native.Services

Partial Class MemberPages_Cadastros_usersControl
    Inherits System.Web.UI.Page

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Dim selects As New preencheSelects
    Private vFilial As Int16
    Dim oProj As New Projeto


#Region "Pageload Events"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            vDepartamento = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
            Session("sDEPARTAMENTO") = vDepartamento

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

        Select Case selConsulta.Value
            Case 1
                Mountquery += " And login like '%%'  "
            Case 2
                Mountquery += " And Acesso In (99) "
            Case 3
                Mountquery += " And Acesso In (99) "
        End Select

        command.Dispose()
        data.Close()

        'If daterange.Value.Length > 0 Then
        '    Mountquery += " And Data Between Convert(datetime,'" & Split(daterange.Value, " à ", 0)(0).ToString() & " 00:00',103) and Convert(datetime,'" & Split(daterange.Value, " à ", 0)(1).ToString() & " 23:59',103) "
        'End If

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

        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilMenu)
        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilNewUser)
        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilAlterUser)

        selects.Define_Corporacao(Session("sDEPARTAMENTO"), selTipo)
        selects.Define_Corporacao(Session("sDEPARTAMENTO"), selTipoAlter)
        Session("sCORPORACAO") = selTipo.SelectedItem.Value

        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)
        selects.Define_Filial(selTipoAlter.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilialAlter)

    End Sub

    Protected Sub selTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selTipo.SelectedIndexChanged
        Session("sCORPORACAO") = selTipo.SelectedItem.Value
        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('new_user');", True)
        selFilial.Focus()
    End Sub

    Protected Sub selTipoAlter_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selTipoAlter.SelectedIndexChanged
        Session("sCORPORACAO") = selTipoAlter.SelectedItem.Value
        selects.Define_Filial(selTipoAlter.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilialAlter)
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('alter_user');", True)
        selFilialAlter.Focus()
    End Sub

    Protected Sub grvDados_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        'If (e.Row.RowType = DataControlRowType.DataRow) Then
        '    Dim imgs() As String = Split(e.Row.Cells(6).Text, ";", -1)
        '    Dim compil = ""

        '    For Each complilaImgs In imgs
        '        If complilaImgs.ToString() <> "" Then
        '            compil += "<a href='Arquivos\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
        '        End If
        '    Next
        '    e.Row.Cells(6).Text = Server.HtmlDecode(compil)

        'End If
    End Sub

#End Region

#Region "Buttons Events"

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

        carregaGrid()

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('find_user');", True)
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

    End Sub

    Protected Sub btnSalvarPerfis_Click(sender As Object, e As EventArgs)
        Dim teste = ""
        For Each n As TreeNode In tvwMenuHor.Nodes
            For Each c In n.ChildNodes
                Dim cN As TreeNode
                cN = c

                If cN.Checked Then
                    teste += cN.Value + ";"
                End If
            Next
        Next

        For Each n As TreeNode In tvwMenuVer.Nodes
            For Each c In n.ChildNodes
                Dim cN As TreeNode
                cN = c

                If cN.Checked Then
                    teste += cN.Value + ";"
                End If

            Next

        Next

    End Sub
    Protected Sub btnSalvarEx_Click(sender As Object, e As EventArgs)
        Dim teste = ""
        For Each n As TreeNode In tvwMenuHorExc.Nodes
            For Each c In n.ChildNodes
                Dim cN As TreeNode
                cN = c

                If cN.Checked Then
                    teste += cN.Value + ";"
                End If
            Next
        Next

        For Each n As TreeNode In tvwMenuVertExc.Nodes
            For Each c In n.ChildNodes
                Dim cN As TreeNode
                cN = c

                If cN.Checked Then
                    teste += cN.Value + ";"
                End If

            Next

        Next
    End Sub

    Protected Sub btnFiltrarMenuPerfil_Click(sender As Object, e As EventArgs)
        divTreePerfil.Visible = True
        Dim ID = selPerfilMenu.SelectedValue
        Dim dtHor As DataTable = Me.GetData("Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + ID.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = 0 Order by menuOrdem")
        Dim dtVer As DataTable = Me.GetData("Select Question as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + ID.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = -1  Order by Sort")
        Me.PopulateTreeViewNodes(dtHor, 0, tvwMenuHor, 1, ID, Nothing)
        Me.PopulateTreeViewNodes(dtVer, 0, tvwMenuVer, 2, ID, Nothing)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('param_menu');", True)
    End Sub

    Protected Sub btnBuscarEx_Click(sender As Object, e As EventArgs)
        divTreeEx.Visible = True
        Dim login = txtLoginEx.Value
        Dim dtHorEx As DataTable = Me.GetData("Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = 0 Order by menuOrdem")
        Dim dtVerEx As DataTable = Me.GetData("Select Question as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = -1  Order by Sort")
        Me.PopulateTreeViewNodes(dtHorEx, 0, tvwMenuHorExc, 1, Nothing, login)
        Me.PopulateTreeViewNodes(dtVerEx, 0, tvwMenuVertExc, 2, Nothing, login)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('exception_user');", True)
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

#End Region

#Region "TreeView Actions"

    Private Sub PopulateTreeViewNodes(dtParent As DataTable, parentId As Integer, tree As WebControls.TreeView, tipo As Integer, id As Integer, login As String)
        Dim dtChild As DataTable

        tree.Nodes.Clear()

        For Each row As DataRow In dtParent.Rows
            Dim child As New TreeNode() With {
             .Text = "  " + row("Text").ToString(),
             .Value = row("Id").ToString(),
             .ShowCheckBox = True,
             .Expanded = False,
             .ToolTip = row("descPGR").ToString(),
             .SelectAction = TreeNodeSelectAction.None
            }

            If row("Checked").ToString() = "true" Then
                child.Checked = True
            Else
                child.Checked = False
            End If

            child.Target = row("Text").ToString()
            tree.Nodes.Add(child)

            If IsNothing(login) Then
                If tipo = 1 Then
                    dtChild = Me.GetData("Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                Else
                    dtChild = Me.GetData("Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                End If
            Else
                If tipo = 1 Then
                    dtChild = Me.GetData("Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions Where Login = '" + login.ToString() + "') = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                Else
                    dtChild = Me.GetData("Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions Where Login = '" + login.ToString() + "') = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                End If
            End If

            PopulateTreeViewChild(dtChild, Integer.Parse(child.Value), child, tree, tipo, id, login)

        Next

    End Sub

    Private Sub PopulateTreeViewChild(dtParent As DataTable, parentId As Integer, treeNode As TreeNode, tree As WebControls.TreeView, tipo As Integer, id As Integer, login As String)
        Dim dtChild As DataTable

        For Each row As DataRow In dtParent.Rows
            Dim child As New TreeNode() With {
             .Text = "  " + row("Text").ToString(),
             .Value = row("Id").ToString(),
             .ShowCheckBox = True,
             .Expanded = False,
             .SelectAction = TreeNodeSelectAction.None
            }

            If row("Checked").ToString() = "true" Then
                child.Checked = True
            Else
                child.Checked = False
            End If

            If tipo = 1 Then
                dtChild = Me.GetData("Select * From Menu.Dados Where ParentID = " + child.Value + "order by MenuOrdem")
            Else
                dtChild = Me.GetData("Select Answer as Text, id, DescPGR From Menu.tblProgramas Where ParentID = " + child.Value + "order by Sort")
            End If

            If dtChild.Rows.Count() > 0 Then

                child.Target = row("Text").ToString()
                treeNode.ChildNodes.Add(child)

                If IsNothing(login) Then
                    If tipo = 1 Then
                        dtChild = Me.GetData("Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                    Else
                        dtChild = Me.GetData("Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                    End If
                Else
                    If tipo = 1 Then
                        dtChild = Me.GetData("Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                    Else
                        dtChild = Me.GetData("Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                    End If
                End If

                PopulateTreeViewChild(dtChild, Integer.Parse(child.Value), child, tree, tipo, id, login)
            Else
                child.Target = row("Text").ToString()
                treeNode.ChildNodes.Add(child)
            End If

        Next

    End Sub

    Private Function GetData(query As String) As DataTable
        Dim dt As New DataTable()
        Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using
            Return dt
        End Using
    End Function

#End Region

End Class

