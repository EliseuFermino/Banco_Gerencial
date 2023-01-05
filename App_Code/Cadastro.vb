Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Cadastro

    Private connManager As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Private vDesc As String
    Private vDeptoDesc As String
    Private vDeptoID As String
    Private vSecaoDesc As String
    Private vSecaoID As String
    Private vDescProduto As String
    Private vGrupoDesc As String
    Private vSubGrupoDesc As String


    Public Property varDesc() As String
        Get
            varDesc = vDesc
        End Get
        Set(ByVal value As String)
            vDesc = value
        End Set
    End Property

    Public Property varDeptoDesc() As String
        Get
            varDeptoDesc = vDeptoDesc
        End Get
        Set(ByVal value As String)
            vDeptoDesc = value
        End Set
    End Property

    Public Property varDeptoID() As String
        Get
            varDeptoID = vDeptoID
        End Get
        Set(ByVal value As String)
            vDeptoID = value
        End Set
    End Property

    Public Property varSecaoDesc() As String
        Get
            varSecaoDesc = vSecaoDesc
        End Get
        Set(ByVal value As String)
            vSecaoDesc = value
        End Set
    End Property

    Public Property varDescProduto() As String
        Get
            varDescProduto = vDescProduto
        End Get
        Set(ByVal value As String)
            vDescProduto = value
        End Set
    End Property

    Public Property varGrupoDesc() As String
        Get
            varGrupoDesc = vGrupoDesc
        End Get
        Set(ByVal value As String)
            vGrupoDesc = value
        End Set
    End Property

    Public Property varSubGrupoDesc() As String
        Get
            varSubGrupoDesc = vSubGrupoDesc
        End Get
        Set(ByVal value As String)
            vSubGrupoDesc = value
        End Set
    End Property

    Sub Busca_CodDepto(ByVal iSecao As Int32)
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspCadSecaoBusca_Depto", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@idSecao", iSecao)
                Try
                    con.Open()
                    Dim reader5 As SqlDataReader
                    reader5 = cmdTest.ExecuteReader()
                    While reader5.Read
                        varDeptoID = reader5.GetSqlInt32(0)
                    End While
                    con.Close()
                Catch ex As Exception
                    varDesc = ex.Message
                Finally
                    con.Close()
                End Try
            End Using
        End Using
    End Sub

    Sub BuscaMercadologicoProduto(ByVal iProduto As String)
        Using con As New SqlConnection(connManager)
            Using cmdTest As New SqlCommand("uspCadProdutosBusca", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@CodProduto", iProduto)
                Try
                    con.Open()
                    Dim reader5 As SqlDataReader
                    reader5 = cmdTest.ExecuteReader()
                    While reader5.Read
                        varDescProduto = reader5.GetSqlString(1)
                        varDeptoDesc = reader5.GetSqlString(2)
                        varSecaoDesc = reader5.GetSqlString(3)
                        varGrupoDesc = reader5.GetSqlString(4)
                        varSubGrupoDesc = reader5.GetSqlString(5)
                    End While
                    con.Close()
                Catch ex As Exception
                    varDesc = ex.Message
                Finally
                    con.Close()
                End Try
            End Using
        End Using
    End Sub



End Class
