Imports DevExpress.Web

Partial Class Controles_wucCheckBoxSLV
    Inherits System.Web.UI.UserControl

    Public Event Checked_chkFixarCabecalho(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_AA(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_AT(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_SellOut(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_CAI(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_MesmosDias(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Checked_chkMostrar_Meta(ByVal sender As Object, ByVal e As EventArgs)

#Region " Fixar Cabeçalho"

    Public Property Visible_Cabecalho() As Boolean
        Get
            Return chkFixarCabecalho.Visible
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Visible = value
        End Set
    End Property


    Public Property Checked_Cabecalho() As Boolean
        Get
            Return chkFixarCabecalho.Checked
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Checked = value
        End Set
    End Property

    Public Property Enabled_Cabecalho() As Boolean
        Get
            Return chkFixarCabecalho.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Enabled = value
        End Set
    End Property

    Protected Sub chkFixarCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixarCabecalho.CheckedChanged
        RaiseEvent Checked_chkFixarCabecalho(sender, e)

    End Sub

    Public Property chkFixarCabecalho_Control() As ASPxCheckBox
        Get
            Return chkFixarCabecalho
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkFixarCabecalho = value
        End Set
    End Property

#End Region

#Region " Ano Anterior"

    Public Property Visible_CheckBoxAA() As Boolean
        Get
            Return chkMostrar_AA.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AA.Visible = value
        End Set
    End Property


    Public Property Checked_CheckBoxAA() As Boolean
        Get
            Return chkMostrar_AA.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AA.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxAA() As Boolean
        Get
            Return chkMostrar_AA.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AA.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_AA_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_AA.CheckedChanged
        RaiseEvent Checked_chkMostrar_AA(sender, e)
    End Sub

    Public Property chkMostrar_AA_Control() As ASPxCheckBox
        Get
            Return chkMostrar_AA
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_AA = value
        End Set
    End Property

#End Region

#Region " Ano Atual"

    Public Property Visible_CheckBoxAT() As Boolean
        Get
            Return chkMostrar_AT.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AT.Visible = value
        End Set
    End Property


    Public Property Checked_CheckBoxAT() As Boolean
        Get
            Return chkMostrar_AT.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AT.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxAT() As Boolean
        Get
            Return chkMostrar_AT.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_AT.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_AT_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_AT.CheckedChanged
        RaiseEvent Checked_chkMostrar_AT(sender, e)
    End Sub

    Public Property chkMostrar_AT_Control() As ASPxCheckBox
        Get
            Return chkMostrar_AT
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_AT = value
        End Set
    End Property

#End Region

#Region " Sell-Out"

    Public Property Visible_CheckBoxSellOut() As Boolean
        Get
            Return chkMostrar_SellOut.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_SellOut.Visible = value
        End Set
    End Property


    Public Property Checked_CheckBoxSellOut() As Boolean
        Get
            Return chkMostrar_SellOut.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_SellOut.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxSellOut() As Boolean
        Get
            Return chkMostrar_SellOut.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_SellOut.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_SellOut_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_SellOut.CheckedChanged
        RaiseEvent Checked_chkMostrar_SellOut(sender, e)
    End Sub

    Public Property chkMostrar_SellOut_Control() As ASPxCheckBox
        Get
            Return chkMostrar_SellOut
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_SellOut = value
        End Set
    End Property

#End Region

#Region " CAI"

    Public Property Visible_CheckBoxCAI() As Boolean
        Get
            Return chkMostrar_CAI.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_CAI.Visible = value
        End Set
    End Property

    Public Property Checked_CheckBoxCAI() As Boolean
        Get
            Return chkMostrar_CAI.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_CAI.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxCAI() As Boolean
        Get
            Return chkMostrar_CAI.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_CAI.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_CAI_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_CAI.CheckedChanged
        RaiseEvent Checked_chkMostrar_CAI(sender, e)
    End Sub

    Public Property chkMostrar_CAI_Control() As ASPxCheckBox
        Get
            Return chkMostrar_CAI
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_CAI = value
        End Set
    End Property

#End Region

#Region " Mesmos Dias"

    Public Property Visible_CheckBoxMesmosDias() As Boolean
        Get
            Return chkMostrar_MesmosDias.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_MesmosDias.Visible = value
        End Set
    End Property


    Public Property Checked_CheckBoxMesmosDias() As Boolean
        Get
            Return chkMostrar_MesmosDias.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_MesmosDias.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxMesmosDias() As Boolean
        Get
            Return chkMostrar_MesmosDias.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_MesmosDias.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_MesmosDias_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_MesmosDias.CheckedChanged
        RaiseEvent Checked_chkMostrar_MesmosDias(sender, e)
    End Sub

    Public Property chkMostrar_MesmosDias_Control() As ASPxCheckBox
        Get
            Return chkMostrar_MesmosDias
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_MesmosDias = value
        End Set
    End Property

#End Region

#Region " Meta"

    Public Property Visible_CheckBoxMeta() As Boolean
        Get
            Return chkMostrar_Meta.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_Meta.Visible = value
        End Set
    End Property

    Public Property Checked_CheckBoxMeta() As Boolean
        Get
            Return chkMostrar_Meta.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_Meta.Checked = value
        End Set
    End Property

    Public Property Enabled_CheckBoxMeta() As Boolean
        Get
            Return chkMostrar_Meta.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMostrar_Meta.Enabled = value
        End Set
    End Property

    Protected Sub chkMostrar_Meta_CheckedChanged(sender As Object, e As EventArgs) Handles chkMostrar_Meta.CheckedChanged
        RaiseEvent Checked_chkMostrar_Meta(sender, e)
    End Sub

    Public Property chkMostrar_Meta_Control() As ASPxCheckBox
        Get
            Return chkMostrar_Meta
        End Get
        Set(ByVal value As ASPxCheckBox)
            chkMostrar_Meta = value
        End Set
    End Property

#End Region

End Class
