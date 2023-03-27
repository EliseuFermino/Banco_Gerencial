Imports DevExpress.Web.ASPxHtmlEditor.Internal
Imports Microsoft.Reporting.WebForms.ReportViewer
Imports System.Drawing.Printing
Partial Class MemberPages_Checklist_Reports_ReportViewer_Cheklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaRelatorio()

        End If
    End Sub

    Private Sub carregaRelatorio()
        'Dim idFilial = Request.QueryString("idFilial").ToString()
        'Dim Data = Request.QueryString("data").ToString()
        'Dim imgs() As String = Split("3;2;4;5;6;7", ";", -1)
        'Dim compil = ""

        'For Each complilaImgs In imgs
        '    If complilaImgs.ToString() <> "" Then
        '        compil += "<a href='Arquivos\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
        '    End If
        'Next
        'renderRel.InnerHtml += Server.HtmlDecode(compil)


        'renderRel.InnerHtml = "<h1>Bootstrap Tutorial</h1><p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p></div><div id='customers'></div>"

    End Sub
End Class
