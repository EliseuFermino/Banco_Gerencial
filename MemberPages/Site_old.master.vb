
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.IO

Partial Class SiteMaster_Old
    Inherits MasterPage

    Private Const menuConcorrentes As Integer = 4   'Index do Menu "Concorrentes".
    Private Const menuOpcoes As Integer = 5   'Index do Menu "Opções".
    Private Const menuProjeto As Integer = 6   'Index do Menu "Projeto".
    Dim cnnStr As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim varDepto, varPermissao As String

    ' ---- Lista dos Menus -------------------------------------------------------------------------------------
    ' varPermissao = 1 Permitido     2 Negado
    ' 0 = Menu Principal
    ' 1 = Vendas
    ' 2 = Margens
    ' 3 = Metas
    ' 4 = Concorrentes
    ' 5 = Opções
    ' 6 = Projeto
    ' 7 = ABRAS
    ' 8 = Financeiro
    ' 9 = Item
    '10 = Menu Loja
    '11 = Comercial
    '-----------------------------------------------------------------------------------------------------------

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.lblTitle.Text = System.Guid.NewGuid().ToString()
        End If

        'Defino tempo da sessão em 300 minutos
        Session.Timeout = 300

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oProjeto As New Projeto
        Dim Depto As String
        Depto = Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))
        Call OcultarMenu()
        Select Case Depto
            Case "Controladoria"
                varPermissao = 1
                Call ExibirMenu()
                Me.Menu.Items.Item(3).Items(5).Visible = True   'Metas
                If Page.User.Identity.Name = "Eliseu" Then
                    Me.Menu.Items.Item(8).Visible = True    'Financeiro
                    Me.Menu.Items.Item(10).Visible = True    'Financeiro
                    Me.Menu.Items.Item(11).Visible = True    'Resultados
                    Me.Menu.Items.Item(9).Visible = False
                    Me.Menu.Items.Item(12).Visible = True
                    Me.Menu.Items(6).Items(4).Visible = True   'Projeto -> Padronização de Documentos
                    Me.Menu.Items(6).Items(5).Visible = True   'Projeto -> Tarefas
                    'Me.Menu.Items(6).Items(6).Visible = True   'Projeto -> Tarefas
                Else
                    Me.Menu.Items.Item(10).Visible = True    'Financeiro
                    Me.Menu.Items.Item(11).Visible = True    'Resultados
                    Me.Menu.Items(6).Items(5).Visible = True   'Projeto -> Tarefas
                    Me.Menu.Items.Item(12).Visible = True
                    'Me.Menu.Items(6).Items(6).Visible = True
                End If

                Me.Menu.Items.Item(1).Visible = True
                Me.Menu.Items.Item(1).Items(0).Visible = True
                Me.Menu.Items.Item(1).Items(1).Visible = True
                Me.Menu.Items.Item(1).Items(2).Visible = True
                Me.Menu.Items.Item(1).Items(3).Visible = True

            Case "Diretor"  'Acesso -> Usuário:Diretor    Senha: tico@12
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()
                Call Acesso_Projeto()

                Me.Menu.Items.Item(4).Visible = True   'Concorrentes
                Me.Menu.Items.Item(4).Items(1).Visible = True   'Concorrentes

                Me.Menu.Items(12).Visible = True    'RESULTADOS
                Me.Menu.Items(12).Items(1).Visible = True

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

            Case "Presidência"  'Acesso -> Usuário:Presidência    Senha: tico@12
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                Me.Menu.Items.Item(4).Visible = True   'Concorrentes
                Me.Menu.Items.Item(4).Items(1).Visible = True   'Concorrentes

                Me.Menu.Items(12).Visible = True    'RESULTADOS
                Me.Menu.Items(12).Items(1).Visible = True

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

            Case "Marketing"  'Acesso -> Usuário:Marketing    Senha: tico@12
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()

                Me.Menu.Items(10).Visible = True
                Me.Menu.Items(10).Items(1).Visible = False
                Me.Menu.Items(10).Items(0).Visible = False

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False
            Case "Supervisor"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()

                Me.Menu.Items.Item(4).Visible = True   'Concorrentes
                Me.Menu.Items.Item(4).Items(1).Visible = True   'Concorrentes

                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items.Item(6).Items(0).Visible = True   'Agenda
                Me.Menu.Items.Item(6).Items(1).Visible = False
                Me.Menu.Items.Item(6).Items(2).Visible = False
                Me.Menu.Items.Item(6).Items(3).Visible = False
                Me.Menu.Items.Item(6).Items(4).Visible = False
                Me.Menu.Items.Item(6).Items(5).Visible = False

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(12).Visible = True    'RESULTADOS
                Me.Menu.Items(12).Items(1).Visible = True

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

            Case "Supervisor_Norte"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas


                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items.Item(6).Items(0).Visible = True   'Agenda
                Me.Menu.Items.Item(6).Items(1).Visible = False
                Me.Menu.Items.Item(6).Items(2).Visible = False
                Me.Menu.Items.Item(6).Items(3).Visible = False
                Me.Menu.Items.Item(6).Items(4).Visible = False
                Me.Menu.Items.Item(6).Items(5).Visible = False

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(12).Visible = True    'RESULTADOS
                Me.Menu.Items(12).Items(1).Visible = True

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

            Case "Supervisor_M"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items(10).Visible = True
                Me.Menu.Items(10).Items(1).Visible = False
                Me.Menu.Items(10).Items(0).Visible = False

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False
            Case "Gerente"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False
                Me.Menu.Items.Item(12).Visible = True   'Despesas

                Call Acesso_Projeto()
            Case "Informática"  'Acesso -> Usuário:Informática    Senha: tico@12
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items(10).Visible = True
                Me.Menu.Items(10).Items(1).Visible = False
                Me.Menu.Items(10).Items(0).Visible = False

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False
            Case "Auditoria"  'Acesso -> Usuário:Auditoria    Senha: tico@12
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(6).Visible = True   'Projeto
                'Me.Menu.Items(6).Items(6).Visible = True
            Case "Financeiro"   'Acesso -> Usuário:Financeiro    Senha: tico@12
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items(6).Items(3).Visible = False
                'Me.Menu.Items(6).Items(6).Visible = False   'Projeto -> Tarefas
            Case "Projeto"  'Acesso -> Usuário:RH   Senha: tico@12
                Call Acesso_Projeto()
            Case "Projeto_Usuario_Todos"  'Acesso -> Usuário:RH   Senha: tico@12
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items(6).Items(3).Visible = False   'projeto - cadastro
                'Me.Menu.Items(6).Items(6).Visible = False   'Projeto -> Tarefas
            Case "Projeto_Usuario"  'Acesso -> Usuário:RH   Senha: tico@12
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items(6).Items(3).Visible = False   'projeto - cadastro
                'Me.Menu.Items(6).Items(6).Visible = False   'Projeto -> Tarefas
            Case "Ranking"  'Acesso -> Usuário:RH   Senha: tico@12
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(1).Visible = True
                Me.Menu.Items(1).Items(1).Visible = False
                Me.Menu.Items(1).Items(2).Visible = False
                Me.Menu.Items(1).Items(3).Visible = False

            Case "Agenda"  'Acesso -> Usuário:RH   Senha: tico@12
                Me.Menu.Items.Item(0).Visible = True
                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items.Item(5).Visible = True   'Gerencial
                Me.Menu.Items.Item(5).Items(0).Visible = False
                Me.Menu.Items.Item(5).Items(1).Visible = False
                Me.Menu.Items.Item(5).Items(3).Visible = False
                Me.Menu.Items.Item(5).Items(4).Visible = False
                Me.Menu.Items.Item(5).Items(5).Visible = False

                Me.Menu.Items.Item(5).Items(2).Items(0).Visible = False
                Me.Menu.Items.Item(5).Items(2).Items(1).Visible = False
                Me.Menu.Items.Item(5).Items(2).Items(2).Visible = False

                Me.Menu.Items(6).Items(0).Visible = True   'projeto - cadastro
                Me.Menu.Items(6).Items(1).Visible = False   'Projeto -> Padronização de Documentos
                Me.Menu.Items(6).Items(2).Visible = False   'Projeto -> Padronização de Documentos
                Me.Menu.Items(6).Items(3).Visible = False   'Projeto -> Tarefas
                Me.Menu.Items(6).Items(4).Visible = False   'Projeto -> Padronização de Documentos
                Me.Menu.Items(6).Items(5).Visible = False   'Projeto -> Tarefas
                'Me.Menu.Items(6).Items(6).Visible = False   'Projeto -> Tarefas
            Case "Administração"  'Acesso -> 
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()

                Me.Menu.Items.Item(6).Visible = True   'Projeto
                Me.Menu.Items.Item(6).Items(0).Visible = True   'Agenda
                Me.Menu.Items.Item(6).Items(1).Visible = False
                Me.Menu.Items.Item(6).Items(2).Visible = False
                Me.Menu.Items.Item(6).Items(3).Visible = False
                Me.Menu.Items.Item(6).Items(4).Visible = False
                Me.Menu.Items.Item(6).Items(5).Visible = False

                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                'RESULTADOS
                Call Ocultar_Resultado()
                Call Liberar_Resultado()
                Call Liberar_Resultado_Despesas()

            Case "Comercial"
                Me.Menu.Items.Item(0).Visible = True

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                Me.Menu.Items(1).Items(2).Visible = False
                Me.Menu.Items(1).Items(3).Visible = False

                Call Liberar_Perdas_Sem_Checklist()

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()

            Case "Loja"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True

                'Ranking de Vendas
                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()

                Me.Menu.Items(12).Visible = True    'RESULTADOS
                Me.Menu.Items(12).Items(1).Visible = True

                Me.Menu.Items(13).Visible = True    'Check-list
                Me.Menu.Items(13).Items(0).Visible = False
                Me.Menu.Items(13).Items(1).Items(0).Visible = False
                Me.Menu.Items(13).Items(2).Items(0).Visible = False

            Case "Perdas"
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

            Case "Perdas_Supervisor"
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False

                Call Liberar_Agenda()
                Call Liberar_Acessos()

            Case "Tesouraria"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas

                'METAS ---------------------------------------------------
                Call Ocultar_Meta()
                Call Liberar_Metas()
                Call Liberar_Meta_Orcamento()
                Call Liberar_Meta_Relatorios()
                Call Liberar_Meta_Replanejamento()


                Me.Menu.Items.Item(7).Visible = True   'ABRAS

                Me.Menu.Items(13).Visible = True
                Me.Menu.Items(13).Items(0).Visible = False



            Case "GestaoCategoria"
                varPermissao = 1
                Me.Menu.Items.Item(0).Visible = True   'Menu Principal

                Me.Menu.Items.Item(1).Visible = True   'Vendas
                Me.Menu.Items.Item(1).Items(0).Visible = True   'Analise de Vendas              


            Case Else

        End Select

        Session("idPermissao") = varPermissao
        'UserMsgBox(Me, "Permissao " & varPermissao & ".")

        'Me.Menu.Items(12).Items(0).Items(1).NavigateUrl = "~/MemberPages/Consulta12Meses_Subgrupo.aspx?idCat=7"

    End Sub

    Private Sub Ocultar_Meta()
        Me.Menu.Items.Item(3).Visible = False   'Metas  
        Me.Menu.Items.Item(3).Visible = False   'Metas
        Me.Menu.Items.Item(3).Items(0).Visible = False   'Orçamento
        Me.Menu.Items.Item(3).Items(2).Visible = False  'Replanejamento
        Me.Menu.Items.Item(3).Items(1).Visible = False
        Me.Menu.Items.Item(3).Items(3).Visible = False
        Me.Menu.Items.Item(3).Items(4).Visible = False
        Me.Menu.Items.Item(3).Items(5).Visible = False
        Me.Menu.Items.Item(3).Items(6).Visible = False

    End Sub

    Private Sub Liberar_Metas()
        Me.Menu.Items.Item(3).Visible = True   'Metas        
    End Sub

    Private Sub Liberar_Meta_Orcamento()
        Me.Menu.Items.Item(3).Items(0).Visible = True   'Orçamento       
    End Sub

    Private Sub Liberar_Meta_Relatorios()
        Me.Menu.Items.Item(3).Items(1).Visible = True   'Relatórios
    End Sub

    Private Sub Liberar_Meta_Replanejamento()
        Me.Menu.Items.Item(3).Items(2).Visible = True  'Replanejamento



    End Sub

    'Private Sub Liberar_Meta_Orcamento()
    '    Call Liberar_Metas()
    '    Me.Menu.Items.Item(3).Visible = True   'Metas
    '    Me.Menu.Items.Item(3).Items(0).Visible = True   'Orçamento
    '    Me.Menu.Items.Item(3).Items(2).Visible = True  'Replanejamento
    '    Me.Menu.Items.Item(3).Items(1).Visible = False
    '    Me.Menu.Items.Item(3).Items(3).Visible = False
    '    Me.Menu.Items.Item(3).Items(4).Visible = False
    '    Me.Menu.Items.Item(3).Items(5).Visible = False
    '    Me.Menu.Items.Item(3).Items(6).Visible = False
    'End Sub

    Private Sub Ocultar_Resultado()
        Me.Menu.Items(12).Visible = False    'RESULTADOS
        Me.Menu.Items(12).Items(0).Visible = False  'Teórico
        Me.Menu.Items(12).Items(1).Visible = False  'Resultados
    End Sub

    Private Sub Liberar_Resultado()
        Me.Menu.Items(12).Visible = True    'RESULTADOS
    End Sub

    Private Sub Liberar_Resultado_Despesas()
        Me.Menu.Items(12).Items(1).Visible = True
    End Sub

    Private Sub Liberar_Agenda()
        Me.Menu.Items.Item(6).Visible = True
        Me.Menu.Items(6).Items(0).Visible = True   'projeto - cadastro
        Me.Menu.Items(6).Items(1).Visible = False   'Projeto -> Padronização de Documentos
        Me.Menu.Items(6).Items(2).Visible = False   'Projeto -> Padronização de Documentos
        Me.Menu.Items(6).Items(3).Visible = False   'Projeto -> Tarefas
        Me.Menu.Items(6).Items(4).Visible = False   'Projeto -> Padronização de Documentos
        Me.Menu.Items(6).Items(5).Visible = False   'Projeto -> Tarefas
    End Sub

    Private Sub Acesso_Projeto()
        Me.Menu.Items.Item(0).Visible = True
        Me.Menu.Items.Item(6).Visible = True   'Projeto
        Me.Menu.Items(6).Items(3).Visible = False   'projeto - cadastro
        'Me.Menu.Items(6).Items(6).Visible = False   'Projeto -> Tarefas
    End Sub

    Sub Permissao()

        'Vendas
        If Me.Menu.Items.Item(1).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

        'Margens
        If Me.Menu.Items.Item(2).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

        'Metas
        If Me.Menu.Items.Item(3).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

        'Concorrentes
        If Me.Menu.Items.Item(4).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

        'Opções
        If Me.Menu.Items.Item(5).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

        'Projeto
        If Me.Menu.Items.Item(6).Visible = True Then
            varPermissao = 1
        Else
            varPermissao = 2
        End If

    End Sub

    Private Sub OcultarMenu()
        On Error Resume Next
        Me.Menu.Items.Item(0).Visible = False

        Me.Menu.Items.Item(1).Visible = False
        Me.Menu.Items.Item(1).Items(0).Visible = False
        Me.Menu.Items.Item(1).Items(1).Visible = False
        Me.Menu.Items.Item(1).Items(2).Visible = False
        Me.Menu.Items.Item(1).Items(3).Visible = False

        Me.Menu.Items.Item(1).Items(5).Visible = False

        Me.Menu.Items.Item(1).Items(7).Visible = False
        Me.Menu.Items.Item(1).Items(8).Visible = False


        Me.Menu.Items.Item(2).Visible = False
        Me.Menu.Items.Item(3).Visible = False   'Metas
        Me.Menu.Items.Item(4).Visible = False   'Concorrentes
        Me.Menu.Items.Item(5).Visible = False   'Opções
        Me.Menu.Items.Item(6).Visible = False   'Projeto
        Me.Menu.Items.Item(7).Visible = False   'ABRAS
        Me.Menu.Items.Item(8).Visible = False    'Financeiro
        Me.Menu.Items.Item(9).Visible = False    'Itens
        Me.Menu.Items.Item(10).Visible = False    'Itens
        Me.Menu.Items.Item(11).Visible = False    'Itens
        Me.Menu.Items.Item(12).Visible = False    'Itens
        Me.Menu.Items.Item(13).Visible = False    'Itens
        Me.Menu.Items.Item(14).Visible = False    'Itens

        Me.Menu.Items.Item(1).Visible = False


    End Sub

    Private Sub ExibirMenu()
        On Error Resume Next
        Me.Menu.Items.Item(0).Visible = True
        Me.Menu.Items.Item(1).Visible = True
        Me.Menu.Items.Item(2).Visible = True
        Me.Menu.Items.Item(3).Visible = True   'Metas
        Me.Menu.Items.Item(4).Visible = True   'Concorrentes
        Me.Menu.Items.Item(5).Visible = True   'Opções
        Me.Menu.Items.Item(6).Visible = True   'Projeto
        Me.Menu.Items.Item(7).Visible = True   'ABRAS
        Me.Menu.Items.Item(8).Visible = True    'Financeiro
        Me.Menu.Items.Item(9).Visible = True    'Itens
        Me.Menu.Items.Item(10).Visible = True    'Itens
        Me.Menu.Items.Item(11).Visible = True    'Itens
        Me.Menu.Items.Item(12).Visible = True    'Itens
        Me.Menu.Items.Item(13).Visible = True    'Itens
        Me.Menu.Items.Item(14).Visible = True    'Itens

    End Sub

    Function BuscaIP() As String
        Dim IPUsuario As String
        IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("HTTP X FORWARDED FOR")

        If IPUsuario = "" Then
            IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        End If
        Return IPUsuario
    End Function

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

    Private Sub Liberar_Perdas()
        Me.Menu.Items(13).Visible = True
        Me.Menu.Items(13).Items(0).Visible = False
    End Sub

    Private Sub Liberar_Perdas_Sem_Checklist()
        Me.Menu.Items(13).Visible = True
        Me.Menu.Items(13).Items(0).Visible = False
        Me.Menu.Items(13).Items(1).Visible = False
    End Sub

    Private Sub Liberar_Acessos()
        Me.Menu.Items(5).Visible = True
        Me.Menu.Items(5).Items(0).Visible = True
        Me.Menu.Items(5).Items(1).Visible = False
        Me.Menu.Items(5).Items(2).Visible = False
        Me.Menu.Items(5).Items(3).Visible = False
        Me.Menu.Items(5).Items(4).Visible = False
        Me.Menu.Items(5).Items(5).Visible = False
    End Sub

End Class