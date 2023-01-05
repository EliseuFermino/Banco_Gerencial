Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports DevExpress.Web

Public Class SLV

#Region " Functions"

    Private Sub ExcluirMercadologicoDoUsuario(ByVal iTipo As Byte, ByVal iNomeDaTabela As String, iUser As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        Dim deleteSQL = "DELETE FROM " & iNomeDaTabela & " WHERE Usuario = ('" & iUser & "')"
        Dim deleteCommand = New SqlCommand(deleteSQL, connection)

        Try
            connection.Open()
            deleteCommand.ExecuteNonQuery()
        Catch ex As Exception
            'Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub

    Private Sub InserirMercadologico(ByVal iListaDeMercadologico As ASPxListBox, ByVal iNomeDaTabela As String, iUser As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        For Each item In iListaDeMercadologico.SelectedValues

            Dim idMercadologico As Int16 = item.ToString

            Dim insertSQL = "INSERT INTO " & iNomeDaTabela & " (Usuario,idMercadologico) VALUES ('" & iUser & "', '" & idMercadologico & "')"
            Dim insertCommand = New SqlCommand(insertSQL, connection)

            Try
                connection.Open()
                insertCommand.ExecuteNonQuery()
            Catch ex As Exception
                'Me.lblError.Text = Err.Description
            Finally
                connection.Close()
            End Try



        Next
    End Sub

    Public Sub AtualizarMercadologico(ByVal iListaDeMercadologico As ASPxListBox, ByVal iNumeroMercadologico As Int16, iNomeDaTabela As String, iUser As String)
        If iListaDeMercadologico.SelectedValues.Count > 0 Then
            ExcluirMercadologicoDoUsuario(iNumeroMercadologico, iNomeDaTabela, iUser)
            InserirMercadologico(iListaDeMercadologico, iNomeDaTabela, iUser)
        End If
    End Sub

    Public Function idMercadologicoDaLista(ByVal iListaDeMercadologico As ASPxListBox) As UShort
        Dim varMercadologico As UShort
        For Each item In iListaDeMercadologico.SelectedValues
            Dim idMercadologico As Int16 = item.ToString
            varMercadologico = idMercadologico
        Next
        idMercadologicoDaLista = varMercadologico
    End Function

    Public Function nomeMercadologicoDaLista(ByVal iListaDeMercadologico As ASPxListBox) As String
        Dim varNomeMercadologico As String
        varNomeMercadologico = ""
        For Each nomeItem In iListaDeMercadologico.SelectedItems
            Dim strMercadologico As String = nomeItem.ToString
            varNomeMercadologico = strMercadologico
        Next
        nomeMercadologicoDaLista = varNomeMercadologico
    End Function






#End Region


End Class
