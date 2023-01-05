Imports System.IO
Imports System.Drawing.Imaging
Imports System.Data.SqlClient
Imports System.Data

Partial Class Dados
    Inherits System.Web.UI.Page

    Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)
        If fuImage.HasFile Then
            Dim bytes As Byte()
            Dim contentType As String = fuImage.PostedFile.ContentType
            Dim fileName As String = fuImage.PostedFile.FileName
            Dim filePath As String = fileName
            Dim image As System.Drawing.Image = System.Drawing.Image.FromStream(fuImage.PostedFile.InputStream)

            Dim image_height As Integer = image.Height
            Dim image_width As Integer = image.Width
            Dim max_height As Integer = 180
            Dim max_width As Integer = 320

            image_height = (image_height * max_width) / image_width
            image_width = max_width


            'If image_height > max_height Then
            '    image_width = (image_width * max_height) / image_height
            '    image_height = max_height
            'Else
            'End If



            ' Resize image
            Using thumbnail As System.Drawing.Image = image.GetThumbnailImage(image_width, image_height, New System.Drawing.Image.GetThumbnailImageAbort(AddressOf ThumbnailCallback), IntPtr.Zero)
                Using memoryStream As MemoryStream = New MemoryStream()
                    thumbnail.Save(memoryStream, ImageFormat.Png)
                    bytes = New Byte(memoryStream.Length - 1) {}
                    memoryStream.Position = 0
                    memoryStream.Read(bytes, 0, CInt(bytes.Length))
                End Using
            End Using
            ' Insert uploaded image to Database
            Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
            Using con As SqlConnection = New SqlConnection(constr)
                Dim query As String = "INSERT INTO tblFiles VALUES (@Name, @ContentType, @Data)"
                Using cmd As SqlCommand = New SqlCommand(query)
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@Name", fileName)
                    cmd.Parameters.AddWithValue("@ContentType", contentType)
                    cmd.Parameters.AddWithValue("@Data", bytes)
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            End Using
        End If
        ' Display image after upload to Database
        'Image1.Visible = True
        'Dim byteData As Byte() = CType(GetData("SELECT Data FROM tblFiles").Rows(0)("Data"), Byte())
        'Dim base64String As String = Convert.ToBase64String(byteData, 0, byteData.Length)
        'Image1.ImageUrl = "data:image/png;base64," & base64String
    End Sub

    Private Function GetData(ByVal query As String) As DataTable
        Dim dt As DataTable = New DataTable()
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand(query)
                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using

            Return dt
        End Using
    End Function

    Public Function ThumbnailCallback() As Boolean
        Return False
    End Function



    'Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)
    '    If fuImage.HasFile Then
    '        Dim bytes As Byte()
    '        Dim contentType As String = fuImage.PostedFile.ContentType
    '        Dim fileName As String = fuImage.PostedFile.FileName
    '        Dim filePath As String = fileName
    '        Dim image As System.Drawing.Image = System.Drawing.Image.FromStream(fuImage.PostedFile.InputStream)
    '        ' Resize image
    '        Using thumbnail As System.Drawing.Image = image.GetThumbnailImage(640, 427, New System.Drawing.Image.GetThumbnailImageAbort(AddressOf ThumbnailCallback), IntPtr.Zero)
    '            Using memoryStream As MemoryStream = New MemoryStream()
    '                thumbnail.Save(memoryStream, ImageFormat.Png)
    '                bytes = New Byte(memoryStream.Length - 1) {}
    '                memoryStream.Position = 0
    '                memoryStream.Read(bytes, 0, CInt(bytes.Length))
    '            End Using
    '        End Using
    '        ' Insert uploaded image to Database
    '        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
    '        Using con As SqlConnection = New SqlConnection(constr)
    '            Dim query As String = "INSERT INTO tblFiles VALUES (@Name, @ContentType, @Data)"
    '            Using cmd As SqlCommand = New SqlCommand(query)
    '                cmd.Connection = con
    '                cmd.Parameters.AddWithValue("@Name", fileName)
    '                cmd.Parameters.AddWithValue("@ContentType", contentType)
    '                cmd.Parameters.AddWithValue("@Data", bytes)
    '                con.Open()
    '                cmd.ExecuteNonQuery()
    '                con.Close()
    '            End Using
    '        End Using
    '    End If
    '    ' Display image after upload to Database
    '    'Image1.Visible = True
    '    'Dim byteData As Byte() = CType(GetData("SELECT Data FROM tblFiles").Rows(0)("Data"), Byte())
    '    'Dim base64String As String = Convert.ToBase64String(byteData, 0, byteData.Length)
    '    'Image1.ImageUrl = "data:image/png;base64," & base64String
    'End Sub

End Class
