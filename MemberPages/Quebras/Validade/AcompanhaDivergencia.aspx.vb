#Region " Imports"

Imports DevExpress.Web


#End Region


Partial Class MemberPages_Quebras_AcompanhaDivergencia
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

  

#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        CallSession()
        Me.grid.Visible = True
        Me.grid.DataBind()
      
        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

    End Sub


#End Region

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub


#Region " SESSION"

    Private Sub CallSession()
        Session("sDIA_INICIAL") = Me.cboDia.CallDia


    End Sub

#End Region


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

            CallSession()   'Chamar Sessões
            Me.grid.Visible = True

            oFun.Grid_Column_BorderRight(grid, "Descricao", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "idProduto52", Drawing.Color.Gray, BorderStyle.Solid, 2)

            Me.grid.DataBind()
            oVem.AtualizarEstatisticaPrograma(319, User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Acompanhamento da Divergência - PGR309"
        End If
    End Sub

   

#End Region

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrDivergencia")
    End Sub
End Class
