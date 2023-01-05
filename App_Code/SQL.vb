Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class SQL

    Dim oVem As New VendaEmpresaMes
 
    Public Function ExecuteScalar_Parameter1(ByVal iConexaoDoBanco As SqlConnection,
                                 ByVal iNomeStoredProcedure As String,
                                 ByVal iNomeDoParametroNoBanco As String,
                                 ByVal iSqlDbType As SqlDbType,
                                 ByVal iParametro1 As String) As String

        Try
            Dim ret As String = String.Empty

            Dim conn As New SqlConnection
            conn = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, conn)

                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco, iSqlDbType).Value = iParametro1
                cmd.Connection.Open()
                ret = cmd.ExecuteScalar()
                cmd.Connection.Close()

            End Using

            ExecuteScalar_Parameter1 = ret

        Catch ex As SqlClient.SqlException
            ExecuteScalar_Parameter1 = "<SQL Exception>"
        End Try

    End Function

#Region " InsertDB"

    ''' <summary>
    ''' Executa consulta INSERT com 1 CAMPO.
    ''' </summary>
    ''' <param name="iConexaoDoBanco"></param>
    ''' <param name="iNomeStoredProcedure"></param>
    ''' <param name="iNomeDoParametroNoBanco1"></param>
    ''' <param name="iSqlDbType1"></param>
    ''' <param name="iParametro1"></param>
    ''' <remarks></remarks>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                         ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String
                        )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub

    ''' <summary>
    ''' Executa consulta INSERT com 2 CAMPOS.
    ''' </summary>
    ''' <param name="iConexaoDoBanco"></param>
    ''' <param name="iNomeStoredProcedure"></param>
    ''' <param name="iNomeDoParametroNoBanco1"></param>
    ''' <param name="iSqlDbType1"></param>
    ''' <param name="iParametro1"></param>
    ''' <param name="iNomeDoParametroNoBanco2"></param>
    ''' <param name="iSqlDbType2"></param>
    ''' <param name="iParametro2"></param>
    ''' <remarks></remarks>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                         ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                         ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String
                        )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub

    ''' <summary>
    ''' Executa consulta INSERT com 3 CAMPOS.
    ''' </summary>
    ''' <param name="iConexaoDoBanco"></param>
    ''' <param name="iNomeStoredProcedure"></param>
    ''' <param name="iNomeDoParametroNoBanco1"></param>
    ''' <param name="iSqlDbType1"></param>
    ''' <param name="iParametro1"></param>
    ''' <param name="iNomeDoParametroNoBanco2"></param>
    ''' <param name="iSqlDbType2"></param>
    ''' <param name="iParametro2"></param>
    ''' <param name="iNomeDoParametroNoBanco3"></param>
    ''' <param name="iSqlDbType3"></param>
    ''' <param name="iParametro3"></param>
    ''' <remarks></remarks>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub

    ''' <summary>
    ''' Executa consulta INSERT com 4 CAMPOS.
    ''' </summary>
    ''' <param name="iConexaoDoBanco"></param>
    ''' <param name="iNomeStoredProcedure"></param>
    ''' <param name="iNomeDoParametroNoBanco1"></param>
    ''' <param name="iSqlDbType1"></param>
    ''' <param name="iParametro1"></param>
    ''' <param name="iNomeDoParametroNoBanco2"></param>
    ''' <param name="iSqlDbType2"></param>
    ''' <param name="iParametro2"></param>
    ''' <param name="iNomeDoParametroNoBanco3"></param>
    ''' <param name="iSqlDbType3"></param>
    ''' <param name="iParametro3"></param>
    ''' <remarks></remarks>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub

    ''' <summary>
    ''' Executa consulta INSERT com 5 CAMPOS.
    ''' </summary>  
    ''' <remarks>Testando 5 Campos</remarks>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String,
                          ByVal iNomeDoParametroNoBanco5 As String, iSqlDbType5 As SqlDbType, ByVal iParametro5 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Parameters.Add(iNomeDoParametroNoBanco5, iSqlDbType5).Value = iParametro5
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub


    ''' <summary>
    ''' Executa consulta INSERT com 6 CAMPOS.
    ''' </summary>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String,
                          ByVal iNomeDoParametroNoBanco5 As String, iSqlDbType5 As SqlDbType, ByVal iParametro5 As String,
                          ByVal iNomeDoParametroNoBanco6 As String, iSqlDbType6 As SqlDbType, ByVal iParametro6 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Parameters.Add(iNomeDoParametroNoBanco5, iSqlDbType5).Value = iParametro5
                cmd.Parameters.Add(iNomeDoParametroNoBanco6, iSqlDbType6).Value = iParametro6
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub


    ''' <summary>
    ''' Executa consulta INSERT com 7 CAMPOS.
    ''' </summary>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String,
                          ByVal iNomeDoParametroNoBanco5 As String, iSqlDbType5 As SqlDbType, ByVal iParametro5 As String,
                          ByVal iNomeDoParametroNoBanco6 As String, iSqlDbType6 As SqlDbType, ByVal iParametro6 As String,
                          ByVal iNomeDoParametroNoBanco7 As String, iSqlDbType7 As SqlDbType, ByVal iParametro7 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Parameters.Add(iNomeDoParametroNoBanco5, iSqlDbType5).Value = iParametro5
                cmd.Parameters.Add(iNomeDoParametroNoBanco6, iSqlDbType6).Value = iParametro6
                cmd.Parameters.Add(iNomeDoParametroNoBanco7, iSqlDbType7).Value = iParametro7
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub


    ''' <summary>
    ''' Executa consulta INSERT com 8 CAMPOS.
    ''' </summary>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String,
                          ByVal iNomeDoParametroNoBanco5 As String, iSqlDbType5 As SqlDbType, ByVal iParametro5 As String,
                          ByVal iNomeDoParametroNoBanco6 As String, iSqlDbType6 As SqlDbType, ByVal iParametro6 As String,
                          ByVal iNomeDoParametroNoBanco7 As String, iSqlDbType7 As SqlDbType, ByVal iParametro7 As String,
                          ByVal iNomeDoParametroNoBanco8 As String, iSqlDbType8 As SqlDbType, ByVal iParametro8 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Parameters.Add(iNomeDoParametroNoBanco5, iSqlDbType5).Value = iParametro5
                cmd.Parameters.Add(iNomeDoParametroNoBanco6, iSqlDbType6).Value = iParametro6
                cmd.Parameters.Add(iNomeDoParametroNoBanco7, iSqlDbType7).Value = iParametro7
                cmd.Parameters.Add(iNomeDoParametroNoBanco8, iSqlDbType8).Value = iParametro8
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub


    ''' <summary>
    ''' Executa consulta INSERT com 9 CAMPOS.
    ''' </summary>
    Public Overridable Sub InsertDB(ByVal iConexaoDoBanco As SqlConnection, ByVal iNomeStoredProcedure As String,
                          ByVal iNomeDoParametroNoBanco1 As String, iSqlDbType1 As SqlDbType, ByVal iParametro1 As String,
                          ByVal iNomeDoParametroNoBanco2 As String, iSqlDbType2 As SqlDbType, ByVal iParametro2 As String,
                          ByVal iNomeDoParametroNoBanco3 As String, iSqlDbType3 As SqlDbType, ByVal iParametro3 As String,
                          ByVal iNomeDoParametroNoBanco4 As String, iSqlDbType4 As SqlDbType, ByVal iParametro4 As String,
                          ByVal iNomeDoParametroNoBanco5 As String, iSqlDbType5 As SqlDbType, ByVal iParametro5 As String,
                          ByVal iNomeDoParametroNoBanco6 As String, iSqlDbType6 As SqlDbType, ByVal iParametro6 As String,
                          ByVal iNomeDoParametroNoBanco7 As String, iSqlDbType7 As SqlDbType, ByVal iParametro7 As String,
                          ByVal iNomeDoParametroNoBanco8 As String, iSqlDbType8 As SqlDbType, ByVal iParametro8 As String,
                          ByVal iNomeDoParametroNoBanco9 As String, iSqlDbType9 As SqlDbType, ByVal iParametro9 As String
                         )

        Try
            Dim con As New SqlConnection
            con = iConexaoDoBanco

            Using cmd As SqlClient.SqlCommand = New SqlClient.SqlCommand(iNomeStoredProcedure, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(iNomeDoParametroNoBanco1, iSqlDbType1).Value = iParametro1
                cmd.Parameters.Add(iNomeDoParametroNoBanco2, iSqlDbType2).Value = iParametro2
                cmd.Parameters.Add(iNomeDoParametroNoBanco3, iSqlDbType3).Value = iParametro3
                cmd.Parameters.Add(iNomeDoParametroNoBanco4, iSqlDbType4).Value = iParametro4
                cmd.Parameters.Add(iNomeDoParametroNoBanco5, iSqlDbType5).Value = iParametro5
                cmd.Parameters.Add(iNomeDoParametroNoBanco6, iSqlDbType6).Value = iParametro6
                cmd.Parameters.Add(iNomeDoParametroNoBanco7, iSqlDbType7).Value = iParametro7
                cmd.Parameters.Add(iNomeDoParametroNoBanco8, iSqlDbType8).Value = iParametro8
                cmd.Parameters.Add(iNomeDoParametroNoBanco9, iSqlDbType9).Value = iParametro9
                cmd.Connection.Open()
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()
            End Using

        Catch ex As SqlClient.SqlException

        End Try

    End Sub

#End Region

End Class
