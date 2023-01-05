Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_RPM_rpmTarefasHoje
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oData As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oFun As New Funcoes
            oFun.Grid_Title(grid, "Tarefas de Hoje - " & DateAndTime.Today & ".")
        End If
    End Sub


#Region " ALTERAÇÃO"

    Sub BuscarTarefa_RPM()

        Call LimparTela_Tarefa_RPM()

        Dim con As New SqlConnection(Conexao.gerRPM)
        Dim strSQL As String = "SELECT Descricao, Solicitante, CONVERT(CHAR(10),DiaCadastro,103) AS DiaCadastro,Duração,Status,Categoria,Projeto,CONVERT(CHAR(10),Conclusao,103) AS Conclusao FROM Dados.vwTodasTarefas WHERE ID = " & Me.txtTarefaID.Value & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                txtDesc.Text = reader5.GetSqlString(0)  'Descricao
                txtSolicitante.Text = reader5.GetSqlString(1)   'Solicitante
                cboDia.Text = CDate(reader5.GetSqlString(2))
                txtDuracao.Text = reader5.GetSqlString(3)   'Duração
                cboStatus.Text = reader5.GetSqlString(4)    'Status
                cboCategoria.Text = reader5.GetSqlString(5) 'Categoria
                cboProjeto.Text = reader5.GetSqlString(6)   'Projeto
                cboConclusao.Text = CDate(reader5.GetSqlString(7))
             
            End While

        Catch ex As Exception
            oVem.UserMsgBox(Me, "Classe: BuscarTarefa_RPM - " & ex.Message)

        Finally
            con.Close()
        End Try

    End Sub

    Private Sub LimparTela_Tarefa_RPM()
        txtDesc.Text = ""
        txtSolicitante.Text = ""
        cboDia.Text = ""
        txtDuracao.Text = ""
        cboStatus.Text = ""
        cboCategoria.Text = ""
        cboProjeto.Text = ""
        cboConclusao.Text = ""
    End Sub


#End Region

    Protected Sub panPlanoAcao_PreRender(sender As Object, e As EventArgs) Handles panPlanoAcao.PreRender
        BuscarTarefa_RPM()
    End Sub


    Private Sub AtualizarRPM()

        oData.ExecuteStoredProcedure("usp_Dia_Update", Conexao.gerRPM,
                                      "@ID", txtTarefaID.Text,
                                      "@descTarefa", txtDesc.Text,
                                      "@diaAte", cboDia.Date,
                                      "@idStatus", cboStatus.Value,
                                      "@idCategoria", cboCategoria.Value,
                                      "@duracao", txtDuracao.Text,
                                      "@solicitante", txtSolicitante.Text,
                                      "@diaConclusao", cboConclusao.Date,
                                      "@idProjeto", cboProjeto.Value
                                      )





    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        AtualizarRPM()
        grid.DataBind()

    End Sub
 Protected Sub btnExcluirPA_Click(sender As Object, e As EventArgs) Handles btnExcluirPA.Click
        oData.ExecuteStoredProcedure("usp_Dia_Delete", Conexao.gerRPM, "@ID", txtTarefaID.Text)
        grid.DataBind()
    End Sub
End Class
