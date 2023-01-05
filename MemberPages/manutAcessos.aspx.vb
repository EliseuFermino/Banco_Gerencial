Imports DevExpress.Web

Partial Class Ranking_MetaDeVenda
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(102, User.Identity.Name)
        End If


        Me.gridMaster.DataSource = ""
        Select Case LCase(User.Identity.Name)
            Case "ederson", "arlete"
                Me.gridMaster.DataSource = dsMasterPrevencao
                TryCast(gridMaster.Columns("Mes"), GridViewDataColumn).GroupIndex = 0
                TryCast(gridMaster.Columns("Dia"), GridViewDataColumn).GroupIndex = 1
                TryCast(gridMaster.Columns("DescPrograma"), GridViewDataColumn).GroupIndex = 2
                TryCast(gridMaster.Columns("Usuario"), GridViewDataColumn).GroupIndex = 3
                TryCast(gridMaster.Columns("Setor"), GridViewDataColumn).GroupIndex = -1
                Me.cboLista.Text = "Prevenção"
                Me.cboLista.Enabled = False
                Me.cboLista.Visible = True
                Me.lblInfo.Visible = True
            Case Else
                Me.gridMaster.DataSource = dsMaster
        End Select
        Me.gridMaster.DataBind()

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Estatisticas de Acesso - PGR102"
    End Sub

End Class
