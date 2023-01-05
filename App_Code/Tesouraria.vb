Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Tesouraria

    Dim oVem As New VendaEmpresaMes

    Private vDesc As String
    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Private NomeCompleto_Value As String
    Public Property NomeCompleto As String
        Get
            NomeCompleto = NomeCompleto_Value
        End Get
        Set(value As String)
            NomeCompleto_Value = value
        End Set
    End Property

    Private Matricula_Value As String
    Public Property Matricula() As String
        Get
            Return Matricula_Value
        End Get
        Set(ByVal value As String)
            Matricula_Value = value
        End Set
    End Property

    Private DataNascimento_Value As String
    Public Property DataNascimento() As String
        Get
            Return DataNascimento_Value
        End Get
        Set(ByVal value As String)
            DataNascimento_Value = value
        End Set
    End Property

    Private LocalNascimento_Value As String
    Public Property LocalNascimento() As String
        Get
            Return LocalNascimento_Value
        End Get
        Set(ByVal value As String)
            LocalNascimento_Value = value
        End Set
    End Property

    Private UF_Nascimento_Value As Byte
    Public Property UF_Nascimento() As Byte
        Get
            Return UF_Nascimento_Value
        End Get
        Set(ByVal value As Byte)
            UF_Nascimento_Value = value
        End Set
    End Property

    Private EstadoCivil_Value As Byte
    Public Property EstadoCivil() As Byte
        Get
            Return EstadoCivil_Value
        End Get
        Set(ByVal value As Byte)
            EstadoCivil_Value = value
        End Set
    End Property

    Private NomeDoConjuge_Value As String
    Public Property NomeDoConjuge() As String
        Get
            Return NomeDoConjuge_Value
        End Get
        Set(ByVal value As String)
            NomeDoConjuge_Value = value
        End Set
    End Property

    Private NomeDoPai_Value As String
    Public Property NomeDoPai() As String
        Get
            Return NomeDoPai_Value
        End Get
        Set(ByVal value As String)
            NomeDoPai_Value = value
        End Set
    End Property

    Private NomeDaMae_Value As String
    Public Property NomeDaMae() As String
        Get
            Return NomeDaMae_Value
        End Get
        Set(ByVal value As String)
            NomeDaMae_Value = value
        End Set
    End Property

    Private Sexo_Value As Byte
    Public Property Sexo() As Byte
        Get
            Return Sexo_Value
        End Get
        Set(ByVal value As Byte)
            Sexo_Value = value
        End Set
    End Property

    Private NumeroDoRG_Value As String
    Public Property NumeroDoRG() As String
        Get
            Return NumeroDoRG_Value
        End Get
        Set(ByVal value As String)
            NumeroDoRG_Value = value
        End Set
    End Property

    Private OrgaoEmissor_Value As Byte
    Public Property OrgaoEmissor() As Byte
        Get
            Return OrgaoEmissor_Value
        End Get
        Set(ByVal value As Byte)
            OrgaoEmissor_Value = value
        End Set
    End Property

    Private UFRG_Value As Byte
    Public Property UFRG() As Byte
        Get
            Return UFRG_Value
        End Get
        Set(ByVal value As Byte)
            UFRG_Value = value
        End Set
    End Property

    Private DOC_Value As String
    Public Property DOC() As String
        Get
            Return DOC_Value
        End Get
        Set(ByVal value As String)
            DOC_Value = value
        End Set
    End Property

    Private Ocupacao_Value As Int16
    Public Property Ocupacao() As Int16
        Get
            Return Ocupacao_Value
        End Get
        Set(ByVal value As Int16)
            Ocupacao_Value = value
        End Set
    End Property

    Private DataAdmissao_Value As String
    Public Property DataAdmissao() As String
        Get
            Return DataAdmissao_Value
        End Get
        Set(ByVal value As String)
            DataAdmissao_Value = value
        End Set
    End Property

    Private Endereco_Value As String
    Public Property Endereco() As String
        Get
            Return Endereco_Value
        End Get
        Set(ByVal value As String)
            Endereco_Value = value
        End Set
    End Property

    Private Numero_Value As String
    Public Property Numero() As String
        Get
            Return Numero_Value
        End Get
        Set(ByVal value As String)
            Numero_Value = value
        End Set
    End Property

    Private Complemento_Value As String
    Public Property Complemento() As String
        Get
            Return Complemento_Value
        End Get
        Set(ByVal value As String)
            Complemento_Value = value
        End Set
    End Property

    Private Bairro_Value As String
    Public Property Bairro() As String
        Get
            Return Bairro_Value
        End Get
        Set(ByVal value As String)
            Bairro_Value = value
        End Set
    End Property

    Private Cidade_Value As String
    Public Property Cidade() As String
        Get
            Return Cidade_Value
        End Get
        Set(ByVal value As String)
            Cidade_Value = value
        End Set
    End Property

    Private UF_Value As Byte
    Public Property UF() As Byte
        Get
            Return UF_Value
        End Get
        Set(ByVal value As Byte)
            UF_Value = value
        End Set
    End Property

    Private CEP_Value As Integer
    Public Property CEP() As Integer
        Get
            Return CEP_Value
        End Get
        Set(ByVal value As Integer)
            CEP_Value = value
        End Set
    End Property

    Private DDD_Value As String
    Public Property DDD() As String
        Get
            Return DDD_Value
        End Get
        Set(ByVal value As String)
            DDD_Value = value
        End Set
    End Property

    Private Telefone_Value As String
    Public Property Telefone() As String
        Get
            Return Telefone_Value
        End Get
        Set(ByVal value As String)
            Telefone_Value = value
        End Set
    End Property

    Private Email_Value As String
    Public Property Email() As String
        Get
            Return Email_Value
        End Get
        Set(ByVal value As String)
            Email_Value = value
        End Set
    End Property

    Private GrauDeInstrucao_Value As Byte
    Public Property GrauDeInstrucao() As Byte
        Get
            Return GrauDeInstrucao_Value
        End Get
        Set(ByVal value As Byte)
            GrauDeInstrucao_Value = value
        End Set
    End Property

    Private Renda_Value As Integer
    Public Property Renda() As Integer
        Get
            Return Renda_Value
        End Get
        Set(ByVal value As Integer)
            Renda_Value = value
        End Set
    End Property























    Public Sub BuscaCadastro(ByVal iCPF As Int64)

        Dim con As New SqlConnection(Conexao.gerTesouraria)
        Dim comando As New SqlCommand("usp_BuscarCadastroPeloCPF", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@CPF", SqlDbType.BigInt))
        comando.Parameters("@CPF").Value = iCPF

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                NomeCompleto = reader5.GetSqlString(0)

                Matricula = FixNull(reader5.GetSqlString(1))


                DataNascimento = reader5.GetSqlString(2)
                LocalNascimento = reader5.GetSqlString(3)
                UF_Nascimento = reader5.GetSqlByte(4)
                EstadoCivil = reader5.GetSqlByte(5)
                NomeDoConjuge = reader5.GetSqlString(6)
                NomeDoPai = reader5.GetSqlString(7)
                NomeDaMae = reader5.GetSqlString(8)
                Sexo = reader5.GetSqlByte(9)
                NumeroDoRG = FixNull(reader5.GetSqlString(10))
                OrgaoEmissor = reader5.GetSqlByte(11)
                UFRG = reader5.GetSqlByte(12)
                DOC = reader5.GetSqlString(13)
                Ocupacao = reader5.GetSqlInt16(14)
                DataAdmissao = reader5.GetSqlString(15)
                Endereco = reader5.GetSqlString(16)


                Numero = FixNull(reader5.GetSqlString(17))

                Complemento = FixNull(reader5.GetSqlString(18))


                Bairro = reader5.GetSqlString(19)
                Cidade = reader5.GetSqlString(20)
                UF = reader5.GetSqlByte(21)
                CEP = reader5.GetSqlInt32(22)
                DDD = FixNull(reader5.GetSqlString(23))
                Telefone = reader5.GetSqlString(24)
                Email = reader5.GetSqlString(25)
                GrauDeInstrucao = reader5.GetSqlByte(26)
                Renda = reader5.GetSqlInt32(27)

            End While

        Catch ex As Exception
            Beep()
            varDesc = "Classe: Tesouraria, Procedure: BuscaCadastro, Erro: " & ex.Message & "."
        Finally
            con.Close()
        End Try
    End Sub

    

    Public Function FixNull(ByVal dbvalue As Object) As String
        If dbvalue Is DBNull.Value Then
            Return ""
        Else
            Return dbvalue.ToString
        End If
    End Function

   
End Class
