Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmResFin_Conferencia
    Inherits System.Web.UI.Page
    Dim strConn As String = Conexao.gerContSQL1_str

    Sub PreencherFilial()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT [Filial], [Desc] FROM [listLojasAdm] ORDER BY [Filial]"

        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.cboFilial.DataSource = objDr
        Me.cboFilial.DataBind()
        Conn.Close()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Call PreencherFilial()
        If Month(Now()) > 1 Then
            Me.cboAno.Text = Year(Now())
        Else
            Me.cboAno.Text = Year(Now()) - 1
        End If
        Me.cboMes.Value = 1
        Me.cboMes.Text = "Janeiro"
        Me.cboFilial.Value = 3
        Me.lblUserName.Text = User.Identity.Name
   
    End Sub

    Sub AtualizarConsulta()
        On Error Resume Next
        Dim sConnStr As String = strConn
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspResFin_AtuCubo", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Ano", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.Value

        cmdTest.Parameters.Add(New SqlParameter("@Mes", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes.Value

        cmdTest.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@idFilial").Value = Me.cboFilial.Value

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()

        Me.ASPxGridView1.DataBind()


        cnBKTest.Close()

    End Sub

    Sub AtualizarGridView()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT Dia, vlr, Contas, Agendas, DescFonte FROM viewResFin_Cubo WHERE (userName = '" & Me.lblUserName.Text & "')"
        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.ASPxGridView1.DataSource = objDr
        Me.ASPxGridView1.DataBind()

        Conn.Close()
    End Sub

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class
