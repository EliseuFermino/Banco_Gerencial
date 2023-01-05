
Partial Class wucMes
    Inherits System.Web.UI.UserControl

    Public Event ListMesChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListMesFinalChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallMes() As Byte
        Get
            Return cboMes.Value
        End Get
        Set(ByVal value As Byte)
            cboMes.Value = value
        End Set
    End Property

    Public Property CallMesFinal() As Byte
        Get
            Return cboMesFinal.Value
        End Get
        Set(ByVal value As Byte)
            cboMesFinal.Value = value
        End Set
    End Property

    Public Property CallMesDesc() As String
        Get
            Return cboMes.Text
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Protected Sub cboMes_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.Load

        If Not IsPostBack Then
            Me.cboMes.Value = CByte(Month(Now()))
            Session("sMES") = CByte(Month(Now()))

            cboMesFinal.Value = Session("sMES")
            Session("sMES_FINAL") = Session("sMES")

        End If

    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Session("sMES") = cboMes.Value
        RaiseEvent ListMesChanged(sender, e)


    End Sub

    Public Property Enabled_cboMes() As Boolean
        Get
            Return cboMes.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboMes.Enabled = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboMes.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboMes.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_MesFinal() As Boolean
        Get
            Return cboMesFinal.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboMesFinal.AutoPostBack = value
        End Set
    End Property

    Public Property Visible_cboMes_Final() As Boolean
        Get
            Return cboMesFinal.Visible
        End Get
        Set(ByVal value As Boolean)
            cboMesFinal.Visible = value

            If cboMesFinal.Visible = True Then
                cboMes.Caption = "Mês Inicial"
            Else
                cboMes.Caption = "Mês"
            End If
        End Set
    End Property

    Protected Sub cboMesFinal_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboMesFinal.SelectedIndexChanged
        Session("sMES_FINAL") = cboMesFinal.Value
        RaiseEvent ListMesFinalChanged(sender, e)
    End Sub

    Public Property Visible_Ano() As Boolean
        Get
            Return chkAno.Visible
        End Get
        Set(ByVal value As Boolean)
            chkAno.Visible = value
            
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
