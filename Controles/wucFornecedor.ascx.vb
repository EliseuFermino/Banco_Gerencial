Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Threading
Imports System.Data
Imports System.Data.SqlClient

Partial Class Controles_wucFornecedor
    Inherits System.Web.UI.UserControl

    Public Event txtFornecedorChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkCNPJChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If myPopupControl_Fornecedor.IsCallback Then
            ' Intentionally pauses server-side processing, 
            ' to demonstrate the Loading Panel functionality.
            Session("sFORNECEDOR_ENCONTRA") = Me.txtFiltro_FornecedorInforma.Text
            Session("sSTATUS") = cboFiltroStatus_Fornecedor.Value
            dsFiltroFornecedor.DataBind()
            Thread.Sleep(500)
        End If

    End Sub

    Private Sub BuscarProduto()
        Using connection As New SqlConnection(clData_DW_Condor.dbConnect)
            connection.Open()
            Dim command As New SqlCommand("SELECT nomeFornecedor FROM Cadastros.DimFornecedor WHERE idFornecedor=@idFornecedor", connection)
            Dim nameParameter = New SqlParameter("idFornecedor", txtFornecedorcodigoEncontrado.Value)
            nameParameter.SqlDbType = SqlDbType.Int
            command.Parameters.Add(nameParameter)
            Dim TotalDeItens As String = command.ExecuteScalar()
            txtFornecedorNomeEncontrado.Text = TotalDeItens
            If TotalDeItens = Nothing Then
                txtFornecedorNomeEncontrado.Text = "Fornecedor não existe!!!"
                txtFornecedorNomeEncontrado.ForeColor = Drawing.Color.Red
                txtFornecedorNomeEncontrado.Font.Bold = True
            Else
                txtFornecedorNomeEncontrado.Text = TotalDeItens
                txtFornecedorNomeEncontrado.Font.Bold = False
            End If
        End Using
    End Sub

    Protected Sub cbPanelFornecedor_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelFornecedor.Callback
        Call BuscarProduto()
    End Sub


    Public Property CallFornecedor() As String
        Get
            Return txtFornecedorcodigoEncontrado.Value
        End Get
        Set(ByVal value As String)
            txtFornecedorcodigoEncontrado.Value = value
        End Set
    End Property

    Public Property NomeFornecedor() As String
        Get
            Return txtFornecedorNomeEncontrado.Value
        End Get
        Set(ByVal value As String)
            txtFornecedorNomeEncontrado.Value = value
        End Set
    End Property


    Public Property CNPJ_Principal_Checked() As Boolean
        Get
            Return chkCNPJ_Principal.Checked
        End Get
        Set(ByVal value As Boolean)
            chkCNPJ_Principal.Checked = value
        End Set
    End Property

    Public Property CNPJ_Principal_Visible() As Boolean
        Get
            Return chkCNPJ_Principal.Visible
        End Get
        Set(ByVal value As Boolean)
            chkCNPJ_Principal.Visible = value
        End Set
    End Property

    Public Property CNPJ_Principal_Enabled() As Boolean
        Get
            Return chkCNPJ_Principal.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkCNPJ_Principal.Enabled = value
        End Set
    End Property

    Protected Sub txtFornecedorcodigoEncontrado_TextChanged(sender As Object, e As EventArgs) Handles txtFornecedorcodigoEncontrado.TextChanged
        RaiseEvent txtFornecedorChanged(sender, e)
    End Sub

    Protected Sub chkCNPJ_Principal_CheckedChanged(sender As Object, e As EventArgs) Handles chkCNPJ_Principal.CheckedChanged
        RaiseEvent chkCNPJChanged(sender, e)
    End Sub

    
End Class