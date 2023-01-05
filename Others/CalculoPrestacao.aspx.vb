Imports System.Math
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnCalculate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculate.Click
        Dim LoanPayment As Double
        'Use Pmt function to determine payment for 36 month loan

        LoanPayment = Pmt(CDbl((Me.txtInterest.Text) / 12) / 10, txtMeses.Text, CDbl(Me.txtAmount.Text))
        txtPayment.Text = Format(Abs(LoanPayment), "R$ #,##0.00")

    End Sub

   

    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        Me.txtAmount.Text = ""
        Me.txtInterest.Text = ""
        Me.txtMeses.Text = ""
        Me.txtPayment.Text = ""
        Me.txtAmount.Focus()
    End Sub
End Class
