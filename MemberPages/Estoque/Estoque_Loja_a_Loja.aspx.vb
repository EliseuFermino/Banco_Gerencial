
Partial Class MemberPages_Estoque_Loja_a_Loja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(423, User.Identity.Name)
            cboPeriodo.Visible_MesmosDias = False
            cboPeriodo.Enabled_cboDiaFinal = False
            cboPeriodo.Visible_divDescPerioodo_a = False
            cboPeriodo.Visible_cboDiaFinal = False
            cboPeriodo.AutoPostBack_cboDiaInicial = False
           
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Total do Estoque - Loja a Loja - PGR423"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then
            cboSize.CallSize = 100
        End If
    End Sub

#End Region


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial

        grid.Visible = True
        grid.DataBind()

        'lblInfo.Text = "Session(sPRODUTO) " & Session("sPRODUTO") & " <br> Session(sDIA_INICIAL) " & Session("sDIA_INICIAL") & " <br> Session(sDIA_FINAL) " & Session("sDIA_FINAL")

        'If Session("sDIA_FINAL") = DateAndTime.Today Then
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", True)
        '    oFun.Grid_ColumnTitle(grid, "Estoque_Qtde", "Estoque Qtde em <br> " & DateAndTime.Today.Date & " <br> as 06:00 horas")
        'Else
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", False)
        'End If



    End Sub


End Class

