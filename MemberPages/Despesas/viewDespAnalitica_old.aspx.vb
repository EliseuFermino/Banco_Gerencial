
Partial Class MemberPages_Despesas_viewDespAnalitica_old
    Inherits System.Web.UI.Page

    Private vlrRealA1 As Double = 0

    Protected Sub rnd_Subgrupo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rnd_Subgrupo.CheckedChanged
        If Me.rnd_Subgrupo.Checked = True Then

            cboGrupoSub.Visible_LabelSubGrupo = True
            cboGrupoSub.Visible_cboSubgrupo = True

            Me.cboGrupoSub.Enabled_cboSubgrupo = True
            Me.cboGrupoSub.Enabled_cboGrupo = False

            cboGrupoSub.SelectedIndex_cboSubgrupo = 0
        End If
    End Sub

    Protected Sub rnd_Grupo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rnd_Grupo.CheckedChanged
        If Me.rnd_Grupo.Checked = True Then
            Me.cboGrupoSub.Enabled_cboSubgrupo = False
            Me.cboGrupoSub.Enabled_cboGrupo = True

            cboGrupoSub.Visible_cboSubgrupo = False
            cboGrupoSub.Visible_LabelSubGrupo = False
            cboGrupoSub.Enabled_cboGrupo = True

        End If
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "GridView1"
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Consulta de Despesa Analiticas - PGR18"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sGRUPO") = Me.cboGrupoSub.CallGrupo
            Session("sSUBGRUPO") = 1
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        Dim oFun As New Funcoes
        oFun.Grid_Size(GridView1, cboSize.CallSize)
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboGrupoSub.Visible_LabelSubGrupo = False
            cboGrupoSub.Visible_cboSubgrupo = False
            cboGrupoSub.Visible_LabelGrupo = False

            cboFilial.Visible_cboCorporacao = False
        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial


        If Me.rnd_Grupo.Checked = True Then
            Session("sSUBGRUPO") = 1
            Session("sGRUPO") = Me.cboGrupoSub.CallGrupo
        End If
        If rnd_Subgrupo.Checked = True Then
            Session("sSUBGRUPO") = 2
            Session("sGRUPO") = Me.cboGrupoSub.CallSubgrupo
        End If

        Me.GridView1.DataBind()



    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(18, User.Identity.Name)

            Me.cboAno.AnoInicial = Year(Now().AddYears(-1))
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False
            Me.cboGrupoSub.AutoPostBack_cboSubgrupo = False
            Me.cboGrupoSub.AutoPostBack_cboGrupo = False

            Me.rnd_Grupo.Checked = True


            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sSUBGRUPO") = 0
            Session("sGRUPO") = 0


        End If
    End Sub
End Class
