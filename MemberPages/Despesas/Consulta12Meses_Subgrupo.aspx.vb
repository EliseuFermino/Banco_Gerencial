
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page



    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(41, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            Session("sAno") = Me.cboAno.CallAno
            Me.ASPxGridView1.Visible = False
            'Me.cboGrupo.Text = 1
            ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
        End If
    End Sub

    Private Sub AtualizarTitulo()
        ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
    End Sub

    Protected Sub btnExportarExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportarExcel.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
    End Sub

    Protected Sub cboGrupo_ListSubgrupoChanged(sender As Object, e As EventArgs) Handles cboGrupo.ListSubgrupoChanged
        Session("sSubgrupo") = Me.cboGrupo.CallSubgrupo
        Me.ASPxGridView1.Visible = True
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Consulta de Despesa por Subgrupo - 12 meses"
    End Sub
End Class
