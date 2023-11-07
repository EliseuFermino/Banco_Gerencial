Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports DevExpress.CodeParser
Imports DevExpress.ExpressApp
Imports DevExpress.Spreadsheet
Imports DevExpress.Web.Demos
Imports Resources

Partial Class MemberPages_Cadastros_usersControl
    Inherits System.Web.UI.Page

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Dim selects As New preencheSelects
    Private vFilial As Int16
    Dim oProj As New Projeto
    Private retProc As Boolean


#Region "Pageload Events"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oProj.BuscarLocalDoUsuario(Page.User.Identity.Name)
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
        If (txtParamConsulta.Value <> "") Then
            Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
            Dim con As SqlConnection = New SqlConnection(constr)
            Dim adapter As New SqlDataAdapter
            Dim parameter As New SqlParameter
            Dim command As SqlCommand
            Dim Mountquery As String = <![CDATA[Select		(c.Name + ' ' + c.LastName)	 As Name
		                                            ,	Isnull(c.Login,a.Username) As Login
		                                            ,	isnull(d.Depto, a.Depto) As Depto
                                                    ,   b.Email
		                                            ,	b.CreateDate
		                                            ,	b.LastLoginDate
		                                            ,	e.FilialDesc
		                                            ,	Case 
				                                            When a.Ativo = 1 then 'Ativo' 
			                                            Else 'Inativo' 
			                                            End As Ativo
                                            From		aspnet_Users				a
                                            Inner Join	aspnet_Membership			b On b.UserId	= a.UserId
                                            Left  Join	aspnet_UsersDetails			c On c.UserId	= b.UserId
                                            Left  Join  aspnet_UsersDepto			d On d.DeptoId	= c.DeptoId
                                            Left  Join  gerCadastros.dbo.DimFilial	e On e.idFilial = a.idFilial 
                                            Where 1=1 ]]>.Value()


            Select Case selConsulta.Value
                Case 1
                    Mountquery += " And a.UserName like '%" & txtParamConsulta.Value.ToLower() & "%'"
                Case 2
                    Mountquery += " And b.Email like '%" & txtParamConsulta.Value.ToLower() & "%'"
                Case 3
                    Mountquery += " And (c.Name like '%" & txtParamConsulta.Value.ToLower() & "%' Or c.LastName like '%" & txtParamConsulta.Value.ToLower() & "%')"
                Case 4
                    Mountquery += " And (d.Depto like '%" & txtParamConsulta.Value.ToLower() & "%' Or a.Depto like '%" & txtParamConsulta.Value.ToLower() & "%')"
            End Select

            con.Open()
            command = New SqlCommand(Mountquery, con)
            Dim idr As IDataReader = command.ExecuteReader()
            grvDados.DataSource = idr
            grvDados.DataBind()

            con.Close()
            idr.Close()
            command.Dispose()

        End If

    End Sub

    Private Sub carregaSelects()

        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilMenu)
        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilNewUser)
        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilAlterUser)
        selects.preencherPerfis("Select DeptoID, Depto From [dbo].[aspnet_UsersDepto]", selPerfilDuplicar)

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
        Dim local As String
        Dim loja As Integer
        If (txtFirstName.Value = "" Or txtLastName.Value = "" Or txtLoginNew.Value = "" Or txtEmail.Value = "" Or selPerfilNewUser.SelectedValue = "0") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCampos();", True)
            Return
        End If

        If rdLoja.Checked Then
            local = "Loja"
        Else
            local = "Adm"
        End If

        If isLoja.Checked Then
            loja = 1
        Else
            loja = 0
        End If

        retProc = callProc(1, txtFirstName.Value, txtLastName.Value, txtLoginNew.Value, txtMatricula.Value, txtEmail.Value, selPerfilNewUser.SelectedValue, local, selFilial.SelectedValue, loja)

        If retProc Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('new_user');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('new_user');", True)
        End If

    End Sub

    Protected Sub btnAlterDepto_Click(sender As Object, e As EventArgs)
        If (txtLoginAlterPerfil.Value = "" Or selPerfilAlterUser.SelectedValue = "0") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposAlterDepto();", True)
            Return
        End If

        retProc = callProc(2, "", "", txtLoginAlterPerfil.Value, 0, "", selPerfilAlterUser.SelectedValue, "", 0, 0)

        If retProc Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('alter_user');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('alter_user');", True)
        End If
    End Sub

    Protected Sub btnResetarSenha_Click(sender As Object, e As EventArgs)
        If (txtLoginReset.Value = "") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposResetSenha();", True)
            Return
        End If

        retProc = callProc(5, "", "", txtLoginReset.Value, 0, "", "", "", 0, 0)

        If retProc Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('alter_user');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('alter_user');", True)
        End If

    End Sub

    Protected Sub btnAlterFilial_Click(sender As Object, e As EventArgs)
        If (txtLoginAlterFilial.Value = "" Or selFilialAlter.SelectedValue = "0") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposAlterFilial();", True)
            Return
        End If

        retProc = callProc(4, "", "", txtLoginAlterFilial.Value, 0, "", "", "", selFilialAlter.SelectedValue, 0)

        If retProc Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('alter_user');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('alter_user');", True)
        End If
    End Sub

    Protected Sub btnBlockUser_Click(sender As Object, e As EventArgs)
        If (txtLoginInativar.Value = "") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposInativar();", True)
            Return
        End If

        retProc = callProc(3, "", "", txtLoginInativar.Value, 0, "", "", "", 0, 0)

        If retProc Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('alter_user');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('alter_user');", True)
        End If
    End Sub

    Protected Sub btnNewPerfil_Click(sender As Object, e As EventArgs)
        If (txtNewPerfil.Value = "") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposNewPerfil();", True)
            Return
        End If

        Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim comando As New SqlCommand("[uspCreateNewDepto]", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Option", SqlDbType.SmallInt))
        comando.Parameters.Add(New SqlParameter("@Perfil", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@PerfilModel", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@UserAction", SqlDbType.VarChar))

        comando.Parameters("@Option").Value = 1
        comando.Parameters("@Perfil").Value = txtNewPerfil.Value
        comando.Parameters("@PerfilModel").Value = 0
        comando.Parameters("@UserAction").Value = Page.User.Identity.Name.ToString()

        Try
            con.Open()
            comando.ExecuteNonQuery()
            retProc = True
        Catch ex As Exception
            retProc = False
        Finally
            con.Close()
            comando.Dispose()
        End Try


        If retProc Then

            carregaSelects()
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('new_role');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('new_role');", True)
        End If
    End Sub

    Protected Sub btnDuplicarPerfil_Click(sender As Object, e As EventArgs)
        If (txtDuplicarPerfil.Value = "" Or selPerfilDuplicar.SelectedValue = "0") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCamposNewPerfilModel();", True)
            Return
        End If

        Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim comando As New SqlCommand("[uspCreateNewDepto]", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Option", SqlDbType.SmallInt))
        comando.Parameters.Add(New SqlParameter("@Perfil", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@PerfilModel", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@UserAction", SqlDbType.VarChar))

        comando.Parameters("@Option").Value = 2
        comando.Parameters("@Perfil").Value = txtDuplicarPerfil.Value
        comando.Parameters("@PerfilModel").Value = selPerfilDuplicar.SelectedValue
        comando.Parameters("@UserAction").Value = Page.User.Identity.Name.ToString()

        Try
            con.Open()
            comando.ExecuteNonQuery()
            retProc = True
        Catch ex As Exception
            retProc = False
        Finally
            con.Close()
            comando.Dispose()
        End Try


        If retProc Then

            carregaSelects()
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('new_role');", True)
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('new_role');", True)
        End If
    End Sub

    Protected Sub btnFiltrarMenuPerfil_Click(sender As Object, e As EventArgs)
        divTreePerfil.Visible = True
        Dim ID = selPerfilMenu.SelectedValue
        Dim dtHor As DataTable = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + ID.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = 0 Order by menuOrdem")
        Dim dtVer As DataTable = Me.GetData("LocalSqlServer", "Select Question as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + ID.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = -1  Order by Sort")
        Me.PopulateTreeViewNodes(dtHor, 0, tvwMenuHor, 1, ID, Nothing)
        Me.PopulateTreeViewNodes(dtVer, 0, tvwMenuVer, 2, ID, Nothing)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('param_menu');", True)
    End Sub

    Protected Sub btnBuscarEx_Click(sender As Object, e As EventArgs)
        divTreeEx.Visible = True
        Dim login = txtLoginEx.Value
        Dim dtHorEx As DataTable = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = 0 Order by menuOrdem")
        Dim dtVerEx As DataTable = Me.GetData("LocalSqlServer", "Select Question as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuV = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = -1  Order by Sort")
        Me.PopulateTreeViewNodes(dtHorEx, 0, tvwMenuHorExc, 1, Nothing, login)
        Me.PopulateTreeViewNodes(dtVerEx, 0, tvwMenuVertExc, 2, Nothing, login)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('exception_user');", True)
    End Sub

    Protected Sub btnConsulta_Click(sender As Object, e As EventArgs)
        carregaGrid()
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "showWindow('find_user');", True)

    End Sub

    Private Function callProc(opt As Integer, fName As String, lName As String, user As String, mat As Integer, email As String, dep As String, local As String, filial As Integer, isloja As Integer) As Boolean
        Dim ret As Boolean = False
        Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim comando As New SqlCommand("[uspCreateorUpdateUser]", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Option", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@FirstName", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@LastName", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@UserName", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Matricula", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@Email", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Departamento", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Local", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters.Add(New SqlParameter("@isLoja", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@UserAction", SqlDbType.VarChar))

        comando.Parameters("@Option").Value = opt
        comando.Parameters("@FirstName").Value = fName
        comando.Parameters("@LastName").Value = lName
        comando.Parameters("@UserName").Value = user
        comando.Parameters("@Matricula").Value = mat
        comando.Parameters("@Email").Value = email
        comando.Parameters("@Departamento").Value = dep
        comando.Parameters("@Local").Value = local
        comando.Parameters("@idFilial").Value = filial
        comando.Parameters("@isLoja").Value = isloja
        comando.Parameters("@UserAction").Value = Page.User.Identity.Name.ToString()

        Try
            con.Open()
            comando.ExecuteNonQuery()
            ret = True
        Catch ex As Exception
            ret = False
        Finally
            con.Close()
            comando.Dispose()
        End Try

        Return ret

    End Function

    Private Function callProcPerfil(optMenu As String, opt As Integer, perfil As String, user As String, idMenus As Integer, action As Integer) As Boolean
        Dim ret As Boolean = False
        Dim constr As String = ConfigurationManager.ConnectionStrings("LocalSqlServer").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim comando As New SqlCommand("[uspParamDeptoMenus]", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@OptionMenu", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Option", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@Perfil", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@User", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@idMenus", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@UserAction", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Action", SqlDbType.Int))

        comando.Parameters("@OptionMenu").Value = optMenu
        comando.Parameters("@Option").Value = opt
        comando.Parameters("@Perfil").Value = perfil
        comando.Parameters("@User").Value = user
        comando.Parameters("@idMenus").Value = idMenus
        comando.Parameters("@UserAction").Value = Page.User.Identity.Name.ToString()
        comando.Parameters("@Action").Value = action

        Try
            con.Open()
            comando.ExecuteNonQuery()
            ret = True
        Catch ex As Exception
            ret = False
        Finally
            con.Close()
            comando.Dispose()
        End Try

        Return ret

    End Function

    Protected Sub btnSalvarPerfis_Click(sender As Object, e As EventArgs)

        callProcPerfil(1, 1, selPerfilMenu.SelectedValue, "", 0, 2)
        For Each n As TreeNode In tvwMenuHor.CheckedNodes
            retProc = callProcPerfil(1, 1, selPerfilMenu.SelectedValue, "", n.Value, 1)

            If Not retProc Then
                ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('param_menu');", True)
                Return
            End If
        Next

        For Each n As TreeNode In tvwMenuVer.CheckedNodes
            retProc = callProcPerfil(1, 2, selPerfilMenu.SelectedValue, "", n.Value, 1)

            If Not retProc Then
                ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('param_menu');", True)
                Return
            End If
        Next

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('param_menu');", True)
        'ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertTeste('" + menus + "', 'param_menu');", True)

    End Sub

    Protected Sub btnSalvarEx_Click(sender As Object, e As EventArgs)

        callProcPerfil(2, 1, "", txtLoginEx.Value, 0, 2)
        For Each n As TreeNode In tvwMenuHorExc.CheckedNodes
            retProc = callProcPerfil(2, 1, "", txtLoginEx.Value, n.Value, 1)

            If Not retProc Then
                ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('exception_user');", True)
                Return
            End If
        Next

        For Each n As TreeNode In tvwMenuVertExc.CheckedNodes
            retProc = callProcPerfil(2, 2, "", txtLoginEx.Value, n.Value, 1)

            If Not retProc Then
                ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertErro('exception_user');", True)
                Return
            End If
        Next

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess('exception_user');", True)

        'ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertTeste('" + menus + "', 'exception_user');", True)

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
             .ToolTip = "Id - " + row("Id").ToString(),
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
                    dtChild = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                Else
                    dtChild = Me.GetData("LocalSqlServer", "Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                End If
            Else
                If tipo = 1 Then
                    dtChild = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where a.ID = x.idMenuH and x.Login = '" + login.ToString() + "') = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                Else
                    dtChild = Me.GetData("LocalSqlServer", "Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where a.ID = x.idMenuV and Login = '" + login.ToString() + "') = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
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
             .ToolTip = "Id - " + row("Id").ToString(),
             .Expanded = False,
             .SelectAction = TreeNodeSelectAction.None
            }

            If row("Checked").ToString() = "true" Then
                child.Checked = True
            Else
                child.Checked = False
            End If

            If tipo = 1 Then
                dtChild = Me.GetData("LocalSqlServer", "Select * From Menu.Dados Where ParentID = " + child.Value + "order by MenuOrdem")
            Else
                dtChild = Me.GetData("LocalSqlServer", "Select Answer as Text, id, DescPGR From Menu.tblProgramas Where ParentID = " + child.Value + "order by Sort")
            End If

            If dtChild.Rows.Count() > 0 Then

                child.Target = row("Text").ToString()
                treeNode.ChildNodes.Add(child)

                If IsNothing(login) Then
                    If tipo = 1 Then
                        dtChild = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuH and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                    Else
                        dtChild = Me.GetData("LocalSqlServer", "Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From [dbo].[aspnet_UsersDeptoItems] b Where a.ID = b.idMenuV and b.DeptoId = " + id.ToString() + ") = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                    End If
                Else
                    If tipo = 1 Then
                        dtChild = Me.GetData("LocalSqlServer", "Select a.* , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.Dados a  Where ParentID = " + child.Value + "order by MenuOrdem")
                    Else
                        dtChild = Me.GetData("LocalSqlServer", "Select Answer as Text, id, DescPGR , Case When (Select Top 1 1 From aspnet_UsersExceptions x Where x.Login = '" + login.ToString() + "' and x.idMenuH = a.ID ) = 1 Then 'true' Else 'false' End as Checked From Menu.tblProgramas a Where ParentID = " + child.Value + "order by Sort")
                    End If
                End If

                PopulateTreeViewChild(dtChild, Integer.Parse(child.Value), child, tree, tipo, id, login)
            Else
                child.Target = row("Text").ToString()
                treeNode.ChildNodes.Add(child)
            End If

        Next

    End Sub

    Private Function GetData(conString As String, query As String) As DataTable
        Dim dt As New DataTable()
        Dim constr As String = ConfigurationManager.ConnectionStrings(conString).ConnectionString
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

