Imports System.Math
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnCalculate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculate.Click




        Dim dt1 As DateTime = Convert.ToDateTime(txtEmissao.Text)
        Dim dt2 As DateTime = Convert.ToDateTime(txtDataVencimento.Text)

        Dim ts As TimeSpan = dt2 - dt1
        Dim myTres As Int16 = ts.Days / 3
        Dim meuPrazo As Date = DateAdd(DateInterval.Day, myTres, dt1)

        lblPrazoMaximo.Text = "Data Máxima de Recebimento <br /> " & meuPrazo

    End Sub


    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        lblPrazoMaximo.Text = ""
        txtDataVencimento.Text = ""
        txtEmissao.Text = ""
        txtEmissao.Focus()
    End Sub

   
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVem As New VendaEmpresaMes
        oVem.AtualizarEstatisticaPrograma(302, Page.User.Identity.Name)
    End Sub
End Class
