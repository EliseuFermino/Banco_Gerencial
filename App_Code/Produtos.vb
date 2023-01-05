Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class Produtos

    Dim oSql As New SQL
    Private vDesc As String

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    'Public Function BuscarCodigo(ByVal EAN As String) As Integer

    '    Try
    '        Dim ret As Integer

    '        Dim conn As New SqlConnection
    '        conn = Conexao.DW_Condor_One

    '        Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("Cadastros.uspBuscarCodigoProdutoPeloEAN", conn)

    '            cmd.CommandType = CommandType.StoredProcedure
    '            cmd.Parameters.Add("@EAN", SqlDbType.BigInt).Value = EAN
    '            cmd.Connection.Open()
    '            ret = cmd.ExecuteScalar()
    '            cmd.Connection.Close()

    '        End Using

    '        BuscarCodigo = ret

    '    Catch ex As SqlClient.SqlException
    '        BuscarCodigo = "<SQL Exception>"
    '    End Try


    'End Function

    'Public Function BuscarNome(ByVal EAN As String) As String

    '    Try
    '        Dim ret As String = String.Empty

    '        Dim conn As New SqlConnection
    '        conn = Conexao.DW_Condor_One

    '        Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand("Cadastros.uspBuscarNomeProdutoPeloEAN", conn)

    '            cmd.CommandType = CommandType.StoredProcedure
    '            cmd.Parameters.Add("@EAN", SqlDbType.BigInt).Value = EAN
    '            cmd.Connection.Open()
    '            ret = cmd.ExecuteScalar()
    '            cmd.Connection.Close()

    '        End Using

    '        BuscarNome = ret

    '    Catch ex As SqlClient.SqlException
    '        BuscarNome = "<SQL Exception>"
    '    End Try

    'End Function

    Public Function BuscarNomePeloEAN(ByVal EAN As String) As String

        BuscarNomePeloEAN = oSql.ExecuteScalar_Parameter1(Conexao.DW_Condor_One, "Cadastros.uspBuscarNomeProdutoPeloEAN", "@EAN", SqlDbType.BigInt, CLng(EAN))

    End Function

    Public Function BuscarCodigoPeloEAN(ByVal EAN As String) As Integer

        BuscarCodigoPeloEAN = oSql.ExecuteScalar_Parameter1(Conexao.DW_Condor_One, "Cadastros.uspBuscarCodigoProdutoPeloEAN", "@EAN", SqlDbType.BigInt, CLng(EAN))

    End Function

    Public Function BuscarNomeComprador(ByVal idComprador As Integer) As String
        BuscarNomeComprador = oSql.ExecuteScalar_Parameter1(Conexao.gerManager_conn, "Cadastros.uspBuscarNomeCompradorPeloID", "@idComprador", SqlDbType.Int, idComprador)
    End Function

    Public Function BuscarNomeGestor(ByVal idGestor As Integer) As String
        BuscarNomeGestor = oSql.ExecuteScalar_Parameter1(Conexao.gerManager_conn, "Cadastros.uspBuscarNomeGestorPeloID", "@idGestor", SqlDbType.Int, idGestor)
    End Function

    Public Function BuscarIdGestor_Pelo_GestorAssistente(ByVal idGestorAssistente As Integer) As String
        BuscarIdGestor_Pelo_GestorAssistente = oSql.ExecuteScalar_Parameter1(Conexao.gerManager_conn, "Cadastros.uspBuscarIdGestor_Pelo_IdGestorAssistente", "@idGestorAssistente", SqlDbType.Int, idGestorAssistente)
    End Function

End Class

