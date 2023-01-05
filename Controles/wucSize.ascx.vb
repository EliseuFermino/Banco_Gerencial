Imports DevExpress.Web

Partial Class Controles_wucSize
    Inherits System.Web.UI.UserControl

    Public Event SelectedIndexChanged_cboSize(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallSize() As String
        Get
            Return cboSize.Value
        End Get
        Set(ByVal value As String)
            cboSize.Value = value
        End Set
    End Property

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged

        RaiseEvent SelectedIndexChanged_cboSize(sender, e)

    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboSize.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSize.AutoPostBack = value
        End Set
    End Property
 
    Public Property ClientInstanceName() As String
        Get
            Return cboSize.ClientInstanceName
        End Get
        Set(ByVal value As String)
            cboSize.ClientInstanceName = value
        End Set
    End Property

End Class
