
Partial Class MemberPages_Despesas_viewDespAnalitica
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Me.cboAno.AnoInicial = 2013
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboMes.CallMes = Month(DateAndTime.Now()) - 1
            Session("sMES") = Me.cboMes.CallMes

            'Me.cboGrupoSubgrupo.CallGrupo = 15   'Pessoal

            'Me.cboGrupo.CallGrupo = ""
            'Me.cboGrupo.Visible_cboSubgrupo = False
            'Me.cboGrupo.Visible_LabelSubGrupo = False

            'Me.cboGrupo.Grupo_Label_ForeColor = Drawing.Color.White

            'If Me.cboFilial.IsLoja Then
            '    Me.pnlHide.Visible = False
            'End If

            grid.Visible = False

        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        grid.DataBind()
        grid.Visible = True

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "VALOR")
    End Sub
End Class
