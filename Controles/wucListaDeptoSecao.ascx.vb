
Imports System
Imports Microsoft.VisualBasic


Partial Class Controles_wucLista_DeptoSecao
    Inherits System.Web.UI.UserControl

    Dim strConn As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Public Event ListDeptoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDepto() As Byte
        Get
            Return cboDepto.Value
        End Get
        Set(ByVal value As Byte)
            cboDepto.Value = value
        End Set
    End Property

    Public Property CallDeptoDescricao() As String
        Get
            Return cboDepto.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboDepto.SelectedItem.Text = value
        End Set
    End Property

    Public Property CallSecao() As Int16
        Get
            Return cboSecao.Value
        End Get
        Set(ByVal value As Int16)
            cboSecao.Value = value
        End Set
    End Property

    Public Property CallSecaoDescricao() As String
        Get
            Return cboSecao.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboSecao.SelectedItem.Text = value
        End Set
    End Property

#Region " Visible"

    Public Property Visible_Depto() As Boolean
        Get
            Return cboDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            cboDepto.Visible = value
        End Set
    End Property

    Public Property Visible_Secao() As Boolean
        Get
            Return cboSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSecao.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaDepto() As Boolean
        Get
            Return lblDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            lblDepto.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaSecao() As Boolean
        Get
            Return lblSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            lblSecao.Visible = value
        End Set
    End Property

#End Region

#Region " AutoPostBack"

    Public Property AutoPostBack_Depto() As Boolean
        Get
            Return cboDepto.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDepto.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_Secao() As Boolean
        Get
            Return cboSecao.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSecao.AutoPostBack = value
        End Set
    End Property
#End Region

    Protected Sub cboSecao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboSecao.Callback
        FillCityCombo(e.Parameter)
    End Sub

    Protected Sub FillCityCombo(ByVal depto As Byte)
        If String.IsNullOrEmpty(depto) Then
            Return
        End If

        dsSecao.SelectParameters(0).DefaultValue = depto
        cboSecao.DataBind()
    End Sub

    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSecao.SelectedIndexChanged
        RaiseEvent ListSecaoChanged(sender, e)
    End Sub

    Protected Sub cboDepto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboDepto.SelectedIndexChanged
        RaiseEvent ListDeptoChanged(sender, e)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

            FillCityCombo(1)
            cboSecao.SelectedIndex = 0
        End If
    End Sub
End Class
