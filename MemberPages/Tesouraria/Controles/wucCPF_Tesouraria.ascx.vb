
Partial Class MemberPages_Tesouraria_Controles_wucCPF_Tesouraria
    Inherits System.Web.UI.UserControl

    Public Event ListCPFChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub cboCPF_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCPF.SelectedIndexChanged
        RaiseEvent ListCPFChanged(sender, e)
    End Sub

    Public Property CallCPF() As Int64
        Get
            Return cboCPF.Value
        End Get
        Set(ByVal value As Int64)
            cboCPF.Value = value
        End Set
    End Property

End Class
