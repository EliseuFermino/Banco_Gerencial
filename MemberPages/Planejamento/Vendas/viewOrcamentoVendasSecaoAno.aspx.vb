Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_viewOrcamentoVendasSecaoAno
    Inherits System.Web.UI.Page

    Dim oOrc As New Orcamento

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim Ano As Int32
            Dim oVem As New VendaEmpresaMes
            Dim varPosicao As Byte = oOrc.DefinirPosicao(cboAno.CallAno, 1)

            oVem.AtualizarEstatisticaPrograma(80, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Ano = Me.cboAno.CallAno


            Select Case varPosicao
                Case 1 ' Loja
                    cboPosicao.CallPosicao = 1
                Case 2  ' Administracao
                    cboPosicao.CallPosicao = 2
                Case 3  ' Definitivo
                    cboPosicao.CallPosicao = 3
                Case 4  ' Comercial
                    cboPosicao.CallPosicao = 4
            End Select
           

            Call mySession()
            Call Atualizar()

        End If
    End Sub

    Private Sub Legendas()
        Me.grid.Columns.Item("Grupo_Ano3").Caption = "Histórico " & Me.cboAno.CallAno - 3
        Me.grid.Columns.Item("Grupo_Ano2").Caption = "Histórico " & Me.cboAno.CallAno - 2
        Me.grid.Columns.Item("Grupo_Ano1").Caption = "Histórico " & Me.cboAno.CallAno - 1
        Me.grid.Columns.Item("Grupo_Meta").Caption = "Meta " & Me.cboAno.CallAno

        Me.grid.Columns.Item("CrescMeta").Caption = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
        Me.grid.Columns.Item("CrescAA").Caption = Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)
        Me.grid.Columns.Item("CrescAA1").Caption = Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "CrescA3_A4" Or e.DataColumn.FieldName = "CrescA2_A3" Or e.DataColumn.FieldName = "CrescA1_A2" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("Descricao"))

        Select Case NomeColuna
            Case "Departamento 1", "Departamento 2", "Departamento 3", "Departamento 4", "Departamento 5"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "Total"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
    End Sub

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = cboFilial.CallFilial
        Session("sUSER") = Page.User.Identity.Name
        Session("sTIPO") = 1
        Session("sPOSICAO") = cboPosicao.CallPosicao

    End Sub

    Private Sub Atualizar()

        Me.grid.DataBind()
        Call Legendas()
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        Select Case Me.cboPosicao.CallPosicao
            Case 1, 2   'Lojas e Adminsitação
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento Ano da Loja - Vendas - PGR80 "
            Case 3
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento Ano - Vendas - PGR80  "
            Case 4  'Comercial
                CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatorio Analise do Orçamento Ano do Comercial - Vendas - PGR80  "
        End Select

    End Sub

    Protected Sub cboPanel_Callback1(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        mySession()
        Atualizar()
    End Sub
End Class
