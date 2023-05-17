Imports DevExpress.Web

Partial Class MemberPages_SLV_SLV003
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(147, User.Identity.Name)
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas por Grupo - PGR147"
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "Lucro_AA" Or
           e.DataColumn.FieldName = "LucroSO_AA" Or
           e.DataColumn.FieldName = "vlrLucroFinal_AA" Or
           e.DataColumn.FieldName = "percMargem_AA" Or
           e.DataColumn.FieldName = "percMargemSO_AA" Or
           e.DataColumn.FieldName = "percMargemFinal_AA" Or
           e.DataColumn.FieldName = "partVenda" Or
            e.DataColumn.FieldName = "Lucro_AT" Or
            e.DataColumn.FieldName = "LucroSO_AT" Or
            e.DataColumn.FieldName = "vlrLucroFinal_AT" Or
            e.DataColumn.FieldName = "percMargem_AT" Or
            e.DataColumn.FieldName = "percMargemSO_AT" Or
            e.DataColumn.FieldName = "percMargemFinal_AT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDIA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboPeriodo.CallDiaFinal

        'Exibir Ano Anterior
        If Me.chkMostrar_AA.Checked = True Then
            Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        End If

        'Exibir Ano Atual
        If Me.chkMostrar_AT.Checked = True Then
            Me.grid.Columns.Item("bandAnoAtual").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAtual").Visible = False
        End If

        If Me.chkMostrar_AT.Checked = True Then
            If Me.chkMostrar_MargemPraticada.Checked = True Then
                Me.grid.Columns.Item("bandMargemPraticada_AT").Visible = True
            Else
                Me.grid.Columns.Item("bandMargemPraticada_AT").Visible = False
            End If

            If Me.chkMostrar_SellOut.Checked = True Then
                Me.grid.Columns.Item("bandSellOut_AT").Visible = True
            Else
                Me.grid.Columns.Item("bandSellOut_AT").Visible = False
            End If
        End If

        If Me.chkMostrar_AA.Checked = True Then
            If Me.chkMostrar_MargemPraticada.Checked = True Then
                Me.grid.Columns.Item("bandMargemPraticada_AA").Visible = True
            Else
                Me.grid.Columns.Item("bandMargemPraticada_AA").Visible = False
            End If

            If Me.chkMostrar_SellOut.Checked = True Then
                Me.grid.Columns.Item("bandSellOut_AA").Visible = True
            Else
                Me.grid.Columns.Item("bandSellOut_AA").Visible = False
            End If
        End If

        Me.grid.DataBind()
        Me.grid.Visible = True

    End Sub


End Class
