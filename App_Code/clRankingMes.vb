Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clRankingMes
    Private vVlrMeta As Decimal
    Private vVlrReal As Decimal

    Dim connString As String = clData_gerVendas.dbConnect  ' "Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerVendas;User ID=sa; PWD=rd700@1"

    Public Property vlrMeta() As Decimal
        Get
            vlrMeta = vVlrMeta
        End Get
        Set(ByVal value As Decimal)
            vVlrMeta = value
        End Set
    End Property

    Public Property vlrReal() As Decimal
        Get
            vlrReal = vVlrReal
        End Get
        Set(ByVal value As Decimal)
            vVlrReal = value
        End Set
    End Property

    Sub BuscaTotalRankingMes(ByVal iAno As String, ByVal iMes As String)
        Dim con As New SqlConnection(connString)
        Dim comando As New SqlCommand("Mes.uspBuscarRankingMes_Total", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                vlrMeta = reader5.GetSqlMoney(0)
                vlrReal = reader5.GetSqlMoney(1)
            End While

        Catch ex As Exception
            Beep()

        Finally
            con.Close()
        End Try
    End Sub

End Class
