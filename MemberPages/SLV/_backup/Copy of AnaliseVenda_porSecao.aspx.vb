Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVenda_PorSecao
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick

        Dim vMesInicial As Byte
        vMesInicial = Me.cboDia.CallDiaInicial.Month

        clData_gerManager.uspSecaoDias("SLV.AtualizarAnaliseVendaSecao_porSecao", Me.cboSecao.CallSecao, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)
        Session("sUSUARIO") = User.Identity.Name

        Me.chkMA.Visible = True
        Me.chkAA.Visible = True
        Me.chkMeta.Visible = True
        Me.chkCrescVenda.Visible = True
        Me.chkCrescQtde.Visible = True
        Me.chkCrescLucro.Visible = True
        Me.chkPartAT.Visible = True
        Me.chkPartAA.Visible = True
        Me.chkPartMA.Visible = True
        Me.chkLucroAT.Visible = True
        Me.chkLucroAA.Visible = True
        Me.chkLucroMA.Visible = True

        If ViewState("INICIAR") = "1" Then
            Me.chkPartMA.Checked = False
            Me.chkLucroMA.Checked = False
        End If


        Me.grid.Visible = True
        Me.grid.DataBind()

        If vMesInicial = 1 Then
            Call OcultarMesAnterior()
            Me.chkMA.Visible = False
            Me.chkPartMA.Visible = False
            Me.chkLucroMA.Visible = False
        Else
            Call ExibirMesAnterior()

        End If

        Me.Panel1.Visible = True
        Me.Panel2.Visible = True
        Me.Panel3.Visible = True
        Me.Panel4.Visible = True

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(68, User.Identity.Name)
            Me.cboSecao.CallSecao = 1
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas - por Seção"
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescQtde" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If



        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

    Private Sub ExibirMesAnterior()
        Me.grid.Columns.Item("QtdeMA").Visible = True
        Me.grid.Columns.Item("vlrVendaMA").Visible = True
        Me.grid.Columns.Item("percMargemMA").Visible = True
        Me.grid.Columns.Item("vlrMargemMA").Visible = True
        Me.grid.Columns.Item("percPartMA").Visible = True

        Me.chkMA.Checked = True
        Me.chkMA.Visible = True
        Me.chkPartMA.Checked = True
        Me.chkPartMA.Enabled = True
        Me.chkLucroMA.Checked = True
        Me.chkLucroMA.Enabled = True

    End Sub

    Private Sub OcultarMesAnterior()
        Me.grid.Columns.Item("QtdeMA").Visible = False
        Me.grid.Columns.Item("vlrVendaMA").Visible = False
        Me.grid.Columns.Item("percMargemMA").Visible = False
        Me.grid.Columns.Item("percPartMA").Visible = False
        Me.grid.Columns.Item("vlrMargemMA").Visible = False
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub chkMA_CheckedChanged(sender As Object, e As EventArgs) Handles chkMA.CheckedChanged
        If Me.chkMA.Checked = True Then
            Call ExibirMesAnterior()
        Else
            Call OcultarMesAnterior()
        End If
    End Sub

    Protected Sub chkMeta_CheckedChanged(sender As Object, e As EventArgs) Handles chkMeta.CheckedChanged
        If Me.chkMeta.Checked = True Then   '
            Me.grid.Columns.Item("vlrMeta").Visible = True
            Me.grid.Columns.Item("percMargemMeta").Visible = True
        Else
            Me.grid.Columns.Item("vlrMeta").Visible = False
            Me.grid.Columns.Item("percMargemMeta").Visible = False
        End If
    End Sub

    Protected Sub chkCrescQtde_CheckedChanged(sender As Object, e As EventArgs) Handles chkCrescQtde.CheckedChanged
        If Me.chkCrescQtde.Checked = True Then   '
            Me.grid.Columns.Item("percCrescQtde").Visible = True
        Else
            Me.grid.Columns.Item("percCrescQtde").Visible = False
        End If
    End Sub

    Protected Sub chkCrescLucro_CheckedChanged(sender As Object, e As EventArgs) Handles chkCrescLucro.CheckedChanged
        If Me.chkCrescLucro.Checked = True Then   '
            Me.grid.Columns.Item("percCrescLucro").Visible = True
        Else
            Me.grid.Columns.Item("percCrescLucro").Visible = False
        End If
    End Sub

    Protected Sub chkCrescVenda_CheckedChanged(sender As Object, e As EventArgs) Handles chkCrescVenda.CheckedChanged
        If Me.chkCrescVenda.Checked = True Then   '
            Me.grid.Columns.Item("percCresc").Visible = True
        Else
            Me.grid.Columns.Item("percCresc").Visible = False
        End If
    End Sub

    Protected Sub chkAA_CheckedChanged(sender As Object, e As EventArgs) Handles chkAA.CheckedChanged
        If Me.chkAA.Checked = True Then
            Me.grid.Columns.Item("QtdeAA").Visible = True
            Me.grid.Columns.Item("vlrVendaAA").Visible = True
            Me.grid.Columns.Item("percMargemAA").Visible = True
            Me.grid.Columns.Item("vlrMargemAA").Visible = True
        Else
            Me.grid.Columns.Item("QtdeAA").Visible = False
            Me.grid.Columns.Item("vlrVendaAA").Visible = False
            Me.grid.Columns.Item("percMargemAA").Visible = False
            Me.grid.Columns.Item("vlrMargemAA").Visible = False
        End If
    End Sub

    Protected Sub chkPartAA_CheckedChanged(sender As Object, e As EventArgs) Handles chkPartAA.CheckedChanged
        If Me.chkPartAA.Checked = True Then   '
            Me.grid.Columns.Item("percPartAA").Visible = True
        Else
            Me.grid.Columns.Item("percPartAA").Visible = False
        End If
    End Sub

    Protected Sub chkPartAT_CheckedChanged(sender As Object, e As EventArgs) Handles chkPartAT.CheckedChanged
        If Me.chkPartAT.Checked = True Then   '
            Me.grid.Columns.Item("percPartAT").Visible = True
        Else
            Me.grid.Columns.Item("percPartAT").Visible = False
        End If
    End Sub

    Protected Sub chkPartMA_CheckedChanged(sender As Object, e As EventArgs) Handles chkPartMA.CheckedChanged
        If Me.chkPartMA.Checked = True Then   '
            Me.grid.Columns.Item("percPartMA").Visible = True
        Else
            Me.grid.Columns.Item("percPartMA").Visible = False
        End If
    End Sub

    Protected Sub chkLucroAT_CheckedChanged(sender As Object, e As EventArgs) Handles chkLucroAT.CheckedChanged
        If Me.chkLucroAT.Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemAT").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemAT").Visible = False
        End If
    End Sub

    Protected Sub chkLucroMA_CheckedChanged(sender As Object, e As EventArgs) Handles chkLucroMA.CheckedChanged
        If Me.chkLucroMA.Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemMA").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemMA").Visible = False
        End If
    End Sub

    Protected Sub chkLucroAA_CheckedChanged(sender As Object, e As EventArgs) Handles chkLucroAA.CheckedChanged
        If Me.chkLucroAA.Checked = True Then   '
            Me.grid.Columns.Item("vlrMargemAA").Visible = True
        Else
            Me.grid.Columns.Item("vlrMargemAA").Visible = False
        End If
    End Sub

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If
    End Sub
End Class
