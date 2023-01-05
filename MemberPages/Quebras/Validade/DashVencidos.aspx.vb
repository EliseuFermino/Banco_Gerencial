
Partial Class MemberPages_Quebras_Validade_DashVencidos
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oFun.Grid_Title(gridVencidosHojes, "Produtos Lançados Hoje")
            oFun.Grid_Title(gridVencidosOntem, "Produtos Lançados Ontem")
            oFun.Grid_Title(gridVencidosDia, "Produtos Lançados em " & DateAndTime.Today.AddDays(-2))

            gridVencidosDia.DataBind()
            gridVencidosOntem.DataBind()
            gridVencidosHojes.DataBind()


        End If
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sDIA") = cboDia.Date
        dsVencidosDia.DataBind()
        gridVencidosDia.DataBind()
        oFun.Grid_Title(gridVencidosDia, "Produtos Lançados em " & Session("sDIA"))
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboDia.Date = DateAndTime.Today.AddDays(-2)
            Session("sDIA") = DateAndTime.Today.AddDays(-2)
            gridVencidosDia.DataBind()
            gridVencidosOntem.DataBind()
            gridVencidosHojes.DataBind()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Produtos Vencidos por Lançamento - PGR306"
        End If
    End Sub

End Class
