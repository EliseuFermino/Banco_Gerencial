
Imports DevExpress.Web

Partial Class MemberPages_Projetos_Controles_wucCadastroCad
    Inherits System.Web.UI.UserControl

    Protected Sub rndProjeto_CheckedChanged(sender As Object, e As EventArgs) Handles rndProjeto.CheckedChanged
        DefinirTitulo()
    End Sub

    Protected Sub rndSubProjeto_CheckedChanged(sender As Object, e As EventArgs) Handles rndSubProjeto.CheckedChanged
        DefinirTitulo()
    End Sub

    Protected Sub rndTarefa_CheckedChanged(sender As Object, e As EventArgs) Handles rndTarefa.CheckedChanged
        DefinirTitulo()
    End Sub

    Protected Sub rndSubTarefa_CheckedChanged(sender As Object, e As EventArgs) Handles rndSubTarefa.CheckedChanged
        DefinirTitulo()
    End Sub

#Region " Funções"

    Private Sub DefinirTitulo()

        If rndProjeto.Checked = True Then
            lblTitulo.Text = "Projeto"
            OcultarExibir(lblProjeto, cboProjeto, True)
            OcultarExibir(lblSubProjeto, cboSubProjeto, False)
            OcultarExibir(lblTarefa, cboTarefa, False)
            OcultarExibir(lblSubTarefa, cboSubTarefa, False)

        End If


        If rndSubProjeto.Checked = True Then
            lblTitulo.Text = "Sub-Projeto"
            OcultarExibir(lblProjeto, cboProjeto, True)
            OcultarExibir(lblSubProjeto, cboSubProjeto, True)
            OcultarExibir(lblTarefa, cboTarefa, False)
            OcultarExibir(lblSubTarefa, cboSubTarefa, False)
            
        End If


        If rndTarefa.Checked = True Then
            lblTitulo.Text = "Tarefa"
            OcultarExibir(lblProjeto, cboProjeto, True)
            OcultarExibir(lblSubProjeto, cboSubProjeto, True)
            OcultarExibir(lblTarefa, cboTarefa, True)
            OcultarExibir(lblSubTarefa, cboSubTarefa, False)
           
        End If


        If rndSubTarefa.Checked = True Then
            lblTitulo.Text = "Sub-Tarefa"
            OcultarExibir(lblProjeto, cboProjeto, True)
            OcultarExibir(lblSubProjeto, cboSubProjeto, True)
            OcultarExibir(lblTarefa, cboTarefa, True)
            OcultarExibir(lblSubTarefa, cboSubTarefa, True)
            
        End If


    End Sub

    Private Sub OcultarExibir(ByVal iTitulo As Label, iCbo As ASPxComboBox, iTrueFalse As Boolean)
        iTitulo.Visible = iTrueFalse
        iCbo.Visible = iTrueFalse
    End Sub

#End Region



 
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            OcultarExibir(lblSubProjeto, cboSubProjeto, False)
            OcultarExibir(lblTarefa, cboTarefa, False)
            OcultarExibir(lblSubTarefa, cboSubTarefa, False)

        End If

    End Sub
End Class
