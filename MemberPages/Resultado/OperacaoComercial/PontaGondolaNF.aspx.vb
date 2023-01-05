
Partial Class MemberPages_Resultado_OperacaoComercial_PontaGondolaNF
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim varMes As Byte = Month(DateAndTime.Now())

            oVem.AtualizarEstatisticaPrograma(150, User.Identity.Name)

            Me.cboAno.AutoPostBack = False
            Me.cboAno.AnoInicial = 2015
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())

            Me.cboMes.CallMes = varMes - 1

            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ponta de Gondola e Sell-Out Aberta por Titulo - PGR150"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja Then
                Me.cboFilial.Visible_cboCorporacao = False

            Else

                Me.cboFilial.CallFilial = 3

            End If
            Call CreateSession()
            Me.grid.DataBind()

        End If
    End Sub

    Private Sub CreateSession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial

        If rndAg249.Checked = True Then
            Session("sAGENDA") = 249
            lblDesc.Text = "O valor total da Agenda 249 (Ponta de Gondola) vai para o Teórico de " & cboMes.CallMesDesc & "/" & cboAno.CallAno & "."
        End If

        If rndAg500.Checked = True Then
            Session("sAGENDA") = 500
            lblDesc.Text = "O valor total da Agenda 500 (Sell-Out) vai para o Teórico de " & cboMes.CallMesDesc & "/" & cboAno.CallAno & "."
        End If

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        'Exibir todos os dados ou não (colocar barra de rolagem)
        If Me.chkFixar.Checked = False Then
            grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        Else
            grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        End If

        Call CreateSession()
        Me.grid.DataBind()

    End Sub
End Class
