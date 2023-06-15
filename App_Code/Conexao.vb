Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationManager
Imports System.Data
Imports DevExpress.Web

Public Class Conexao

    'Public Shared gerCadastros As String = ConnectionStrings("gerCadastrosConnectionString").ConnectionString

    'Public Shared gerAgendas As String = ConnectionStrings("gerAgendasConnectionString").ConnectionString
    'Public Shared gerBI As String = ConnectionStrings("gerBIConnectionString").ConnectionString
    'Public Shared gerInv As String = ConnectionStrings("gerInvConnectionString").ConnectionString
    'Public Shared gerManager As String = ConnectionStrings("gerManagerConnectionString").ConnectionString
    'Public Shared gerVendas As String = ConnectionStrings("gerVendasConnectionString").ConnectionString

    Dim oVem As New VendaEmpresaMes

    Public Shared Function DW_Condor_One() As SqlConnection
        Dim connectionString As String = "Data Source=10.1.2.225;Initial Catalog=DW_Condor_One;User ID=sa;Password=rd700@1"
        Return New SqlConnection(connectionString)
    End Function

    Public Shared Function gerCont() As SqlConnection
        Dim connectionString As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
        Return New SqlConnection(connectionString)
    End Function

    Public Shared Function gerProjetos() As SqlConnection
        Dim connectionString As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerProjetos;User ID=sa; PWD=rd700@1"
        Return New SqlConnection(connectionString)
    End Function

    Public Shared Function gerManager_conn() As SqlConnection
        Dim connectionString As String = "Data Source=10.1.2.225;Initial Catalog=gerManager;User ID=sa;Password=rd700@1"
        Return New SqlConnection(connectionString)
    End Function

    Public Shared gerCheckList As String = ConnectionStrings("gerCheckListConnectionString").ConnectionString

    Public Shared gerManager As String = ConnectionStrings("gerManagerConnectionString").ConnectionString

    Public Shared gerConcor As String = ConnectionStrings("gerConcorConnectionString").ConnectionString

    Public Shared gerMetas As String = ConnectionStrings("gerMetasConnectionString").ConnectionString

    Public Shared gerTesouraria As String = ConnectionStrings("gerTesourariaConnectionString").ConnectionString

    Public Shared gerMarketing As String = ConnectionStrings("gerMarketingConnectionString").ConnectionString

    Public Shared DW_Condor_One_ConnectionString As String = ConnectionStrings("DW_Condor_One_ConnectionString").ConnectionString

    Public Shared gerPerdas As String = ConnectionStrings("gerPerdasConnectionString").ConnectionString

    Public Shared gerRPM As String = ConnectionStrings("gerRPMConnectionString").ConnectionString

    Public Shared gerCont_str As String = ConnectionStrings("ApplicationServices").ConnectionString

    Public Shared gerOrcamento As String = ConnectionStrings("gerOrcamentoConnectionString").ConnectionString

    Public Shared gerContSQL1_str As String = ConnectionStrings("gerContSQL1ConnectionString").ConnectionString

    Public Shared gerVendaItem_str As String = ConnectionStrings("gerVendaItemConnectionString").ConnectionString

    Public Shared Vendas_tr As String = ConnectionStrings("VendasConnectionString").ConnectionString

    Public Shared gerTemp_tr As String = ConnectionStrings("gerTempConnectionString").ConnectionString

    Public Shared gerVendaFornecedores_str As String = ConnectionStrings("gerVendaFornecedoresConnectionString").ConnectionString

    Public Shared gerVendaFornecedoresSLV_str As String = ConnectionStrings("gerVendaFornecedoresSLVConnectionString").ConnectionString

    Public Shared gerKnowledge_str As String = ConnectionStrings("gerKnowledgeConnectionString").ConnectionString

    Public Shared gerTran_SLV_str As String = ConnectionStrings("SQL18_gerTran_SLV_ConnectionString").ConnectionString

    Public Shared gerProjetos_str As String = ConnectionStrings("SQL14_gerProjetosConnectionString").ConnectionString

    Public Shared gerCadastros_str As String = ConnectionStrings("gerCadastrosConnectionString").ConnectionString

    Public Shared gerTran_Vendas_str As String = ConnectionStrings("gerTran_VendasConnectionString").ConnectionString

    Public Shared gerBI_str As String = ConnectionStrings("gerBIConnectionString").ConnectionString

    Public Shared DW_str As String = ConnectionStrings("DWConnectionString").ConnectionString

    Public Shared SQL14_gerManager As String = ConnectionStrings("SQL14_gerManagerConnectionString").ConnectionString

    Public Shared LocalSqlServer As String = ConnectionStrings("LocalSqlServer").ConnectionString


    Public Function spScalar(ByVal myConnection As String, ByVal myNameStoredProcedure As String) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar = varReturn

    End Function

    Public Function spScalar_pAno(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Ano As Int16) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@Ano", Ano)

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pAno = varReturn

    End Function

    Public Function spScalar_pAno_Field(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Ano As Int16, ByVal declare_Field As String, ByVal Field As String) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@Ano", Ano)
        comando.Parameters.AddWithValue(declare_Field, Field)

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pAno_Field = varReturn

    End Function

    Public Function spScalar_pDia_Field(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Dia As Date, ByVal declare_Field As String, ByVal Field As String) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@Dia", Dia)
        comando.Parameters.AddWithValue(declare_Field, Field)

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pDia_Field = varReturn

    End Function

    Public Function spScalar_pFilial(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Filial As Byte) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@idFilial", Filial)

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pFilial = varReturn

    End Function


    Public Function spScalar_pAnoMes(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Ano As Int16, ByVal Mes As Byte) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@Ano", Ano)
        comando.Parameters.AddWithValue("@Mes", Mes)

        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pAnoMes = varReturn

    End Function

    Public Function spScalar_pFilialAnoMes(ByVal myConnection As String, ByVal myNameStoredProcedure As String, ByVal Filial As Byte, ByVal Ano As Int16, ByVal Mes As Byte) As String

        Dim con As New SqlConnection(myConnection)
        Dim comando As New SqlCommand(myNameStoredProcedure, con)
        Dim varReturn As String
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.AddWithValue("@idFilial", Filial)
        comando.Parameters.AddWithValue("@Ano", Ano)
        comando.Parameters.AddWithValue("@Mes", Mes)


        Try
            con.Open()
            varReturn = comando.ExecuteScalar()

            con.Close()
        Catch ex As Exception
            varReturn = "Função: 'spScalar_pFilialAnoMes' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()

        End Try

        spScalar_pFilialAnoMes = varReturn

    End Function


    Sub ListaUsuario_Excluir_String(ByVal nomeConexao As SqlConnection, ByVal nomeDaTabela As String, nomeUsuario As String)

        Dim connection As SqlConnection = nomeConexao

        Dim deleteSQL = "DELETE FROM " & nomeDaTabela & " WHERE Usuario = ('" & nomeUsuario & "')"
        Dim deleteCommand = New SqlCommand(deleteSQL, connection)

        Try
            connection.Open()
            deleteCommand.ExecuteNonQuery()
        Catch ex As Exception
            'Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub


    Private Sub ListaUsuario_Adicionar_String(ByVal nomeConexao As SqlConnection, ByVal nomeLista As ASPxListBox, ByVal nomeDaTabela As String, nomeUsuario As String)

        Dim connection As SqlConnection = nomeConexao

        For Each item In nomeLista.SelectedValues

            Dim TextoSelecionado As Int16 = item.ToString

            Dim insertSQL = "INSERT INTO " & nomeDaTabela & " (Usuario,dados) VALUES ('" & nomeUsuario & "', '" & TextoSelecionado & "')"
            Dim insertCommand = New SqlCommand(insertSQL, connection)

            Try
                connection.Open()
                insertCommand.ExecuteNonQuery()
            Catch ex As Exception
                'Me.lblError.Text = Err.Description
            Finally
                connection.Close()
            End Try

        Next

    End Sub

    Sub ValorUnico_Adicionar(ByVal nomeConexao As SqlConnection, ByVal nomeDaTabela As String, nomeUsuario As String, TextoSelecionado As String)

        Dim connection As SqlConnection = nomeConexao

        Dim insertSQL = "INSERT INTO " & nomeDaTabela & " (Usuario,dados) VALUES ('" & nomeUsuario & "', '" & TextoSelecionado & "')"
        Dim insertCommand = New SqlCommand(insertSQL, connection)

        Try
            connection.Open()
            insertCommand.ExecuteNonQuery()
        Catch ex As Exception
            'Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub


    Sub Lista_Usuario_String(ByVal nomeConexao As SqlConnection, ByVal nomeLista As ASPxListBox, nomeDaTabela As String, nomeUsuario As String)
        If nomeLista.SelectedValues.Count >= 0 Then
            ListaUsuario_Excluir_String(nomeConexao, nomeDaTabela, nomeUsuario)
            ListaUsuario_Adicionar_String(nomeConexao, nomeLista, nomeDaTabela, nomeUsuario)
        End If
    End Sub



End Class
