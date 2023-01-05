
Imports System.Data

Partial Class MemberPages_Inventario_Programa_Estatistic
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Call Contagem1()
        Call Contagem2()
        Call Contagem3()
    End Sub

    Private Sub Contagem1()

        Dim varNumInv As Byte
        varNumInv = 8

        Dim dt As DataTable = clData_gerInv.TableGet("Programa.viewTotalDeLotes", varNumInv)
        Dim dr As DataRow = dt.Rows(0)

        Dim dt1 As DataTable = clData_gerInv.TableGet("Programa.qsel1EstatisticaLiberado", varNumInv)
        Dim dr1 As DataRow = dt1.Rows(0)

        Dim dt2 As DataTable = clData_gerInv.TableGet("Programa.qsel1EstatisticaBaixa", varNumInv)
        Dim dr2 As DataRow = dt2.Rows(0)


        Me.lblTotal.Text = CDbl(dr("Total")).ToString("n0")
        Me.lblDespachados1.Text = dr1("TotalLotes")
        Me.lblBaixa1.Text = dr2("TotalLotes")

        If CDbl(Me.lblBaixa1.Text) = 0 Then
            Me.lblCalcBaixa1.Text = 0
        Else
            Me.lblCalcDespachado1.Text = (CDbl(Me.lblDespachados1.Text) / CDbl(Me.lblTotal.Text) * 100).ToString("n2") & "%"
            Me.lblCalcBaixa1.Text = (CDbl(Me.lblBaixa1.Text) / CDbl(Me.lblDespachados1.Text) * 100).ToString("n2") & "%"
        End If
    End Sub

    Private Sub Contagem2()

        Dim varNumInv As Byte
        varNumInv = 7

        Dim dt1 As DataTable = clData_gerInv.TableGet("Programa.qsel2EstatisticaLiberado", varNumInv)
        Dim dr1 As DataRow = dt1.Rows(0)

        Dim dt2 As DataTable = clData_gerInv.TableGet("Programa.qsel2EstatisticaBaixa", varNumInv)
        Dim dr2 As DataRow = dt2.Rows(0)

        Me.lblDespachados2.Text = dr1("TotalLotes")
        Me.lblTotal2.Text = Me.lblDespachados2.Text
        Me.lblBaixa2.Text = dr2("TotalLotes")

        If CDbl(Me.lblBaixa2.Text) = 0 Then
            Me.lblCalcBaixa2.Text = 0
        Else
            Me.lblCalcBaixa2.Text = (CDbl(Me.lblBaixa2.Text) / CDbl(Me.lblDespachados2.Text) * 100).ToString("n2") & "%"
        End If

    End Sub

    Private Sub Contagem3()

        Dim varNumInv As Byte
        varNumInv = 7

        Dim dt1 As DataTable = clData_gerInv.TableGet("Programa.qsel3EstatisticaLiberado", varNumInv)
        Dim dr1 As DataRow = dt1.Rows(0)

        Dim dt2 As DataTable = clData_gerInv.TableGet("Programa.qsel3EstatisticaBaixa", varNumInv)
        Dim dr2 As DataRow = dt2.Rows(0)

        Me.lblDespachados3.Text = dr1("TotalLotes")
        Me.lblTotal3.Text = Me.lblDespachados3.Text
        Me.lblBaixa3.Text = dr2("TotalLotes")

        If CDbl(Me.lblBaixa3.Text) = 0 Then
            Me.lblCalcBaixa3.Text = 0
        Else
            Me.lblCalcBaixa3.Text = (CDbl(Me.lblBaixa3.Text) / CDbl(Me.lblDespachados3.Text) * 100).ToString("n2") & "%"
        End If
    End Sub

End Class
