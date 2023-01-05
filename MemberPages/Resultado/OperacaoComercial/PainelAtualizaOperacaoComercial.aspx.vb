
Partial Class MemberPages_Resultado_OperacaoComercial_PainelAtualizaOperacaoComercial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboAno.AnoInicial = 2015
            cboAno.AnoFinal = Year(DateAndTime.Now())
            cboAno.CallAno = Year(DateAndTime.Now())
        End If
    End Sub
End Class
