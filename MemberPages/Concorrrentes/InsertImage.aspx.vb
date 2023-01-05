Imports System.IO
Imports System.Data.OleDb
Imports System.Data

Partial Class _InsertImage
    Inherits System.Web.UI.Page

    Protected Sub btnSaveImage_Click(sender As Object, e As System.EventArgs) Handles btnSaveImage.Click
        If FileUpload1.HasFile Then
            Dim name As String = FileUpload1.PostedFile.FileName
            Dim length As Integer = FileUpload1.PostedFile.ContentLength

            Dim imageBytes As Byte() = New Byte(length - 1) {}
            Dim imageStream As Stream = FileUpload1.PostedFile.InputStream
            imageStream.Read(imageBytes, 0, length)

            Dim connString As String = ConfigurationManager.ConnectionStrings("ImagesDB").ConnectionString
            Dim connection As New OleDbConnection(connString)

            Dim insertQuery As String = "INSERT INTO Images(ImageName, ImageSize, ImageData, IE) VALUES(@ImageName, @ImageSize, @ImageData, @IE)"
            Dim command As New OleDbCommand()
            command.Connection = connection
            command.CommandText = insertQuery
            command.CommandType = CommandType.Text
            command.Parameters.AddWithValue("@ImageName", name)
            command.Parameters.AddWithValue("@ImageSize", length)
            command.Parameters.AddWithValue("@ImageData", imageBytes)
            command.Parameters.AddWithValue("@IE", Me.txtIE.Text)

            Try
                connection.Open()
                command.ExecuteNonQuery()
                lblMessage.Text = "Image data saved successfully"
            Catch ex As Exception
                lblMessage.Text = "Unable to save image data"
            Finally
                connection.Close()
            End Try
        End If
    End Sub
End Class
