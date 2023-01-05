
#Region " Imports"

Imports System.Data
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_Marketing_AlteraExcluiConvidado
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(236, Page.User.Identity.Name)

            cboAno.AnoInicial = 2018
            cboAno.AnoFinal = 2018
            cboAno.CallAno = 2018

            Session("sANO") = Me.cboAno.CallAno
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Alteração e Exclusão de Convidados - PGR236"
        End If
    End Sub

    Protected Sub cboList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboList.SelectedIndexChanged
        Call BuscarAtas()
      
    End Sub

    Sub BuscarAtas()

        Dim con As New SqlConnection(Conexao.gerMarketing)

        Dim strSQL As String = "SELECT CPF_CGC, nomeConvidado, ISNULL(Cargo,'') AS Cargo, Acompanhante, idTipo " & _
                                "FROM dbo.tblConvidados WHERE nomeConvidado LIKE '" & Me.cboList.Text & "' AND Ano=" & cboAno.CallAno & ""
        'oVem.UserMsgBox(Me, strSQL)
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try

            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Me.txtCPF.Text = reader5.GetSqlInt64(0)
                Me.txtConvidado.Text = reader5.GetSqlString(1)
                Me.txtCargo.Text = reader5.GetSqlString(2)

                'ACOMPANHANTE
                If reader5.GetSqlByte(3) = 1 Then
                    rnd_Sim.Checked = False
                    rnd_nao.Checked = True
                End If

                If reader5.GetSqlByte(3) = 2 Then
                    rnd_nao.Checked = False
                    rnd_Sim.Checked = True
                End If

                'OPCAO
                '0 = Fornecedor
                If reader5.GetSqlByte(4) = 0 Then
                    rndCondor.Checked = False
                    rndCGC.Checked = True
                    cboTipo.Visible = False
                    txtCPF.Visible = True
                    lblCNPJ_Caption.Visible = True
                End If

                '1 = Colaborador
                If reader5.GetSqlByte(4) = 1 Or reader5.GetSqlByte(4) = 2 Or reader5.GetSqlByte(4) = 99 Then
                    rndCGC.Checked = False
                    rndCondor.Checked = True
                    cboTipo.Visible = True
                    txtCPF.Visible = False
                    lblCNPJ_Caption.Visible = False
                    Select Case reader5.GetSqlByte(4)
                        Case 1  'Colaborador
                            cboTipo.SelectedIndex = 0
                        Case 2  'Autoridades
                            cboTipo.SelectedIndex = 1
                        Case 99  'Outros
                            cboTipo.SelectedIndex = 2
                    End Select
                End If

            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)

        Finally
            con.Close()
        End Try

    End Sub


    Private Sub ExcluirConvidado()

        Dim Connection As New SqlConnection(Conexao.gerMarketing)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = "dbo.uspExcluirConvidados"
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@Ano", cboAno.CallAno)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int16
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@nomeConvidado", txtConvidado.Text)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.String
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@Usuario", Page.User.Identity.Name)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.String
        Command.Parameters.Add(Parameter2)


        Try
            Connection.Open()
            Command.ExecuteNonQuery()
            Connection.Close()

            Me.txtConvidado.Text = ""
            Me.txtCargo.Text = ""

            oVem.UserMsgBox(Me, "O convidado " & Me.cboList.Text & " foi excluido com sucesso!!!")
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo:  btnExcluirPA_Click - " & ex.Message)
        Finally
            Connection.Close()
        End Try

    End Sub


    Protected Sub cboDistribuidor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboDistribuidor.SelectedIndexChanged

        cboList.SelectedIndex = 0
        BuscarAtas()
    End Sub

    Protected Sub btnExcluir_Click(sender As Object, e As EventArgs) Handles btnExcluir.Click
        ExcluirConvidado()
        cboList.DataBind()
        cboList.SelectedIndex = 0
        BuscarAtas()
    End Sub


    Private Sub uspAtualizarConvidado(iAcompanhante As Byte, iTipo As Byte, ByVal CPF_CGC As Long)

        Dim Connection As New SqlConnection(Conexao.gerMarketing)
        Dim Command As New SqlClient.SqlCommand("cmd", Connection)

        Command.CommandText = "dbo.uspAtualizarConvidados"
        Command.CommandType = CommandType.StoredProcedure

        Dim Parameter0 As New SqlClient.SqlParameter("@Ano", cboAno.CallAno)
        Parameter0.Direction = ParameterDirection.Input
        Parameter0.DbType = DbType.Int16
        Command.Parameters.Add(Parameter0)

        Dim Parameter1 As New SqlClient.SqlParameter("@Distribuidor", cboDistribuidor.Value)
        Parameter1.Direction = ParameterDirection.Input
        Parameter1.DbType = DbType.Byte
        Command.Parameters.Add(Parameter1)

        Dim Parameter2 As New SqlClient.SqlParameter("@CGC_CPF", CPF_CGC)
        Parameter2.Direction = ParameterDirection.Input
        Parameter2.DbType = DbType.Int64
        Command.Parameters.Add(Parameter2)

        Dim Parameter3 As New SqlClient.SqlParameter("@nomeConvidado", txtConvidado.Text)
        Parameter3.Direction = ParameterDirection.Input
        Parameter3.DbType = DbType.String
        Command.Parameters.Add(Parameter3)

        Dim Parameter4 As New SqlClient.SqlParameter("@Acompanhante", iAcompanhante)
        Parameter4.Direction = ParameterDirection.Input
        Parameter4.DbType = DbType.Byte
        Command.Parameters.Add(Parameter4)

        Dim Parameter5 As New SqlClient.SqlParameter("@Usuario", Page.User.Identity.Name)
        Parameter5.Direction = ParameterDirection.Input
        Parameter5.DbType = DbType.String
        Command.Parameters.Add(Parameter5)

        Dim Parameter6 As New SqlClient.SqlParameter("@idTipo", iTipo)
        Parameter6.Direction = ParameterDirection.Input
        Parameter6.DbType = DbType.Byte
        Command.Parameters.Add(Parameter6)

        Dim Parameter7 As New SqlClient.SqlParameter("@Cargo", txtCargo.Text)
        Parameter7.Direction = ParameterDirection.Input
        Parameter7.DbType = DbType.String
        Command.Parameters.Add(Parameter7)

        Try
            Connection.Open()
            Command.ExecuteNonQuery()
            Connection.Close()
            oVem.UserMsgBox(Me, "O convidado " & Me.cboList.Text & " foi alterado com sucesso!!!")
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo:  btnExcluirPA_Click - " & ex.Message)
        Finally
            Connection.Close()
        End Try

    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Dim varNaoSim As Byte
        Dim varTipo As Byte
        Dim varCPF As Long



        If rndCGC.Checked = True Then
            varCPF = ValidadeCNPJ()
            varTipo = 0 'Fornecedor
        End If

        If rndCondor.Checked = True Then
            Select Case Me.cboTipo.Value
                Case 1
                    varTipo = 1 'Colaborador
                    varCPF = 76189406000126
                Case 2
                    varTipo = 2 'Autoridades
                    varCPF = 76189406000126
                Case 99
                    varTipo = 99    'Outros
            End Select
        End If

        If rnd_nao.Checked = True Then  'Acompanhante
            varNaoSim = 1
        Else
            varNaoSim = 2
        End If

        uspAtualizarConvidado(varNaoSim, varTipo, varCPF)
    End Sub


    Private Function ValidadeCNPJ() As Int64
        Dim varCPF As Long

        varCPF = CLng(Left(Me.txtCPF.Text, 2) & Left(Mid(Me.txtCPF.Text, 4), 3) & Left(Mid(Me.txtCPF.Text, 8), 3) & Left(Mid(Me.txtCPF.Text, 12), 4) & Right(Me.txtCPF.Text, 2))
        ValidadeCNPJ = varCPF
    End Function

End Class
