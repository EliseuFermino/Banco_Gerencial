﻿
Partial Class wucListaSecao_Depto5
    Inherits System.Web.UI.UserControl

    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallSecao() As Int16
        Get
            Return cboSecao.Value
        End Get
        Set(ByVal value As Int16)
            cboSecao.Value = value
        End Set
    End Property

    Public Property cboSecao_Enabled() As Boolean
        Get
            Return cboSecao.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSecao.Enabled = value
        End Set
    End Property

    Public Property cboSecao_Visible() As Boolean
        Get
            Return cboSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSecao.Visible = value
        End Set
    End Property

    Public Property cboSecao_VisibleLabel() As Boolean
        Get
            Return lblSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            lblSecao.Visible = value
        End Set
    End Property


    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSecao.SelectedIndexChanged
        RaiseEvent ListSecaoChanged(sender, e)
    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboSecao.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSecao.AutoPostBack = value
        End Set
    End Property

    Public Property CallSecaoDesc() As String
        Get
            Return cboSecao.Text
        End Get
        Set(ByVal value As String)
            cboSecao.Text = value
        End Set
    End Property

End Class
