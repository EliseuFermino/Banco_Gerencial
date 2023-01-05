Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Comercial_Meta_Comercial_7
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(382, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2019
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False

            cboMes.AutoPostBack = False
            cboMes.AutoPostBack_MesFinal = False
            cboMes.Visible_cboMes_Final = True





        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Meta Comercial - Venda e Margem Final (PDV + SellOut) - PGR382"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()
            cboMes.CallMes = 1
            cboMes.CallMesFinal = Month(DateAndTime.Now.AddDays(-1)) - 1
            Session("sMES") = 1
            Session("sMES_FINAL") = Month(DateAndTime.Now.AddDays(-1)) - 1
            ' -----------

            Dim iProj As New Projeto
            If LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "comercial" Then
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            ElseIf LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "gestor_comercial" Then
                Session("sTIPO_LISTA") = 2  ' Gestor_Comercial
                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If

            ' -----------

            Atualizar()

            'oFun.Grid_Column_BorderLeft(grid, "vlrMetaVenda", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(grid, "percAtingVendas", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(grid, "percAtingLucro", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(grid, "difPercMargem", Drawing.Color.Gray, BorderStyle.Solid, 1)
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno

    End Sub

    Private Sub Atualizar()
        mySession()
        Me.grid.DataBind()
    End Sub


End Class
