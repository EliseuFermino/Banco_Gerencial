
Partial Class Controles_graficoCrescimento
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboFilial.AutoPostBack = False
            Me.cboFilial.Visible_cboCorporacao = False

            If Me.cboFilial.IsLoja = True Then
                Session("sFILIAL") = Me.cboFilial.CallFilial
            Else
                Me.cboFilial.CallFilial = 3
                Session("sFILIAL") = 3
            End If

            Me.cboSecao.CallSecao = 1
            Session("sSECAO") = 1
            Me.grfSecao.DataBind()

        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Private Sub TipoSuperHiperSuperE()
        Select Case Me.cboFilial.CallFilial
            Case 3, 4, 5, 8, 13, 15, 17, 18, 28, 31, 34    'Super
                Me.lblSuperHiperSuperE.Text = "Super"
                Me.lblSuperHiperSuperET.Text = "Super"
            Case 7, 10, 20, 30, 37 'Super E'
                Me.lblSuperHiperSuperE.Text = "Super E"
                Me.lblSuperHiperSuperET.Text = "Super E"
            Case 6, 9, 11, 14, 19, 21, 22, 23, 24, 25, 26, 27, 29, 32, 33, 36, 38, 39   'Hiper
                Me.lblSuperHiperSuperE.Text = "Hiper"
                Me.lblSuperHiperSuperET.Text = "Hiper"
        End Select
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call TipoSuperHiperSuperE()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                Session("sFILIAL") = Me.cboFilial.CallFilial
            Else
                Me.cboFilial.CallFilial = 3
                Session("sFILIAL") = 3
            End If
            Me.cboSecao.CallSecao = 1
            Session("sSECAO") = 1
            Me.grfSecao.DataBind()
        End If
    End Sub

    Protected Sub cbPanelSecao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelSecao.Callback
        Session("sSECAO") = Me.cboSecao.CallSecao
        Me.grfSecao.DataBind()
    End Sub
End Class
