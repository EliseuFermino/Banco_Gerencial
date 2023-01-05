
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page

   

    Private Sub AtualizarTitulo()
        Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.CallAno & ". Seção " & Me.cboSecao.CallSecaoDesc & "."
    End Sub


    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Atualizar()
        Call AtualizarTitulo()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Atualizar()
        Call AtualizarTitulo()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(41, User.Identity.Name)

            Me.cboAno.AnoInicial = 2013
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now()) + 1
            Me.cboSecao.CallSecao = 1

            Atualizar()

            Me.cboSecao.AutoPostBack = True
            cboAno.AutoPostBack = True
            cboPosicao.AutoPostBack = True
            Call AtualizarTitulo()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Meta Original das Vendas por Seção Anual "
            Call AtualizarTitulo()
        End If

    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Atualizar()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Me.cboSecao.CallSecaoDesc = "01-Seca Pesada"
            Call AtualizarTitulo()
            Me.ASPxGridView1.DataBind()
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        Dim oFun As New Funcoes
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sSECAO") = Me.cboSecao.CallSecao
        Session("sPOSICAO") = Me.cboPosicao.CallPosicao
        Me.ASPxGridView1.DataBind()
    End Sub

End Class
