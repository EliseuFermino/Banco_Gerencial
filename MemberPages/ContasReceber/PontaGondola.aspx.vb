
Partial Class MemberPages_ContasReceber_PontaGondola
    Inherits System.Web.UI.Page

    Dim oDT As New myDateTimes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            cboAno.AnoFinal = oDT.YearToday
            cboAno.AnoInicial = oDT.YearAA
            cboAno.CallAno = oDT.YearToday

            cboAno1.AnoFinal = oDT.YearToday
            cboAno1.AnoInicial = oDT.YearAA
            cboAno1.CallAno = oDT.YearToday

            cboFilial.AutoPostBack = True
        End If




    End Sub


    Private Sub mySession()
        Session("sANO") = cboAno.CallAno
        Session("sANO") = cboAno1.CallAno
        Session("sMES") = cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial

        gridPG_por_Mes_Selecionado.DataBind()
        gridPG_por_Ano_Selecionado.DataBind()

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then
            mySession()

        End If

    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        mySession()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        mySession()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        mySession()
    End Sub

    Protected Sub cboAno1_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno1.ListAnoChanged
        mySession()
    End Sub
End Class
