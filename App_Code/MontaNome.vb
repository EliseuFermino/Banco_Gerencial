Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Imports DevExpress.Web
Imports System.Net


Public Class VendaEmpresaMes
    Private vVlrOri As String
    Private vPercOri As String
    Private vVlrRev As Double
    Private vPercRev As Double
    Private vVlrRea As String
    Private vPercRea As String
    Private vVendaRevista As String
    Private vVendaRealizada As String
    Private connString As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;Persist Security Info=True;User ID=sa;Password=rd700@1"
    'Private conn196 As String = "Data Source=NS3;Initial Catalog=gerContSQL1;User ID=eliseuf;Password=rd700sx"
    Private connManager As String = Conexao.gerManager
    Private connBI As String = clDataDb_gerBI.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerBI;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Private connCadastros As String = clData_gerCadastro.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerCadastros;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Private connContSQL1 As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerContSQL1;User ID=sa;Password=rd700@1"
    Private strSQL As String
    Private strCategoria As String
    Private vDesc As String
    Private vFilial As String
    Private vFilialDesc As String
    Private vVlrReaMargem As String
    Private vPercReaMargem As String

    Private vDia1 As String
    Private vDia2 As String
    Private vDia3 As String
    Private vDia4 As String
    Private vDia5 As String
    Private vDia6 As String
    Private vDia7 As String
    Private vDia8 As String
    Private vDia9 As String
    Private vNumDesc As String

    Private vLiberaReplanejamento As Boolean
    Private vLiberaParticipacao As Boolean
    Private vLiberaMargem As Boolean
    Private vLiberaAgenda23 As Boolean

    Enum TipoMenu
        Menu_Horizontal = 1
        Menu_Vertical = 2
    End Enum

#Region " Libera Replanejamento"

    Public Property LiberaReplanejamento() As Boolean
        Get
            LiberaReplanejamento = vLiberaReplanejamento
        End Get
        Set(ByVal value As Boolean)
            vLiberaReplanejamento = value
        End Set
    End Property

    Public Property LiberaParticipacao() As Boolean
        Get
            LiberaParticipacao = vLiberaParticipacao
        End Get
        Set(ByVal value As Boolean)
            vLiberaParticipacao = value
        End Set
    End Property

    Public Property LiberaMargem() As Boolean
        Get
            LiberaMargem = vLiberaMargem
        End Get
        Set(ByVal value As Boolean)
            vLiberaMargem = value
        End Set
    End Property

    Public Property LiberaAgenda23() As Boolean
        Get
            LiberaAgenda23 = vLiberaAgenda23
        End Get
        Set(ByVal value As Boolean)
            vLiberaAgenda23 = value
        End Set
    End Property

    Public Sub BuscaLiberaProgramaReplanejamento(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16)
        ' 0 = False   1= True
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Cadastros.uspBuscar_CadLiberaReplanejamento", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        LiberaReplanejamento = 0
        LiberaParticipacao = 0
        LiberaMargem = 0
        vLiberaAgenda23 = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                LiberaReplanejamento = reader5.GetSqlBoolean(0)
                LiberaParticipacao = reader5.GetSqlBoolean(1)
                LiberaMargem = reader5.GetSqlBoolean(2)
                vLiberaAgenda23 = reader5.GetSqlBoolean(3)

            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try

    End Sub

    Public Sub AtualizaLiberaProgramaReplanejamento(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16,
                                                    ByVal iTipo As Byte, ByVal iLiberado As Boolean)
        ' 0 = False   1= True
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Cadastros.uspAtualizar_CadLiberaReplanejamento", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@Tipo", SqlDbType.TinyInt))
        comando.Parameters("@Tipo").Value = iTipo

        comando.Parameters.Add(New SqlParameter("@Liberado", SqlDbType.Bit))
        comando.Parameters("@Liberado").Value = iLiberado

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Sub LimparLiberaProgramaReplanejamento()
        ' 0 = False   1= True
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Cadastros.uspLimpar_CadLiberaReplanejamento", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

#End Region

    Public Property Dia1() As String
        Get
            Dia1 = vDia1
        End Get
        Set(ByVal value As String)
            vDia1 = value
        End Set
    End Property

    Public Property Dia2() As String
        Get
            Dia2 = vDia2
        End Get
        Set(ByVal value As String)
            vDia2 = value
        End Set
    End Property

    Public Property Dia3() As String
        Get
            Dia3 = vDia3
        End Get
        Set(ByVal value As String)
            vDia3 = value
        End Set
    End Property

    Public Property Dia4() As String
        Get
            Dia4 = vDia4
        End Get
        Set(ByVal value As String)
            vDia4 = value
        End Set
    End Property

    Public Property Dia5() As String
        Get
            Dia5 = vDia5
        End Get
        Set(ByVal value As String)
            vDia5 = value
        End Set
    End Property

    Public Property Dia6() As String
        Get
            Dia6 = vDia6
        End Get
        Set(ByVal value As String)
            vDia6 = value
        End Set
    End Property

    Public Property Dia7() As String
        Get
            Dia7 = vDia7
        End Get
        Set(ByVal value As String)
            vDia7 = value
        End Set
    End Property

    Public Property Dia8() As String
        Get
            Dia8 = vDia8
        End Get
        Set(ByVal value As String)
            vDia8 = value
        End Set
    End Property

    Public Property Dia9() As String
        Get
            Dia9 = vDia9
        End Get
        Set(ByVal value As String)
            vDia9 = value
        End Set
    End Property

    Public Property NumDesc() As String
        Get
            NumDesc = vNumDesc
        End Get
        Set(ByVal value As String)
            vNumDesc = value
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

    Public Property varStrCategoria() As String
        Get
            varStrCategoria = strCategoria
        End Get
        Set(ByVal value As String)
            strCategoria = value
        End Set
    End Property

    Public Property Filial() As String
        Get
            Filial = vFilial
        End Get
        Set(ByVal value As String)
            vFilial = value
        End Set
    End Property

    Public Property FilialDesc() As String
        Get
            FilialDesc = vFilialDesc
        End Get
        Set(ByVal value As String)
            vFilialDesc = value
        End Set
    End Property

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

    Public Property vlrRev() As Double
        Get
            vlrRev = vVlrRev
        End Get
        Set(ByVal value As Double)
            vVlrRev = value
        End Set
    End Property

    Public Property percRev() As Double
        Get
            percRev = vPercRev
        End Get
        Set(ByVal value As Double)
            vPercRev = value
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

    Public Property vlrReaMargem() As String
        Get
            vlrReaMargem = vVlrReaMargem
        End Get
        Set(ByVal value As String)
            vVlrReaMargem = value
        End Set
    End Property

    Public Property percReaMargem() As String
        Get
            percReaMargem = vPercReaMargem
        End Get
        Set(ByVal value As String)
            vPercReaMargem = value
        End Set
    End Property

    Public Property VendaRealizada() As String
        Get
            VendaRealizada = vVendaRealizada
        End Get
        Set(ByVal value As String)
            vVendaRealizada = value
        End Set
    End Property

    Public Shared Function GetIPAddress() As String
        Dim context As System.Web.HttpContext = System.Web.HttpContext.Current
        Dim sIPAddress As String = context.Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If String.IsNullOrEmpty(sIPAddress) Then
            Return context.Request.ServerVariables("REMOTE_ADDR")
        Else
            Dim ipArray As String() = sIPAddress.Split(New [Char]() {","c})
            Return ipArray(0)
        End If
    End Function

    Public Sub AtualizarEstatisticaPrograma(ByVal iCodPrograma As Int16, ByVal iUserName As String)
        Dim sConnStr As String = connString
        Dim cnBKTest As New SqlConnection(connContSQL1)
        Dim cmdTest As New SqlCommand("uspProgramaEstatisticaAdd", cnBKTest)

        Dim strHostName As String = System.Net.Dns.GetHostName()

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@idPrograma", SqlDbType.SmallInt))
        cmdTest.Parameters("@idPrograma").Value = iCodPrograma

        cmdTest.Parameters.Add(New SqlParameter("@IPuser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPuser").Value = LCase(iUserName)

        cmdTest.Parameters.Add(New SqlParameter("@strHostName", SqlDbType.VarChar))
        cmdTest.Parameters("@strHostName").Value = System.Net.Dns.GetHostName()

        cmdTest.Parameters.Add(New SqlParameter("@clientIPAddress", SqlDbType.VarChar))
        cmdTest.Parameters("@clientIPAddress").Value = GetIPAddress()

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
        Catch ex As Exception
            UserMsgBox(Me, "Função: 'AtualizarEstatisticaPrograma' Erro: " & Err.Number & " - " & Err.Description)
        End Try

    End Sub

    Public Function Venda(ByVal iNivel As String, ByVal iAno As String, ByVal iMes As String) As Double

        Dim con As New SqlConnection(connString)
        Dim comando As New SqlCommand("uspBuscaVendaEmpresaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idNivel", SqlDbType.TinyInt))
        comando.Parameters("@idNivel").Value = iNivel

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Venda = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0.00")

            End While

        Catch ex As Exception
            'Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Public Sub Salvar_Rev(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16, ByVal iVlr As Double, ByVal iPerc As Double, ByVal iCatCod As Byte, ByVal iUserName As String)
        Dim sConnStr As String = connString
        Dim cnBKTest As New SqlConnection(connManager)
        Dim cmdTest As New SqlCommand("usp_Rev_Salvar", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        cmdTest.Parameters("@idCod").Value = iCod

        cmdTest.Parameters.Add(New SqlParameter("@ano", SqlDbType.SmallInt))
        cmdTest.Parameters("@ano").Value = iAno

        cmdTest.Parameters.Add(New SqlParameter("@mes", SqlDbType.TinyInt))
        cmdTest.Parameters("@mes").Value = iMes

        cmdTest.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        cmdTest.Parameters("@idFilial").Value = iFilial

        'matricula aqui se refere a "UserName". É gravado no campo UserName da tabela tblRev
        cmdTest.Parameters.Add(New SqlParameter("@matricula", SqlDbType.VarChar))
        cmdTest.Parameters("@matricula").Value = LCase(iUserName)

        cmdTest.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        cmdTest.Parameters("@vlr").Value = iVlr

        cmdTest.Parameters.Add(New SqlParameter("@perc", SqlDbType.SmallMoney))
        cmdTest.Parameters("@perc").Value = iPerc

        cmdTest.Parameters.Add(New SqlParameter("@catCod", SqlDbType.TinyInt))
        cmdTest.Parameters("@catCod").Value = iCatCod


        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
        Catch ex As Exception
            varDesc = "Certo!!!"
            varDesc = "Função: 'Salvar_Rev' Erro: " & Err.Number & " - " & Err.Description
            UserMsgBox(Me, "Função: 'Salvar_Rev' Erro: " & Err.Number & " - " & Err.Description)
        Finally
            cnBKTest.Close()
        End Try

    End Sub


    Public Function BuscaGrupoAno_OriLoja(ByVal iCod As String, ByVal iFilial As String, ByVal iAno As String) As Double

        Dim con As New SqlConnection(connString)
        Dim comando As New SqlCommand("uspBuscaOriLoja_GrupoAno", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0.00")
                percOri = Format(CSng(reader5.GetSqlMoney(1)), "#,##0.00")

            End While

        Catch ex As Exception
            'Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaGrupoAno_Ori(ByVal iCod As String, ByVal iFilial As String, ByVal iAno As String, ByVal iPosicao As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspBuscaOri_GruposAno", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.VarChar))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.Char))
        comando.Parameters("@idPosicao").Value = iPosicao

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

    Public Function Busca_Empresa_VendaAno_Rea(ByVal iAno As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Vendas.uspBuscarVendaEmpresaAno", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@ano", SqlDbType.SmallInt))
        comando.Parameters("@ano").Value = iAno

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0")

            End While

        Catch ex As Exception
            'Beep()
            varDesc = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function Busca_Empresa_VendaAno_Rea_PeriodoDaDespesa() As Double

        Dim con As New SqlConnection(connString)
        Dim comando As New SqlCommand("uspBuscaVendaRealizada_Ano_PeriodoDespesa", con)
        comando.CommandType = CommandType.StoredProcedure

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                varDesc = CDbl(reader5.GetSqlByte(1)) & "/" & CDbl(reader5.GetSqlInt16(0))
                vlrOri = Format(CDbl(reader5.GetSqlMoney(2)), "#,##0")

            End While

        Catch ex As Exception
            'Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaOriGrupoMes(ByVal iPosicao As Byte, ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriGrupoBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0

                vlrOri = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0.00")
                percOri = Format(CDbl(reader5.GetSqlMoney(1)), "#,##0.00")

            End While

        Catch ex As Exception
            ' Beep()
            varDesc = "Classe: MontaNome, Procedure: BuscaOriGrupoMes, Erro: " & ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaGrupo_ReaAno(ByVal iCod As Byte, ByVal iAno As Int16, ByVal iFilial As Int16) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaAnoBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0

                vlrOri = Convert.ToDouble(reader5("vlr")).ToString("n0")
                percOri = Convert.ToDouble(reader5("perc")).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaGrupo_ReaMes(ByVal iCod As String, ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlDouble(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaSubgrupo_ReaAno(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iFilial As Int16) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSubAnoBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception

            varDesc = "Classe: BuscaSubgrupo_ReaAno - " & ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Function ListaDeGrupo(ByVal iDDL As DropDownList, ByVal iCatLinhaCod As String, ByVal iCatLinhaDesc As String, ByVal iCategoria As String) As Boolean

        Select Case iCategoria
            Case 2  'Impostos
                varStrCategoria = "Impostos"
                strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listImpostos"

            Case 7  'Despesas
                varStrCategoria = "Despesas"
                strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listDespGrupoTodas"
            Case 39  'Outras Receitas
                varStrCategoria = "Outras Receitas"
                strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listOutrasReceita"
            Case 42 'Resultado Financeiro
                varStrCategoria = "Resultado Financeiro"
                strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listResultadoFinanceiro"
            Case 99 'Todas as Contas Usadas
                varStrCategoria = "Todas As Contas"
                strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listContasTodas"
        End Select

        Dim Conn As New SqlConnection(connString)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            iDDL.DataSource = objDr
            iDDL.DataValueField = iCatLinhaCod
            iDDL.DataTextField = iCatLinhaDesc
            iDDL.DataBind()
            Conn.Close()

        Catch e As Exception
            'Catch the error and display it.
            UserMsgBox(Me, "An Error Occurred: " & e.ToString())

        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try
    End Function

    Function ListaDeGestor(ByVal iDDL As DropDownList, ByVal iFieldValue As String, ByVal iFieldText As String) As Boolean
        strSQL = "SELECT CodPessoalAdm, DescPessoalAdm from listGestor"

        Dim Conn As New SqlConnection(connString)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            iDDL.DataSource = objDr
            iDDL.DataValueField = iFieldValue
            iDDL.DataTextField = iFieldText
            iDDL.DataBind()
            Conn.Close()

        Catch e As Exception
            'Catch the error and display it.
            UserMsgBox(Me, "An Error Occurred: " & e.ToString())

        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try

    End Function

    Function ListaDasFiliais(ByVal iDDL As DropDownList, ByVal iFilial As String, ByVal iDesc As String) As Boolean
        strSQL = "SELECT [Filial], [Desc] FROM listLojasAdm ORDER BY [Filial]"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            iDDL.DataSource = objDr
            iDDL.DataValueField = iFilial
            iDDL.DataTextField = iDesc
            iDDL.DataBind()
            Conn.Close()

        Catch e As Exception
            'Catch the error and display it.
            UserMsgBox(Me, "An Error Occurred: " & e.ToString())

        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try

    End Function

    Function ListaDasSecoes_ComFiltro(ByVal iDDL As ASPxComboBox, ByVal iSecao As String, ByVal iDesc As String, ByVal iDepto As String) As Boolean
        strSQL = "SELECT idSecao, ListaReduzida FROM Cadastros.tblCadSecao WHERE (idDepto = " & iDepto & ") ORDER BY idSecao"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            iDDL.DataSource = objDr
            iDDL.ValueField = iSecao
            iDDL.TextField = iDesc
            iDDL.DataBind()
            Conn.Close()

        Catch ex As Exception
            'Catch the error and display it.
            varDesc = ex.Source & " - " & ex.Message
        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try

    End Function

    Public Sub UserMsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
        Catch ex As Exception

        End Try
    End Sub

    Public Function BuscaRevGrupoMes(ByVal iCod As String, ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspRevMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrRev = 0
        percRev = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRev = 0
                percRev = 0

                vlrRev = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percRev = CDbl(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            ' Beep()
            UserMsgBox(Me, ex.Message)
            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaRea_SubgrupoMes(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iCod As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSubMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.VarChar))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        vlrRea = 0
        percRea = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                percRea = 0

                vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            'Beep()
            UserMsgBox(Me, ex.Message)
            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Sub BuscaRevSubgrupoMes(ByVal iCod As String, ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String)
        Dim con As New SqlConnection(connString)
        Dim comando As New SqlCommand("uspRevMesBuscaSub", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRev = 0
                percRev = 0

                vlrRev = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0.00")
                percRev = Format(CDbl(reader5.GetSqlMoney(1)), "#,##0.00")

            End While

        Catch ex As Exception
            ' Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaOriSubgrupoMes(ByVal iPosicao As Byte, ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Byte)
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriSubgrupoBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0

                vlrOri = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0.00")
                percOri = Format(CDbl(reader5.GetSqlMoney(1)), "#,##0.00")

            End While

        Catch ex As Exception
            ' Beep()
            varDesc = "Classe MontaNome - Erro: " & ex.Message

        Finally
            con.Close()
        End Try
    End Sub

    Public Sub Excluir_Rev_Corporacao(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Byte)

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "DELETE FROM gerManager.Metas.tblRevCorp WHERE idCod=" & iCod & " AND Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=" & iFilial & ""

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: Excluir_Rev_Corporacao - " & ex.Message

        Finally
            Conn.Close()
        End Try

    End Sub

    Public Sub Salvar_Rev_Empresa(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        Dim strSQL As String
        If iCod = 1 Then    'Elimina as lojas do Apoio para poder salvar
            strSQL = "INSERT INTO gerManager.Metas.tblRevCorp (idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, UserName) " &
                        "SELECT a.idCod, a.Ano, a.Mes, SUM(a.vlr), 199, 0, 1,  CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                                   "FROM gerMetas.Filial.tblRev AS a INNER JOIN DW.dbo.DimFilial AS b " &
                                   "ON a.idFilial = b.Filial " &
                                   "WHERE a.idCod = " & iCod & " And a.Ano = " & iAno & " And a.Mes = " & iMes & " And b.isLoja = 1 " &
                                   "GROUP BY a.idCod, a.Ano, a.Mes "
        Else
            strSQL = "INSERT INTO gerMetas.Metas.tblRevCorp (idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, UserName) " &
                                   "SELECT a.idCod, a.Ano, a.Mes, SUM(a.vlr), 199, 0, c.idGrupo,  CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                                   "FROM gerMetas.Filial.tblRev AS a INNER JOIN DW.dbo.DimFilial AS b  " &
                                   "ON a.idFilial = b.idFilial INNER JOIN gerDespesas.Cadastros.tblCategoriaLinha AS c  " &
                                   "ON a.idCod = c.idGrupo  " &
                                   "WHERE a.idCod = " & iCod & " And a.Ano = " & iAno & " And a.Mes = " & iMes & " " &
                                   "GROUP BY a.idCod, a.Ano, a.Mes, c.idGrupo "
        End If

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: Salvar_Rev_Empresa - " & ex.Message
            'varDesc = "strSQL: " & strSQL

        Finally
            Conn.Close()
        End Try
    End Sub

    Public Sub Salvar_Rev_SuperHiper(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        Dim strSQL As String = "INSERT INTO gerManager.Metas.tblRevCorp (idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, UserName) " &
                                   "SELECT a.idCod, a.Ano, a.Mes, SUM(a.vlr), b.CodigoSuperHiper, 0, c.idGrupo,  CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                                   "FROM gerManager.Metas.tblRev AS a INNER JOIN gerManager.Cadastros.tblCadFiliais AS b " &
                                   "ON a.idFilial = b.Filial INNER JOIN gerManager.Cadastros.tblCategoriaLinha AS c ON a.idCod = c.idGrupoSub " &
                                   "GROUP BY a.idCod, a.Ano, a.Mes, b.CodigoSuperHiper, c.idGrupo " &
                                   "HAVING a.idCod=" & iCod & " AND a.Ano=" & iAno & " AND a.Mes=" & iMes & " AND b.CodigoSuperHiper <> 0"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: Salvar_Rev_SuperHiper - " & ex.Message
            'varDesc = "strSQL: " & strSQL

        Finally
            Conn.Close()
        End Try
    End Sub

    Public Sub Salvar_Rev_Regional(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        Dim strSQL As String = "INSERT INTO gerManager.Metas.tblRevCorp (idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, UserName) " &
                                   "SELECT a.idCod, a.Ano, a.Mes, SUM(a.vlr), b.CodigoRegional, 0, c.idGrupo,  CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                                   "FROM gerManager.Metas.tblRev AS a INNER JOIN gerManager.Cadastros.tblCadFiliais AS b " &
                                   "ON a.idFilial = b.Filial INNER JOIN gerManager.Cadastros.tblCategoriaLinha AS c ON a.idCod = c.idGrupoSub " &
                                   "GROUP BY a.idCod, a.Ano, a.Mes, b.CodigoRegional, c.idGrupo " &
                                   "HAVING a.idCod=" & iCod & " AND a.Ano=" & iAno & " AND a.Mes=" & iMes & " AND b.CodigoRegional <> 0"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: Salvar_Rev_Regional - " & ex.Message
            'varDesc = "strSQL: " & strSQL

        Finally
            Conn.Close()
        End Try
    End Sub

    Public Sub Busca_Ori_Corporacao(ByVal iCod As String, ByVal iAno As String, ByVal iMes As Byte, ByVal iFilial As String)

        Dim strSQL As String = "SELECT vlr, perc FROM gerBI.Metas.tblOriCorp WHERE idCod=" & iCod & " AND Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=" & iFilial & ""

        Dim Conn As New SqlConnection(connBI)
        Dim Cmd As New SqlCommand(strSQL, Conn)

        vlrOri = 0
        percOri = 0

        Try
            Conn.Open()
            Dim reader5 As SqlDataReader
            reader5 = Cmd.ExecuteReader()
            While reader5.Read
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            varDesc = "Busca_Ori_Corporacao: " & ex.Message
        Finally
            Conn.Close()
        End Try
    End Sub

    Public Sub Busca_Rev_Corporacao(ByVal iCod As Integer, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Byte)

        Dim strSQL As String = "SELECT vlr, perc FROM gerManager.Metas.tblRevCorp WHERE idCod=" & iCod & " AND Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=" & iFilial & ""

        Dim Conn As New SqlConnection(connManager)
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            Dim reader5 As SqlDataReader
            reader5 = Cmd.ExecuteReader()
            While reader5.Read
                vlrRev = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percRev = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            varDesc = "Busca_Rev_Corporacao: " & ex.Message
        Finally
            Conn.Close()
        End Try
    End Sub

    Public Sub Busca_Rev_Corporacao_Ano(ByVal iCod As Integer, ByVal iAno As Int16, ByVal iFilial As Byte)

        'Dim strSQL As String = "SELECT vlr, perc FROM tblrevCorpAno WHERE idCod=" & iCod & " AND Ano=" & iAno & " AND idFilial=" & iFilial & ""

        'Dim Conn As New SqlConnection(conn196)
        'Dim Cmd As New SqlCommand(strSQL, Conn)

        'Try
        '    Conn.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = Cmd.ExecuteReader()
        '    While reader5.Read
        '        vlrRev = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0")
        '        percRev = Format(CDbl(reader5.GetSqlMoney(1)), "#,##0.00")
        '    End While

        'Catch ex As Exception
        '    varDesc = "Busca_Rev_Corporacao_Ano: " & ex.Message
        'Finally
        '    Conn.Close()
        'End Try
    End Sub

    Public Sub AtualizarVendas_LojasDoApoio(ByVal iAno As String, ByVal iMes As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspVenda_AtualizarLojasApoio", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Sub Apoio_Rev_Atualizar(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        'Insere na tblrevCorp as novas despesas do Apoio calculadas depois das alterações das vendas e 
        'e alterações das contas que tem variação em função do %.
        Dim strAdd, strDel, strDelTotalDesp, strAtuPerc, strTotalApoio As String
        Dim vlrVenda As Double
        Me.Busca_Rev_Corporacao(1, iAno, iMes, 199) 'Busca venda da empresa para calcular o % do Apoio
        vlrVenda = vlrRev

        strDel = "DELETE FROM gerManager.Metas.tblRevCorp WHERE Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=198 AND CatCod=7"
        strDelTotalDesp = "DELETE FROM gerManager.Metas.tblRevCorp WHERE idCod=14 AND Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=198"

        strAdd = "INSERT INTO gerManager.Metas.tblRevCorp(idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, userName) " &
                               "SELECT a.idCod, a.Ano, a.Mes, SUM(a.vlr), b.CodigoApoio, 0, c.idCat, CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                               "FROM gerManager.Metas.tblRev AS a INNER JOIN gerManager.Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial INNER JOIN gerManager.Cadastros.tblCategoriaLinha AS c ON a.idCod = c.idGrupo " &
                               "GROUP BY a.idCod, a.Ano, a.Mes, b.CodigoApoio, c.idCat " &
                               "HAVING(a.Ano=" & iAno & " And a.Mes=" & iMes & " And b.CodigoApoio <> 0 And idCat=7)"

        strTotalApoio = "INSERT INTO gerManager.Metas.tblRevCorp(idCod, Ano, Mes, vlr, idFilial, perc, CatCod, dataAtu, horaAtu, userName) " &
                               "SELECT 14, a.Ano, a.Mes, SUM(a.vlr), a.idFilial, 0, 99, CONVERT(char,getDate(),103), CONVERT(char,getDate(),108), '" & iUserName & "' " &
                               "FROM gerManager.Metas.tblRevCorp AS a " &
                               "GROUP BY a.Ano, a.Mes, a.idFilial, a.CatCod " &
                               "HAVING(a.Ano=" & iAno & " And a.Mes=" & iMes & " And a.idFilial = 198 And CatCod=7)"

        strAtuPerc = "UPDATE gerManager.Metas.tblRevCorp " &
                     "SET perc = CASE WHEN " & vlrVenda & "=0 THEN 0 WHEN vlr=0 THEN 0 ELSE CAST(vlr AS FLOAT) / CAST(" & vlrVenda & " AS FLOAT) * 100 END " &
                     "WHERE Ano=" & iAno & " AND Mes=" & iMes & " AND idFilial=198"

        Call AtualizarSQL(strDel, "Apoio_Rev_Atualizar - strDel")
        Call AtualizarSQL(strDelTotalDesp, "Apoio_Rev_Atualizar - strDelTotalDesp")
        Call AtualizarSQL(strAdd, "Apoio_Rev_Atualizar - strAdd")
        Call AtualizarSQL(strTotalApoio, "Apoio_Rev_Atualizar - strTotalApoio")
        Call AtualizarSQL(strAtuPerc, "Apoio_Rev_Atualizar - strAtuPerc")
    End Sub

    Public Sub Apoio_Rev_AtualizarPercentualNasLojas(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        'Insere na tblrevCorp as novas despesas do Apoio calculadas depois das alterações das vendas e 
        'e alterações das contas que tem variação em função do %.

        Try
            Me.Busca_Rev_Corporacao(14, iAno, iMes, 198) 'Busca venda da empresa para calcular o % do Apoio

            Me.Salvar_Rev(38, iAno, iMes, 3, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 4, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 5, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 6, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 7, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 8, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 9, 0, percRev, 7, iUserName)

            Me.Salvar_Rev(38, iAno, iMes, 10, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 11, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 13, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 14, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 15, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 17, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 18, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 19, 0, percRev, 7, iUserName)

            Me.Salvar_Rev(38, iAno, iMes, 20, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 21, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 22, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 23, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 24, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 25, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 26, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 27, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 28, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 29, 0, percRev, 7, iUserName)

            Me.Salvar_Rev(38, iAno, iMes, 30, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 31, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 32, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 33, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 34, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 36, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 37, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 38, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 39, 0, percRev, 7, iUserName)

            Me.Salvar_Rev(38, iAno, iMes, 40, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 41, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 42, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 43, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 44, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 45, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 46, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 47, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 48, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 49, 0, percRev, 7, iUserName)

            Me.Salvar_Rev(38, iAno, iMes, 50, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 51, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 52, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 53, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 54, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 55, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 56, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 57, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 58, 0, percRev, 7, iUserName)
            Me.Salvar_Rev(38, iAno, iMes, 59, 0, percRev, 7, iUserName)

            Call Apoio_Rev_AtualizarValorNaslojas(iAno, iMes, iUserName)
        Catch ex As Exception
            varDesc = "Classe:  Apoio_Rev_AtualizarPercentualNasLojas()  - " & ex.Message
        End Try
    End Sub

    Private Sub Apoio_Rev_AtualizarValorNaslojas(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iUserName As String)
        'Insere na tblrevCorp as novas despesas do Apoio calculadas depois das alterações das vendas e 
        'e alterações das contas que tem variação em função do %.
        Dim strAtuPerc As String

        strAtuPerc = "UPDATE m " &
                     "SET m.vlr=CASE WHEN v.vlr=0 THEN 0 WHEN m.perc=0 THEN 0 ELSE CAST(v.vlr AS FLOAT) * CAST(m.perc AS FLOAT) / 100 END, userName='" & iUserName & "' " &
                     "FROM viewVendaRevistaLojas AS v JOIN tblRev As m " &
                     "ON v.Ano = m.Ano " &
                     "AND v.Mes = m.Mes " &
                     "AND v.idFilial = m.idFilial " &
                     "WHERE(m.idCod = 38 And m.Ano = " & iAno & " And m.Mes = " & iMes & ") " &
                     "AND (m.idFilial<>1 AND m.idFilial<>12 AND m.idFilial<>16 AND m.idFilial<>100)"

        Call AtualizarSQL(strAtuPerc, "Apoio_Rev_AtualizarValorNaslojas")
    End Sub

    Private Sub AtualizarSQL(ByVal iStrSQL As String, ByVal iNomeProcedimento As String)
        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(iStrSQL, Conn)
        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: " & iNomeProcedimento & " - " & ex.Message
            'varDesc = "strSQL: " & strSQL
        Finally
            Conn.Close()
        End Try
    End Sub

    Public Function Busca_Loja_VendaAno_Rea(ByVal iAno As String, ByVal iFilial As String) As Double

        'Dim con As New SqlConnection(conn196)
        'Dim comando As New SqlCommand("uspBuscaVendaLojaAno", con)
        'comando.CommandType = CommandType.StoredProcedure

        'comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        'comando.Parameters("@Ano").Value = iAno

        'comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        'comando.Parameters("@idFilial").Value = iFilial

        'Try
        '    con.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = comando.ExecuteReader()
        '    While reader5.Read

        '        vlrOri = Format(CDbl(reader5.GetSqlMoney(0)), "#,##0")

        '    End While

        'Catch ex As Exception
        '    Beep()
        '    varDesc = ex.Message

        'Finally
        '    con.Close()
        'End Try
    End Function

    Public Function Busca_Rea_MargemLojaAcumulada_Mes(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        'Dim con As New SqlConnection(conn196)
        'Dim comando As New SqlCommand("uspBuscaMargemReaAcumuladaMes", con)
        'comando.CommandType = CommandType.StoredProcedure

        'comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        'comando.Parameters("@Ano").Value = iAno

        'comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        'comando.Parameters("@Mes").Value = iMes

        'comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        'comando.Parameters("@idFilial").Value = iFilial

        'Try
        '    con.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = comando.ExecuteReader()
        '    While reader5.Read

        '        vlrRea = reader5.GetSqlMoney(0)
        '        percRea = reader5.GetSqlMoney(1)

        '    End While

        'Catch ex As Exception
        '    Beep()
        '    varDesc = ex.Message

        'Finally
        '    con.Close()
        'End Try
    End Function

    Public Function Busca_Rea_MargemCorporacao_Dia(ByVal iDia As Date) As Double

        ''Busca a Margem da Empresa por Dia
        'Dim con As String = connString
        'Dim cnBKTest As New SqlConnection(conn196)
        'Dim cmdTest As New SqlCommand("uspVendaDiaCorp_Busca", cnBKTest)
        'cmdTest.CommandType = CommandType.StoredProcedure

        'cmdTest.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
        'cmdTest.Parameters("@Dia").Value = iDia

        'cmdTest.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        'cmdTest.Parameters("@idFilial").Value = 99

        'Try
        '    cnBKTest.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = cmdTest.ExecuteReader()
        '    While reader5.Read
        '        vlrRea = reader5.GetSqlMoney(1).ToString()    'percMargem
        '        percRea = reader5.GetSqlMoney(2).ToString()    'percMargem
        '    End While

        'Catch ex As Exception
        '    Beep()
        '    varDesc = ex.Message

        'Finally
        '    cnBKTest.Close()
        'End Try
    End Function

    Public Function Busca_Rea_MargemCorporacao_Dia_SellOut(ByVal iDia As Date) As Double

        ''Busca a Margem da Empresa por Dia
        'Dim con As String = connString
        'Dim cnBKTest As New SqlConnection(conn196)
        'Dim cmdTest As New SqlCommand("uspVendaDiaCorp_Busca", cnBKTest)
        'cmdTest.CommandType = CommandType.StoredProcedure

        'cmdTest.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
        'cmdTest.Parameters("@Dia").Value = iDia

        'cmdTest.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        'cmdTest.Parameters("@idFilial").Value = 99

        'Try
        '    cnBKTest.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = cmdTest.ExecuteReader()
        '    While reader5.Read
        '        vlrRea = reader5.GetSqlMoney(3).ToString()    'percMargem
        '        percRea = reader5.GetSqlMoney(4).ToString()    'percMargem
        '    End While

        'Catch ex As Exception
        '    Beep()
        '    varDesc = ex.Message

        'Finally
        '    cnBKTest.Close()
        'End Try
    End Function


    Public Sub Busca_Rea_MargemCorporacao_Mes_BaseDia(ByVal iMes As Byte, ByVal iAno As Int32)

        ''Busca a Margem da Corporação por Mês
        ''Se por exemplo o Mês esta incompleto - Exemplo, hoje é dia 09/08/2011, a
        ''Margem será calculada até o dia 08/08/2011, o dia atual não conta no calculo 
        ''da Margem.

        ''Busca a Margem da Empresa por Dia
        'Dim con As String = connString
        'Dim cnBKTest As New SqlConnection(conn196)
        'Dim cmdTest As New SqlCommand("uspVendaDiaCorp_Busca_AcumuladaMes", cnBKTest)
        'cmdTest.CommandType = CommandType.StoredProcedure

        'cmdTest.Parameters.AddWithValue("@Ano", iAno)
        'cmdTest.Parameters.AddWithValue("@Mes", iMes)

        'Try
        '    cnBKTest.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = cmdTest.ExecuteReader()
        '    While reader5.Read
        '        vlrRea = reader5.GetSqlMoney(1).ToString()                 'percMargem
        '        percRea = reader5.GetSqlDouble(2).ToString()
        '    End While

        'Catch ex As Exception
        '    varDesc = Err.Number & " - " & Err.Description

        'Finally
        '    cnBKTest.Close()
        'End Try
    End Sub

    Public Sub Busca_Rea_MargemCorporacao_Ano_BaseDia(ByVal iAno As Int32)

        ''Busca a Margem da Corporação por Mês
        ''Se por exemplo o Mês esta incompleto - Exemplo, hoje é dia 09/08/2011, a
        ''Margem será calculada até o dia 08/08/2011, o dia atual não conta no calculo 
        ''da Margem.

        ''Busca a Margem da Empresa por Dia
        'Dim con As String = connString
        'Dim cnBKTest As New SqlConnection(conn196)
        'Dim cmdTest As New SqlCommand("uspVendaDiaCorp_Busca_AcumuladaAno", cnBKTest)
        'cmdTest.CommandType = CommandType.StoredProcedure

        'cmdTest.Parameters.AddWithValue("@Ano", iAno)

        'Try
        '    cnBKTest.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = cmdTest.ExecuteReader()
        '    While reader5.Read
        '        vlrRea = reader5.GetSqlMoney(1).ToString()                 'percMargem
        '        percRea = reader5.GetSqlDouble(2).ToString()
        '    End While

        'Catch ex As Exception
        '    varDesc = Err.Number & " - " & Err.Description

        'Finally
        '    cnBKTest.Close()
        'End Try
    End Sub

    Public Function DefinirLojaAdm(ByVal iUsuario As String) As Byte

        If StrConv(Left(iUsuario, 4), VbStrConv.Lowercase) = "loja" Then
            'Definir o nº da Filial da Loja
            If Len(iUsuario) = 5 Then   'Loja9 - até 9
                Filial = CByte(Right(iUsuario, 1))
            ElseIf Len(iUsuario) = 6 Then 'Loja11 - Maior que 9
                Filial = CByte(Right(iUsuario, 2))
            End If
        Else    'Usuário da Administração e Outros
            Filial = CByte(3)
        End If
        Call BuscarDadosFiliais(Filial)
    End Function

    Function BuscarDadosFiliais(ByVal iFilial As String) As Boolean
        strSQL = "SELECT [Filial], [FilialLista] FROM Cadastros.tblCadFiliais ORDER BY [Filial]"

        Dim Conn As New SqlConnection(connManager)
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            Dim reader5 As SqlDataReader
            reader5 = Cmd.ExecuteReader()
            While reader5.Read
                vlrRev = 0
                percRev = 0

                FilialDesc = reader5.GetSqlString(1)

            End While

        Catch ex As Exception
            varDesc = ex.Message

        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try

    End Function

    Public Sub AtualizarGridLojas(ByVal iDepto As String, ByVal iSecao As String, ByVal iGrupo As String, ByVal iUsuario As String)

        'Busca a Margem da Corporação por Mês
        'Se por exemplo o Mês esta incompleto - Exemplo, hoje é dia 09/08/2011, a
        'Margem será calculada até o dia 08/08/2011, o dia atual não conta no calculo 
        'da Margem.

        'Busca a Margem da Empresa por Dia
        Dim con As String = connString
        Dim cnBKTest As New SqlConnection(connManager)
        Dim cmdTest As New SqlCommand("uspAtualizarVenda_GridLojas_Grupo", cnBKTest)
        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.AddWithValue("@varDepto", iDepto)
        cmdTest.Parameters.AddWithValue("@varSecao", iSecao)
        cmdTest.Parameters.AddWithValue("@varGrupo", iGrupo)
        cmdTest.Parameters.AddWithValue("@varUsuario", iUsuario)

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()

        Catch ex As Exception
            varDesc = Err.Number & " - " & Err.Description

        Finally
            cnBKTest.Close()
        End Try
    End Sub

    'uspBuscaVendaEmpresaMes_Rea

    Public Function BuscaVendaEmpresaMes_Rea(ByVal iAno As String, ByVal iMes As String) As Double

        'Dim con As New SqlConnection(conn196)
        'Dim comando As New SqlCommand("uspBuscaVendaEmpresaMes_Rea", con)
        'comando.CommandType = CommandType.StoredProcedure

        'comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        'comando.Parameters("@Ano").Value = iAno

        'comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        'comando.Parameters("@Mes").Value = iMes

        'Try
        '    con.Open()
        '    Dim reader5 As SqlDataReader
        '    reader5 = comando.ExecuteReader()
        '    While reader5.Read
        '        vlrRea = 0
        '        percRea = 0
        '        vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
        '    End While
        'Catch ex As Exception
        '    varDesc = "Classe: BuscaVendaEmpresaMes_Rea - " & ex.Message
        'Finally
        '    con.Close()
        'End Try
    End Function

    Public Function BuscaGrupoMes(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriGrupoBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        vlrOri = 0
        percOri = 0
        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Public Sub BuscaSecao_VendaMargem_Rea(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String)

        '*************************************************************************************************************************
        'Parameter: iStatus 
        '1=Venda  2=Margem   3=Venda e Margem   6=Posto
        '1-(vlrRea, percRea)  2-(vlrReaMargem, percMargem)    3-(vlrRea, percRea, vlrReaMargem, percMargem)
        '*************************************************************************************************************************

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSecao_Venda_Busca_Mes_Replanejamento", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = iSecao

        vlrRea = 0
        percRea = 0
        vlrReaMargem = 0
        percReaMargem = 0
        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                percRea = 0
                vlrReaMargem = 0
                percReaMargem = 0
                Select Case iStatus
                    Case 1

                        vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 2
                        vlrRea = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(3)).ToString("n2")
                    Case 3
                        vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                        vlrReaMargem = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                        percReaMargem = CDbl(reader5.GetSqlMoney(3)).ToString("n2")
                    Case 4
                        vlrRea = CDbl(reader5.GetSqlMoney(4)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(5)).ToString("n2")
                    Case 5
                        vlrRea = CDbl(reader5.GetSqlMoney(6)).ToString("n0")    ' vlrLucroFinal
                        percRea = CDbl(reader5.GetSqlMoney(7)).ToString("n2")   ' percMargemFinal
                    Case 6  'Posto
                        vlrRea = CDbl(reader5.GetDouble(0)).ToString("n0")
                End Select

            End While
        Catch ex As Exception
            varDesc = "Classe no ex: BuscaSecao_VendaMargem_Rea - " & ex.Message & " - " & iAno & " - " & iMes & " - " & iFilial & " - " & iSecao & " - " & iStatus & " - " & vlrRea & " - " & percRea
        Finally
            con.Close()
        End Try

    End Sub

    Sub BuscaSecao_VendaMargem_Ori(ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16, ByVal iSecao As Int16, ByVal iPosicao As Byte, ByVal iTipoSecao As Byte)
        '**************************************************************
        'Parameter: @idPosicao = 1-Loja; 2-Administrativos; 3-Definitivo

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriSecaoLojaBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = iTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.TinyInt))
        comando.Parameters("@idSecao").Value = iSecao

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try

    End Sub

    Public Function BuscaMemo_Ori(ByVal iAno As String, ByVal iFilial As String, ByVal iDepto As String, ByVal iSecao As String) As Boolean

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("SELECT ISNULL(Memo, '') FROM tblOriSecaoAnoLoja WHERE idTipoSecao=1 AND Ano=" & iAno & " AND Mes=99 AND idFilial=" & iFilial & " AND idDepto=" & iDepto & " AND idSecao=" & iSecao & "", con)

        varDesc = ""

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                varDesc = ""
                varDesc = reader5.GetSqlString(0).ToString()
            End While

        Catch ex As Exception
            ' Beep()
        Finally
            con.Close()
        End Try
    End Function

    Public Function Salvar_Ori_Grupo_Mes(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                            ByVal iMes As String, ByVal iFilial As String, ByVal iVlr As Double,
                            ByVal iPerc As Double, ByVal iUser As String, ByVal iCatCod As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriGrupoMes", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)

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

    Public Function Salvar_Ori_Grupo_Ano(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                                         ByVal iFilial As String, ByVal iVlr As Double, ByVal iPerc As Double,
                                         ByVal iUser As String, ByVal iCatCod As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriGrupoAno", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)

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

    Public Function Salvar_Ori_Secao_Mes(ByVal iPosicao As String, ByVal iTipoSecao As String, ByVal iAno As String,
                                         ByVal iMes As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iUser As String,
                                          ByVal iVlr As Double, ByVal iPerc As Double) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriSecaoMes", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
                cmdTest.Parameters.AddWithValue("@idTipoSecao", iTipoSecao)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idSecao", iSecao)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)

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

    Public Function Salvar_Ori_Secao_Ano(ByVal iPosicao As Int16, ByVal iTipoSecao As Int16, ByVal iAno As Int32,
                                         ByVal iFilial As Int16, ByVal iSecao As Int32, ByVal iUser As String,
                                         ByVal iDepto As Int32, ByVal iVlr As Double, ByVal iPerc As Double, ByVal iMemo As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriSecaoAno", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
                cmdTest.Parameters.AddWithValue("@idTipoSecao", iTipoSecao)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@idSecao", iSecao)
                cmdTest.Parameters.AddWithValue("@idDepto", iDepto)
                cmdTest.Parameters.AddWithValue("@vlr", iVlr)
                cmdTest.Parameters.AddWithValue("@perc", iPerc)
                cmdTest.Parameters.AddWithValue("@userName", iUser)
                cmdTest.Parameters.AddWithValue("@Memo", iMemo)

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

    Public Function SalvarCorporacao_Ori_Grupo_Mes(ByVal iPosicao As String, ByVal idCod As String, ByVal iAno As String,
                                     ByVal iMes As String, ByVal iGrupoSub As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("usp_OriLoja_Corp_Salvar", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idNivel", iPosicao)
                cmdTest.Parameters.AddWithValue("@idCod", idCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@Mes", iMes)
                cmdTest.Parameters.AddWithValue("@idGrupoSub", iGrupoSub)
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

    Public Function BuscaSecao_VendaMargem_Rea_Ano(ByVal iAno As Int32, ByVal iFilial As Int16, ByVal iSecao As Int32) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSecao_Venda_Busca_Ano", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = iSecao


        vlrRea = 0
        percRea = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                percRea = 0
                vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                'Format(CDbl(reader5.GetSqlMoney(0)), "#,##0")
                'percRea = reader5.GetSqlString(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaSecao_VendaMargem_Rea_Ano - " & ex.Message
        Finally
            con.Close()
        End Try

    End Function

    Public Function BuscaVendaSecaoComprador_Rea(ByVal iAno As String, ByVal iMes As String,
                                    ByVal iFilial As String, ByVal iSecao As String,
                                    ByVal iStatus As String) As Double
        'Busca a Venda, Participação, Margem por Seção e por Comprador
        '*************************************************************************************************************************
        'Parameter: iStatus 
        '1=Venda  2=Margem   3=Venda e Margem
        '1-(vlrRea, percRea)  2-(vlrReaMargem, percMargem)    3-(vlrRea, percRea, vlrReaMargem, percMargem)
        '*************************************************************************************************************************
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspBuscaVendaPorComprador_Real", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.VarChar))
        comando.Parameters("@idSecao").Value = iSecao

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        vlrRea = 0
        percRea = 0
        vlrReaMargem = 0
        percReaMargem = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                percRea = 0
                vlrReaMargem = 0
                percReaMargem = 0
                Select Case iStatus
                    Case 1
                        vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlString(1)).ToString("n2")
                    Case 2
                        vlrRea = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(3)).ToString("n2")
                    Case 3
                        vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                        percRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                        vlrReaMargem = CDbl(reader5.GetSqlMoney(2)).ToString("n0")
                        percReaMargem = CDbl(reader5.GetSqlMoney(3)).ToString("n2")
                End Select
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaVendaSecaoComprador_Rea - " & ex.Message
        Finally
            con.Close()
        End Try

    End Function

    Public Function BuscaOri_Comprador_VendaTotal_Mes(ByVal iAno As String, ByVal iMes As String,
                                                      ByVal iFilial As String, ByVal iComprador As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriTotalCompradorBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idComprador", SqlDbType.VarChar))
        comando.Parameters("@idComprador").Value = iComprador

        vlrOri = 0
        percOri = 0
        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Sub BuscaOri_Comprador_VendaSecao_Mes(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String,
                                           ByVal iSecao As String, ByVal iPosicao As String,
                                          ByVal iTipoSecao As String, ByVal iComprador As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspOriSecaoCompradorBuscaMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.Char))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.Char))
        comando.Parameters("@idTipoSecao").Value = iTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.VarChar))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.VarChar))
        comando.Parameters("@idSecao").Value = iSecao

        comando.Parameters.Add(New SqlParameter("@idComprador", SqlDbType.VarChar))
        comando.Parameters("@idComprador").Value = iComprador

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaOri_Comprador_VendaSecao_Mes - " & ex.Message
        Finally
            con.Close()
        End Try

    End Sub

    Public Function AtualizarVendaRankingSecao(ByVal iFilial As String, ByVal iUser As String,
                                      ByVal iDataInicial As Date, ByVal iDataFinal As Date) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspAtualizarVenda_Grid", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@DI", iDataInicial)
                cmdTest.Parameters.AddWithValue("@DF", iDataFinal)
                cmdTest.Parameters.AddWithValue("@userName", iUser)

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

    Public Function AtualizarVendaItem(ByVal iFilial As String, ByVal iUser As String,
                                   ByVal iDataInicial As Date, ByVal iDataFinal As Date,
                                   ByVal iDepto As String, ByVal iSecao As String,
                                   ByVal iGrupo As String, ByVal iSubgrupo As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspAtualizarVenda_Grid_Item", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idDepto", iDepto)
                cmdTest.Parameters.AddWithValue("@idSecao", iSecao)
                cmdTest.Parameters.AddWithValue("@idGrupo", iGrupo)
                cmdTest.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@DI", iDataInicial)
                cmdTest.Parameters.AddWithValue("@DF", iDataFinal)
                cmdTest.Parameters.AddWithValue("@userName", iUser)

                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = "Classe: AtualizarVendaItem " & ex.Message

                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try

                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Function BuscaRevSecaoMes(ByVal iTipoSecao As Byte, ByVal iSecao As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspRevMesBusca_Secao", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = iTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iSecao

        vlrRev = 0
        percRev = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRev = 0
                percRev = 0

                vlrRev = CDbl(reader5.GetSqlDouble(0)).ToString("n2")
                percRev = CDbl(reader5.GetSqlDouble(1)).ToString("n4")

            End While

        Catch ex As Exception
            'Beep()
            varDesc = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Sub CalcularMetaRevistaTeorico(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iUserName As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspAtualizarMetaTeorico_Revista_Lojas", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = LCase(iUserName)

        Try
            con.Open()
            comando.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
            varDesc = "Função: 'CalcularMetaRevistaTeorico' Erro: " & Err.Number & " - " & Err.Description
        End Try

    End Sub

    Public Function BuscaProgramaStatus(ByVal iAno As String, ByVal iMes As String,
                                ByVal iPrograma As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspBuscaProgramaStatus", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPrograma", SqlDbType.VarChar))
        comando.Parameters("@idPrograma").Value = iPrograma

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        vlrRea = 1

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 1
                vlrRea = reader5.GetSqlString(0)
            End While
        Catch ex As Exception
            varDesc = "Classe: BuscaGrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try
    End Function

    Public Function Salvar_Ori_Subgrupo_Mes(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                         ByVal iMes As String, ByVal iFilial As String, ByVal iVlr As Double,
                         ByVal iPerc As Double, ByVal iUser As String, ByVal idGrupo As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriSubgrupoMes", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
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

    Public Function Salvar_Ori_Subgrupo_Ano(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                     ByVal iFilial As String, ByVal iVlr As Double,
                     ByVal iPerc As Double, ByVal iUser As String, ByVal idGrupo As String) As Boolean
        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriSubgrupoAno", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
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

    Public Sub Salvar_Ori_Grupo_Mes_BaseSubgrupo(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                        ByVal iFilial As String,
                        ByVal iUser As String, ByVal iCatCod As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspInsertOriGrupoMes_FromSubGrupo", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.Char))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.VarChar))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = iUser

        comando.Parameters.Add(New SqlParameter("@idCatCod", SqlDbType.VarChar))
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

    Public Function Salvar_Ori_Grupo_Ano_BaseGrupo(ByVal iPosicao As String, ByVal iCod As String, ByVal iAno As String,
                                     ByVal iFilial As String,
                                     ByVal iUser As String, ByVal iCatCod As String) As Boolean

        Dim gravou As Boolean
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspInsertOriGrupoAno_BaseMes", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idPosicao", iPosicao)
                cmdTest.Parameters.AddWithValue("@idCod", iCod)
                cmdTest.Parameters.AddWithValue("@Ano", iAno)
                cmdTest.Parameters.AddWithValue("@idFilial", iFilial)
                cmdTest.Parameters.AddWithValue("@userName", iUser)
                cmdTest.Parameters.AddWithValue("@idCatCod", iCatCod)
                Try
                    con.Open()
                    gravou = cmdTest.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
                Catch ex As Exception
                    varDesc = "Classe Salvar_Ori_Grupo_Ano_BaseGrupo: " & ex.Message
                Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
                    con.Close() 'Fecha o banco de dados
                End Try
                Return gravou   'Toda função tem retornar alguma coisa
                'Neste caso o retorno será dados pela variavel "gavou"
            End Using
        End Using
    End Function

    Public Sub Busca_Ori_Corporacao_Ano(ByVal iCod As String, ByVal iAno As String, ByVal iFilial As String)

        Dim strSQL As String = "SELECT vlr, perc FROM Metas.tblOriCorpAno WHERE idCod=" & iCod & " AND Ano=" & iAno & " AND idFilial=" & iFilial & ""

        Dim Conn As New SqlConnection(connBI)
        Dim Cmd As New SqlCommand(strSQL, Conn)

        vlrOri = 0
        percOri = 0

        Try
            Conn.Open()
            Dim reader5 As SqlDataReader
            reader5 = Cmd.ExecuteReader()
            While reader5.Read
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            varDesc = "Busca_Ori_Corporacao_Ano: " & ex.Message
        Finally
            Conn.Close()
        End Try
    End Sub

    'Public Function Buscar_IDSubGrupo_Jogue(ByVal iGrupo As Int16) As Boolean

    '    Dim con As New SqlConnection(connManager)
    '    Dim comando As New SqlCommand("uspBuscaIDSubgrupo", con)
    '    comando.CommandType = CommandType.StoredProcedure

    '    comando.Parameters.Add(New SqlParameter("@idGrupo", SqlDbType.TinyInt))
    '    comando.Parameters("@idGrupo").Value = iGrupo

    '    Try
    '        con.Open()
    '        Dim reader5 As SqlDataReader
    '        reader5 = comando.ExecuteReader()
    '        While reader5.Read
    '            Buscar_IDSubGrupo = reader5.GetSqlInt16(0)
    '        End While
    '    Catch ex As Exception
    '        varDesc = "Classe: Buscar_IDSubGrupo - " & ex.Message
    '    Finally
    '        con.Close()
    '    End Try



    'End Function

    Public Function Buscar_IDSubGrupo(ByVal iGrupo As Int16) As Int16

        Using connection As New SqlConnection(connManager)
            connection.Open()
            Dim command As New SqlCommand("uspBuscaIDSubgrupo", connection)
            command.CommandType = CommandType.StoredProcedure

            Dim nameParameter = New SqlParameter("idGrupo", iGrupo)
            nameParameter.SqlDbType = SqlDbType.TinyInt
            command.Parameters.Add(nameParameter)
            Dim varSubgrupo As String = command.ExecuteScalar()
            If varSubgrupo = Nothing Then
                Buscar_IDSubGrupo = 0
            Else
                Buscar_IDSubGrupo = varSubgrupo
            End If
        End Using
    End Function

    Public Function BuscaRea_SecaoAno(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSecao_Venda_Busca_Ano", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = iSecao

        vlrOri = 0
        percOri = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrOri = 0
                percOri = 0

                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlDouble(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = "BuscaRea_SecaoAno - Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaReaQuebraSecao_Divegencia(ByVal iAno As String, ByVal iFilial As String, ByVal iTipoSecao As String, ByVal iMes As String, ByVal iSecao As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaQuebraSecao_Busca_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.SmallInt))
        comando.Parameters("@idTipoSecao").Value = iTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = iSecao

        vlrRea = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                vlrRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            varDesc = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function BuscaRea_Agenda23_Secao(ByVal iAno As String, ByVal iFilial As String, ByVal iMes As String, ByVal iSecao As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspReaSecao_Agenda23_Busca_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = iSecao

        vlrRea = 0
        percRea = 0

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrRea = 0
                percRea = 0
                vlrRea = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percRea = CDbl(reader5.GetSqlMoney(1)).ToString("n2")

            End While

        Catch ex As Exception
            varDesc = ex.Message

        Finally
            con.Close()
        End Try
    End Function

    Public Function Campanha_BuscarPeriodo(ByVal iCampanha As String, ByVal iAno As String) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspCampanha_BuscarPeriodo", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCampanha", SqlDbType.TinyInt))
        comando.Parameters("@idCampanha").Value = iCampanha

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        Dia1 = ""
        Dia2 = ""
        Dia3 = ""
        Dia4 = ""
        Dia5 = ""
        Dia6 = ""
        Dia7 = ""
        Dia8 = ""
        Dia9 = ""
        NumDesc = ""

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Dia1 = ""
                Dia2 = ""
                Dia3 = ""
                Dia4 = ""
                Dia5 = ""
                Dia6 = ""
                Dia7 = ""
                Dia8 = ""
                Dia9 = ""
                NumDesc = ""

                Dia1 = reader5.GetSqlString(0).ToString()
                Dia2 = reader5.GetSqlString(1).ToString()
                Dia3 = reader5.GetSqlString(2).ToString()
                Dia4 = reader5.GetSqlString(3).ToString()
                Dia5 = reader5.GetSqlValue(4).ToString()
                Dia6 = reader5.GetSqlValue(5).ToString()
                Dia7 = reader5.GetSqlValue(6).ToString()
                Dia8 = reader5.GetSqlValue(7).ToString()
                Dia9 = reader5.GetSqlValue(8).ToString()
                NumDesc = reader5.GetSqlValue(9).ToString()

            End While

        Catch ex As Exception
            varDesc = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Sub PeriodoAcumulado_Excluir(ByVal iUser As String)

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "DELETE FROM gerManager.Temp.ttPerAcu WHERE Usuario='" & iUser & "'"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: PeriodoAcumulado_Excluir - " & ex.Message

        Finally
            Conn.Close()
        End Try

    End Sub

    Public Sub PeriodoAcumulado_Adicionar(ByVal iMes As Byte, ByVal iUser As String)

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "INSERT INTO gerManager.Temp.ttPerAcu (Usuario, Mes) VALUES ('" & iUser & "'," & iMes & ")"

        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: PeriodoAcumulado_Adicionar - " & ex.Message

        Finally
            Conn.Close()
        End Try

    End Sub

    Public Sub CalcularMetaRevistaSecao(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iUserName As String)
        'Quando se salva a Participação das Vendas no passo 3 no Replanejamento por seção, precisa alterar as 
        'Margens e a Agenda 23. Este procedimento faz isso.

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspRevSecao_AtualizarSecoes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = iUserName

        Try
            con.Open()
            comando.ExecuteNonQuery()
            con.Close()
        Catch ex As Exception
            varDesc = "Função: 'CalcularMetaRevistaSecao' Erro: " & Err.Number & " - " & Err.Description
        End Try

    End Sub

#Region " Meta Original"

    Public Sub BI_BuscaOri_GrupoMes(ByVal iCod As Byte, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Int16)

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
                vlrOri = 0
                percOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                percOri = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While
        Catch ex As Exception
            varDesc = "Classe: BI_BuscaOri_GrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Function BI_BuscaOri_GrupoMes_Valor(ByVal iCod As Byte, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Byte) As Decimal

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("uspBuscaOri_GrupoMes", con)
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
                vlrOri = 0
                vlrOri = CDbl(reader5.GetSqlMoney(0)).ToString("n0")

            End While
        Catch ex As Exception
            varDesc = "Classe: BI_BuscaOri_GrupoMes - " & ex.Message
        Finally
            con.Close()
        End Try

        BI_BuscaOri_GrupoMes_Valor = vlrOri
    End Function

#End Region


    Function Flash_BuscaDataAtualizacao(ByVal iDate As Date) As String

        strSQL = "SELECT Hora FROM Ranking.FlashVendaAtualizacao WHERE Dia='" & iDate.ToString("yyyy/MM/dd") & "'"

        Dim Conn As New SqlConnection(connManager)
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Dim Hora As Date

        Try
            Conn.Open()
            Dim reader5 As SqlDataReader
            reader5 = Cmd.ExecuteReader()
            While reader5.Read

                Hora = reader5.GetSqlString(0).ToString()

            End While

        Catch ex As Exception
            varDesc = ex.Message

        Finally
            Cmd.Dispose()
            Conn.Close()

        End Try

        Return Hora
    End Function

    Public Sub SLV_AtualizaComparativoVendaGrupo(ByVal iAno As Int16, ByVal iUser As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("SLV.uspAtualizaComparativoVendaGrupo", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@User", SqlDbType.VarChar))
        comando.Parameters("@User").Value = iUser

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Sub SLV_AtualizaComparativoVendaSecao(ByVal iAno As Int16, ByVal iUser As String)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("SLV.uspAtualizaComparativoVendaSecao", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@User", SqlDbType.VarChar))
        comando.Parameters("@User").Value = iUser

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Sub AtualizaMesUsuario(ByVal iMes As Byte, ByVal iUser As String)

        Dim con As New SqlConnection(connCadastros)
        Dim comando As New SqlCommand("uspAtualizaMesUsuario", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@mes", SqlDbType.TinyInt))
        comando.Parameters("@mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@usuario", SqlDbType.VarChar))
        comando.Parameters("@usuario").Value = iUser

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

    Public Sub DeleteaMesUsuario(ByVal iUser As String)

        Dim con As New SqlConnection(connCadastros)
        Dim comando As New SqlCommand("uspDeleteMesUsuario", con)
        Dim objDr As SqlDataReader
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@usuario", SqlDbType.VarChar))
        comando.Parameters("@usuario").Value = iUser

        Try
            con.Open()
            objDr = comando.ExecuteReader(CommandBehavior.CloseConnection)
            con.Close()

        Catch ex As Exception

            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub


    Public Function BuscarMesUltimaDespesaFechada(ByVal iAno As Int32) As Byte

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Cadastros.uspBuscarMesUltimaDespesaFechada", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                BuscarMesUltimaDespesaFechada = reader5.GetSqlByte(0)
            End While

        Catch ex As Exception
            varDesc = ex.Message

        Finally

            con.Close()

        End Try

        Return BuscarMesUltimaDespesaFechada

    End Function

#Region " MY PERSONALIZE FUNCTIONS "

    ''' <summary>
    ''' Retorna o Ano Atual. Exemplo: 2016
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function Year_Return_Actual() As Int16

        Year_Return_Actual = DateAndTime.Today.Year

    End Function

    ''' <summary>
    ''' Retorna o Ano Passado. Exemplo: Se o ano de hoje é 2016 é retornado o ano de 2015.
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function Year_Return_Last() As Int16
        Year_Return_Last = DateAndTime.Today.AddYears(-1).Year
    End Function

    ''' <summary>
    ''' Retorna o Mês Atual
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function Month_Return_Actual() As Byte
        Month_Return_Actual = DateAndTime.Today.Month
    End Function

    ''' <summary>
    ''' Ano Bissexto. Retorna TRUE se o ano for Bissexto. Retorna FALSE se o ano não for Bissexto
    ''' </summary>
    ''' <param name="iYear"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function LeapYear(ByVal iYear As Int16) As Boolean
        LeapYear = DateTime.IsLeapYear(iYear)
    End Function

#End Region

    Public Sub Permissa_Acesso_Programa(sender As Object, e As EventArgs, ByVal Usuario As String, ByVal idTipoMenu As TipoMenu, ByVal idPrograma As Int16, ByVal pathPrograma As String)

        Dim oDb As New clDataDb

        idPrograma = oDb.ExecuteStoredProcedure_Scalar_Permission("dbo.usp_Buscar_Permissao_Programa", Conexao.gerCont_str, "idUsuario", Usuario, "idTipoMenu", idTipoMenu, "idPrograma", idPrograma)

        If idPrograma = 0 Then
            oDb.GetDataDB_ExecuteScalar_Parameter2("dbo.usp_LOG_BG", Conexao.gerCont_str, "idUsuario", Usuario, "pathPrograma", pathPrograma)
            HttpContext.Current.Response.Redirect("http://10.1.1.14:81/MemberPages/Error404.aspx")

            Exit Sub
        End If

    End Sub

    ''' <summary>
    ''' Muda a cor do numero para vermelho quando for menor que zero. Se for maior, a cor do numero muda para preto por ser positivo.
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub MudarNegativoParaVermelho(ByVal vlrCampo As Label)

        If CDbl(vlrCampo.Text) < 0 Then
            vlrCampo.ForeColor = Drawing.Color.Red
        ElseIf CDbl(vlrCampo.Text) >= 0 Then
            vlrCampo.ForeColor = Drawing.Color.Black
        Else
            vlrCampo.ForeColor = Drawing.Color.Black
        End If

    End Sub




End Class


