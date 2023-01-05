
#Region " Imports"

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Imports DevExpress.Web
Imports System.Configuration.ConfigurationManager

#End Region

Public Class Orcamento

    Private vDesc As String

    Public Shared dbConnect As String = ConnectionStrings("gerOrcamentoConnectionString").ConnectionString

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Sub AtualizarStoredProcedure_Parameter_Ano(ByVal NomeStoredProcedure As String, ByVal Ano As Int16)
        Dim Conn As New SqlConnection(dbConnect)
        Dim Cmd As New SqlCommand(NomeStoredProcedure, Conn)
        Cmd.CommandType = CommandType.StoredProcedure

        Cmd.Parameters.AddWithValue("@Ano", Ano)

        Try
            Conn.Open()
            Cmd.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: AtualizarStoredProcedure_Parameter_Ano - '" & NomeStoredProcedure & "' - " & ex.Message

        Finally
            Conn.Close()
        End Try
    End Sub


    Public Sub AtualizarStoredProcedure_Parameter_AnoCod(ByVal NomeStoredProcedure As String, ByVal Ano As Int16, idCod As Int16)
        Dim Conn As New SqlConnection(dbConnect)
        Dim Cmd As New SqlCommand(NomeStoredProcedure, Conn)
        Cmd.CommandType = CommandType.StoredProcedure

        Cmd.Parameters.AddWithValue("@Ano", Ano)
        Cmd.Parameters.AddWithValue("@idCod", idCod)

        Try
            Conn.Open()
            Cmd.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: AtualizarStoredProcedure_Parameter_AnoCod - '" & NomeStoredProcedure & "' - " & ex.Message

        Finally
            Conn.Close()
        End Try
    End Sub


    Public Sub AtualizarStoredProcedure_Parameter_AnoCodFilial(ByVal NomeStoredProcedure As String, ByVal Ano As Int16, idCod As Byte, idFilial As Byte)
        Dim Conn As New SqlConnection(dbConnect)
        Dim Cmd As New SqlCommand(NomeStoredProcedure, Conn)
        Cmd.CommandType = CommandType.StoredProcedure

        Cmd.Parameters.AddWithValue("@Ano", Ano)
        Cmd.Parameters.AddWithValue("@idCod", idCod)
        Cmd.Parameters.AddWithValue("@idFilial", idFilial)

        Try
            Conn.Open()
            Cmd.ExecuteNonQuery()
            Conn.Close()
        Catch ex As Exception
            varDesc = "Módulo: AtualizarStoredProcedure_Parameter_AnoCodFilial - '" & NomeStoredProcedure & "' - " & ex.Message

        Finally
            Conn.Close()
        End Try
    End Sub

    Public Function Scalar_SP_IntTinyTiny(ByVal iAno As Int16, idPrograma As Byte, idPosicao As Byte) As Boolean

        Using connection As New SqlConnection(dbConnect)
            connection.Open()
            Dim command As New SqlCommand("uspCadLiberaPrograma_Status", connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
            command.Parameters("@Ano").Value = iAno

            command.Parameters.Add(New SqlParameter("@idPrograma", SqlDbType.TinyInt))
            command.Parameters("@idPrograma").Value = idPrograma

            command.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
            command.Parameters("@idPosicao").Value = idPosicao

            Dim idStatus As Boolean = command.ExecuteScalar()

            Scalar_SP_IntTinyTiny = idStatus
            varDesc = Err.Description

        End Using
    End Function


    Public Function DefinirFilial(ByVal iFilial As Int16) As Int16
        Dim myFilial As Int16
        myFilial = iFilial
        Select Case myFilial
            Case 60 ' 
                myFilial = 60
            Case Else
                myFilial = myFilial
        End Select
        DefinirFilial = myFilial
    End Function

    Public Sub HabilitarSalvar(ByVal iBtnSalvar As Button, ByVal iAno As Int16, ByVal iPosicao As Byte, ByVal iNumeroPrograma As Byte, ByVal iUser As String)

        Dim oDb As New clDataDb

        If LCase(iUser) = "eder" Or LCase(iUser) = "eliseu" Then
            iBtnSalvar.Enabled = True
        Else
            If CType(oDb.GetDataDB_ExecuteScalar_Parameter3("dbo.uspCadLiberaPrograma_Status", Conexao.gerOrcamento, "@Ano", iAno, "@idPrograma", iNumeroPrograma, "@idPosicao", iPosicao), Boolean) = True Then
                iBtnSalvar.Enabled = True
            Else
                iBtnSalvar.Enabled = False
            End If
        End If

    End Sub


    Public Function DefinirPosicao(ByVal iAno As Int16, iPrograma As Byte) As Byte

        Dim oDb As New clDataDb

        DefinirPosicao = CType(oDb.GetDataDB_ExecuteScalar_Parameter2("usp_IsDefinitive", Conexao.gerOrcamento, "@Ano", iAno, "@idPrograma", iPrograma), Boolean)

    End Function

    Public Function Status_Da_Posicao(ByVal iAno As Int16, idPrograma As Byte, descDepartamento As String) As Byte

        Using connection As New SqlConnection(dbConnect)
            connection.Open()
            Dim command As New SqlCommand("usp_Definir_Posicao", connection)
            command.CommandType = CommandType.StoredProcedure

            command.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
            command.Parameters("@Ano").Value = iAno

            command.Parameters.Add(New SqlParameter("@idPrograma", SqlDbType.TinyInt))
            command.Parameters("@idPrograma").Value = idPrograma

            command.Parameters.Add(New SqlParameter("@Departamento", SqlDbType.NVarChar))
            command.Parameters("@Departamento").Value = descDepartamento

            Dim idStatus As Byte = command.ExecuteScalar()

            Status_Da_Posicao = idStatus
            'varDesc = Err.Description

        End Using
    End Function



End Class
