Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Despesas_viewDRE_Loja
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(165, User.Identity.Name)


            Dim varAno As Int32
            varAno = Year(Now()) + 1
            Me.cboAno.AnoInicial = varAno - 1
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            If Me.cboFilial.IsLoja = True Then Me.cboFilial.Visible_cboCorporacao = False
        End If
    End Sub


    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = 1
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Private Sub Titulos()
        Me.gridAno.SettingsText.Title = "D.R.E. do Ano " & Me.cboAno.CallAno
    End Sub

    Private Sub Atualizar()
        Call mySession()
        Me.gridAno.DataBind()
        Call Titulos()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call Atualizar()
    End Sub

    Protected Sub gridAno_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAno.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "pl_vlr" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "pl_perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "pd_vlr" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "pd_perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub gridAno_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridAno.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "1"    'Vendas
                e.Row.BackColor = System.Drawing.Color.Aquamarine
                e.Row.Font.Bold = True
            Case "2"    'Impostos
                e.Row.BackColor = System.Drawing.Color.Honeydew
            Case "3", "40", "13"   'Vendas
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "14"   'Despesas
                e.Row.BackColor = System.Drawing.Color.Yellow
            Case "79"    'Resultado Antes IR
                e.Row.BackColor = System.Drawing.Color.Honeydew
                e.Row.Font.Bold = True
            Case "47" 'Resultado Final
                e.Row.BackColor = System.Drawing.Color.Aquamarine
                e.Row.Font.Bold = True
            Case "5", "6"
                e.Row.BackColor = System.Drawing.Color.Bisque
            Case "4"
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "D.R.E. - Demonstração do Resultado do Exercício - pgr165"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanel.Callback
        Atualizar()
    End Sub
End Class
