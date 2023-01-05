Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_viewImpostoCompraImportacao1
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        With Me.GridView1
            .Columns(1).ItemStyle.Width = 30
            .Columns(2).ItemStyle.Width = 100
            .Columns(3).ItemStyle.Width = 100
            .Columns(4).ItemStyle.Width = 100
            .Columns(5).ItemStyle.Width = 100

        End With
    End Sub

    Sub AtualizarGridView()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT tblComprasFiscal.idAgenda, descAgenda, vlrContabil, vlrBaseImposto, vlrImposto, vlrLiqSemImposto, vlrBaseCofinsPis, vlrCofins, vlrPis, vlrLiqSemImpostoI " & _
                               "FROM tblComprasFiscal JOIN tblCadAgendas " & _
                               "ON tblComprasFiscal.idAgenda = tblCadAgendas.idAgenda " & _
                               "WHERE idFilial = 1 AND Mes = " & Me.GridView1.SelectedRow.Cells(1).Text & " AND Ano = " & Me.cboAno.SelectedValue & " AND (tblComprasFiscal.idAgenda = 332 OR tblComprasFiscal.idAgenda = 479 OR tblComprasFiscal.idAgenda = 480) " & _
                               "ORDER BY tblComprasFiscal.idAgenda"
        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.GridView2.DataSource = objDr
        Me.GridView2.DataBind()

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Call AtualizarGridView()
    End Sub
End Class
