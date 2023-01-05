Imports System.Data
Imports System.Data.SqlClient

Partial Class Ranking_projMenuPrincipal
    Inherits System.Web.UI.Page

    Dim cnnStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim varProjeto As Byte

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'idHabilitaProjeto: 1-Abre  2-Fecha
        Dim oProjeto As New Projeto

        Call DesativarMenus()
        Select Case LCase(Trim(User.Identity.Name))
            Case "eliseu", "eder", "áurea", "auditoria", "felipe", "joel", "vladimir", "sandra girardi", "renato munhoz"
                Session("idProjeto") = 1
                Call AtivarMenus()
            Case "adailton", "financeiro", "eliane"    'Gestor Projeto: Gestão Economica/Financeira
                Me.btn_GestaoEconomica.Enabled = True
                Session("idProjeto") = 3
            Case "joão", "gerente"
                Me.btn_GestaoEstoques.Enabled = True
                Session("idProjeto") = 2
            Case "luis"
                Me.btn_Logistica.Enabled = True
                Session("idProjeto") = 1
            Case "aliceu", "diretor"
                Me.btn_AmplicaoLojas.Enabled = True
                Session("idProjeto") = 9
            Case "renato"
                Me.btn_Pessoas.Enabled = True
                Session("idProjeto") = 4
            Case "bernardo"
                Me.btn_GerenciamentoMix.Enabled = True
                Session("idProjeto") = 5
            Case "edison"
                Me.btn_ManutencaoLimpeza.Enabled = True
                Session("idProjeto") = 6
            Case "elaine"
                Me.btn_CRM.Enabled = True
                Session("idProjeto") = 7
            Case "rh"
                Me.btn_GerenciamentoMix.Enabled = True
                Session("idProjeto") = 5
        End Select

        Select Case Trim(oProjeto.BuscarDepartamentoDoUsuario(User.Identity.Name))
            Case "Tesouraria"
                Me.btn_GestaoEconomica.Enabled = True
                Session("idProjeto") = 3
                Session("SomenteLeitura") = oProjeto.SomenteLeitura
                'Me.lblDesc.Text = oProjeto.SomenteLeitura
            Case "Projeto_Usuario_Todos"
                Me.btn_GestaoEconomica.Enabled = True
                Session("idProjeto") = 1
                Session("SomenteLeitura") = oProjeto.SomenteLeitura
                Call AtivarMenus()
                'Me.lblDesc.Text = oProjeto.SomenteLeitura
        End Select

        Call PlanoDeAcaoAtrasado()
    End Sub

    Sub DesativarMenus()
        Me.btn_RedesenhoProcesso.Enabled = False
        Me.btn_CRM.Enabled = False
        Me.btn_GerenciamentoMix.Enabled = False
        Me.btn_GestaoEconomica.Enabled = False
        Me.btn_GestaoEstoques.Enabled = False
        Me.btn_Logistica.Enabled = False
        Me.btn_ManutencaoLimpeza.Enabled = False
        Me.btn_Pessoas.Enabled = False
        Me.btn_AmplicaoLojas.Enabled = False
    End Sub

    Sub AtivarMenus()
        Me.btn_RedesenhoProcesso.Enabled = True
        Me.btn_CRM.Enabled = True
        Me.btn_GerenciamentoMix.Enabled = True
        Me.btn_GestaoEconomica.Enabled = True
        Me.btn_GestaoEstoques.Enabled = True
        Me.btn_Logistica.Enabled = True
        Me.btn_ManutencaoLimpeza.Enabled = True
        Me.btn_Pessoas.Enabled = True
        Me.btn_AmplicaoLojas.Enabled = True
    End Sub

    Sub PlanoDeAcaoAtrasado()
        Dim oVem As New VendaEmpresaMes
        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "SELECT ProjetoID, Validade FROM viewProjValidadePlanoAcao"
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case CInt(reader5.GetSqlInt16(0))
                    Case 1  'Logística
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_Logistica.ImageUrl = "~/image/proj_Menu_Logistica_Red.png"
                        Else
                            Me.btn_Logistica.ImageUrl = "~/image/proj_Menu_Logistica.png"
                        End If
                    Case 2  'Gestão de estoque
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_GestaoEstoques.ImageUrl = "~/image/proj_Menu_GestaoEstoque_Red.png"
                        Else
                            Me.btn_GestaoEstoques.ImageUrl = "~/image/proj_Menu_GestaoEstoque.png"
                        End If
                    Case 3  'Gestão Econômico/Financeiro
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_GestaoEconomica.ImageUrl = "~/image/proj_Menu_GestaoEconomicaFinanceira_Red.png"
                        Else
                            Me.btn_GestaoEconomica.ImageUrl = "~/image/proj_Menu_GestaoEconomicaFinanceira.png"
                        End If
                    Case 4  'Pessoal
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_Pessoas.ImageUrl = "~/image/proj_Menu_Pessoas_Red.png"
                        Else
                            Me.btn_Pessoas.ImageUrl = "~/image/proj_Menu_Pessoas.png"
                        End If
                    Case 5  'Gerenciamento de Mix e Categoria
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_GerenciamentoMix.ImageUrl = "~/image/proj_Menu_GerenciaMixCategoria_Red.png"
                        Else
                            Me.btn_GerenciamentoMix.ImageUrl = "~/image/proj_Menu_GerenciaMixCategoria.png"
                        End If
                    Case 6  'Manutenção e Limpeza
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_ManutencaoLimpeza.ImageUrl = "~/image/proj_Menu_ManutencaoLimpeza_Red.png"
                        Else
                            Me.btn_ManutencaoLimpeza.ImageUrl = "~/image/proj_Menu_ManutencaoLimpeza.png"
                        End If
                    Case 7  'CRM
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_CRM.ImageUrl = "~/image/proj_Menu_CRM_Red.png"
                        Else
                            Me.btn_CRM.ImageUrl = "~/image/proj_Menu_CRM.png"
                        End If
                    Case 9  'Ampliação e Adequação de Lojas
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_AmplicaoLojas.ImageUrl = "~/image/proj_Menu_AmpliacaoAdequacaoLojas_Red.png"
                        Else
                            Me.btn_AmplicaoLojas.ImageUrl = "~/image/proj_Menu_AmpliacaoAdequacaoLojas.png"
                        End If
                    Case 10  'Redesenhar Processos
                        If reader5.GetSqlInt32(1) < 0 Then
                            Me.btn_RedesenhoProcesso.ImageUrl = "~/image/proj_Menu_RedesenhoProcessos_Red.png"
                        Else
                            Me.btn_RedesenhoProcesso.ImageUrl = "~/image/proj_Menu_RedesenhoProcessos.png"
                        End If
                End Select

            End While

        Catch ex As Exception
            oVem.UserMsgBox(Me, "Classe: PlanoDeAcaoAtrasado - " & ex.Message)

        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Carteira de Projetos"
    End Sub

    Protected Sub btnIr_Click(sender As Object, e As EventArgs) Handles btnIr.Click
        Call Linkar("planej01_Ficha.aspx", Me.cboListaProjetos.Value)
    End Sub


    Private Sub Linkar(ByVal link As String, ByVal idCat As String)
        Dim url As String = link & "?idCat=" & idCat & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub

  
End Class
