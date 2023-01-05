
#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region

Partial Class Controles_wucMercadologicoNew
    Inherits System.Web.UI.UserControl

    Public Event rdTotal_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rdDepartamento_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rdSecao_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rdGrupo_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rdSubgrupo_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)

    'Define Enum Mercadologico
    Private Enum Mercadologico As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum

    Dim oProj As New Projeto

    Protected Sub cbPanelMercadologico_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelMercadologico.Callback

        Dim varOpcao As Byte

        Session("sNATRICULA") = Page.User.Identity.Name
        Session("sDEPTO") = Trim(oProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))

        If Me.rdTotal.Checked = True Then
            varOpcao = 1    'Total
        End If

        ' Departamento
        If Me.rdDepartamento.Checked = True Then
            Me.cblDepartamento.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            varOpcao = 2    'Departamento
        End If

        ' Seção
        If Me.rdSecao.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            varOpcao = 3    'Seção
        End If

        ' Grupo
        If Me.rdGrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")

            Me.cblDepartamento.Enabled = False
            varOpcao = 4    'Grupo
        End If

        ' Subgrupo
        If Me.rdSubgrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            Me.cblsubgrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")
            AtualizarMercadologico(Me.cblsubgrupo, Mercadologico.Subgrupo, "Temp.tblUsuarioSubgrupo")

            Me.cblDepartamento.Enabled = False
            Me.cblSecao.Enabled = False
            varOpcao = 5    'Sub-grupo
        End If

        Session("sOPCAO") = varOpcao

        Me.cblDepartamento.DataBind()
        Me.cblSecao.DataBind()
        Me.cblGrupo.DataBind()
        Me.cblsubgrupo.DataBind()
    End Sub



    Private Sub ExcluirMercadologicoDoUsuario(ByVal iTipo As Byte, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        Dim deleteSQL = "DELETE FROM " & nomeDaTabela & " WHERE Usuario = ('" & Page.User.Identity.Name & "')"
        Dim deleteCommand = New SqlCommand(deleteSQL, connection)

        Try
            connection.Open()
            deleteCommand.ExecuteNonQuery()
        Catch ex As Exception
            Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub

    Private Sub InserirMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        For Each item In ListaDeMercadologico.SelectedValues

            Dim idMercadologico As Int16 = item.ToString

            Dim insertSQL = "INSERT INTO " & nomeDaTabela & " (Usuario,idMercadologico) VALUES ('" & Page.User.Identity.Name & "', '" & idMercadologico & "')"
            Dim insertCommand = New SqlCommand(insertSQL, connection)

            Try
                connection.Open()
                insertCommand.ExecuteNonQuery()
            Catch ex As Exception
                Me.lblError.Text = Err.Description
            Finally
                connection.Close()
            End Try

            Session("sMERCADOLOGICO") = idMercadologico

        Next

        For Each nomeItem In ListaDeMercadologico.SelectedItems

            Dim strMercadologico As String = nomeItem.ToString
            Session("sNOME_MERCADOLOGICO") = strMercadologico
        Next


    End Sub

    Private Sub AtualizarMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal NumeroMercadologico As Int16, nomeDaTabela As String)
        lblError.Text = ""
        If ListaDeMercadologico.SelectedValues.Count > 0 Then
            ExcluirMercadologicoDoUsuario(NumeroMercadologico, nomeDaTabela)
            InserirMercadologico(ListaDeMercadologico, nomeDaTabela)
        End If
    End Sub


#Region " RaiseEvent"

    Protected Sub rdTotal_CheckedChanged(sender As Object, e As EventArgs) Handles rdTotal.CheckedChanged
        RaiseEvent rdTotal_iCheckedChanged(sender, e)
    End Sub

    Protected Sub rdDepartamento_CheckedChanged(sender As Object, e As EventArgs) Handles rdDepartamento.CheckedChanged
        RaiseEvent rdDepartamento_iCheckedChanged(sender, e)
    End Sub

    Protected Sub rdSecao_CheckedChanged(sender As Object, e As EventArgs) Handles rdSecao.CheckedChanged
        RaiseEvent rdSecao_iCheckedChanged(sender, e)
    End Sub

    Protected Sub rdGrupo_CheckedChanged(sender As Object, e As EventArgs) Handles rdGrupo.CheckedChanged
        RaiseEvent rdGrupo_iCheckedChanged(sender, e)
    End Sub

    Protected Sub rdSubgrupo_CheckedChanged(sender As Object, e As EventArgs) Handles rdSubgrupo.CheckedChanged
        RaiseEvent rdSubgrupo_iCheckedChanged(sender, e)
    End Sub

#End Region

#Region "_Checked"

    Public Property Checked_rdTotal() As Boolean
        Get
            Return Me.rdTotal.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rdTotal.Checked = value
        End Set
    End Property

    Public Property Checked_rdDepartamento() As Boolean
        Get
            Return Me.rdDepartamento.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rdDepartamento.Checked = value
        End Set
    End Property

    Public Property Checked_rdSecao() As Boolean
        Get
            Return Me.rdSecao.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rdSecao.Checked = value
        End Set
    End Property

    Public Property Checked_rdGrupo() As Boolean
        Get
            Return Me.rdGrupo.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rdGrupo.Checked = value
        End Set
    End Property

    Public Property Checked_rdSubgrupo() As Boolean
        Get
            Return Me.rdSubgrupo.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rdSubgrupo.Checked = value
        End Set
    End Property

#End Region

#Region " Visible"

    Public Property Visible_rdTotal() As Boolean
        Get
            Return rdTotal.Visible
        End Get
        Set(ByVal value As Boolean)
            rdTotal.Visible = value
        End Set
    End Property

    Public Property Visible_rdDepartamento() As Boolean
        Get
            Return rdDepartamento.Visible
        End Get
        Set(ByVal value As Boolean)
            rdDepartamento.Visible = value
        End Set
    End Property

    Public Property Visible_rdSecao() As Boolean
        Get
            Return rdSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            rdSecao.Visible = value
        End Set
    End Property

    Public Property Visible_rdGrupo() As Boolean
        Get
            Return rdGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            rdGrupo.Visible = value
        End Set
    End Property

    Public Property Visible_rdSubgrupo() As Boolean
        Get
            Return rdSubgrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            rdSubgrupo.Visible = value
        End Set
    End Property

#End Region

#Region " Call's"

    Public Property CallDepto() As String
        Get
            Return Me.cblDepartamento.SelectedItem.Selected
        End Get
        Set(ByVal value As String)
            Me.cblDepartamento.SelectedItem.Selected = value
        End Set
    End Property

    Public Property CallDeptoDescricao() As String
        Get
            Return cblDepartamento.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cblDepartamento.Value = value
        End Set
    End Property

    Public Property CallSecao() As String
        Get
            Return cblSecao.SelectedItem.Selected
        End Get
        Set(ByVal value As String)
            cblSecao.SelectedItem.Selected = value
        End Set
    End Property

    Public Property CallSecaoDescricao() As String
        Get
            Return cblSecao.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cblSecao.Value = value
        End Set
    End Property

    Public Property CallGrupo() As String
        Get
            Return cblGrupo.SelectedItem.Selected
        End Get
        Set(ByVal value As String)
            cblGrupo.SelectedItem.Selected = value
        End Set
    End Property

    Public Property CallGrupoDescricao() As String
        Get
            Return cblGrupo.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cblGrupo.Value = value
        End Set
    End Property

    Public Property CallSubgrupo() As String
        Get
            Return cblsubgrupo.SelectedItem.Selected
        End Get
        Set(ByVal value As String)
            cblsubgrupo.SelectedItem.Selected = value
        End Set
    End Property

    Public Property CallSubgrupoDescricao() As String
        Get
            Return cblsubgrupo.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cblsubgrupo.Value = value
        End Set
    End Property

#End Region

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Session("sOPCAO") = 1   'Total
        End If

    End Sub

End Class
