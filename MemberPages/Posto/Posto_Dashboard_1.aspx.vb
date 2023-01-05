
Partial Class MemberPages_Posto_Posto_Dashboard_1
    Inherits System.Web.UI.Page

    Dim varTitle As String
    Dim myDate As Date
    Dim oFun As New Funcoes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Now.Hour > 8 Then
            Session("sDIA") = Today
            myDate = Date.Now
        Else
            Session("sDIA") = Today.AddDays(-1)
            myDate = Date.Now.AddDays(-1)
        End If

    End Sub


    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        Dim oVem As New VendaEmpresaMes

        Dim inputDate As Date
        Dim result As Boolean = Date.TryParse(myDate, inputDate)

        If result = True Then

            varTitle = " Venda Dia " & myDate.ToString("dd/MM/yyyy") & " - Atualizado às " & oVem.Flash_BuscaDataAtualizacao(myDate)
            CType(Master.FindControl("lblTitle"), Label).Text = varTitle
        Else
            varTitle = " Ops! Dia com problema!"
            CType(Master.FindControl("lblTitle"), Label).Text = varTitle
        End If

    End Sub

End Class
