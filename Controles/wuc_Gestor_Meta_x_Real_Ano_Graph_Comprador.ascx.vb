Imports System.Net
Imports System.Windows.Forms


Partial Class Controles_wuc_Gestor_Meta_x_Real_Ano_Graph_Comprador
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sANO") = myDateTimes.YearToday
        End If
    End Sub

End Class
