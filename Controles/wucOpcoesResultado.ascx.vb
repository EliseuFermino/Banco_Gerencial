
Partial Class Controles_wucOpcoesSLV
    Inherits System.Web.UI.UserControl

    Public Event chk1PeriodoChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chk2PeriodoChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chk3PeriodoChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkAcumuladoChecked(ByVal sender As Object, ByVal e As EventArgs)

    Public Event chkOriP1VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriP2VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriP3VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriAcuVlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriP1PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriP2PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriP3PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkOriAcuPercChecked(ByVal sender As Object, ByVal e As EventArgs)

    Public Event chkRevP1VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevP2VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevP3VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevAcuVlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevP1PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevP2PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevP3PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevAcuPercChecked(ByVal sender As Object, ByVal e As EventArgs)

    Public Event chkReaP1VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaP2VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaP3VlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaAcuVlrChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaP1PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaP2PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaP3PercChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkReaAcuPercChecked(ByVal sender As Object, ByVal e As EventArgs)

    'REVISTA
    Public Event chkRevistaTudo_Checked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevistaValor_Checked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRevistaPerc_Checked(ByVal sender As Object, ByVal e As EventArgs)


    Public Property chk1Periodo_Enabled() As Boolean
        Get
            Return chk1Periodo.Enabled
        End Get
        Set(ByVal value As Boolean)
            chk1Periodo.Enabled = value
        End Set
    End Property

    Public Property chk2Periodo_Enabled() As Boolean
        Get
            Return chk2Periodo.Enabled
        End Get
        Set(ByVal value As Boolean)
            chk2Periodo.Enabled = value
        End Set
    End Property

    Public Property chk3Periodo_Enabled() As Boolean
        Get
            Return chk3Periodo.Enabled
        End Get
        Set(ByVal value As Boolean)
            chk3Periodo.Enabled = value
        End Set
    End Property

    Public Property chkAcumulado_Enabled() As Boolean
        Get
            Return chkAcumulado.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkAcumulado.Enabled = value
        End Set
    End Property


    Public Property chkOriP1Vlr_Enabled() As Boolean
        Get
            Return chkOriP1Vlr.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Vlr.Enabled = value
        End Set
    End Property

    Public Property chkOriP2Vlr_Enabled() As Boolean
        Get
            Return chkOriP2Vlr.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Vlr.Enabled = value
        End Set
    End Property

    Public Property chkOriP3Vlr_Enabled() As Boolean
        Get
            Return chkOriP3Vlr.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Vlr.Enabled = value
        End Set
    End Property

    Public Property chkOriAcuVlr_Enabled() As Boolean
        Get
            Return chkOriAcuVlr.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuVlr.Enabled = value
        End Set
    End Property


    Public Property chkOriP1Perc_Enabled() As Boolean
        Get
            Return chkOriP1Perc.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Perc.Enabled = value
        End Set
    End Property

    Public Property chkOriP2Perc_Enabled() As Boolean
        Get
            Return chkOriP2Perc.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Perc.Enabled = value
        End Set
    End Property

    Public Property chkOriP3Perc_Enabled() As Boolean
        Get
            Return chkOriP3Perc.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Perc.Enabled = value
        End Set
    End Property

    Public Property chkOriAcuPerc_Enabled() As Boolean
        Get
            Return chkOriAcuPerc.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuPerc.Enabled = value
        End Set
    End Property



    Public Property chk1Periodo_Visible() As Boolean
        Get
            Return chk1Periodo.Visible
        End Get
        Set(ByVal value As Boolean)
            chk1Periodo.Visible = value
        End Set
    End Property

    Public Property chk2Periodo_Visible() As Boolean
        Get
            Return chk2Periodo.Visible
        End Get
        Set(ByVal value As Boolean)
            chk2Periodo.Visible = value
        End Set
    End Property

    Public Property chk3Periodo_Visible() As Boolean
        Get
            Return chk3Periodo.Visible
        End Get
        Set(ByVal value As Boolean)
            chk3Periodo.Visible = value
        End Set
    End Property

    Public Property chkAcumulado_Visible() As Boolean
        Get
            Return chkAcumulado.Visible
        End Get
        Set(ByVal value As Boolean)
            chkAcumulado.Visible = value
        End Set
    End Property


    Public Property chkOriP1Perc_Visible() As Boolean
        Get
            Return chkOriP1Perc.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Perc.Visible = value
        End Set
    End Property

    Public Property chkOriP2Perc_Visible() As Boolean
        Get
            Return chkOriP2Perc.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Perc.Visible = value
        End Set
    End Property

    Public Property chkOriP3Perc_Visible() As Boolean
        Get
            Return chkOriP3Perc.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Perc.Visible = value
        End Set
    End Property

    Public Property chkOriAcuPerc_Visible() As Boolean
        Get
            Return chkOriAcuPerc.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuPerc.Visible = value
        End Set
    End Property

    Public Property chkOriP1Vlr_Visible() As Boolean
        Get
            Return chkOriP1Vlr.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Vlr.Visible = value
        End Set
    End Property

    Public Property chkOriP2Vlr_Visible() As Boolean
        Get
            Return chkOriP2Vlr.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Vlr.Visible = value
        End Set
    End Property

    Public Property chkOriP3Vlr_Visible() As Boolean
        Get
            Return chkOriP3Vlr.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Vlr.Visible = value
        End Set
    End Property

    Public Property chkOriAcuVlr_Visible() As Boolean
        Get
            Return chkOriAcuVlr.Visible
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuVlr.Visible = value
        End Set
    End Property


    Public Property chk1Periodo_Checked() As Boolean
        Get
            Return chk1Periodo.Checked
        End Get
        Set(ByVal value As Boolean)
            chk1Periodo.Checked = value
        End Set
    End Property

    Public Property chk2Periodo_Checked() As Boolean
        Get
            Return chk2Periodo.Checked
        End Get
        Set(ByVal value As Boolean)
            chk2Periodo.Checked = value
        End Set
    End Property

    Public Property chk3Periodo_Checked() As Boolean
        Get
            Return chk3Periodo.Checked
        End Get
        Set(ByVal value As Boolean)
            chk3Periodo.Checked = value
        End Set
    End Property

    Public Property chkAcumulado_Checked() As Boolean
        Get
            Return chkAcumulado.Checked
        End Get
        Set(ByVal value As Boolean)
            chkAcumulado.Checked = value
        End Set
    End Property

    Public Property chkOriP1Vlr_Checked() As Boolean
        Get
            Return chkOriP1Vlr.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Vlr.Checked = value
        End Set
    End Property

    Public Property chkOriP2Vlr_Checked() As Boolean
        Get
            Return chkOriP2Vlr.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Vlr.Checked = value
        End Set
    End Property

    Public Property chkOriP3Vlr_Checked() As Boolean
        Get
            Return chkOriP3Vlr.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Vlr.Checked = value
        End Set
    End Property

    Public Property chkOriAcuVlr_Checked() As Boolean
        Get
            Return chkOriAcuVlr.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuVlr.Checked = value
        End Set
    End Property


    Public Property chkOriP1Perc_Checked() As Boolean
        Get
            Return chkOriP1Perc.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP1Perc.Checked = value
        End Set
    End Property

    Public Property chkOriP2Perc_Checked() As Boolean
        Get
            Return chkOriP2Perc.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP2Perc.Checked = value
        End Set
    End Property

    Public Property chkOriP3Perc_Checked() As Boolean
        Get
            Return chkOriP3Perc.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriP3Perc.Checked = value
        End Set
    End Property

    Public Property chkOriAcuPerc_Checked() As Boolean
        Get
            Return chkOriAcuPerc.Checked
        End Get
        Set(ByVal value As Boolean)
            chkOriAcuPerc.Checked = value
        End Set
    End Property


    ' -- CABEÇALHOS
    Public Property Panel1_Visible() As Boolean
        Get
            Return Panel1.Visible
        End Get
        Set(ByVal value As Boolean)
            Panel1.Visible = value
        End Set
    End Property

    Public Property Panel2_Visible() As Boolean
        Get
            Return Panel2.Visible
        End Get
        Set(ByVal value As Boolean)
            Panel2.Visible = value
        End Set
    End Property

    Public Property PanelRevista_Visible() As Boolean
        Get
            Return Panel_Revista.Visible
        End Get
        Set(ByVal value As Boolean)
            Panel_Revista.Visible = value
        End Set
    End Property

    Public Property Panel4_Visible() As Boolean
        Get
            Return Panel4.Visible
        End Get
        Set(ByVal value As Boolean)
            Panel4.Visible = value
        End Set
    End Property


    ' -- REVISTA -------------------------------------------------------------------------
    Public Property Revista_Tudo_Visible() As Boolean
        Get
            Return chkRevista_Tudo.Visible
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Tudo.Visible = value
        End Set
    End Property

    Public Property Revista_Valor_Visible() As Boolean
        Get
            Return chkRevista_Valor.Visible
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Valor.Visible = value
        End Set
    End Property

    Public Property Revista_Percentual_Visible() As Boolean
        Get
            Return chkRevista_Perc.Visible
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Perc.Visible = value
        End Set
    End Property

    Public Property Revista_Tudo_Checked() As Boolean
        Get
            Return chkRevista_Tudo.Checked
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Tudo.Checked = value
        End Set
    End Property

    Public Property Revista_Valor_Checked() As Boolean
        Get
            Return chkRevista_Valor.Checked
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Valor.Checked = value
        End Set
    End Property

    Public Property Revista_Percentual_Checked() As Boolean
        Get
            Return chkRevista_Perc.Checked
        End Get
        Set(ByVal value As Boolean)
            chkRevista_Perc.Checked = value
        End Set
    End Property

    ' -----------------------------------------------------------------------------------

    Protected Sub chk1Periodo_CheckedChanged(sender As Object, e As EventArgs) Handles chk1Periodo.CheckedChanged
        RaiseEvent chk1PeriodoChecked(sender, e)
    End Sub

    Protected Sub chk2Periodo_CheckedChanged(sender As Object, e As EventArgs) Handles chk2Periodo.CheckedChanged
        RaiseEvent chk2PeriodoChecked(sender, e)
    End Sub

    Protected Sub chk3Periodo_CheckedChanged(sender As Object, e As EventArgs) Handles chk3Periodo.CheckedChanged
        RaiseEvent chk3PeriodoChecked(sender, e)
    End Sub

    Protected Sub chkAcumulado_CheckedChanged(sender As Object, e As EventArgs) Handles chkAcumulado.CheckedChanged
        RaiseEvent chkAcumuladoChecked(sender, e)
    End Sub

    Protected Sub chkOriP1Vlr_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP1Vlr.CheckedChanged
        RaiseEvent chkOriP1VlrChecked(sender, e)
    End Sub

    Protected Sub chkOriP2Vlr_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP2Vlr.CheckedChanged
        RaiseEvent chkOriP2VlrChecked(sender, e)
    End Sub

    Protected Sub chkOriP3Vlr_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP3Vlr.CheckedChanged
        RaiseEvent chkOriP3VlrChecked(sender, e)
    End Sub

    Protected Sub chkOriAcuVlr_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriAcuVlr.CheckedChanged
        RaiseEvent chkOriAcuVlrChecked(sender, e)
    End Sub


    Protected Sub chkOriP1Perc_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP1Perc.CheckedChanged
        RaiseEvent chkOriP1PercChecked(sender, e)
    End Sub

    Protected Sub chkOriP2Perc_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP2Perc.CheckedChanged
        RaiseEvent chkOriP2PercChecked(sender, e)
    End Sub

    Protected Sub chkOriP3Perc_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriP3Perc.CheckedChanged
        RaiseEvent chkOriP3PercChecked(sender, e)
    End Sub

    Protected Sub chkOriAcuPerc_CheckedChanged(sender As Object, e As EventArgs) Handles chkOriAcuPerc.CheckedChanged
        RaiseEvent chkOriAcuPercChecked(sender, e)
    End Sub

    Protected Sub chkRevista_Tudo_CheckedChanged(sender As Object, e As EventArgs) Handles chkRevista_Tudo.CheckedChanged
        RaiseEvent chkRevistaTudo_Checked(sender, e)
    End Sub

    Protected Sub chkRevista_Valor_CheckedChanged(sender As Object, e As EventArgs) Handles chkRevista_Valor.CheckedChanged
        RaiseEvent chkRevistaValor_Checked(sender, e)
    End Sub

    Protected Sub chkRevista_Perc_CheckedChanged(sender As Object, e As EventArgs) Handles chkRevista_Perc.CheckedChanged
        RaiseEvent chkRevistaPerc_Checked(sender, e)
    End Sub
End Class
