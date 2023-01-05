Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Despesas_viewDesp_porGrupo_TodosMeses
    Inherits System.Web.UI.Page

    Dim strConn As String = "Data Source=NS3;Initial Catalog=gerContSQL1;User ID=eliseuf; PWD=RD700sx"
    Private vlrRev As Double = 0
    Private vlrRea As Double = 0
    Private vlrDif As Double = 0

    Sub PreencherGrid_Sistema()
        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT descMes, vlrRev, percRev, vlrRea, percRea, difVlr, difPerc FROM viewDespesaReal_porGrupo_TodosMeses WHERE idCod = " & Me.cboGrupo.SelectedValue & " AND Ano = " & Me.cboAno.SelectedValue & " AND idFilial = " & Me.cboFilial.SelectedValue & ""

        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.gridGrupo.DataSource = objDr
        Me.gridGrupo.DataBind()

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        oVem.ListaDasFiliais(Me.cboFilial, "Filial", "Desc")
        oVem.ListaDeGrupo(Me.cboGrupo, "CatLinhaCod", "CatLinhaDesc", 7) '7=Despesas
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo.SelectedIndexChanged
        Call Atualizar()
    End Sub

    Sub Atualizar()
        Call PreencherGrid_Sistema()
    End Sub

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
        Call Atualizar()
    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Call Atualizar()
    End Sub

    Protected Sub gridGrupo_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridGrupo.RowDataBound

        'Mudar Largura das colunas
        With gridGrupo
            .Columns(0).ItemStyle.Width = 100
            .Columns(1).ItemStyle.Width = 90
            .Columns(2).ItemStyle.Width = 40
            .Columns(3).ItemStyle.Width = 90
            .Columns(4).ItemStyle.Width = 40
            .Columns(5).ItemStyle.Width = 90
            .Columns(6).ItemStyle.Width = 40
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrRev += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRev"))
            vlrRea += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRea"))
            vlrDif += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "difVlr"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = (vlrRev).ToString("n0")
            e.Row.Cells(3).Text = (vlrRea).ToString("n0")
            e.Row.Cells(5).Text = (vlrDif).ToString("n0")
        End If
    End Sub
End Class
