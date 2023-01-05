
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Marketing_NumerosConvidados
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oCon As New Conexao

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = Year(DateAndTime.Now)
            cboAno.CallAno = Year(DateAndTime.Now)
            Session("sANO") = Year(DateAndTime.Now)

            oVem.AtualizarEstatisticaPrograma(237, Page.User.Identity.Name)
            BuscarTotal()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Total de Convites - PGR237"
        End If
    End Sub


    Public Sub BuscarTotal()

        lblTotalConvidadosGeral.Text = CInt(oCon.spScalar_pAno(Conexao.gerMarketing, "dbo.usp_TotalDeConvidadosGeral", cboAno.CallAno)).ToString("n0")
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = cboAno.CallAno
        lblTotalConvidadosGeral.Text = CInt(oCon.spScalar_pAno(Conexao.gerMarketing, "dbo.usp_TotalDeConvidadosGeral", cboAno.CallAno)).ToString("n0")
        SqlDataSource1.DataBind()
        SqlDataSource2.DataBind()
        SqlDataSource3.DataBind()
        SqlDataSource4.DataBind()
    End Sub
End Class
