
Partial Class Ranking_projProcessoAtual
    Inherits System.Web.UI.Page


    Private Sub SomenteLeitura()
        Select Case Session("SomenteLeitura")
            Case 1  'Somente Leitura - Acesso a todos Projetos
                Me.cboAcompProjeto.Enabled_cboProjeto = True
            Case 2  'Projeto Especificadp
                Me.cboAcompProjeto.Enabled_cboProjeto = False
        End Select
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVem As New VendaEmpresaMes
        Dim oProjeto As New Projeto
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(30, User.Identity.Name)
            Me.cboAcompProjeto.Value_cboProjeto = oProjeto.NumeroDoProjeto(User.Identity.Name)
            Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
                Case 1
                    Me.cboAcompProjeto.Enabled_cboProjeto = True
                Case 3
                    Me.cboAcompProjeto.Enabled_cboProjeto = True
                Case Else
                    Me.cboAcompProjeto.Enabled_cboProjeto = False
            End Select

            Call SomenteLeitura()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projetos - Arquivos"
        End If

    End Sub

#End Region

#Region " Funções"

    ''' <summary>
    ''' 1=Projeto   2=Sub-Projeto
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function StatusProjeto_Or_Subprojeto() As Byte
        Dim iTipo As Byte

        If CInt(Trim((Me.cboAcompProjeto.Text_cboProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboAcompProjeto.Value_cboProjeto
            iTipo = 1 'Projeto
        End If

        If CInt(Trim((Me.cboAcompProjeto.Text_cboSubProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboAcompProjeto.Value_cboSubProjeto
            iTipo = 2 'Sub-Projeto
        End If

        Session("idTipo") = iTipo
        Return iTipo
    End Function


#End Region

#Region " Cbo"

    Protected Sub cboAcompProjeto_SelectedIndexChanged_cboProjeto(sender As Object, e As EventArgs) Handles cboAcompProjeto.SelectedIndexChanged_cboProjeto
        StatusProjeto_Or_Subprojeto()
    End Sub

    Protected Sub cboAcompProjeto_SelectedIndexChanged_cboSubProjeto(sender As Object, e As EventArgs) Handles cboAcompProjeto.SelectedIndexChanged_cboSubProjeto
        StatusProjeto_Or_Subprojeto()
    End Sub

#End Region

End Class
