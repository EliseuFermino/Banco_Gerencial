Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Threading
Imports System.Data
Imports System.Data.SqlClient

Partial Class Controles_wucProdutoEncontra
    Inherits System.Web.UI.UserControl

    Public Event txtProdutoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If myPopupControl.IsCallback Then
            ' Intentionally pauses server-side processing, 
            ' to demonstrate the Loading Panel functionality.

            Session("sPRODUTO_PROCURA") = LTrim(RTrim(Me.txtFiltro_ProdutoInforma.Text))
            Session("sSTATUS") = cboFiltroStatus.Value
            dsFiltroProduto.DataBind()
            Thread.Sleep(500)
        End If

    End Sub

    Private Sub BuscarProduto()


        Using connection As New SqlConnection(clData_DW_Condor.dbConnect)
            connection.Open()
            Dim command As New SqlCommand("SELECT nomeProduto FROM Cadastros.DimProduto WHERE idProduto=@idProduto", connection)
            Dim nameParameter = New SqlParameter("idProduto", txtProdutocodigoEncontrado.Value)
            nameParameter.SqlDbType = SqlDbType.Int
            command.Parameters.Add(nameParameter)
            Dim TotalDeItens As String = command.ExecuteScalar()
            txtProdutoNomeEncontrado.Text = TotalDeItens
            If TotalDeItens = Nothing Then
                txtProdutoNomeEncontrado.Text = "Produto não existe!!!"
                txtProdutoNomeEncontrado.ForeColor = Drawing.Color.Red
                txtProdutoNomeEncontrado.Font.Bold = True
            Else
                txtProdutoNomeEncontrado.Text = TotalDeItens.ToString
                txtProdutoNomeEncontrado.Font.Bold = False
                Session("sNOME_PRODUTO") = LTrim(RTrim(TotalDeItens))
                Session("sPRODUTO") = LTrim(RTrim(Me.txtProdutocodigoEncontrado.Text))
            End If
        End Using
    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback

        Call BuscarProduto()
    End Sub


    Public Property CallProduto() As String
        Get
            Return txtProdutocodigoEncontrado.Value
        End Get
        Set(ByVal value As String)
            txtProdutocodigoEncontrado.Value = value
        End Set
    End Property
  
    Protected Sub txtProdutocodigoEncontrado_TextChanged(sender As Object, e As EventArgs) Handles txtProdutocodigoEncontrado.TextChanged

        RaiseEvent txtProdutoChanged(sender, e)
    End Sub

    Protected Sub gridFiltroProduto_FocusedRowChanged(sender As Object, e As EventArgs) Handles gridFiltroProduto.FocusedRowChanged
        Session("sPRODUTO") = LTrim(RTrim(Me.txtProdutocodigoEncontrado.Text))
    End Sub

   
 
   
End Class
