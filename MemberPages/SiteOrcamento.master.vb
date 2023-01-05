Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_SiteOrcamento
    Inherits System.Web.UI.MasterPage

    Public Sub Load_FAQ1()
        Dim arg As New DataSourceSelectArguments()
        Dim dataview As DataView = DirectCast(SqlDataSource1.[Select](arg), DataView)

        For i As Integer = 0 To dataview.Count - 1
            Dim row As DataRow = dataview(i).Row
            If Convert.ToInt32(row("ParentID")) = -1 Then
                Dim nbGroup As NavBarGroup = CreateGroupItem(row)
                navFaAQ.Groups.Add(nbGroup)
                nbGroup.HeaderImage.Url = row("QuestionImage").ToString()
                nbGroup.ToolTip = row("QuestionToolTip").ToString()
            End If

        Next

        For i As Integer = 0 To dataview.Count - 1
            Dim row As DataRow = dataview(i).Row
            Dim nbGroup As NavBarGroup = navFaAQ.Groups.FindByName(row("ParentID").ToString())

            If nbGroup IsNot Nothing Then

                Dim item As New NavBarItem()
                item.Text = row("Answer").ToString()
                item.Name = row("ID").ToString()
                item.NavigateUrl = row("link").ToString()
                item.Image.Url = row("AnswerImage").ToString()
                item.ToolTip = row("AnswerToolTip").ToString()

                nbGroup.Items.Add(item)

            End If
        Next
    End Sub

    Private Function CreateGroupItem(row As DataRow) As NavBarGroup
        Dim res As New NavBarGroup()
        res.Text = row("Question").ToString()
        res.Name = row("ID").ToString()
        Return res
    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sUSUARIO") = Page.User.Identity.Name
            Session("sMASTER") = 2  'Orçamento
            Load_FAQ1()
        End If
    End Sub
End Class

