
Partial Class Controles_wucVendaAcompanhamentoMercadologico
    Inherits System.Web.UI.UserControl

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Dim DiaHoje As Date = DateAndTime.Now()
        Session("sDIA") = DiaHoje
        Session("sFILIAL") = cboFilial.CallFilial
        gridHoras.DataBind()
        gridOntem.DataBind()
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Dim oFun As New Funcoes
            Dim DiaHoje As Date = DateAndTime.Now()
            oVem.AtualizarEstatisticaPrograma(0, Page.User.Identity.Name)

            If CInt(DateAndTime.Now.Hour) > 8 Then
                Session("sDIA") = DiaHoje.Date
            Else
                Session("sDIA") = DiaHoje.Date.AddDays(-1)
            End If


            Session("sDIA") = DiaHoje
            Session("sDIAONTEM") = DiaHoje.AddDays(-1)
            Session("sFILIAL") = cboFilial.CallFilial
            gridHoras.DataBind()

            oFun.Grid_Title(gridHoras, "Venda de Ovos de Pascoa por Hora   " & DiaHoje.Date & " - " & DiaHoje.Date.ToString("dddd"))
            oFun.Grid_Title(gridOntem, "Venda de Ovos de Pascoa por Hora   " & DiaHoje.Date.AddDays(-1) & " - " & DiaHoje.Date.AddDays(-1).Date.ToString("dddd"))


        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If cboFilial.IsLoja = False Then
                cboFilial.CallCorporacao = 199
                cboFilial.DataBindFilial()
                cboFilial.CallFilial = 99

                Session("sFILIAL") = cboFilial.CallFilial
                gridHoras.DataBind()


                cboFilialOntem.Visible_cboCorporacao = False
                cboFilialOntem.Enabled_cboFilial = False
            Else
                Session("sFILIAL") = cboFilial.CallFilial
                gridHoras.DataBind()


                cboFilialOntem.Visible_cboCorporacao = False
                cboFilialOntem.Enabled_cboFilial = False
            End If
        End If
    End Sub
End Class
