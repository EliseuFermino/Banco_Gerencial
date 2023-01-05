Imports DevExpress.Web

Partial Class MemberPages_Quebras002
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(94, User.Identity.Name)

            Me.cboAnoInicial.AnoInicial = 2011
            Me.cboAnoInicial.AnoFinal = Year(Now())
            Me.cboAnoInicial.CallAno = Year(Now())

            Me.cboAnoFinal.AnoInicial = 2011
            Me.cboAnoFinal.AnoFinal = Year(Now())
            Me.cboAnoFinal.CallAno = Year(Now())

            Session("sANO_INICIAL") = Me.cboAnoInicial.CallAno
            Session("sANO_FINAL") = Me.cboAnoFinal.CallAno
            Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
            Session("sMES_FINAL") = Me.cboMesFinal.CallMes
            Me.txtTop.CallProduto = 268470
            Session("sPRODUTO") = Me.txtTop.CallProduto

            Me.cboAnoInicial.AutoPostBack = False
            Me.cboAnoFinal.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False

            Me.chkFixarCabecalho.Checked = True

            Me.btnAtualizar.btnSalvar_Text = "Atualizar"
        End If
    End Sub

    Private Sub Atualizar()
        Session("sANO_INICIAL") = Me.cboAnoInicial.CallAno
        Session("sANO_FINAL") = Me.cboAnoFinal.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sPRODUTO") = Me.txtTop.CallProduto
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise Horizontal de Quebra por Item"
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        'On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Qtde52" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Qtde23" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrAg52" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrAg23" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrQuebra" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeQuebra" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked
        If Me.chkFixarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        Else
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        End If
    End Sub

    
    Protected Sub txtTop_txtProdutoChanged(sender As Object, e As EventArgs) Handles txtTop.txtProdutoChanged
        Call Atualizar()
    End Sub
End Class
