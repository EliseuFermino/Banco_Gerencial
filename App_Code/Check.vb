Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Check
    Private vDesc As String
    Private vPontos As String
    Private vDescricao As String
    Private vPontuacao As Double

    Private connCheckList As String = Conexao.gerCheckList

    Public Property Dia1 As String
    Public Property Dia2 As String
    Public Property Dia3 As String
    Public Property Dia4 As String
    Public Property Dia5 As String
    Public Property Dia6 As String
    Public Property Dia7 As String
    Public Property Dia8 As String
    Public Property Dia9 As String

    Public Property Dia10 As String
    Public Property Dia11 As String
    Public Property Dia12 As String
    Public Property Dia13 As String
    Public Property Dia14 As String
    Public Property Dia15 As String
    Public Property Dia16 As String
    Public Property Dia17 As String
    Public Property Dia18 As String
    Public Property Dia19 As String

    Public Property Dia20 As String
    Public Property Dia21 As String
    Public Property Dia22 As String
    Public Property Dia23 As String
    Public Property Dia24 As String
    Public Property Dia25 As String
    Public Property Dia26 As String
    Public Property Dia27 As String
    Public Property Dia28 As String
    Public Property Dia29 As String

    Public Property Dia30 As String
    Public Property Dia31 As String

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Property Pontos() As String
        Get
            Pontos = vPontos
        End Get
        Set(ByVal value As String)
            vPontos = value
        End Set
    End Property

    Public Property Descricao() As String
        Get
            Descricao = vDescricao
        End Get
        Set(ByVal value As String)
            vDescricao = value
        End Set
    End Property

    Public Property Pontuacao() As Double
        Get
            Pontuacao = vPontuacao
        End Get
        Set(ByVal value As Double)
            vPontuacao = value
        End Set
    End Property

    Public Function SalvarChecklist(ByVal iDia As Date, ByVal iFilial As Int16, ByVal iGrupo As Int16, _
                        ByVal iSubgrupo As Int16, ByVal iCod As Int16, ByVal iPontos As Int16, _
                        ByVal iMatricula As String, ByVal iDescricao As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.usp_SalvarChecklist", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idGrupo", iGrupo)
                cmdTest.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                If iPontos = 0 Then
                    cmdTest.Parameters.AddWithValue("@notas", 0)
                Else
                    cmdTest.Parameters.AddWithValue("@notas", 2)
                End If
                cmdTest.Parameters.AddWithValue("@pontos", iPontos)
                cmdTest.Parameters.AddWithValue("@matricula", iMatricula)
                cmdTest.Parameters.AddWithValue("@descricao", iDescricao)


                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Function SalvarChecklist_Confeitaria(ByVal iDia As Date, ByVal iFilial As Int16, ByVal iGrupo As Int16, _
                        ByVal iSubgrupo As Int16, ByVal iCod As Int16, ByVal iPontos As Int16, _
                        ByVal iMatricula As String, ByVal iDescricao As String, ByVal iProduto As Integer) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.usp_SalvarChecklist_Confeitaria", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idGrupo", iGrupo)
                cmdTest.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                If iPontos = 0 Then
                    cmdTest.Parameters.AddWithValue("@notas", 0)
                Else
                    cmdTest.Parameters.AddWithValue("@notas", 2)
                End If
                cmdTest.Parameters.AddWithValue("@pontos", iPontos)
                cmdTest.Parameters.AddWithValue("@matricula", iMatricula)
                cmdTest.Parameters.AddWithValue("@descricao", iDescricao)
                cmdTest.Parameters.AddWithValue("@idProduto", iProduto)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Function SalvarChecklist_Confeitaria_Unico(ByVal iDia As Date, ByVal iFilial As Int16, ByVal iProduto As Integer) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.usp_SalvarChecklist_Confeitaria_Unico", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idProduto", iProduto)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Sub BuscarCheckList(ByVal iDia As Date, ByVal iFilial As Byte, ByVal iGrupo As Byte, _
                         ByVal iSubgrupo As Byte, ByVal iCod As Byte)

        Dim con As New SqlConnection(connCheckList)
        Dim comando As New SqlCommand("dbo.usp_BuscarChecklist", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@dia", SqlDbType.Date))
        comando.Parameters("@dia").Value = iDia

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idGrupo", SqlDbType.TinyInt))
        comando.Parameters("@idGrupo").Value = iGrupo

        comando.Parameters.Add(New SqlParameter("@idSubgrupo", SqlDbType.TinyInt))
        comando.Parameters("@idSubgrupo").Value = iSubgrupo

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iCod

        Pontos = 2
        Descricao = ""

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Pontos = reader5.GetSqlByte(0)
                Descricao = reader5.GetSqlString(1)

            End While

        Catch ex As Exception
            varDesc = "Classe BuscarCheckList " & ex.Message

        Finally
            con.Close()
        End Try

    End Sub

    Public Sub BuscarPontuacaoSemanaTotal(ByVal iAno As Int16, ByVal iMes As Byte, _
                            ByVal iFilial As Byte, ByVal iDescSemana As String)

        Dim con As New SqlConnection(connCheckList)
        Dim comando As New SqlCommand("Checklist.usp_BuscarResultadoPorSemanaTotal", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@ano", SqlDbType.SmallInt))
        comando.Parameters("@ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@mes", SqlDbType.TinyInt))
        comando.Parameters("@mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@descSemana", SqlDbType.VarChar))
        comando.Parameters("@descSemana").Value = iDescSemana

        Pontuacao = 0
        Descricao = ""

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Pontuacao = reader5.GetSqlDouble(0)
                Descricao = reader5.GetSqlString(1)
            End While

        Catch ex As Exception
            varDesc = "Classe BuscarPontuacaoSemanaTotal " & ex.Message

        Finally
            con.Close()
        End Try

    End Sub

    Public Function SalvarChecklistGrupo(ByVal iDia As Date, ByVal iFilial As Int16, ByVal iGrupo As Int16, _
                       ByVal iSubgrupo As Int16) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.usp_SalvarChecklistGrupo", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idGrupo", iGrupo)
                cmdTest.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Function SalvarChecklistGrupo_Confeitaria(ByVal iDia As Date, ByVal iFilial As Int16, ByVal iGrupo As Int16, _
                       ByVal iSubgrupo As Int16) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.usp_SalvarChecklistGrupo_Confeitaria", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idGrupo", iGrupo)
                cmdTest.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function


    Public Sub BuscarCheckListGrupo(ByVal iDia As Date, ByVal iFilial As Byte, ByVal iGrupo As Byte, _
                     ByVal iSubgrupo As Byte)

        Dim con As New SqlConnection(connCheckList)
        Dim comando As New SqlCommand("dbo.usp_BuscarChecklistGrupo", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@dia", SqlDbType.Date))
        comando.Parameters("@dia").Value = iDia

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idGrupo", SqlDbType.TinyInt))
        comando.Parameters("@idGrupo").Value = iGrupo

        comando.Parameters.Add(New SqlParameter("@idSubgrupo", SqlDbType.TinyInt))
        comando.Parameters("@idSubgrupo").Value = iSubgrupo

        Pontos = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Pontos = reader5.GetSqlByte(0)

            End While

        Catch ex As Exception
            varDesc = "Classe BuscarCheckListGrupo " & ex.Message

        Finally
            con.Close()
        End Try

    End Sub

    Public Function GerarRelatorio(ByVal iDia As Date, ByVal iFilial As Int16) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCheckList)
            Using cmdTest As New SqlCommand("dbo.uspAtualizarRelatorio", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", iDia)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = Err.Description
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Sub BuscarPontuacaoDiariaPorLoja(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16)

        Dim con As New SqlConnection(connCheckList)
        Dim comando As New SqlCommand("Pontuacao.usp_BuscarTotalDia", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        Dia1 = 0
        Dia2 = 0
        Dia3 = 0
        Dia4 = 0
        Dia5 = 0
        Dia6 = 0
        Dia7 = 0
        Dia8 = 0
        Dia9 = 0

        Dia10 = 0
        Dia11 = 0
        Dia12 = 0
        Dia13 = 0
        Dia14 = 0
        Dia15 = 0
        Dia16 = 0
        Dia17 = 0
        Dia18 = 0
        Dia19 = 0

        Dia20 = 0
        Dia21 = 0
        Dia22 = 0
        Dia23 = 0
        Dia24 = 0
        Dia25 = 0
        Dia26 = 0
        Dia27 = 0
        Dia28 = 0
        Dia28 = 0

        Dia30 = 0
        Dia31 = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Dia1 = reader5.GetSqlMoney(0)
                Dia2 = reader5.GetSqlMoney(1)
                Dia3 = reader5.GetSqlMoney(2)
                Dia4 = reader5.GetSqlMoney(3)
                Dia5 = reader5.GetSqlMoney(4)
                Dia6 = reader5.GetSqlMoney(5)
                Dia7 = reader5.GetSqlMoney(6)
                Dia8 = reader5.GetSqlMoney(7)
                Dia9 = reader5.GetSqlMoney(8)

                Dia10 = reader5.GetSqlMoney(9)
                Dia11 = reader5.GetSqlMoney(10)
                Dia12 = reader5.GetSqlMoney(11)
                Dia13 = reader5.GetSqlMoney(12)
                Dia14 = reader5.GetSqlMoney(13)
                Dia15 = reader5.GetSqlMoney(14)
                Dia16 = reader5.GetSqlMoney(15)
                Dia17 = reader5.GetSqlMoney(16)
                Dia18 = reader5.GetSqlMoney(17)
                Dia19 = reader5.GetSqlMoney(18)

                Dia20 = reader5.GetSqlMoney(19)
                Dia21 = reader5.GetSqlMoney(20)
                Dia22 = reader5.GetSqlMoney(21)
                Dia23 = reader5.GetSqlMoney(22)
                Dia24 = reader5.GetSqlMoney(23)
                Dia25 = reader5.GetSqlMoney(24)
                Dia26 = reader5.GetSqlMoney(25)
                Dia27 = reader5.GetSqlMoney(26)
                Dia28 = reader5.GetSqlMoney(27)
                Dia29 = reader5.GetSqlMoney(28)

                Dia30 = reader5.GetSqlMoney(29)
                Dia31 = reader5.GetSqlMoney(30)

            End While

        Catch ex As Exception
            varDesc = "Classe BuscarCheckListGrupo " & ex.Message

        Finally
            con.Close()
        End Try

    End Sub



End Class
