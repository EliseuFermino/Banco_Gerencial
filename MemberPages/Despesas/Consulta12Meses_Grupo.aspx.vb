
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            'oVem.AtualizarEstatisticaPrograma(41, User.Identity.Name)
            Me.ASPxGridView1.Visible = False

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            Me.cboGrupo.Visible_cboSubgrupo = False
            Me.cboGrupo.Visible_LabelSubGrupo = False

        End If
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call Atualizar()
    End Sub

    Protected Sub cboGrupo_ListGrupoChanged(sender As Object, e As EventArgs) Handles cboGrupo.ListGrupoChanged
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Me.ASPxGridView1.Visible = True
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "Janeiro" Or
           e.DataColumn.FieldName = "Fevereiro" Or
           e.DataColumn.FieldName = "Março" Or
           e.DataColumn.FieldName = "Abril" Or
           e.DataColumn.FieldName = "Maio" Or
           e.DataColumn.FieldName = "Junho" Or
           e.DataColumn.FieldName = "Julho" Or
           e.DataColumn.FieldName = "Agosto" Or
           e.DataColumn.FieldName = "Setembro" Or
           e.DataColumn.FieldName = "Outubro" Or
           e.DataColumn.FieldName = "Novembro" Or
           e.DataColumn.FieldName = "Dezembro" Or
           e.DataColumn.FieldName = "Ano" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Despesas 12 Meses - por Subgrupo e Filial"
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "ASPxGridView1"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then Me.cboFilial.Visible_cboCorporacao = False
            Session("sANO") = Me.cboAno.CallAno
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sGRUPO") = 15
            Me.ASPxGridView1.DataBind()
        End If
    End Sub
End Class
