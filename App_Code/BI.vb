Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class BI

    Private vVlrOri As String
    Private vPercOri As String
    Private vVlrRev As String
    Private vPercRev As String
    Private vVlrRea As String
    Private vPercRea As String
    Private vPercCresc As String
    Private vVlrReaAA As String
    Private vPercReaAA As String
    Private vDifVlrRev As String
    Private vDifPercRev As String
    Private vDesc As String
    Private vVlrReaMA As String
    Private vPercReaMA As String

    Private connBI As String = clDataDb_gerBI.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerBI;User ID=sa;Password=rd700@1"

    Public Property vlrOri() As String
        Get
            vlrOri = vVlrOri
        End Get
        Set(ByVal value As String)
            vVlrOri = value
        End Set
    End Property

    Public Property percOri() As String
        Get
            percOri = vPercOri
        End Get
        Set(ByVal value As String)
            vPercOri = value
        End Set
    End Property

    Public Property vlrRev() As String
        Get
            vlrRev = vVlrRev
        End Get
        Set(ByVal value As String)
            vVlrRev = value
        End Set
    End Property

    Public Property percRev() As String
        Get
            percRev = vPercRev
        End Get
        Set(ByVal value As String)
            vPercRev = value
        End Set
    End Property

    Public Property percCresc() As String
        Get
            percCresc = vPercCresc
        End Get
        Set(ByVal value As String)
            vPercCresc = value
        End Set
    End Property

    Public Property vlrRea() As String
        Get
            vlrRea = vVlrRea
        End Get
        Set(ByVal value As String)
            vVlrRea = value
        End Set
    End Property

    Public Property percRea() As String
        Get
            percRea = vPercRea
        End Get
        Set(ByVal value As String)
            vPercRea = value
        End Set
    End Property

    Public Property vlrReaAA() As String
        Get
            vlrReaAA = vVlrReaAA
        End Get
        Set(ByVal value As String)
            vVlrReaAA = value
        End Set
    End Property

    Public Property percReaAA() As String
        Get
            percReaAA = vPercReaAA
        End Get
        Set(ByVal value As String)
            vPercReaAA = value
        End Set
    End Property

    Public Property vlrReaMA() As String
        Get
            vlrReaMA = vVlrReaMA
        End Get
        Set(ByVal value As String)
            vVlrReaMA = value
        End Set
    End Property

    Public Property percReaMA() As String
        Get
            percReaMA = vPercReaMA
        End Get
        Set(ByVal value As String)
            vPercReaMA = value
        End Set
    End Property

    Public Property vlrDifRev() As String
        Get
            vlrDifRev = vDifVlrRev
        End Get
        Set(ByVal value As String)
            vDifVlrRev = value
        End Set
    End Property

    Public Property percDifRev() As String
        Get
            percDifRev = vDifPercRev
        End Get
        Set(ByVal value As String)
            vDifPercRev = value
        End Set
    End Property

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Function BI_Buscar_MetaRealizado_Corp(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("usp_Buscar_MetaRealizado_Corp", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0
        vlrRev = 0
        percRev = 0
        vlrRea = 0
        percRea = 0


        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")
                vlrRev = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                percRev = CSng(reader5.GetSqlMoney(3)).ToString("n2")
                vlrRea = CDbl(reader5.GetSqlMoney(4)).ToString("n0")
                percRea = CSng(reader5.GetSqlMoney(5)).ToString("n2")


            End While

        Catch ex As Exception
            varDesc = "Classe BuscaGrupoAno_Ori " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaGrupoAno_Ori(ByVal iCod As String, ByVal iFilial As String, ByVal iAno As String, ByVal iPosicao As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("uspBuscaOri_GruposAno", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Classe BuscaGrupoAno_Ori " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaGrupoMes_Ori(ByVal iCod As String, ByVal iFilial As String, ByVal iAno As String, ByVal iMes As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("uspBuscaOri_GrupoMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iCod

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Classe BuscaGrupoAno_Ori " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function Salvar_Ori_Subgrupo_Mes(ByVal iCod As String, ByVal iAno As String, _
                     ByVal iMes As String, ByVal iFilial As String, ByVal iVlr As Double, _
                     ByVal iPerc As Double, ByVal iUser As String, ByVal idGrupo As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspInsertOriSubgrupoMes", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)
                cmdTest.Parameters.AddWithValue("@idCodGrupo", idGrupo)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = ex.Message

                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Function Salvar_Ori_Subgrupo_Ano(ByVal iCod As String, ByVal iAno As String, _
                   ByVal iFilial As String, ByVal iVlr As Double, _
                   ByVal iPerc As Double, ByVal iUser As String, ByVal idGrupo As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspInsertOriSubgrupoAno", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)
                cmdTest.Parameters.AddWithValue("@idCodGrupo", idGrupo)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = ex.Message

                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Sub Salvar_Ori_Grupo_Mes_BaseSubgrupo(ByVal iCod As String, ByVal iAno As String, _
                    ByVal iFilial As String, _
                    ByVal iUser As String, ByVal iCatCod As String)

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("uspInsertOriGrupoMes_FromSubGrupo", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.VarChar))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        comando.Parameters("@userName").Value = iUser

        comando.Parameters.Add(New SqlParameter("@idCatCod", Data.SqlDbType.VarChar))
        comando.Parameters("@idCatCod").Value = iCatCod

        Try
            con.Open()
            comando.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
            varDesc = "Função: 'Salvar_Ori_Grupo_Mes_BaseSubgrupo' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()
        End Try


    End Sub

    Public Function BuscaSubgrupoMes_Ori(ByVal iCod As String, ByVal iFilial As String, ByVal iAno As String, ByVal iMes As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("uspBuscaOri_SubgrupoMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iCod

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "BuscaSubgrupoMes_Ori " & ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Public Function BI_Buscar_UltimaLinhaTeorico(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("usp_Buscar_UltimaLinhaTeorico", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0
        vlrRev = 0
        percRev = 0
        vlrRea = 0
        percRea = 0
        vlrReaAA = 0
        percReaAA = 0
        vlrDifRev = 0
        percDifRev = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")
                vlrRev = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                percRev = CSng(reader5.GetSqlMoney(3)).ToString("n2")
                vlrRea = CDbl(reader5.GetSqlMoney(4)).ToString("n0")
                percRea = CSng(reader5.GetSqlMoney(5)).ToString("n2")
                vlrReaAA = CDbl(reader5.GetSqlMoney(6)).ToString("n0")
                percReaAA = CSng(reader5.GetSqlMoney(7)).ToString("n2")
                vlrDifRev = CDbl(reader5.GetSqlMoney(8)).ToString("n0")
                percDifRev = CSng(reader5.GetSqlMoney(9)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Classe BuscaGrupoAno_Ori " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function BI_Buscar_Ori_Rev_Real_RealAA(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iGrupo As String) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("usp_Buscar_OriRevRealRealAA", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idGrupo", SqlDbType.TinyInt))
        comando.Parameters("@idGrupo").Value = iGrupo

        vlrOri = 0
        percOri = 0
        vlrRev = 0
        percRev = 0
        vlrRea = 0
        percRea = 0
        vlrReaAA = 0
        percReaAA = 0
        vlrDifRev = 0
        percDifRev = 0
        percCresc = 0
        vlrReaMA = 0
        percReaMA = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CSng(reader5.GetSqlMoney(1)).ToString("n2")
                vlrRev = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                percRev = CSng(reader5.GetSqlMoney(3)).ToString("n2")
                vlrRea = CDbl(reader5.GetSqlMoney(4)).ToString("n0")
                percRea = CSng(reader5.GetSqlMoney(5)).ToString("n2")
                vlrReaAA = CDbl(reader5.GetSqlMoney(6)).ToString("n0")
                percReaAA = CSng(reader5.GetSqlMoney(7)).ToString("n2")
                vlrDifRev = CDbl(reader5.GetSqlMoney(8)).ToString("n0")
                percDifRev = CSng(reader5.GetSqlMoney(9)).ToString("n2")
                percCresc = CDbl(reader5.GetSqlMoney(10)).ToString("n2")
                vlrReaMA = CDbl(reader5.GetSqlMoney(11)).ToString("n0")
                percReaMA = CSng(reader5.GetSqlMoney(12)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Classe BuscaGrupoAno_Ori " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

End Class
