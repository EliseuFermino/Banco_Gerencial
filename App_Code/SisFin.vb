Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class SisFin
    Private vDesc As String

    Private connBI As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerSisFin;User ID=sa;Password=rd700@1"
    Private connCad As String = clData_gerCadastro.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerCadastros;User ID=sa;Password=rd700@1"
    '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerSisFin;User ID=sa;Password=rd700@1"

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Function Salvar_Estabelecimento(ByVal iEstab_Desc As String, ByVal iEstab_NomeFantasia As String, _
                 ByVal iEstab_Endereco As String, ByVal iEstab_CEP As String, ByVal iEstab_Estado As String, _
                 ByVal iEstab_Cidade As String, ByVal iEstab_Ramo As String, ByVal iEstab_Ativa As Boolean) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspEstab_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Estab_Desc", iEstab_Desc)
                cmdTest.Parameters.AddWithValue("@Estab_NomeFantasia", iEstab_NomeFantasia)
                cmdTest.Parameters.AddWithValue("@Estab_Endereco", iEstab_Endereco)
                cmdTest.Parameters.AddWithValue("@Estab_CEP", iEstab_CEP)
                cmdTest.Parameters.AddWithValue("@Estab_Estado", iEstab_Estado)
                cmdTest.Parameters.AddWithValue("@Estab_Cidade", iEstab_Cidade)
                cmdTest.Parameters.AddWithValue("@Estab_Ramo", iEstab_Ramo)
                cmdTest.Parameters.AddWithValue("@Estab_Ativa", iEstab_Ativa)

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

    Public Function Salvar_SaldoInicial(ByVal iEstab_ID As String, ByVal iSaldo_Dia As Date, _
              ByVal iSaldo_Inicial As Double) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspSaldo_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Estab_ID", iEstab_ID)
                cmdTest.Parameters.AddWithValue("@Saldo_Dia", iSaldo_Dia)
                cmdTest.Parameters.AddWithValue("@Saldo_Inicial", iSaldo_Inicial)

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

    Public Function Salvar_CategoriaCadastro(ByVal iCat_Descricao As String, ByVal iTipo_ID As Byte) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspCategoria_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Cat_Descricao", iCat_Descricao)
                cmdTest.Parameters.AddWithValue("@Tipo_ID", iTipo_ID)

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

    Public Function Salvar_SubCategoriaCadastro(ByVal iSubCat_Descricao As String, ByVal iCat_ID As Integer) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspSubCategoria_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@SubCat_Descricao", iSubCat_Descricao)
                cmdTest.Parameters.AddWithValue("@Cat_ID", iCat_ID)

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

    Public Function Salvar_Fornecedor(ByVal iForn_Desc As String, ByVal iForn_NomeFantasia As String, _
              ByVal iForn_Endereco As String, ByVal iForn_CEP As String, ByVal iForn_Estado As String, _
              ByVal iForn_Cidade As String, ByVal iForn_Ativa As Boolean, ByVal iForn_CNPJ As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspForn_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Forn_Desc", iForn_Desc)
                cmdTest.Parameters.AddWithValue("@Forn_NomeFantasia", iForn_NomeFantasia)
                cmdTest.Parameters.AddWithValue("@Forn_Endereco", iForn_Endereco)
                cmdTest.Parameters.AddWithValue("@Forn_CEP", iForn_CEP)
                cmdTest.Parameters.AddWithValue("@Forn_Estado", iForn_Estado)
                cmdTest.Parameters.AddWithValue("@Forn_Cidade", iForn_Cidade)
                cmdTest.Parameters.AddWithValue("@Forn_Ativa", iForn_Ativa)
                cmdTest.Parameters.AddWithValue("@Forn_CNPJ", iForn_CNPJ)

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

    Public Function Salvar_ContasMensais(ByVal iAno As String, ByVal iMes As String, ByVal iEmpresa_ID As String, _
           ByVal iForn_ID As String, ByVal iSubCategoria_ID As String, ByVal iUser As String, _
           ByVal iMes1_Vlr As String, ByVal iMes2_Vlr As String, ByVal iMes3_Vlr As String, ByVal iMes4_Vlr As String, _
           ByVal iMes5_Vlr As String, ByVal iMes6_Vlr As String, ByVal iMes7_Vlr As String, ByVal iMes8_Vlr As String, _
           ByVal iMes9_Vlr As String, ByVal iMes10_Vlr As String, ByVal iMes11_Vlr As String, ByVal iMes12_Vlr As String, ByVal iAno_Vlr As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspForn_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@EmpresaID", iEmpresa_ID)
                cmdTest.Parameters.AddWithValue("@FornID", iForn_ID)
                cmdTest.Parameters.AddWithValue("@SubCategoriaID", iSubCategoria_ID)
                cmdTest.Parameters.AddWithValue("@User", iUser)
                cmdTest.Parameters.AddWithValue("@vlrMes1", iMes1_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes2", iMes2_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes3", iMes3_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes4", iMes4_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes5", iMes5_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes6", iMes6_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes7", iMes7_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes8", iMes8_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes9", iMes9_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes10", iMes10_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes11", iMes11_Vlr)
                cmdTest.Parameters.AddWithValue("@vlrMes12", iMes12_Vlr)

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

    Public Function Salvar_Movimentacao(ByVal iAno As String, ByVal iMes As String, ByVal iEstab_ID As String, _
       ByVal iForn_ID As String, ByVal iSubCategoria_ID As String, ByVal iUsuario As String, _
       ByVal iVlr As Double, ByVal iPerc As String, ByVal iData_Realizacao As Date, ByVal iData_Vencimento As Date, _
       ByVal iCat_ID As String, ByVal iMemoInfo As String, ByVal iVlrReceita As String, ByVal iDataPagto As Date, _
       ByVal iPrioridade As String, ByVal iPago As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connBI)
            Using cmdTest As New SqlCommand("uspSalvar_Movimentacao", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@EstabID", iEstab_ID)
                cmdTest.Parameters.AddWithValue("@FornID", iForn_ID)
                cmdTest.Parameters.AddWithValue("@SubCategoriaID", iSubCategoria_ID)
                cmdTest.Parameters.AddWithValue("@User", iUsuario)
                cmdTest.Parameters.AddWithValue("@Vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@Perc", iPerc)
                cmdTest.Parameters.AddWithValue("@DataRealizacao", iData_Realizacao)
                cmdTest.Parameters.AddWithValue("@DataVencimento", iData_Vencimento)
                cmdTest.Parameters.AddWithValue("@CatID", iCat_ID)
                cmdTest.Parameters.AddWithValue("@MemoInfo", iMemoInfo)
                cmdTest.Parameters.AddWithValue("@VlrReceita", iVlrReceita)
                cmdTest.Parameters.AddWithValue("@DataPagto", iDataPagto)
                cmdTest.Parameters.AddWithValue("@Pago", iPago)

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
                varDesc = gravou
            End Using
        End Using
    End Function

    Public Function Salvar_AtividadeCadastro(ByVal iAtividade_Descricao As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connCad)
            Using cmdTest As New SqlCommand("uspAtividade_Cadastro", con)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Atividade_Descricao", iAtividade_Descricao)

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

End Class
