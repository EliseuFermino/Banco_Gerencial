
Partial Class $relurlnamespace$_$safeitemname$
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboGrupo.Visible_LabelSubGrupo = False
            Me.cboGrupo.Visible_cboSubgrupo = False
            Me.cboDepto.CallDepto = 1

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())

            Me.cboMes.CallMes = Month(DateAndTime.Now())
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Titulo"
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sDEPTO") = Me.cboDepto.CallDepto
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub cboDepto_ListDeptoChanged(sender As Object, e As EventArgs) Handles cboDepto.ListDeptoChanged
        Session("sDEPTO") = Me.cboDepto.CallDepto
    End Sub

    Protected Sub cboGrupo_ListGrupoChanged(sender As Object, e As EventArgs) Handles cboGrupo.ListGrupoChanged
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
    End Sub

    Protected Sub cbPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel1.Callback
        Threading.Thread.Sleep(1500)
    End Sub
End Class
