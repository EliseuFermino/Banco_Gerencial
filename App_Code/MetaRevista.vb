
#Region " Imports"

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

#End Region

Public Class MetaRevista

#Region " Variables"

    Private vVlrRev As String
    Private vPercRev As String
    Private vDesc As String

    Dim oVem As New VendaEmpresaMes

#End Region

#Region " Property"

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

    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

#End Region

    Public Sub BuscaRevGrupoMes(ByVal iCod As Int16, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iFilial As Byte)

        Dim con As New SqlConnection(Conexao.gerMetas)
        Dim comando As New SqlCommand("Filial.uspRevMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
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
            Beep()
            oVem.UserMsgBox(Me, ex.Message)
            varDesc = ex.Message
        Finally
            con.Close()
        End Try
    End Sub

End Class
