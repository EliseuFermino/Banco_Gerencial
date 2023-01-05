Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_CheckList_imgGrab
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Dim ds As New DataSet

            Dim da As SqlClient.SqlDataAdapter

            Dim arrContent As Byte()

            Dim dr As DataRow

            Dim strSql As String

            strSql = "Select * from Checklist.Images Where imgId=" & Request.QueryString("ID")

            da = New SqlClient.SqlDataAdapter(strSql, connManager)

            da.Fill(ds)

            dr = ds.Tables(0).Rows(0)

            arrContent = CType(dr.Item("imgData"), Byte())

            Dim conType As String = dr.Item("imgType").ToString()

            Response.ContentType = conType

            Response.OutputStream.Write(arrContent, 0, dr.Item("imgLength"))

            Response.End()

        Catch ex As Exception



        End Try
    End Sub
End Class
