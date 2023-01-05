
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmViewSistemaDia
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str
    Private vlrDia As Double = 0
    Private vlrDia1 As Double = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        oVem.ListaDasFiliais(Me.cboFilial, "Filial", "Desc")
        Me.lblDia.Text = Me.Calendar1.TodaysDate

    End Sub

    Sub PreencherGrid()
        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT tblResFin_Dados.Dia, tblResFin_Dados.idAgenda, tblCadAgendas.descAgenda, tblResFin_Dados.vlr FROM tblResFin_Dados INNER JOIN tblCadAgendas ON tblResFin_Dados.idAgenda = tblCadAgendas.idAgenda WHERE tblResFin_Dados.Dia = CONVERT(DATE,'" & Me.lblDia.Text & "',103) AND tblResFin_Dados.idFilial = " & Me.cboFilial.SelectedValue & " AND tblResFin_Dados.idSis = " & Me.cboSistema.SelectedValue & " ORDER BY tblResFin_Dados.idAgenda"
        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.GridView1.DataSource = objDr
        Me.GridView1.DataBind()

    End Sub

    Sub PreencherGrid_Mes()
        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT tblResFin_Dados.Ano, tblResFin_Dados.Mes, tblResFin_Dados.idAgenda, tblCadAgendas.descAgenda, SUM(tblResFin_Dados.vlr) AS vlr FROM tblResFin_Dados INNER JOIN tblCadAgendas ON tblResFin_Dados.idAgenda = tblCadAgendas.idAgenda GROUP BY tblResFin_Dados.Ano, tblResFin_Dados.Mes, tblResFin_Dados.idAgenda, tblCadAgendas.descAgenda, tblResFin_Dados.idFilial, tblResFin_Dados.idSis HAVING tblResFin_Dados.Ano = " & Year(Me.lblDia.Text) & " AND tblResFin_Dados.Mes = " & Month(Me.lblDia.Text) & "  AND tblResFin_Dados.idFilial = " & Me.cboFilial.SelectedValue & " AND tblResFin_Dados.idSis = " & Me.cboSistema.SelectedValue & " ORDER BY tblResFin_Dados.idAgenda"
        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.GridView2.DataSource = objDr
        Me.GridView2.DataBind()

    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.lblDia.Text = Me.Calendar1.SelectedDate
        Call PreencherGrid()
        Call PreencherGrid_Mes()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrDia1 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlr"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = (vlrDia1).ToString("n2")
        End If
    End Sub

    Protected Sub cboSistema_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSistema.SelectedIndexChanged
        Call PreencherGrid()
        Call PreencherGrid_Mes()
    End Sub

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
        Call PreencherGrid()
        Call PreencherGrid_Mes()
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrDia += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlr"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(4).Text = (vlrDia).ToString("n2")
        End If
    End Sub
End Class
