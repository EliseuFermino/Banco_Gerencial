
Partial Class Controles_wucAguarde
    Inherits System.Web.UI.UserControl

    Public Property CallPanel() As String
        Get
            Return UpdateProgress1.AssociatedUpdatePanelID
        End Get
        Set(ByVal value As String)
            UpdateProgress1.AssociatedUpdatePanelID = value
        End Set
    End Property

End Class
