Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Class MemberPages_Checklist_DashboardPontuacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Me.cboFilial.CallFilial = 22
        Session("sFILIAL") = Me.cboFilial.CallFilial

        Dim filterExpression As String = Convert.ToString(Session("FilterExpression"))
        If filterExpression <> String.Empty Then

            AccessDataSource2.FilterExpression = filterExpression
            ASPxGridView2.DataSource = AccessDataSource2
            ASPxGridView2.DataSourceID = String.Empty
            ASPxGridView2.DataBind()

            AccessDataSource3.FilterExpression = filterExpression
            ASPxGridView3.DataSource = AccessDataSource3
            ASPxGridView3.DataSourceID = String.Empty
            ASPxGridView3.DataBind()

        End If


    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.ASPxGridView1.DataBind()
    End Sub


    Protected Sub ASPxGridView2_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs) Handles ASPxGridView2.CustomCallback
        On Error Resume Next
        Dim values As Object = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, New String() {"myID"})
        ASPxGridView2.DataSource = Nothing
        Dim filterExpression As String = "myID='" & values.ToString() & "'"
        Session("FilterExpression") = filterExpression
        AccessDataSource2.FilterExpression = filterExpression
        ASPxGridView2.DataSource = AccessDataSource2
        ASPxGridView2.PageIndex = 0
        ASPxGridView2.DataBind()
        Me.ASPxGridView2.FocusedRowIndex = 0
    End Sub

    Protected Sub ASPxGridView3_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs) Handles ASPxGridView3.CustomCallback
        On Error Resume Next
        Dim values As Object = ASPxGridView2.GetRowValues(ASPxGridView2.FocusedRowIndex, New String() {"myDetailID"})
        ASPxGridView3.DataSource = Nothing
        Dim filterExpression As String = "myDetailID='" & values.ToString() & "'"
        Session("FilterExpression1") = filterExpression
        AccessDataSource3.FilterExpression = filterExpression
        ASPxGridView3.DataSource = AccessDataSource3
        ASPxGridView3.PageIndex = 0
        ASPxGridView3.DataBind()
    End Sub

   
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Pontuação Mensal do Check-List "
    End Sub
End Class
