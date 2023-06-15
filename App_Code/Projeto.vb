Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO

Public Class Projeto
    Private conn18 As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerCont;Persist Security Info=True;User ID=sa;Password=rd700@1"


    Private vEtapaNumero As String
    Private vEtapaDescricao As String
    Private vEtapaDataInicial As Date
    Private vEtapaDataFinal As Date
    Private vEtapaSituacao As String
    Private vEtapaJustificativa As String

    Private vErroNumero As String
    Private vErroDescricao As String

    Private vPathArquivo As String
    Private vSomenteLeitura As Byte
    Private vPessoaAdmin As String
    Private vDepto As String
    Private vFilial As Int16
    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vCodigoSuperHiper As Boolean
    Private vResetarSenha As Boolean
    Private vAtivo As Boolean

    Public Departamento As String

    Dim oVen As New VendaEmpresaMes



    Public Property ErroNumero() As String
        Get
            ErroNumero = vErroNumero
        End Get
        Set(ByVal value As String)
            vErroNumero = value
        End Set
    End Property

    Public Property ErroDescricao() As String
        Get
            ErroDescricao = vErroDescricao
        End Get
        Set(ByVal value As String)
            vErroDescricao = value
        End Set
    End Property

    Public Property EtapaJustificativa() As String
        Get
            EtapaJustificativa = vEtapaJustificativa
        End Get
        Set(ByVal value As String)
            vEtapaJustificativa = value
        End Set
    End Property

    Public Property EtapaSituacao() As String
        Get
            EtapaSituacao = vEtapaSituacao
        End Get
        Set(ByVal value As String)
            vEtapaSituacao = value
        End Set
    End Property

    Public Property EtapaDataFinal() As Date
        Get
            EtapaDataFinal = vEtapaDataFinal
        End Get
        Set(ByVal value As Date)
            vEtapaDataFinal = value
        End Set
    End Property

    Public Property EtapaDataInicial() As Date
        Get
            EtapaDataInicial = vEtapaDataInicial
        End Get
        Set(ByVal value As Date)
            vEtapaDataInicial = value
        End Set
    End Property

    Public Property EtapaNumero() As String
        Get
            EtapaNumero = vEtapaNumero
        End Get
        Set(ByVal value As String)
            vEtapaNumero = value
        End Set
    End Property

    Public Property EtapaDescricao() As String
        Get
            EtapaDescricao = vEtapaDescricao
        End Get
        Set(ByVal value As String)
            vEtapaDescricao = value
        End Set
    End Property

    Public Property PathArquivo() As String
        Get
            PathArquivo = vPathArquivo
        End Get
        Set(ByVal value As String)
            vPathArquivo = value
        End Set
    End Property

    Public Property Filial() As Int16
        Get
            Filial = vFilial
        End Get
        Set(ByVal value As Int16)
            vFilial = value
        End Set
    End Property

    Public Property Isloja() As Boolean
        Get
            Isloja = vIsLoja
        End Get
        Set(ByVal value As Boolean)
            vIsLoja = value
        End Set
    End Property

    Public Property IsRegional() As Boolean
        Get
            IsRegional = vIsRegional
        End Get
        Set(ByVal value As Boolean)
            vIsRegional = value
        End Set
    End Property

    Public Property CodigoSuperHiper() As Boolean
        Get
            CodigoSuperHiper = vCodigoSuperHiper
        End Get
        Set(ByVal value As Boolean)
            vCodigoSuperHiper = value
        End Set
    End Property

    Public Property ResetarSenha() As Boolean
        Get
            ResetarSenha = vResetarSenha
        End Get
        Set(ByVal value As Boolean)
            vResetarSenha = value
        End Set
    End Property

    Public Property Ativo() As Boolean
        Get
            Ativo = vAtivo
        End Get
        Set(ByVal value As Boolean)
            vAtivo = value
        End Set
    End Property

    Public Property SomenteLeitura() As Byte
        Get
            SomenteLeitura = vSomenteLeitura
        End Get
        Set(ByVal value As Byte)
            vSomenteLeitura = value
        End Set
    End Property

    Public Property PessoaAdmin() As String
        Get
            PessoaAdmin = vPessoaAdmin
        End Get
        Set(ByVal value As String)
            vPessoaAdmin = value
        End Set
    End Property

    Public Property Depto() As String
        Get
            Depto = vDepto
        End Get
        Set(ByVal value As String)
            vDepto = value
        End Set
    End Property

    Sub BuscarPlanoAcao(ByVal iPlanoAcaoID As Int16)

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT etapaDesc, ISNULL(dataInicia,''), ISNULL(dataFinal,''), ISNULL(etapaSituacao,''), ISNULL(etapaJustificativa,''), ISNULL(etapaNum,'') FROM projEtapas WHERE etapaID = " & iPlanoAcaoID & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                EtapaDescricao = reader5.GetSqlString(0)
                EtapaDataInicial = reader5.GetSqlDateTime(1)
                EtapaDataFinal = reader5.GetSqlDateTime(2)
                EtapaSituacao = reader5.GetSqlString(3)
                EtapaJustificativa = reader5.GetSqlString(4)
                EtapaNumero = reader5.GetSqlInt16(5).ToString
            End While
            con.Close()

        Catch ex As Exception
            vErroNumero = Err.Number
            vErroDescricao = Err.Description
        Finally
            con.Close()
        End Try

    End Sub

    Function CoordenadorProjeto(ByVal iNomeUsuario As String) As Byte
        '1 = Tem acesso a todos projetos
        '2 = Tem acesso a somente ao projeto o qual é responsável
        '3 = Tem acesso somente leitura
        '----------------------------------------------------------------------------------------
        Select Case LCase(Trim(iNomeUsuario))
            Case "eliseu", "eder", "áurea", "auditoria", "felipe", "joel", "sandra girardi"
                CoordenadorProjeto = 1
            Case "vladimir"
                CoordenadorProjeto = 3
            Case Else
                CoordenadorProjeto = 2
        End Select
    End Function

    Function NumeroDoProjeto(ByVal iNomeUsuario As String) As Byte
        Select Case LCase(Trim(iNomeUsuario))
            Case "eliseu", "eder", "áurea", "auditoria", "felipe", "joel", "vladimir", "sandra girardi"
                NumeroDoProjeto = 1     'Logistica
            Case "adailton", "financeiro", "eliane"
                NumeroDoProjeto = 3     'Gestão Economica/Financeira
            Case "joão"
                NumeroDoProjeto = 2     'Gestão de Estoque
            Case "luis"
                NumeroDoProjeto = 1     'Logistica
            Case "aliceu", "diretor"
                NumeroDoProjeto = 9     'Ampliação e Adequação de Lojas
            Case "renato"
                NumeroDoProjeto = 4     'RH
            Case "bernardo"
                NumeroDoProjeto = 5     'Gerenciamento de Mix e Categoria
            Case "edison"
                NumeroDoProjeto = 6     'Manutenção e Limpeza
            Case "elaine"
                NumeroDoProjeto = 7     'CRM
            Case "rh"
                NumeroDoProjeto = 4     'RH
            Case "renato munhoz"
                NumeroDoProjeto = 12
        End Select
    End Function

    Function CaminhoArquivo(ByVal iNumeroDoProjeto As Integer, ByVal iNomeDoArquivo As String) As String
        Dim varPath, varPathLink As String
        varPath = "C:\\gerencial\\Arquivos\\"
        varPathLink = "~/Arquivos"
        Select Case iNumeroDoProjeto
            Case 1      'Projeto: Logistica
                CaminhoArquivo = varPath & "Logistica\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Logistica/"
                Return CaminhoArquivo
            Case 2      'Projeto: Gestão de Estoque
                CaminhoArquivo = varPath & "Gestão de Estoques\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Gestão de Estoques/"
                Return CaminhoArquivo
            Case 3      'Projeto: Gestão Economica / Financeira
                CaminhoArquivo = varPath & "Gestão Economica Financeira\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Gestão Economica Financeira/"
                Return CaminhoArquivo
            Case 4      'Projeto: Pessoal
                CaminhoArquivo = varPath & "Pessoas\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Pessoas/"
                Return CaminhoArquivo
            Case 5      'Projeto: Gerenciamento de Mix e Categoria
                CaminhoArquivo = varPath & "Gerenciamento de Mix e Categoria\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Gerenciamento de Mix e Categoria/"
                Return CaminhoArquivo
            Case 6      'Projeto: Manutenção e Limpeza
                CaminhoArquivo = varPath & "Manutenção e Limpeza\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Manutenção e Limpeza/"
                Return CaminhoArquivo
            Case 7      'Projeto: CRM
                CaminhoArquivo = varPath & "CRM\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/CRM/"
                Return CaminhoArquivo
            Case 8      'Projeto: 
            Case 9      'Projeto: Ampliação e adquação de lojas
                CaminhoArquivo = varPath & "Ampliação e Adequação de Lojas\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Ampliação e Adequação de Lojas/"
                Return CaminhoArquivo
            Case 10     'Projeto: Redesenhar processos
                CaminhoArquivo = varPath & "Redesenho de Processos\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Redesenho de Processos/"
                Return CaminhoArquivo
            Case 11     'Projeto: Modelo de Gestão de Estoques

            Case 12 'Grupo Técnico
                CaminhoArquivo = varPath & "Grupo Tecnico\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/Grupo Tecnico/"
                Return CaminhoArquivo

            Case 999     'Projeto: Redesenhar processos
                CaminhoArquivo = varPath & "_Todos os Projetos\\" & iNomeDoArquivo
                PathArquivo = varPathLink & "/_Todos os Projetos/"
                Return CaminhoArquivo
        End Select
    End Function

    ''' <summary>
    ''' Retorna o Departamento do Usuario
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function BuscarDepartamentoDoUsuario(ByVal iUserName As String) As String

        Dim con As New SqlConnection(conn18)

        Dim comando As New SqlCommand("uspUser_BuscarDepto", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = iUserName

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                BuscarDepartamentoDoUsuario = RTrim(reader5.GetSqlString(0).ToString)
                SomenteLeitura = reader5.GetSqlByte(1).ToString
                PessoaAdmin = reader5.GetSqlString(2).ToString
                Departamento = reader5.GetSqlString(0).ToString
                ResetarSenha = reader5.GetSqlBoolean(3)
                Ativo = reader5.GetSqlBoolean(4)
            End While

        Catch ex As Exception
            ErroDescricao = ex.Message
            BuscarDepartamentoDoUsuario = ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Function BuscarLocalDoUsuario(ByVal iUserName As String) As String

        Dim con As New SqlConnection(conn18)

        Dim comando As New SqlCommand("uspUser_BuscarLocal", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = iUserName

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                BuscarLocalDoUsuario = reader5.GetSqlString(0).ToString
                SomenteLeitura = reader5.GetSqlByte(1).ToString
                PessoaAdmin = reader5.GetSqlString(2).ToString
                Filial = reader5.GetSqlByte(3)
                Isloja = reader5.GetBoolean(4)
                IsRegional = reader5.GetBoolean(5)
                CodigoSuperHiper = reader5.GetBoolean(6)
            End While

        Catch ex As Exception
            ErroDescricao = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Function Buscar_Filial_Usuario(ByVal iUserName As String) As Int16
        Dim con As New SqlConnection(conn18)

        Dim comando As New SqlCommand("uspUser_BuscarLocal", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = iUserName

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Buscar_Filial_Usuario = reader5.GetSqlInt16(3)

                'SomenteLeitura = reader5.GetSqlByte(1).ToString
                'PessoaAdmin = reader5.GetSqlString(2).ToString
                'Filial = reader5.GetSqlInt16(4)
                'Isloja = reader5.GetBoolean(4)
                'IsRegional = reader5.GetBoolean(5)
                'CodigoSuperHiper = reader5.GetBoolean(6)

            End While

        Catch ex As Exception
            ErroDescricao = ex.Message
            'Buscar_Filial_Usuario = ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Function Buscar_Departamento_Usuario(ByVal iUserName As String) As String
        Dim con As New SqlConnection(conn18)

        Dim comando As New SqlCommand("uspUser_BuscarDepto", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = iUserName

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Buscar_Departamento_Usuario = reader5.GetSqlString(0).ToString

                'SomenteLeitura = reader5.GetSqlByte(1).ToString
                'PessoaAdmin = reader5.GetSqlString(2).ToString
                'Filial = reader5.GetSqlInt16(4)
                'Isloja = reader5.GetBoolean(4)
                'IsRegional = reader5.GetBoolean(5)
                'CodigoSuperHiper = reader5.GetBoolean(6)

            End While

        Catch ex As Exception
            ErroDescricao = ex.Message
            Buscar_Departamento_Usuario = ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Function BuscarInformacoesUsuario(ByVal iUserName As String) As Byte

        Dim con As New SqlConnection(conn18)

        Dim comando As New SqlCommand("uspUser_BuscarDepto", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = iUserName

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Depto = reader5.GetSqlString(0)
                SomenteLeitura = reader5.GetSqlByte(1).ToString
                PessoaAdmin = reader5.GetSqlString(2)
            End While

        Catch ex As Exception
            ErroDescricao = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Function NameUserReturn() As String
        Dim mySys As New System.Web.UI.Page
        NameUserReturn = mySys.User.Identity.Name
    End Function


End Class
