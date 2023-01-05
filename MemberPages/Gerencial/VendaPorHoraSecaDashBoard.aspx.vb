
Partial Class MemberPages_Gerencial_VendaPorHoraSecaDashBoard
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(253, User.Identity.Name)

            cboDia.CallDia = Today
            cboDia.AutoPostBack = False
            cboDia.Visible_btnAvanca = False
            cboDia.Visible_btnVolta = False
            cboDia.Visible_lblDiaDaSemana = False

            Me.cboFilial.AutoPostBack = False

            Me.cboSecao.CallSecao = 1


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Hora e por Seção Semanal - PGR253"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            Me.cboSecao.CallSecao = 1
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Dim day1, day2, day3, day4, day5, day6 As Date

        day1 = cboDia.CallDia
        day2 = day1.AddDays(-7)
        day3 = day2.AddDays(-7)
        day4 = day3.AddDays(-7)
        day5 = day4.AddDays(-7)
        day6 = day5.AddDays(-7)

        Session("sDIAINICIAL1") = day1
        Session("sDIAINICIAL2") = day2
        Session("sDIAINICIAL3") = day3
        Session("sDIAINICIAL4") = day4
        Session("sDIAINICIAL5") = day5
        Session("sDIAINICIAL6") = day6

        lblGraph1.Text = day1 & " - " & WeekdayName(Weekday(day1))
        lblGraph2.Text = day2 & " - " & WeekdayName(Weekday(day2))
        lblGraph3.Text = day3 & " - " & WeekdayName(Weekday(day3))
        lblGraph4.Text = day4 & " - " & WeekdayName(Weekday(day4))
        lblGraph5.Text = day5 & " - " & WeekdayName(Weekday(day5))
        lblGraph6.Text = day6 & " - " & WeekdayName(Weekday(day6))

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = Me.cboSecao.CallSecao
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

End Class

