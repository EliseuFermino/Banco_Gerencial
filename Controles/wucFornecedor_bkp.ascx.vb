Imports System.Data
Imports System.Data.SqlClient

Partial Class Controles_wucFornecedor
    Inherits System.Web.UI.UserControl

    Public Event txtProdutoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Private Sub BuscarProduto()

        Using connection As New SqlConnection(clData_DW_Condor.dbConnect)
            connection.Open()
            Dim command As New SqlCommand("SELECT nomeFornecedor FROM Cadastros.DimFornecedor WHERE idFornecedor=@idFornecedor", connection)
            Dim nameParameter = New SqlParameter("idFornecedor", Me.txtProduto.Value)
            nameParameter.SqlDbType = SqlDbType.Int
            command.Parameters.Add(nameParameter)
            Dim TotalDeItens As String = command.ExecuteScalar()
            If TotalDeItens = Nothing Then
                Me.lblDados.Text = "Fornecedor não existe!!!"
                Me.lblDados.ForeColor = Drawing.Color.Red
                Me.lblDados.Font.Bold = True
            Else
                Me.lblDados.Text = TotalDeItens
                Me.lblDados.ForeColor = Drawing.Color.Blue
                Me.lblDados.Font.Bold = False
            End If
        End Using


    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback
        Call BuscarProduto()
        Me.ASPxCallbackPanel1.LoadingPanelDelay = 0
    End Sub

    Protected Sub txtProduto_TextChanged(sender As Object, e As EventArgs) Handles txtProduto.TextChanged
        RaiseEvent txtProdutoChanged(sender, e)
    End Sub

    Public Property CallFornecedor() As String
        Get
            Return txtProduto.Value
        End Get
        Set(ByVal value As String)
            txtProduto.Value = value
        End Set
    End Property

    Protected Sub txtProduto_ValueChanged(sender As Object, e As EventArgs) Handles txtProduto.ValueChanged
        RaiseEvent txtProdutoChanged(sender, e)
    End Sub
End Class
