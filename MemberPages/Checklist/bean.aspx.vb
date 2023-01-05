Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing

Partial Class MemberPages_CheckList_bean
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"


    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        Dim intLength As Integer
        Dim arrContent As Byte()

        If FileUpload.PostedFile Is Nothing Then
            lblStatus.Text = "No file specified."
            Exit Sub
        Else

            Dim fileName As String = FileUpload.PostedFile.FileName
            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = ext.ToLower

            Dim imgType = FileUpload.PostedFile.ContentType
            If ext = ".jpg" Then
            ElseIf ext = ".bmp" Then
            ElseIf ext = ".gif" Then
            ElseIf ext = ".png" Then
            ElseIf ext = "jpg" Then
            ElseIf ext = "bmp" Then
            ElseIf ext = "gif" Then
            ElseIf ext = "png" Then
            Else
                lblStatus.Text = "Only gif, bmp, png or jpg format files supported."
                Exit Sub
            End If

            intLength = Convert.ToInt32(FileUpload.PostedFile.InputStream.Length)

            ReDim arrContent(intLength)

            FileUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)


            If Doc2SQLServer(txtTitle.Text.Trim, arrContent, intLength, imgType) = True Then
                lblStatus.Text = "Image uploaded successfully."
            Else
                lblStatus.Text = "An error occured while uploading Image... Please try again."
            End If

        End If
    End Sub

    Protected Function Doc2SQLServer(ByVal title As String, ByVal Content As Byte(), ByVal Length As Integer, ByVal strType As String) As Boolean

        Try

            Dim cnn As Data.SqlClient.SqlConnection
            Dim cmd As Data.SqlClient.SqlCommand
            Dim param As Data.SqlClient.SqlParameter
            Dim strSQL As String

            strSQL = "Insert Into Checklist.Images(imgData,imgTitle,imgType,imgLength) Values(@content,@title,@type,@length)"

            cnn = New Data.SqlClient.SqlConnection(connManager)
            cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)
            param = New Data.SqlClient.SqlParameter("@content", Data.SqlDbType.Image)

            param.Value = Content
            cmd.Parameters.Add(param)
            param = New Data.SqlClient.SqlParameter("@title", Data.SqlDbType.VarChar)
            param.Value = title
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@type", Data.SqlDbType.VarChar)
            param.Value = strType
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@length", Data.SqlDbType.BigInt)
            param.Value = Length
            cmd.Parameters.Add(param)

            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()

            Return True

        Catch ex As Exception

            Return False
        End Try

    End Function

End Class
