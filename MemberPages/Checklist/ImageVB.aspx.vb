
'----------------------------------------------
'Author : Mudassar Khan
'Article: Export GridView displaying Images from database to Word, Excel and PDF Formats
'WebSite: http://www.aspsnippets.com
'----------------------------------------------

Imports System.Data
Imports System.Data.SqlClient
Partial Class PictureVB
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("ImageID") IsNot Nothing Then
            
            Dim strQuery As String = "select imgTitle, imgType," _
               & " imgData from Checklist.Images where imgId=@id"
            Dim cmd As SqlCommand = New SqlCommand(strQuery)
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = _
                Convert.ToInt32(Request.QueryString("ImageID"))
            Dim con As New SqlConnection(clData_gerManager.dbConnect)
            Dim sda As New SqlDataAdapter
            cmd.CommandType = CommandType.Text
            cmd.Connection = con
            Dim dt As New DataTable
            Try
                con.Open()
                sda.SelectCommand = cmd
                sda.Fill(dt)
            Catch ex As Exception
                dt = Nothing
            Finally
                con.Close()
                sda.Dispose()
                con.Dispose()
            End Try
            If dt IsNot Nothing Then
                Dim bytes() As Byte = CType(dt.Rows(0)("imgData"), Byte())
                Response.Buffer = True
                Response.Charset = ""
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.ContentType = dt.Rows(0)("imgType").ToString()
                Response.AddHeader("content-disposition", _
                    "attachment;filename=" _
                  & dt.Rows(0)("imgTitle").ToString())
                Response.BinaryWrite(bytes)
                Response.Flush()
                Response.End()
            End If
        End If
    End Sub
   

End Class
