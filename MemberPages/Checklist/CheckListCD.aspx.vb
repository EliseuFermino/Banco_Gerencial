Imports System.IO
Imports System.Drawing.Imaging
Imports System.Data.SqlClient
Imports System.Data


Partial Class MemberPages_CheckListCD
    Inherits System.Web.UI.Page

    Dim oCh As New Check
    Dim oDa As New clDataDb

#Region " Page"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(66, User.Identity.Name)
            Me.cboDia.CallDia = Date.Today
            Me.cboFilial.AutoPostBack = False
            Me.cboFilial.Visible_cboCorporacao = True
            Call PadraoInicial()
            Call HabilitarGerarRelatorio()



        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Check-list Central de Distribuição"
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        cboFilial.CallFilial = 1
        cboFilial.Enabled_cboFilial = False
        cboFilial.Visible_cboCorporacao = False

    End Sub



#End Region

    Private Sub EnabledControls(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox, ByVal txtDesc As TextBox, ByVal myAchar As ImageButton, ByVal mySalvar As ImageButton, ByVal myPPO As ImageButton, ByVal myBoolean As Boolean)
        rndSim.Enabled = myBoolean
        rndNao.Enabled = myBoolean
        rndNA.Enabled = myBoolean
        txtDesc.Enabled = myBoolean
        myAchar.Visible = myBoolean
        mySalvar.Visible = myBoolean
        myPPO.Visible = myBoolean
    End Sub

    Private Sub UploadImagem(ByVal oUpload As Object, ByVal iText As String, ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte)

        Dim intLength As Integer
        Dim arrContent As Byte()

        If oUpload.HasFile Then
            Dim bytes As Byte()
            Dim contentType As String = oUpload.PostedFile.ContentType
            Dim fileName As String = oUpload.PostedFile.FileName
            Dim filePath As String = fileName
            Dim image As System.Drawing.Image = System.Drawing.Image.FromStream(oUpload.PostedFile.InputStream)

            Dim image_height As Integer = image.Height
            Dim image_width As Integer = image.Width
            Dim max_height As Integer = 342
            Dim max_width As Integer = 608

            image_height = (image_height * max_width) / image_width
            image_width = max_width


            ' Resize image
            Using thumbnail As System.Drawing.Image = image.GetThumbnailImage(image_width, image_height, New System.Drawing.Image.GetThumbnailImageAbort(AddressOf ThumbnailCallback), IntPtr.Zero)
                Using memoryStream As MemoryStream = New MemoryStream()
                    thumbnail.Save(memoryStream, ImageFormat.Png)
                    bytes = New Byte(memoryStream.Length - 1) {}
                    memoryStream.Position = 0
                    memoryStream.Read(bytes, 0, CInt(bytes.Length))
                End Using
            End Using

            intLength = Convert.ToInt32(oUpload.PostedFile.InputStream.Length)

            ReDim arrContent(intLength)

            oUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)

            ' Insert uploaded image to Database
            Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
            Using con As SqlConnection = New SqlConnection(constr)
                Dim query As String = "Insert Into Fotos.tblFilial_" & cboFilial.CallFilial & " (imgData,imgTitle,imgType,imgLength,Dia,idFilial,idGrupo,idSubgrupo,idCod) Values(@content,@title,@type,@length,@dia, @idFilial, @idGrupo, @idSubgrupo, @idCod)"
                Using cmd As SqlCommand = New SqlCommand(query)
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@content", bytes)
                    cmd.Parameters.AddWithValue("@title", fileName)
                    cmd.Parameters.AddWithValue("@type", contentType)

                    cmd.Parameters.AddWithValue("@length", intLength)
                    cmd.Parameters.AddWithValue("@dia", cboDia.CallDia)
                    cmd.Parameters.AddWithValue("@idFilial", cboFilial.CallFilial)
                    cmd.Parameters.AddWithValue("@idGrupo", iGrupo)
                    cmd.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
                    cmd.Parameters.AddWithValue("@idCod", iCod)

                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()

                    lblStatus.Text = "A imagem foi carregada com sucesso!!!"

                End Using
            End Using
        End If



        'On Error Resume Next
        'Dim intLength As Integer
        'Dim arrContent As Byte()

        'If oUpload.PostedFile Is Nothing Then
        '    lblStatus.Text = "Nenhum arquivo selecionado."
        '    Exit Sub
        'Else
        '    Dim fileName As String = oUpload.PostedFile.FileName
        '    Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

        '    ext = ext.ToLower

        '    Dim imgType = oUpload.PostedFile.ContentType
        '    If ext = ".jpg" Then
        '    ElseIf ext = ".bmp" Then
        '    ElseIf ext = ".gif" Then
        '    ElseIf ext = ".png" Then
        '    ElseIf ext = "jpg" Then
        '    ElseIf ext = "bmp" Then
        '    ElseIf ext = "gif" Then
        '    ElseIf ext = "png" Then
        '    Else
        '        lblStatus.Text = "Somente gif, bmp, png or jpg formatos são válidos."
        '        Exit Sub
        '    End If

        '    intLength = Convert.ToInt32(oUpload.PostedFile.InputStream.Length)

        '    ReDim arrContent(intLength)

        '    oUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)

        '    If Doc2SQLServer(iText, arrContent, intLength, imgType, Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, iSubgrupo, iCod) = True Then
        '        lblStatus.Text = "A imagem foi carregada com sucesso!!!"
        '    Else
        '        lblStatus.Text = "Um erro ocorreu ao carregar a imagem... Por favor, tente novamente."
        '    End If

        'End If
    End Sub

    Public Function ThumbnailCallback() As Boolean
        Return False
    End Function

    'Private Sub UploadImagem(ByVal oUpload As Object, ByVal iText As String, ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte)
    '    If oUpload.HasFile Then
    '        Dim fileName As String = Server.HtmlEncode(oUpload.FileName)
    '        Dim extension As String = System.IO.Path.GetExtension(fileName)
    '        If (extension.ToUpper = ".JPG") Or (extension.ToUpper = ".GIF") Then


    '            '**** Resize image section ****
    '            Dim image_file As System.Drawing.Image = System.Drawing.Image.FromStream(oUpload.PostedFile.InputStream)
    '            Dim image_height As Integer = image_file.Height
    '            Dim image_width As Integer = image_file.Width
    '            Dim max_height As Integer = 120
    '            Dim max_width As Integer = 160




    '            image_height = (image_height * max_width) / image_width
    '            image_width = max_width


    '            If image_height > max_height Then
    '                image_width = (image_width * max_height) / image_height
    '                image_height = max_height
    '            Else
    '            End If




    '            Dim bitmap_file As New Bitmap(image_file, image_width, image_height)
    '            Dim stream As New System.IO.MemoryStream


    '            bitmap_file.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg)
    '            stream.Position = 0


    '            Dim data(stream.Length) As Byte
    '            stream.Read(data, 0, stream.Length)
    '            '**** End resize image section ****



    '            Dim myConn As New SqlConnection(Conexao.gerCheckList)
    '            Dim mycmd As New SqlCommand("se_equipmentimages_insert", myConn)
    '            mycmd.CommandType = CommandType.StoredProcedure


    '            mycmd.Parameters.AddWithValue("@imgData", data.Length)
    '            mycmd.Parameters.AddWithValue("@imgTitle", "Eliseu Fermino")

    '            mycmd.Parameters.AddWithValue("@imgType", "image/jpeg")
    '            mycmd.Parameters.AddWithValue("@imgLength", data.Length)
    '            mycmd.Parameters.AddWithValue("@Dia", Me.cboDia.CallDia)
    '            mycmd.Parameters.AddWithValue("@idFilial", Me.cboFilial.CallFilial)
    '            mycmd.Parameters.AddWithValue("@idGrupo", iGrupo)
    '            mycmd.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
    '            mycmd.Parameters.AddWithValue("@idCod", 1)

    '            Try
    '                myConn.Open()
    '                mycmd.ExecuteNonQuery()
    '            Catch ex As Exception
    '            Finally
    '                myConn.Close()
    '            End Try


    '        Else
    '            lblError.Text = Err.Description
    '            lblError.Visible = True
    '        End If
    '    Else
    '        lblError.Text = "No file selected"
    '        lblError.Visible = True
    '    End If
    'End Sub


    Protected Function Doc2SQLServer(ByVal title As String, ByVal Content As Byte(), ByVal Length As Integer, _
                                     ByVal strType As String, ByVal iDia As Date, ByVal iFilial As Byte, _
                                     ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte) As Boolean

        Try

            Dim cnn As Data.SqlClient.SqlConnection
            Dim cmd As Data.SqlClient.SqlCommand
            Dim param As Data.SqlClient.SqlParameter
            Dim strSQL As String

            strSQL = "Insert Into Fotos.tblFilial_" & cboFilial.CallFilial & " (imgData,imgTitle,imgType,imgLength,Dia,idFilial,idGrupo,idSubgrupo,idCod) Values(@content,@title,@type,@length,@dia, @idFilial, @idGrupo, @idSubgrupo, @idCod)"

            cnn = New Data.SqlClient.SqlConnection(Conexao.gerCheckList)
            cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)
            param = New Data.SqlClient.SqlParameter("@content", Data.SqlDbType.VarBinary)

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

            param = New Data.SqlClient.SqlParameter("@dia", Data.SqlDbType.Date)
            param.Value = iDia
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idFilial", Data.SqlDbType.TinyInt)
            param.Value = iFilial
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idGrupo", Data.SqlDbType.TinyInt)
            param.Value = iGrupo
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idSubgrupo", Data.SqlDbType.TinyInt)
            param.Value = iSubgrupo
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@idCod", Data.SqlDbType.TinyInt)
            param.Value = iCod
            cmd.Parameters.Add(param)

            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
            cnn.Dispose()

            Return True

        Catch ex As Exception

            Return False
        End Try

    End Function

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAtualizar.Click
        Call LimparTextBox()
        Call BuscarChecklist()
        Call HabilitarGerarRelatorio()

        If cboDia.CallDia < DateAndTime.Today Then
            btnGrupo1.Enabled = False
            btnGrupo2.Enabled = False
            btnGrupo3.Enabled = False
            btnGrupo4.Enabled = False
            btnGrupo5.Enabled = False
            btnGrupo6.Enabled = False
            btnGrupo7.Enabled = False

            btnGrupo11.Enabled = False
            btnGrupo12.Enabled = False
            btnGrupo13.Enabled = False
            btnGrupo14.Enabled = False
            btnGrupo15.Enabled = False
            btnGrupo16.Enabled = False
            btnGrupo17.Enabled = False

        Else
            btnGrupo1.Enabled = True
            btnGrupo2.Enabled = True
            btnGrupo3.Enabled = True
            btnGrupo4.Enabled = True
            btnGrupo5.Enabled = True
            btnGrupo6.Enabled = True
            btnGrupo7.Enabled = True

            btnGrupo11.Enabled = True
            btnGrupo12.Enabled = True
            btnGrupo13.Enabled = True
            btnGrupo14.Enabled = True
            btnGrupo15.Enabled = True
            btnGrupo16.Enabled = True
            btnGrupo17.Enabled = True
        End If

    End Sub

    Private Sub fLimparTextBox(ByVal myTexto As TextBox)
        myTexto.Text = ""
    End Sub

    Private Sub LimparTextBox()

        'Grupo 1
        Call fLimparTextBox(txt1_1)
        Call fLimparTextBox(txt1_2)
        Call fLimparTextBox(txt1_3)
        Call fLimparTextBox(txt1_4)

        'Grupo 2
        Call fLimparTextBox(txt2_1)
        Call fLimparTextBox(txt2_2)
        Call fLimparTextBox(txt2_3)
        Call fLimparTextBox(txt2_4)
        Call fLimparTextBox(txt2_5)
        Call fLimparTextBox(txt2_6)
        Call fLimparTextBox(txt2_7)
        Call fLimparTextBox(txt2_8)
        Call fLimparTextBox(txt2_9)
        Call fLimparTextBox(txt2_10)
        Call fLimparTextBox(txt2_11)
        Call fLimparTextBox(txt2_12)
        Call fLimparTextBox(txt2_13)
        Call fLimparTextBox(txt2_14)
        Call fLimparTextBox(txt2_15)
        Call fLimparTextBox(txt2_16)
        Call fLimparTextBox(txt2_17)
        Call fLimparTextBox(txt2_18)
        Call fLimparTextBox(txt2_19)
        Call fLimparTextBox(txt2_20)


        'Grupo 3
        Call fLimparTextBox(txt3_1)
        Call fLimparTextBox(txt3_2)
        Call fLimparTextBox(txt3_3)
        Call fLimparTextBox(txt3_4)
        Call fLimparTextBox(txt3_5)
        Call fLimparTextBox(txt3_6)
        Call fLimparTextBox(txt3_7)
        Call fLimparTextBox(txt3_8)
        Call fLimparTextBox(txt3_9)
        Call fLimparTextBox(txt3_10)



        'Grupo 4
        Call fLimparTextBox(txt4_1)
        Call fLimparTextBox(txt4_2)
        Call fLimparTextBox(txt4_3)
        Call fLimparTextBox(txt4_4)
        Call fLimparTextBox(txt4_5)
        Call fLimparTextBox(txt4_6)
        Call fLimparTextBox(txt4_7)
        Call fLimparTextBox(txt4_8)
        Call fLimparTextBox(txt4_9)
        Call fLimparTextBox(txt4_10)
        Call fLimparTextBox(txt4_11)
        Call fLimparTextBox(txt4_12)


        'Grupo 5
        Call fLimparTextBox(txt5_1)
        Call fLimparTextBox(txt5_2)
        Call fLimparTextBox(txt5_3)
        Call fLimparTextBox(txt5_4)
        Call fLimparTextBox(txt5_5)
        Call fLimparTextBox(txt5_6)
        Call fLimparTextBox(txt5_7)
        Call fLimparTextBox(txt5_8)
        Call fLimparTextBox(txt5_9)
        Call fLimparTextBox(txt5_10)
        Call fLimparTextBox(txt5_11)
        Call fLimparTextBox(txt5_12)
        Call fLimparTextBox(txt5_13)
        Call fLimparTextBox(txt5_14)

        'Grupo 6
        Call fLimparTextBox(txt6_1)
        Call fLimparTextBox(txt6_2)
        Call fLimparTextBox(txt6_3)
        Call fLimparTextBox(txt6_4)
        Call fLimparTextBox(txt6_5)
        Call fLimparTextBox(txt6_6)
        Call fLimparTextBox(txt6_7)
        Call fLimparTextBox(txt6_8)


        'Grupo 7
        Call fLimparTextBox(txt7_1)
        Call fLimparTextBox(txt7_2)
        Call fLimparTextBox(txt7_3)
        Call fLimparTextBox(txt7_4)
        Call fLimparTextBox(txt7_5)
        Call fLimparTextBox(txt7_6)
        Call fLimparTextBox(txt7_7)
        Call fLimparTextBox(txt7_8)
        Call fLimparTextBox(txt7_9)
        Call fLimparTextBox(txt7_10)
        Call fLimparTextBox(txt7_11)
        Call fLimparTextBox(txt7_12)
        Call fLimparTextBox(txt7_13)
        Call fLimparTextBox(txt7_14)
        Call fLimparTextBox(txt7_15)
        Call fLimparTextBox(txt7_16)
        Call fLimparTextBox(txt7_17)
        Call fLimparTextBox(txt7_18)
        Call fLimparTextBox(txt7_19)


        'Grupo 11
        Call fLimparTextBox(txt12_1)
        Call fLimparTextBox(txt12_2)
        Call fLimparTextBox(txt12_3)
        Call fLimparTextBox(txt12_4)
        Call fLimparTextBox(txt12_5)
        Call fLimparTextBox(txt12_6)
        Call fLimparTextBox(txt12_7)


        'Grupo 12
        Call fLimparTextBox(txt12_1)
        Call fLimparTextBox(txt12_2)
        Call fLimparTextBox(txt12_3)
        Call fLimparTextBox(txt12_4)
        Call fLimparTextBox(txt12_5)
        Call fLimparTextBox(txt12_6)
        Call fLimparTextBox(txt12_7)


        'Grupo 13
        Call fLimparTextBox(txt13_1)
        Call fLimparTextBox(txt13_2)
        Call fLimparTextBox(txt13_3)
        Call fLimparTextBox(txt13_4)
        Call fLimparTextBox(txt13_5)
        Call fLimparTextBox(txt13_6)
        Call fLimparTextBox(txt13_7)
        Call fLimparTextBox(txt13_8)
        Call fLimparTextBox(txt13_9)
        Call fLimparTextBox(txt13_10)
        Call fLimparTextBox(txt13_11)
        Call fLimparTextBox(txt13_12)
        Call fLimparTextBox(txt13_13)


        'Grupo 14
        Call fLimparTextBox(txt14_1)
        Call fLimparTextBox(txt14_2)
        Call fLimparTextBox(txt14_3)
        Call fLimparTextBox(txt14_4)


        'Grupo 15
        Call fLimparTextBox(txt15_1)
        Call fLimparTextBox(txt15_2)
        Call fLimparTextBox(txt15_3)
        Call fLimparTextBox(txt15_4)
        Call fLimparTextBox(txt15_5)
        Call fLimparTextBox(txt15_6)

        'Grupo 16
        Call fLimparTextBox(txt16_1)
        Call fLimparTextBox(txt16_2)
        Call fLimparTextBox(txt16_3)

        'Grupo 2
        Call fLimparTextBox(txt17_1)
        Call fLimparTextBox(txt17_2)
        Call fLimparTextBox(txt17_3)
        Call fLimparTextBox(txt17_4)
        Call fLimparTextBox(txt17_5)
        Call fLimparTextBox(txt17_6)
        Call fLimparTextBox(txt17_7)
        Call fLimparTextBox(txt17_8)
        Call fLimparTextBox(txt17_9)
        Call fLimparTextBox(txt17_10)
        Call fLimparTextBox(txt17_11)
        Call fLimparTextBox(txt17_12)
        Call fLimparTextBox(txt17_13)
        Call fLimparTextBox(txt17_14)
        Call fLimparTextBox(txt17_15)
        Call fLimparTextBox(txt17_16)
        Call fLimparTextBox(txt17_17)
        Call fLimparTextBox(txt17_18)
        Call fLimparTextBox(txt17_19)
        Call fLimparTextBox(txt17_20)
        Call fLimparTextBox(txt17_21)


    End Sub

    Private Function DefinirPontuacao(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox) As Byte
        If rndSim.Checked = True Then DefinirPontuacao = 1
        If rndNao.Checked = True Then DefinirPontuacao = 0
        If rndNA.Checked = True Then DefinirPontuacao = 2
        Return DefinirPontuacao
    End Function

    Protected Sub btnGrupo1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo1.Click

        Dim userName As String
        Dim varIssue(4) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd1_1_Sim, rnd1_1_Nao, rnd1_1_NA)
        varIssue(2) = DefinirPontuacao(rnd1_2_Sim, rnd1_2_Nao, rnd1_2_NA)
        varIssue(3) = DefinirPontuacao(rnd1_3_Sim, rnd1_3_Nao, rnd1_3_NA)
        varIssue(4) = DefinirPontuacao(rnd1_4_Sim, rnd1_4_Nao, rnd1_4_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 1, varIssue(1), userName, Me.txt1_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 2, varIssue(2), userName, Me.txt1_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 3, varIssue(3), userName, Me.txt1_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 4, varIssue(4), userName, Me.txt1_4.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1)
        Me.panTitle1.CssClass = "pnl_Verde"
    End Sub    ' Bloco 1 - 1 a 25. Total de 14 Perguntas

    Protected Sub btnGrupo2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo2.Click

        Dim userName As String
        Dim varIssue(21) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd2_1_Sim, rnd2_1_Nao, rnd2_1_NA)
        varIssue(2) = DefinirPontuacao(rnd2_2_Sim, rnd2_2_Nao, rnd2_2_NA)
        varIssue(3) = DefinirPontuacao(rnd2_3_Sim, rnd2_3_Nao, rnd2_3_NA)
        varIssue(4) = DefinirPontuacao(rnd2_4_Sim, rnd2_4_Nao, rnd2_4_NA)
        varIssue(5) = DefinirPontuacao(rnd2_5_Sim, rnd2_5_Nao, rnd2_5_NA)
        varIssue(6) = DefinirPontuacao(rnd2_6_Sim, rnd2_6_Nao, rnd2_6_NA)
        varIssue(7) = DefinirPontuacao(rnd2_7_Sim, rnd2_7_Nao, rnd2_7_NA)
        varIssue(8) = DefinirPontuacao(rnd2_8_Sim, rnd2_8_Nao, rnd2_8_NA)
        varIssue(9) = DefinirPontuacao(rnd2_9_Sim, rnd2_9_Nao, rnd2_9_NA)
        varIssue(10) = DefinirPontuacao(rnd2_10_Sim, rnd2_10_Nao, rnd2_10_NA)
        varIssue(11) = DefinirPontuacao(rnd2_11_Sim, rnd2_11_Nao, rnd2_11_NA)
        varIssue(12) = DefinirPontuacao(rnd2_12_Sim, rnd2_12_Nao, rnd2_12_NA)
        varIssue(13) = DefinirPontuacao(rnd2_13_Sim, rnd2_13_Nao, rnd2_13_NA)
        varIssue(14) = DefinirPontuacao(rnd2_14_Sim, rnd2_14_Nao, rnd2_14_NA)
        varIssue(15) = DefinirPontuacao(rnd2_15_Sim, rnd2_15_Nao, rnd2_15_NA)
        varIssue(16) = DefinirPontuacao(rnd2_16_Sim, rnd2_16_Nao, rnd2_16_NA)
        varIssue(17) = DefinirPontuacao(rnd2_17_Sim, rnd2_17_Nao, rnd2_17_NA)
        varIssue(18) = DefinirPontuacao(rnd2_18_Sim, rnd2_18_Nao, rnd2_18_NA)
        varIssue(19) = DefinirPontuacao(rnd2_19_Sim, rnd2_19_Nao, rnd2_19_NA)
        varIssue(20) = DefinirPontuacao(rnd2_20_Sim, rnd2_20_Nao, rnd2_20_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 1, varIssue(1), userName, Me.txt2_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 2, varIssue(2), userName, Me.txt2_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 3, varIssue(3), userName, Me.txt2_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 4, varIssue(4), userName, Me.txt2_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 5, varIssue(5), userName, Me.txt2_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 6, varIssue(6), userName, Me.txt2_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 7, varIssue(7), userName, Me.txt2_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 8, varIssue(8), userName, Me.txt2_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 9, varIssue(9), userName, Me.txt2_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 10, varIssue(10), userName, Me.txt2_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 12, varIssue(11), userName, Me.txt2_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 12, varIssue(12), userName, Me.txt2_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 13, varIssue(13), userName, Me.txt2_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 14, varIssue(14), userName, Me.txt2_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 15, varIssue(15), userName, Me.txt2_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 16, varIssue(16), userName, Me.txt2_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 17, varIssue(17), userName, Me.txt2_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 18, varIssue(18), userName, Me.txt2_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 19, varIssue(19), userName, Me.txt2_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 20, varIssue(20), userName, Me.txt2_20.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1)
        Me.panTitle2.CssClass = "pnl_Verde"
    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo3.Click

        Dim varIssue(11) As Byte
        Dim userName As String

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd3_1_Sim, rnd3_1_Nao, rnd3_1_NA)
        varIssue(2) = DefinirPontuacao(rnd3_2_Sim, rnd3_2_Nao, rnd3_2_NA)
        varIssue(3) = DefinirPontuacao(rnd3_3_Sim, rnd3_3_Nao, rnd3_3_NA)
        varIssue(4) = DefinirPontuacao(rnd3_4_Sim, rnd3_4_Nao, rnd3_4_NA)
        varIssue(5) = DefinirPontuacao(rnd3_5_Sim, rnd3_5_Nao, rnd3_5_NA)
        varIssue(6) = DefinirPontuacao(rnd3_6_Sim, rnd3_6_Nao, rnd3_6_NA)
        varIssue(7) = DefinirPontuacao(rnd3_7_Sim, rnd3_7_Nao, rnd3_7_NA)
        varIssue(8) = DefinirPontuacao(rnd3_8_Sim, rnd3_8_Nao, rnd3_8_NA)
        varIssue(9) = DefinirPontuacao(rnd3_9_Sim, rnd3_9_Nao, rnd3_9_NA)
        varIssue(10) = DefinirPontuacao(rnd3_10_Sim, rnd3_10_Nao, rnd3_10_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 1, varIssue(1), userName, Me.txt3_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 2, varIssue(2), userName, Me.txt3_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 3, varIssue(3), userName, Me.txt3_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 4, varIssue(4), userName, Me.txt3_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 5, varIssue(5), userName, Me.txt3_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 6, varIssue(6), userName, Me.txt3_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 7, varIssue(7), userName, Me.txt3_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 8, varIssue(8), userName, Me.txt3_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 9, varIssue(9), userName, Me.txt3_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 10, varIssue(10), userName, Me.txt3_10.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1)
        Me.panTitle3.CssClass = "pnl_Verde"
    End Sub   ' Bloco 3 - 14 a 22. Total de 9 Perguntas

    Protected Sub btnGrupo4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo4.Click

        Dim userName As String
        Dim varIssue(13) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd4_1_Sim, rnd4_1_Nao, rnd4_1_NA)
        varIssue(2) = DefinirPontuacao(rnd4_2_Sim, rnd4_2_Nao, rnd4_2_NA)
        varIssue(3) = DefinirPontuacao(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA)
        varIssue(4) = DefinirPontuacao(rnd4_4_Sim, rnd4_4_Nao, rnd4_4_NA)
        varIssue(5) = DefinirPontuacao(rnd4_5_Sim, rnd4_5_Nao, rnd4_5_NA)
        varIssue(6) = DefinirPontuacao(rnd4_6_Sim, rnd4_6_Nao, rnd4_6_NA)
        varIssue(7) = DefinirPontuacao(rnd4_7_Sim, rnd4_7_Nao, rnd4_7_NA)
        varIssue(8) = DefinirPontuacao(rnd4_8_Sim, rnd4_8_Nao, rnd4_8_NA)
        varIssue(9) = DefinirPontuacao(rnd4_9_Sim, rnd4_9_Nao, rnd4_9_NA)
        varIssue(10) = DefinirPontuacao(rnd4_10_Sim, rnd4_10_Nao, rnd4_10_NA)
        varIssue(11) = DefinirPontuacao(rnd4_11_Sim, rnd4_11_Nao, rnd4_11_NA)
        varIssue(12) = DefinirPontuacao(rnd4_12_Sim, rnd4_12_Nao, rnd4_12_NA)



        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 1, varIssue(1), userName, Me.txt4_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 2, varIssue(2), userName, Me.txt4_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 3, varIssue(3), userName, Me.txt4_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 4, varIssue(4), userName, Me.txt4_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 5, varIssue(5), userName, Me.txt4_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 6, varIssue(6), userName, Me.txt4_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 7, varIssue(7), userName, Me.txt4_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 8, varIssue(8), userName, Me.txt4_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 9, varIssue(9), userName, Me.txt4_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 10, varIssue(10), userName, Me.txt4_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 11, varIssue(11), userName, Me.txt4_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 12, varIssue(12), userName, Me.txt4_12.Text)



        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1)
        Me.panTitle4.CssClass = "pnl_Verde"
    End Sub  ' Bloco 4 - 23 a 29. Total de 7 Perguntas

    Protected Sub btnGrupo5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo5.Click

        Dim userName As String
        Dim varIssue(14) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd5_1_Sim, rnd5_1_Nao, rnd5_1_NA)
        varIssue(2) = DefinirPontuacao(rnd5_2_Sim, rnd5_2_Nao, rnd5_2_NA)
        varIssue(3) = DefinirPontuacao(rnd5_3_Sim, rnd5_3_Nao, rnd5_3_NA)
        varIssue(4) = DefinirPontuacao(rnd5_4_Sim, rnd5_4_Nao, rnd5_4_NA)
        varIssue(5) = DefinirPontuacao(rnd5_5_Sim, rnd5_5_Nao, rnd5_5_NA)
        varIssue(6) = DefinirPontuacao(rnd5_6_Sim, rnd5_6_Nao, rnd5_6_NA)
        varIssue(7) = DefinirPontuacao(rnd5_7_Sim, rnd5_7_Nao, rnd5_7_NA)
        varIssue(8) = DefinirPontuacao(rnd5_8_Sim, rnd5_8_Nao, rnd5_8_NA)
        varIssue(9) = DefinirPontuacao(rnd5_9_Sim, rnd5_9_Nao, rnd5_9_NA)
        varIssue(10) = DefinirPontuacao(rnd5_10_Sim, rnd5_10_Nao, rnd5_10_NA)
        varIssue(11) = DefinirPontuacao(rnd5_11_Sim, rnd5_11_Nao, rnd5_11_NA)
        varIssue(12) = DefinirPontuacao(rnd5_12_Sim, rnd5_12_Nao, rnd5_12_NA)
        varIssue(13) = DefinirPontuacao(rnd5_13_Sim, rnd5_13_Nao, rnd5_13_NA)
        varIssue(14) = DefinirPontuacao(rnd5_14_Sim, rnd5_14_Nao, rnd5_14_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 1, varIssue(1), userName, Me.txt5_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 2, varIssue(2), userName, Me.txt5_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 3, varIssue(3), userName, Me.txt5_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 4, varIssue(4), userName, Me.txt5_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 5, varIssue(5), userName, Me.txt5_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 6, varIssue(6), userName, Me.txt5_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 7, varIssue(7), userName, Me.txt5_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 8, varIssue(8), userName, Me.txt5_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 9, varIssue(9), userName, Me.txt5_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 10, varIssue(10), userName, Me.txt5_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 11, varIssue(11), userName, Me.txt5_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 12, varIssue(12), userName, Me.txt5_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 13, varIssue(13), userName, Me.txt5_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1, 14, varIssue(14), userName, Me.txt5_14.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1)
        Me.panTitle5.CssClass = "pnl_Verde"
    End Sub  ' Bloco 5 - 30 a 40. Total de 11 Perguntas

    Protected Sub btnGrupo6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo6.Click

        Dim userName As String
        Dim varIssue(8) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd6_1_Sim, rnd6_1_Nao, rnd6_1_NA)
        varIssue(2) = DefinirPontuacao(rnd6_2_Sim, rnd6_2_Nao, rnd6_2_NA)
        varIssue(3) = DefinirPontuacao(rnd6_3_Sim, rnd6_3_Nao, rnd6_3_NA)
        varIssue(4) = DefinirPontuacao(rnd6_4_Sim, rnd6_4_Nao, rnd6_4_NA)
        varIssue(5) = DefinirPontuacao(rnd6_5_Sim, rnd6_5_Nao, rnd6_5_NA)
        varIssue(6) = DefinirPontuacao(rnd6_6_Sim, rnd6_6_Nao, rnd6_6_NA)
        varIssue(7) = DefinirPontuacao(rnd6_7_Sim, rnd6_7_Nao, rnd6_7_NA)
        varIssue(8) = DefinirPontuacao(rnd6_8_Sim, rnd6_8_Nao, rnd6_8_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 1, varIssue(1), userName, Me.txt6_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 2, varIssue(2), userName, Me.txt6_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 3, varIssue(3), userName, Me.txt6_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 4, varIssue(4), userName, Me.txt6_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 5, varIssue(5), userName, Me.txt6_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 6, varIssue(6), userName, Me.txt6_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 7, varIssue(7), userName, Me.txt6_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 8, varIssue(8), userName, Me.txt6_8.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1)
        Me.panTitle6.CssClass = "pnl_Verde"
    End Sub  ' Bloco 6 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo7.Click
        ' Botão Salvar
        ' Salvar os itens do 3.10 ao 3.17 que esta no Grupo 3 - Armazenamento(Câmaras) - Fiambreria e Laticinios - Grupo 2 - (8 perguntas, 10 a 17)
        Dim userName As String
        Dim varIssue(19) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd7_1_Sim, rnd7_1_Nao, rnd7_1_NA)
        varIssue(2) = DefinirPontuacao(rnd7_2_Sim, rnd7_2_Nao, rnd7_2_NA)
        varIssue(3) = DefinirPontuacao(rnd7_3_Sim, rnd7_3_Nao, rnd7_3_NA)
        varIssue(4) = DefinirPontuacao(rnd7_4_Sim, rnd7_4_Nao, rnd7_4_NA)
        varIssue(5) = DefinirPontuacao(rnd7_5_Sim, rnd7_5_Nao, rnd7_5_NA)
        varIssue(6) = DefinirPontuacao(rnd7_6_Sim, rnd7_6_Nao, rnd7_6_NA)
        varIssue(7) = DefinirPontuacao(rnd7_7_Sim, rnd7_7_Nao, rnd7_7_NA)
        varIssue(8) = DefinirPontuacao(rnd7_8_Sim, rnd7_8_Nao, rnd7_8_NA)
        varIssue(9) = DefinirPontuacao(rnd7_9_Sim, rnd7_9_Nao, rnd7_9_NA)
        varIssue(10) = DefinirPontuacao(rnd7_10_Sim, rnd7_10_Nao, rnd7_10_NA)
        varIssue(11) = DefinirPontuacao(rnd7_11_Sim, rnd7_11_Nao, rnd7_11_NA)
        varIssue(12) = DefinirPontuacao(rnd7_12_Sim, rnd7_12_Nao, rnd7_12_NA)
        varIssue(13) = DefinirPontuacao(rnd7_13_Sim, rnd7_13_Nao, rnd7_13_NA)
        varIssue(14) = DefinirPontuacao(rnd7_14_Sim, rnd7_14_Nao, rnd7_14_NA)
        varIssue(15) = DefinirPontuacao(rnd7_15_Sim, rnd7_15_Nao, rnd7_15_NA)
        varIssue(16) = DefinirPontuacao(rnd7_16_Sim, rnd7_16_Nao, rnd7_16_NA)
        varIssue(17) = DefinirPontuacao(rnd7_17_Sim, rnd7_17_Nao, rnd7_17_NA)
        varIssue(18) = DefinirPontuacao(rnd7_18_Sim, rnd7_18_Nao, rnd7_18_NA)
        varIssue(19) = DefinirPontuacao(rnd7_19_Sim, rnd7_19_Nao, rnd7_19_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 1, varIssue(1), userName, Me.txt7_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 2, varIssue(2), userName, Me.txt7_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 3, varIssue(3), userName, Me.txt7_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 4, varIssue(4), userName, Me.txt7_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 5, varIssue(5), userName, Me.txt7_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 6, varIssue(6), userName, Me.txt7_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 7, varIssue(7), userName, Me.txt7_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 8, varIssue(8), userName, Me.txt7_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 9, varIssue(9), userName, Me.txt7_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 10, varIssue(10), userName, Me.txt7_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 11, varIssue(11), userName, Me.txt7_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 12, varIssue(12), userName, Me.txt7_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 13, varIssue(13), userName, Me.txt7_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 14, varIssue(14), userName, Me.txt7_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 15, varIssue(15), userName, Me.txt7_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 16, varIssue(16), userName, Me.txt7_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 17, varIssue(17), userName, Me.txt7_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 18, varIssue(18), userName, Me.txt7_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1, 19, varIssue(19), userName, Me.txt7_19.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1)
        Me.panTitle7.CssClass = "pnl_Verde"
    End Sub  ' Bloco 7 - 15 a 25. Total de 10 Perguntas

    Protected Sub btnGrupo11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo11.Click
        Dim userName As String
        Dim varIssue(22) As Byte

        userName = User.Identity.Name


        varIssue(1) = DefinirPontuacao(rnd11_1_Sim, rnd11_1_Nao, rnd11_1_NA)
        varIssue(2) = DefinirPontuacao(rnd11_2_Sim, rnd11_2_Nao, rnd11_2_NA)
        varIssue(3) = DefinirPontuacao(rnd11_3_Sim, rnd11_3_Nao, rnd11_3_NA)
        varIssue(4) = DefinirPontuacao(rnd11_4_Sim, rnd11_4_Nao, rnd11_4_NA)
        varIssue(5) = DefinirPontuacao(rnd11_5_Sim, rnd11_5_Nao, rnd11_5_NA)
        varIssue(6) = DefinirPontuacao(rnd11_6_Sim, rnd11_6_Nao, rnd11_6_NA)
        varIssue(7) = DefinirPontuacao(rnd11_7_Sim, rnd11_7_Nao, rnd11_7_NA)
        varIssue(8) = DefinirPontuacao(rnd11_8_Sim, rnd11_8_Nao, rnd11_8_NA)
        varIssue(9) = DefinirPontuacao(rnd11_9_Sim, rnd11_9_Nao, rnd11_9_NA)
        varIssue(10) = DefinirPontuacao(rnd11_10_Sim, rnd11_10_Nao, rnd11_10_NA)
        varIssue(11) = DefinirPontuacao(rnd11_11_Sim, rnd11_11_Nao, rnd11_11_NA)
        varIssue(12) = DefinirPontuacao(rnd11_12_Sim, rnd11_12_Nao, rnd11_12_NA)
        varIssue(13) = DefinirPontuacao(rnd11_13_Sim, rnd11_13_Nao, rnd11_13_NA)
        varIssue(14) = DefinirPontuacao(rnd11_14_Sim, rnd11_14_Nao, rnd11_14_NA)
        varIssue(15) = DefinirPontuacao(rnd11_15_Sim, rnd11_15_Nao, rnd11_15_NA)
        varIssue(16) = DefinirPontuacao(rnd11_16_Sim, rnd11_16_Nao, rnd11_16_NA)
        varIssue(17) = DefinirPontuacao(rnd11_17_Sim, rnd11_17_Nao, rnd11_17_NA)
        varIssue(18) = DefinirPontuacao(rnd11_18_Sim, rnd11_18_Nao, rnd11_18_NA)
        varIssue(19) = DefinirPontuacao(rnd11_19_Sim, rnd11_19_Nao, rnd11_19_NA)
        varIssue(20) = DefinirPontuacao(rnd11_20_Sim, rnd11_20_Nao, rnd11_20_NA)
        varIssue(21) = DefinirPontuacao(rnd11_21_Sim, rnd11_21_Nao, rnd11_21_NA)
        varIssue(22) = DefinirPontuacao(rnd11_22_Sim, rnd11_22_Nao, rnd11_22_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 1, varIssue(1), userName, Me.txt11_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 2, varIssue(2), userName, Me.txt11_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 3, varIssue(3), userName, Me.txt11_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 4, varIssue(4), userName, Me.txt11_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 5, varIssue(5), userName, Me.txt11_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 6, varIssue(6), userName, Me.txt11_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 7, varIssue(7), userName, Me.txt11_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 8, varIssue(8), userName, Me.txt11_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 9, varIssue(9), userName, Me.txt11_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 10, varIssue(10), userName, Me.txt11_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 11, varIssue(11), userName, Me.txt11_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 12, varIssue(12), userName, Me.txt11_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 13, varIssue(13), userName, Me.txt11_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 14, varIssue(14), userName, Me.txt11_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 15, varIssue(15), userName, Me.txt11_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 16, varIssue(16), userName, Me.txt11_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 17, varIssue(17), userName, Me.txt11_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 18, varIssue(18), userName, Me.txt11_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 19, varIssue(19), userName, Me.txt11_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 20, varIssue(20), userName, Me.txt11_20.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 21, varIssue(21), userName, Me.txt11_21.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1, 22, varIssue(22), userName, Me.txt11_22.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1)
        Me.panTitle11.CssClass = "pnl_Verde"
    End Sub  ' Bloco 11 - 1 a 3. Total de 3 Perguntas

    Protected Sub btnGrupo12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo12.Click
        Dim userName As String
        Dim varIssue(7) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd12_1_Sim, rnd12_1_Nao, rnd12_1_NA)
        varIssue(2) = DefinirPontuacao(rnd12_2_Sim, rnd12_2_Nao, rnd12_2_NA)
        varIssue(3) = DefinirPontuacao(rnd12_3_Sim, rnd12_3_Nao, rnd12_3_NA)
        varIssue(4) = DefinirPontuacao(rnd12_4_Sim, rnd12_4_Nao, rnd12_4_NA)
        varIssue(5) = DefinirPontuacao(rnd12_5_Sim, rnd12_5_Nao, rnd12_5_NA)
        varIssue(6) = DefinirPontuacao(rnd12_6_Sim, rnd12_6_Nao, rnd12_6_NA)
        varIssue(7) = DefinirPontuacao(rnd12_7_Sim, rnd12_7_Nao, rnd12_7_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 1, varIssue(1), userName, Me.txt12_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 2, varIssue(2), userName, Me.txt12_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 3, varIssue(3), userName, Me.txt12_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 4, varIssue(4), userName, Me.txt12_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 5, varIssue(5), userName, Me.txt12_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 6, varIssue(6), userName, Me.txt12_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 7, varIssue(7), userName, Me.txt12_7.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1)
        Me.panTitle12.CssClass = "pnl_Verde"
    End Sub  ' Bloco 12 - 4 a 10. Total de 7 Perguntas

    Protected Sub btnGrupo13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo13.Click
        Dim userName As String
        Dim varIssue(13) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd13_1_Sim, rnd13_1_Nao, rnd13_1_NA)
        varIssue(2) = DefinirPontuacao(rnd13_2_Sim, rnd13_2_Nao, rnd13_2_NA)
        varIssue(3) = DefinirPontuacao(rnd13_3_Sim, rnd13_3_Nao, rnd13_3_NA)
        varIssue(4) = DefinirPontuacao(rnd13_4_Sim, rnd13_4_Nao, rnd13_4_NA)
        varIssue(5) = DefinirPontuacao(rnd13_5_Sim, rnd13_5_Nao, rnd13_5_NA)
        varIssue(6) = DefinirPontuacao(rnd13_6_Sim, rnd13_6_Nao, rnd13_6_NA)
        varIssue(7) = DefinirPontuacao(rnd13_7_Sim, rnd13_7_Nao, rnd13_7_NA)
        varIssue(8) = DefinirPontuacao(rnd13_8_Sim, rnd13_8_Nao, rnd13_8_NA)
        varIssue(9) = DefinirPontuacao(rnd13_9_Sim, rnd13_9_Nao, rnd13_9_NA)
        varIssue(10) = DefinirPontuacao(rnd13_10_Sim, rnd13_10_Nao, rnd13_10_NA)
        varIssue(11) = DefinirPontuacao(rnd13_11_Sim, rnd13_11_Nao, rnd13_11_NA)
        varIssue(12) = DefinirPontuacao(rnd13_12_Sim, rnd13_12_Nao, rnd13_12_NA)
        varIssue(13) = DefinirPontuacao(rnd13_13_Sim, rnd13_13_Nao, rnd13_13_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 1, varIssue(1), userName, Me.txt13_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 2, varIssue(2), userName, Me.txt13_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 3, varIssue(3), userName, Me.txt13_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 4, varIssue(4), userName, Me.txt13_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 5, varIssue(5), userName, Me.txt13_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 6, varIssue(6), userName, Me.txt13_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 7, varIssue(7), userName, Me.txt13_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 8, varIssue(8), userName, Me.txt13_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 9, varIssue(9), userName, Me.txt13_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 10, varIssue(10), userName, Me.txt13_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 11, varIssue(11), userName, Me.txt13_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 12, varIssue(12), userName, Me.txt13_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 13, varIssue(13), userName, Me.txt13_13.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1)
        Me.panTitle13.CssClass = "pnl_Verde"
    End Sub  ' Bloco 13 - 11 a 13. Total de 3 Perguntas

    Protected Sub btnGrupo14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo14.Click
        Dim userName As String
        Dim varIssue(4) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd14_1_Sim, rnd14_1_Nao, rnd14_1_NA)
        varIssue(2) = DefinirPontuacao(rnd14_2_Sim, rnd14_2_Nao, rnd14_2_NA)
        varIssue(3) = DefinirPontuacao(rnd14_3_Sim, rnd14_3_Nao, rnd14_3_NA)
        varIssue(4) = DefinirPontuacao(rnd14_4_Sim, rnd14_4_Nao, rnd14_4_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 1, varIssue(1), userName, Me.txt14_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 2, varIssue(2), userName, Me.txt14_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 3, varIssue(3), userName, Me.txt14_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 4, varIssue(4), userName, Me.txt14_4.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1)
        Me.panTitle14.CssClass = "pnl_Verde"
    End Sub  ' Bloco 14 - 14 a 20. Total de 7 Perguntas

    Protected Sub btnGrupo15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo15.Click
        Dim userName As String
        Dim varIssue(6) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd15_1_Sim, rnd15_1_Nao, rnd15_1_NA)
        varIssue(2) = DefinirPontuacao(rnd15_2_Sim, rnd15_2_Nao, rnd15_2_NA)
        varIssue(3) = DefinirPontuacao(rnd15_3_Sim, rnd15_3_Nao, rnd15_3_NA)
        varIssue(4) = DefinirPontuacao(rnd15_4_Sim, rnd15_4_Nao, rnd15_4_NA)
        varIssue(5) = DefinirPontuacao(rnd15_5_Sim, rnd15_5_Nao, rnd15_5_NA)
        varIssue(6) = DefinirPontuacao(rnd15_6_Sim, rnd15_6_Nao, rnd15_6_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 1, varIssue(1), userName, Me.txt15_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 2, varIssue(2), userName, Me.txt15_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 3, varIssue(3), userName, Me.txt15_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 4, varIssue(4), userName, Me.txt15_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 5, varIssue(5), userName, Me.txt15_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 6, varIssue(6), userName, Me.txt15_6.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1)
        Me.panTitle15.CssClass = "pnl_Verde"
    End Sub  ' Bloco 15 - 1 a 12. Total de 12 Perguntas

    Protected Sub btnGrupo16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo16.Click
        Dim userName As String
        Dim varIssue(3) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd16_1_Sim, rnd16_1_Nao, rnd16_1_NA)
        varIssue(2) = DefinirPontuacao(rnd16_2_Sim, rnd16_2_Nao, rnd16_2_NA)
        varIssue(3) = DefinirPontuacao(rnd16_3_Sim, rnd16_3_Nao, rnd16_3_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 16, 1, 1, varIssue(1), userName, Me.txt16_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 16, 1, 2, varIssue(2), userName, Me.txt16_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 16, 1, 3, varIssue(3), userName, Me.txt16_3.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 16, 1)
        Me.panTitle16.CssClass = "pnl_Verde"
    End Sub  ' Bloco 16 - 1 a 6. Total de 6 Perguntas

    Protected Sub btnGrupo17_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo17.Click
        Dim userName As String
        Dim varIssue(21) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd17_1_Sim, rnd17_1_Nao, rnd17_1_NA)
        varIssue(2) = DefinirPontuacao(rnd17_2_Sim, rnd17_2_Nao, rnd17_2_NA)
        varIssue(3) = DefinirPontuacao(rnd17_3_Sim, rnd17_3_Nao, rnd17_3_NA)
        varIssue(4) = DefinirPontuacao(rnd17_4_Sim, rnd17_4_Nao, rnd17_4_NA)
        varIssue(5) = DefinirPontuacao(rnd17_5_Sim, rnd17_5_Nao, rnd17_5_NA)
        varIssue(6) = DefinirPontuacao(rnd17_6_Sim, rnd17_6_Nao, rnd17_6_NA)
        varIssue(7) = DefinirPontuacao(rnd17_7_Sim, rnd17_7_Nao, rnd17_7_NA)
        varIssue(8) = DefinirPontuacao(rnd17_8_Sim, rnd17_8_Nao, rnd17_8_NA)
        varIssue(9) = DefinirPontuacao(rnd17_9_Sim, rnd17_9_Nao, rnd17_9_NA)
        varIssue(10) = DefinirPontuacao(rnd17_10_Sim, rnd17_10_Nao, rnd17_10_NA)
        varIssue(11) = DefinirPontuacao(rnd17_11_Sim, rnd17_11_Nao, rnd17_11_NA)
        varIssue(12) = DefinirPontuacao(rnd17_12_Sim, rnd17_12_Nao, rnd17_12_NA)
        varIssue(13) = DefinirPontuacao(rnd17_13_Sim, rnd17_13_Nao, rnd17_13_NA)
        varIssue(14) = DefinirPontuacao(rnd17_14_Sim, rnd17_14_Nao, rnd17_14_NA)
        varIssue(15) = DefinirPontuacao(rnd17_15_Sim, rnd17_15_Nao, rnd17_15_NA)
        varIssue(16) = DefinirPontuacao(rnd17_16_Sim, rnd17_16_Nao, rnd17_16_NA)
        varIssue(17) = DefinirPontuacao(rnd17_17_Sim, rnd17_17_Nao, rnd17_17_NA)
        varIssue(18) = DefinirPontuacao(rnd17_18_Sim, rnd17_18_Nao, rnd17_18_NA)
        varIssue(19) = DefinirPontuacao(rnd17_19_Sim, rnd17_19_Nao, rnd17_19_NA)
        varIssue(20) = DefinirPontuacao(rnd17_20_Sim, rnd17_20_Nao, rnd17_20_NA)
        varIssue(21) = DefinirPontuacao(rnd17_21_Sim, rnd17_21_Nao, rnd17_21_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 1, varIssue(1), userName, Me.txt17_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 2, varIssue(2), userName, Me.txt17_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 3, varIssue(3), userName, Me.txt17_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 4, varIssue(4), userName, Me.txt17_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 5, varIssue(5), userName, Me.txt17_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 6, varIssue(6), userName, Me.txt17_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 7, varIssue(7), userName, Me.txt17_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 8, varIssue(8), userName, Me.txt17_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 9, varIssue(9), userName, Me.txt17_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 10, varIssue(10), userName, Me.txt17_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 11, varIssue(11), userName, Me.txt17_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 12, varIssue(12), userName, Me.txt17_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 13, varIssue(13), userName, Me.txt17_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 14, varIssue(14), userName, Me.txt17_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 15, varIssue(15), userName, Me.txt17_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 16, varIssue(16), userName, Me.txt17_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 17, varIssue(17), userName, Me.txt17_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 18, varIssue(18), userName, Me.txt17_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 19, varIssue(19), userName, Me.txt17_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 20, varIssue(20), userName, Me.txt17_20.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1, 21, varIssue(20), userName, Me.txt17_21.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1)
        Me.panTitle17.CssClass = "pnl_Verde"
    End Sub  ' Bloco 17 - 1 a 12. Total de 6 Perguntas

    Private Sub TudoAzul()
        Me.panTitle1.CssClass = "pnl_Azul"
        Me.panTitle2.CssClass = "pnl_Azul"
        Me.panTitle3.CssClass = "pnl_Azul"
        Me.panTitle4.CssClass = "pnl_Azul"
        Me.panTitle5.CssClass = "pnl_Azul"
        Me.panTitle6.CssClass = "pnl_Azul"
        Me.panTitle7.CssClass = "pnl_Azul"

        Me.panTitle11.CssClass = "pnl_Azul"
        Me.panTitle12.CssClass = "pnl_Azul"
        Me.panTitle13.CssClass = "pnl_Azul"
        Me.panTitle14.CssClass = "pnl_Azul"
        Me.panTitle15.CssClass = "pnl_Azul"
        Me.panTitle16.CssClass = "pnl_Azul"
        Me.panTitle17.CssClass = "pnl_Azul"

    End Sub

    Private Sub BCDet(ByVal myPontos As Byte, ByVal myText As TextBox, ByVal myDesc As String, _
                                   ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox)

        myText.Text = myDesc

        If myPontos = 1 Then
            rndSim.Checked = True
        Else
            rndSim.Checked = False
        End If
        If myPontos = 0 Then
            rndNao.Checked = True
        Else
            rndNao.Checked = False
        End If
        If myPontos = 2 Then
            rndNA.Checked = True
        Else
            rndNA.Checked = False
        End If

    End Sub

    Private Sub BuscarChecklist()
        Call TudoAzul()
        Call BuscarChecklist_Grupo1(1)
        Call BuscarChecklist_Grupo2(2)
        Call BuscarChecklist_Grupo3(3)
        Call BuscarChecklist_Grupo4(4)
        Call BuscarChecklist_Grupo5(5)
        Call BuscarChecklist_Grupo6(6)
        Call BuscarChecklist_Grupo7(7)

        Call BuscarChecklist_Grupo11(11)
        Call BuscarChecklist_Grupo12(12)
        Call BuscarChecklist_Grupo13(13)
        Call BuscarChecklist_Grupo14(14)
        Call BuscarChecklist_Grupo15(15)
        Call BuscarChecklist_Grupo16(16)
        Call BuscarChecklist_Grupo17(17)

        Call BuscarChecklist_GrupoCor()
    End Sub

    Private Sub BuscarChecklist_Grupo1(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt1_1, oCh.Descricao, Me.rnd1_1_Sim, rnd1_1_Nao, Me.rnd1_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt1_2, oCh.Descricao, Me.rnd1_2_Sim, rnd1_2_Nao, Me.rnd1_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt1_3, oCh.Descricao, Me.rnd1_3_Sim, rnd1_3_Nao, Me.rnd1_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt1_4, oCh.Descricao, Me.rnd1_4_Sim, rnd1_4_Nao, Me.rnd1_4_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo2(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt2_1, oCh.Descricao, Me.rnd2_1_Sim, rnd2_1_Nao, Me.rnd2_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt2_2, oCh.Descricao, Me.rnd2_2_Sim, rnd2_2_Nao, Me.rnd2_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt2_3, oCh.Descricao, Me.rnd2_3_Sim, rnd2_3_Nao, Me.rnd2_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt2_4, oCh.Descricao, Me.rnd2_4_Sim, rnd2_4_Nao, Me.rnd2_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt2_5, oCh.Descricao, Me.rnd2_5_Sim, rnd2_5_Nao, Me.rnd2_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt2_6, oCh.Descricao, Me.rnd2_6_Sim, rnd2_6_Nao, Me.rnd2_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt2_7, oCh.Descricao, Me.rnd2_7_Sim, rnd2_7_Nao, Me.rnd2_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt2_8, oCh.Descricao, Me.rnd2_8_Sim, rnd2_8_Nao, Me.rnd2_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt2_9, oCh.Descricao, Me.rnd2_9_Sim, rnd2_9_Nao, Me.rnd2_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt2_10, oCh.Descricao, Me.rnd2_10_Sim, rnd2_10_Nao, Me.rnd2_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt2_11, oCh.Descricao, Me.rnd2_11_Sim, rnd2_11_Nao, Me.rnd2_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt2_12, oCh.Descricao, Me.rnd2_12_Sim, rnd2_12_Nao, Me.rnd2_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt2_13, oCh.Descricao, Me.rnd2_13_Sim, rnd2_13_Nao, Me.rnd2_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt2_14, oCh.Descricao, Me.rnd2_14_Sim, rnd2_14_Nao, Me.rnd2_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt2_15, oCh.Descricao, Me.rnd2_15_Sim, rnd2_15_Nao, Me.rnd2_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt2_16, oCh.Descricao, Me.rnd2_16_Sim, rnd2_16_Nao, Me.rnd2_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 17)
        Call BCDet(oCh.Pontos, Me.txt2_17, oCh.Descricao, Me.rnd2_17_Sim, rnd2_17_Nao, Me.rnd2_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 18)
        Call BCDet(oCh.Pontos, Me.txt2_18, oCh.Descricao, Me.rnd2_18_Sim, rnd2_18_Nao, Me.rnd2_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 19)
        Call BCDet(oCh.Pontos, Me.txt2_19, oCh.Descricao, Me.rnd2_19_Sim, rnd2_19_Nao, Me.rnd2_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 20)
        Call BCDet(oCh.Pontos, Me.txt2_20, oCh.Descricao, Me.rnd2_20_Sim, rnd2_20_Nao, Me.rnd2_20_NA)



    End Sub

    Private Sub BuscarChecklist_Grupo3(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt3_1, oCh.Descricao, Me.rnd3_1_Sim, rnd3_1_Nao, Me.rnd3_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt3_2, oCh.Descricao, Me.rnd3_2_Sim, rnd3_2_Nao, Me.rnd3_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt3_3, oCh.Descricao, Me.rnd3_3_Sim, rnd3_3_Nao, Me.rnd3_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt3_4, oCh.Descricao, Me.rnd3_4_Sim, rnd3_4_Nao, Me.rnd3_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt3_5, oCh.Descricao, Me.rnd3_5_Sim, rnd3_5_Nao, Me.rnd3_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt3_6, oCh.Descricao, Me.rnd3_6_Sim, rnd3_6_Nao, Me.rnd3_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt3_7, oCh.Descricao, Me.rnd3_7_Sim, rnd3_7_Nao, Me.rnd3_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt3_8, oCh.Descricao, Me.rnd3_8_Sim, rnd3_8_Nao, Me.rnd3_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt3_9, oCh.Descricao, Me.rnd3_9_Sim, rnd3_9_Nao, Me.rnd3_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt3_10, oCh.Descricao, Me.rnd3_10_Sim, rnd3_10_Nao, Me.rnd3_10_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo4(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt4_1, oCh.Descricao, Me.rnd4_1_Sim, rnd4_1_Nao, Me.rnd4_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt4_2, oCh.Descricao, Me.rnd4_2_Sim, rnd4_2_Nao, Me.rnd4_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt4_3, oCh.Descricao, Me.rnd4_3_Sim, rnd4_3_Nao, Me.rnd4_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt4_4, oCh.Descricao, Me.rnd4_4_Sim, rnd4_4_Nao, Me.rnd4_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt4_5, oCh.Descricao, Me.rnd4_5_Sim, rnd4_5_Nao, Me.rnd4_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt4_6, oCh.Descricao, Me.rnd4_6_Sim, rnd4_6_Nao, Me.rnd4_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt4_7, oCh.Descricao, Me.rnd4_7_Sim, rnd4_7_Nao, Me.rnd4_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt4_8, oCh.Descricao, Me.rnd4_8_Sim, rnd4_8_Nao, Me.rnd4_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt4_9, oCh.Descricao, Me.rnd4_9_Sim, rnd4_9_Nao, Me.rnd4_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt4_10, oCh.Descricao, Me.rnd4_10_Sim, rnd4_10_Nao, Me.rnd4_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt4_11, oCh.Descricao, Me.rnd4_11_Sim, rnd4_11_Nao, Me.rnd4_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt4_12, oCh.Descricao, Me.rnd4_12_Sim, rnd4_12_Nao, Me.rnd4_12_NA)



    End Sub

    Private Sub BuscarChecklist_Grupo5(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt5_1, oCh.Descricao, Me.rnd5_1_Sim, rnd5_1_Nao, Me.rnd5_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt5_2, oCh.Descricao, Me.rnd5_2_Sim, rnd5_2_Nao, Me.rnd5_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt5_3, oCh.Descricao, Me.rnd5_3_Sim, rnd5_3_Nao, Me.rnd5_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt5_4, oCh.Descricao, Me.rnd5_4_Sim, rnd5_4_Nao, Me.rnd5_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt5_5, oCh.Descricao, Me.rnd5_5_Sim, rnd5_5_Nao, Me.rnd5_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt5_6, oCh.Descricao, Me.rnd5_6_Sim, rnd5_6_Nao, Me.rnd5_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt5_7, oCh.Descricao, Me.rnd5_7_Sim, rnd5_7_Nao, Me.rnd5_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt5_8, oCh.Descricao, Me.rnd5_8_Sim, rnd5_8_Nao, Me.rnd5_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt5_9, oCh.Descricao, Me.rnd5_9_Sim, rnd5_9_Nao, Me.rnd5_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt5_10, oCh.Descricao, Me.rnd5_10_Sim, rnd5_10_Nao, Me.rnd5_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt5_11, oCh.Descricao, Me.rnd5_11_Sim, rnd5_11_Nao, Me.rnd5_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt5_12, oCh.Descricao, Me.rnd5_12_Sim, rnd5_12_Nao, Me.rnd5_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt5_13, oCh.Descricao, Me.rnd5_13_Sim, rnd5_13_Nao, Me.rnd5_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt5_14, oCh.Descricao, Me.rnd5_14_Sim, rnd5_14_Nao, Me.rnd5_14_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo6(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt6_1, oCh.Descricao, Me.rnd6_1_Sim, rnd6_1_Nao, Me.rnd6_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt6_2, oCh.Descricao, Me.rnd6_2_Sim, rnd6_2_Nao, Me.rnd6_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt6_3, oCh.Descricao, Me.rnd6_3_Sim, rnd6_3_Nao, Me.rnd6_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt6_4, oCh.Descricao, Me.rnd6_4_Sim, rnd6_4_Nao, Me.rnd6_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt6_5, oCh.Descricao, Me.rnd6_5_Sim, rnd6_5_Nao, Me.rnd6_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt6_6, oCh.Descricao, Me.rnd6_6_Sim, rnd6_6_Nao, Me.rnd6_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt6_7, oCh.Descricao, Me.rnd6_7_Sim, rnd6_7_Nao, Me.rnd6_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt6_8, oCh.Descricao, Me.rnd6_8_Sim, rnd6_8_Nao, Me.rnd6_8_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo7(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt7_1, oCh.Descricao, Me.rnd7_1_Sim, rnd7_1_Nao, Me.rnd7_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt7_2, oCh.Descricao, Me.rnd7_2_Sim, rnd7_2_Nao, Me.rnd7_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt7_3, oCh.Descricao, Me.rnd7_3_Sim, rnd7_3_Nao, Me.rnd7_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt7_4, oCh.Descricao, Me.rnd7_4_Sim, rnd7_4_Nao, Me.rnd7_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt7_5, oCh.Descricao, Me.rnd7_5_Sim, rnd7_5_Nao, Me.rnd7_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt7_6, oCh.Descricao, Me.rnd7_6_Sim, rnd7_6_Nao, Me.rnd7_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt7_7, oCh.Descricao, Me.rnd7_7_Sim, rnd7_7_Nao, Me.rnd7_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt7_8, oCh.Descricao, Me.rnd7_8_Sim, rnd7_8_Nao, Me.rnd7_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt7_9, oCh.Descricao, Me.rnd7_9_Sim, rnd7_9_Nao, Me.rnd7_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt7_10, oCh.Descricao, Me.rnd7_10_Sim, rnd7_10_Nao, Me.rnd7_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt7_11, oCh.Descricao, Me.rnd7_11_Sim, rnd7_11_Nao, Me.rnd7_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt7_12, oCh.Descricao, Me.rnd7_12_Sim, rnd7_12_Nao, Me.rnd7_12_NA)


    End Sub


    Private Sub BuscarChecklist_Grupo11(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt11_1, oCh.Descricao, Me.rnd11_1_Sim, rnd11_1_Nao, Me.rnd11_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt11_2, oCh.Descricao, Me.rnd11_2_Sim, rnd11_2_Nao, Me.rnd11_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt11_3, oCh.Descricao, Me.rnd11_3_Sim, rnd11_3_Nao, Me.rnd11_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt11_4, oCh.Descricao, Me.rnd11_4_Sim, rnd11_4_Nao, Me.rnd11_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt11_5, oCh.Descricao, Me.rnd11_5_Sim, rnd11_5_Nao, Me.rnd11_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt11_6, oCh.Descricao, Me.rnd11_6_Sim, rnd11_6_Nao, Me.rnd11_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt11_7, oCh.Descricao, Me.rnd11_7_Sim, rnd11_7_Nao, Me.rnd11_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt11_8, oCh.Descricao, Me.rnd11_8_Sim, rnd11_8_Nao, Me.rnd11_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt11_9, oCh.Descricao, Me.rnd11_9_Sim, rnd11_9_Nao, Me.rnd11_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt11_10, oCh.Descricao, Me.rnd11_10_Sim, rnd11_10_Nao, Me.rnd11_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt11_11, oCh.Descricao, Me.rnd11_11_Sim, rnd11_11_Nao, Me.rnd11_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt11_12, oCh.Descricao, Me.rnd11_12_Sim, rnd11_12_Nao, Me.rnd11_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt11_13, oCh.Descricao, Me.rnd11_13_Sim, rnd11_13_Nao, Me.rnd11_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt11_14, oCh.Descricao, Me.rnd11_14_Sim, rnd11_14_Nao, Me.rnd11_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt11_15, oCh.Descricao, Me.rnd11_15_Sim, rnd11_15_Nao, Me.rnd11_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt11_16, oCh.Descricao, Me.rnd11_16_Sim, rnd11_16_Nao, Me.rnd11_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 17)
        Call BCDet(oCh.Pontos, Me.txt11_17, oCh.Descricao, Me.rnd11_17_Sim, rnd11_17_Nao, Me.rnd11_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 18)
        Call BCDet(oCh.Pontos, Me.txt11_18, oCh.Descricao, Me.rnd11_18_Sim, rnd11_18_Nao, Me.rnd11_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 19)
        Call BCDet(oCh.Pontos, Me.txt11_19, oCh.Descricao, Me.rnd11_19_Sim, rnd11_19_Nao, Me.rnd11_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 20)
        Call BCDet(oCh.Pontos, Me.txt11_20, oCh.Descricao, Me.rnd11_20_Sim, rnd11_20_Nao, Me.rnd11_20_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 21)
        Call BCDet(oCh.Pontos, Me.txt11_21, oCh.Descricao, Me.rnd11_21_Sim, rnd11_21_Nao, Me.rnd11_21_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 22)
        Call BCDet(oCh.Pontos, Me.txt11_22, oCh.Descricao, Me.rnd11_22_Sim, rnd11_22_Nao, Me.rnd11_22_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo12(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt12_1, oCh.Descricao, Me.rnd12_1_Sim, rnd12_1_Nao, Me.rnd12_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt12_2, oCh.Descricao, Me.rnd12_2_Sim, rnd12_2_Nao, Me.rnd12_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt12_3, oCh.Descricao, Me.rnd12_3_Sim, rnd12_3_Nao, Me.rnd12_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt12_4, oCh.Descricao, Me.rnd12_4_Sim, rnd12_4_Nao, Me.rnd12_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt12_5, oCh.Descricao, Me.rnd12_5_Sim, rnd12_5_Nao, Me.rnd12_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt12_6, oCh.Descricao, Me.rnd12_6_Sim, rnd12_6_Nao, Me.rnd12_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt12_7, oCh.Descricao, Me.rnd12_7_Sim, rnd12_7_Nao, Me.rnd12_7_NA)



    End Sub

    Private Sub BuscarChecklist_Grupo13(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt13_1, oCh.Descricao, Me.rnd13_1_Sim, rnd13_1_Nao, Me.rnd13_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt13_2, oCh.Descricao, Me.rnd13_2_Sim, rnd13_2_Nao, Me.rnd13_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt13_3, oCh.Descricao, Me.rnd13_3_Sim, rnd13_3_Nao, Me.rnd13_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt13_4, oCh.Descricao, Me.rnd13_4_Sim, rnd13_4_Nao, Me.rnd13_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt13_5, oCh.Descricao, Me.rnd13_5_Sim, rnd13_5_Nao, Me.rnd13_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt13_6, oCh.Descricao, Me.rnd13_6_Sim, rnd13_6_Nao, Me.rnd13_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt13_13, oCh.Descricao, Me.rnd13_13_Sim, rnd13_13_Nao, Me.rnd13_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt13_13, oCh.Descricao, Me.rnd13_13_Sim, rnd13_13_Nao, Me.rnd13_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt13_9, oCh.Descricao, Me.rnd13_9_Sim, rnd13_9_Nao, Me.rnd13_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt13_10, oCh.Descricao, Me.rnd13_10_Sim, rnd13_10_Nao, Me.rnd13_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt13_11, oCh.Descricao, Me.rnd13_11_Sim, rnd13_11_Nao, Me.rnd13_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt13_12, oCh.Descricao, Me.rnd13_12_Sim, rnd13_12_Nao, Me.rnd13_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt13_13, oCh.Descricao, Me.rnd13_13_Sim, rnd13_13_Nao, Me.rnd13_13_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo14(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt14_1, oCh.Descricao, Me.rnd14_1_Sim, rnd14_1_Nao, Me.rnd14_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt14_2, oCh.Descricao, Me.rnd14_2_Sim, rnd14_2_Nao, Me.rnd14_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt14_3, oCh.Descricao, Me.rnd14_3_Sim, rnd14_3_Nao, Me.rnd14_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt14_4, oCh.Descricao, Me.rnd14_4_Sim, rnd14_4_Nao, Me.rnd14_4_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo15(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt15_1, oCh.Descricao, Me.rnd15_1_Sim, rnd15_1_Nao, Me.rnd15_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt15_2, oCh.Descricao, Me.rnd15_2_Sim, rnd15_2_Nao, Me.rnd15_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt15_3, oCh.Descricao, Me.rnd15_3_Sim, rnd15_3_Nao, Me.rnd15_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt15_4, oCh.Descricao, Me.rnd15_4_Sim, rnd15_4_Nao, Me.rnd15_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt15_5, oCh.Descricao, Me.rnd15_5_Sim, rnd15_5_Nao, Me.rnd15_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt15_6, oCh.Descricao, Me.rnd15_6_Sim, rnd15_6_Nao, Me.rnd15_6_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo16(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt16_1, oCh.Descricao, Me.rnd16_1_Sim, rnd16_1_Nao, Me.rnd16_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt16_2, oCh.Descricao, Me.rnd16_2_Sim, rnd16_2_Nao, Me.rnd16_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt16_3, oCh.Descricao, Me.rnd16_3_Sim, rnd16_3_Nao, Me.rnd16_3_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo17(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt17_1, oCh.Descricao, Me.rnd17_1_Sim, rnd17_1_Nao, Me.rnd17_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt17_2, oCh.Descricao, Me.rnd17_2_Sim, rnd17_2_Nao, Me.rnd17_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt17_3, oCh.Descricao, Me.rnd17_3_Sim, rnd17_3_Nao, Me.rnd17_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt17_4, oCh.Descricao, Me.rnd17_4_Sim, rnd17_4_Nao, Me.rnd17_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt17_5, oCh.Descricao, Me.rnd17_5_Sim, rnd17_5_Nao, Me.rnd17_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt17_6, oCh.Descricao, Me.rnd17_6_Sim, rnd17_6_Nao, Me.rnd17_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt17_7, oCh.Descricao, Me.rnd17_7_Sim, rnd17_7_Nao, Me.rnd17_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt17_8, oCh.Descricao, Me.rnd17_8_Sim, rnd17_8_Nao, Me.rnd17_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt17_9, oCh.Descricao, Me.rnd17_9_Sim, rnd17_9_Nao, Me.rnd17_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt17_10, oCh.Descricao, Me.rnd17_10_Sim, rnd17_10_Nao, Me.rnd17_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt17_11, oCh.Descricao, Me.rnd17_11_Sim, rnd17_11_Nao, Me.rnd17_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt17_12, oCh.Descricao, Me.rnd17_12_Sim, rnd17_12_Nao, Me.rnd17_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt17_13, oCh.Descricao, Me.rnd17_13_Sim, rnd17_13_Nao, Me.rnd17_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt17_14, oCh.Descricao, Me.rnd17_14_Sim, rnd17_14_Nao, Me.rnd17_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt17_15, oCh.Descricao, Me.rnd17_15_Sim, rnd17_15_Nao, Me.rnd17_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt17_16, oCh.Descricao, Me.rnd17_16_Sim, rnd17_16_Nao, Me.rnd17_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 17)
        Call BCDet(oCh.Pontos, Me.txt17_17, oCh.Descricao, Me.rnd17_17_Sim, rnd17_17_Nao, Me.rnd17_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 18)
        Call BCDet(oCh.Pontos, Me.txt17_18, oCh.Descricao, Me.rnd17_18_Sim, rnd17_18_Nao, Me.rnd17_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 19)
        Call BCDet(oCh.Pontos, Me.txt17_19, oCh.Descricao, Me.rnd17_19_Sim, rnd17_19_Nao, Me.rnd17_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 20)
        Call BCDet(oCh.Pontos, Me.txt17_20, oCh.Descricao, Me.rnd17_20_Sim, rnd17_20_Nao, Me.rnd17_20_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 21)
        Call BCDet(oCh.Pontos, Me.txt17_21, oCh.Descricao, Me.rnd17_21_Sim, rnd17_21_Nao, Me.rnd17_21_NA)


    End Sub




    Private Sub BuscarChecklist_GrupoCor()
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1)
        Call AtualizarCorTitulo(panTitle1, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1)
        Call AtualizarCorTitulo(panTitle2, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1)
        Call AtualizarCorTitulo(panTitle3, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1)
        Call AtualizarCorTitulo(panTitle4, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1)
        Call AtualizarCorTitulo(panTitle5, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1)
        Call AtualizarCorTitulo(panTitle6, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1)
        Call AtualizarCorTitulo(panTitle7, oCh.Pontos)


        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1)
        Call AtualizarCorTitulo(panTitle11, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1)
        Call AtualizarCorTitulo(panTitle12, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1)
        Call AtualizarCorTitulo(panTitle13, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1)
        Call AtualizarCorTitulo(panTitle14, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1)
        Call AtualizarCorTitulo(panTitle15, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 16, 1)
        Call AtualizarCorTitulo(panTitle16, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 17, 1)
        Call AtualizarCorTitulo(panTitle17, oCh.Pontos)

    End Sub

    Private Sub AtualizarCorTitulo(ByVal iPanel As Panel, ByVal iPontos As Byte)
        If oCh.Pontos = 0 Then
            iPanel.CssClass = "pnl_Azul"
        Else
            iPanel.CssClass = "pnl_Verde"
        End If
    End Sub

    Private Sub fPadraoInicial(ByVal rndNA As CheckBox)
        rndNA.Checked = True
    End Sub

    Private Sub PadraoInicial()
        'Grupo 1
        Call fPadraoInicial(rnd1_1_NA)
        Call fPadraoInicial(rnd1_2_NA)
        Call fPadraoInicial(rnd1_3_NA)
        Call fPadraoInicial(rnd1_4_NA)


        'Grupo 2
        Call fPadraoInicial(rnd2_1_NA)
        Call fPadraoInicial(rnd2_2_NA)
        Call fPadraoInicial(rnd2_3_NA)
        Call fPadraoInicial(rnd2_4_NA)
        Call fPadraoInicial(rnd2_5_NA)
        Call fPadraoInicial(rnd2_6_NA)
        Call fPadraoInicial(rnd2_7_NA)
        Call fPadraoInicial(rnd2_8_NA)
        Call fPadraoInicial(rnd2_9_NA)
        Call fPadraoInicial(rnd2_10_NA)
        Call fPadraoInicial(rnd2_11_NA)
        Call fPadraoInicial(rnd2_12_NA)
        Call fPadraoInicial(rnd2_13_NA)

        Call fPadraoInicial(rnd2_14_NA)
        Call fPadraoInicial(rnd2_15_NA)
        Call fPadraoInicial(rnd2_16_NA)
        Call fPadraoInicial(rnd2_17_NA)
        Call fPadraoInicial(rnd2_18_NA)
        Call fPadraoInicial(rnd2_19_NA)
        Call fPadraoInicial(rnd2_20_NA)


        'Grupo 3
        Call fPadraoInicial(rnd3_1_NA)
        Call fPadraoInicial(rnd3_2_NA)
        Call fPadraoInicial(rnd3_3_NA)
        Call fPadraoInicial(rnd3_4_NA)
        Call fPadraoInicial(rnd3_5_NA)
        Call fPadraoInicial(rnd3_6_NA)
        Call fPadraoInicial(rnd3_7_NA)
        Call fPadraoInicial(rnd3_8_NA)
        Call fPadraoInicial(rnd3_9_NA)
        Call fPadraoInicial(rnd3_10_NA)


        'Grupo 4
        Call fPadraoInicial(rnd4_1_NA)
        Call fPadraoInicial(rnd4_2_NA)
        Call fPadraoInicial(rnd4_3_NA)

        Call fPadraoInicial(rnd4_4_NA)
        Call fPadraoInicial(rnd4_5_NA)
        Call fPadraoInicial(rnd4_6_NA)
        Call fPadraoInicial(rnd4_7_NA)
        Call fPadraoInicial(rnd4_8_NA)
        Call fPadraoInicial(rnd4_9_NA)
        Call fPadraoInicial(rnd4_10_NA)

        Call fPadraoInicial(rnd4_11_NA)
        Call fPadraoInicial(rnd4_12_NA)

        'Grupo 5
        Call fPadraoInicial(rnd5_1_NA)
        Call fPadraoInicial(rnd5_2_NA)
        Call fPadraoInicial(rnd5_3_NA)
        Call fPadraoInicial(rnd5_4_NA)
        Call fPadraoInicial(rnd5_5_NA)
        Call fPadraoInicial(rnd5_6_NA)
        Call fPadraoInicial(rnd5_7_NA)
        Call fPadraoInicial(rnd5_8_NA)
        Call fPadraoInicial(rnd5_9_NA)
        Call fPadraoInicial(rnd5_10_NA)
        Call fPadraoInicial(rnd5_11_NA)
        Call fPadraoInicial(rnd5_12_NA)
        Call fPadraoInicial(rnd5_13_NA)
        Call fPadraoInicial(rnd5_14_NA)

        'Grupo 6
        Call fPadraoInicial(rnd6_1_NA)
        Call fPadraoInicial(rnd6_2_NA)
        Call fPadraoInicial(rnd6_3_NA)
        Call fPadraoInicial(rnd6_4_NA)
        Call fPadraoInicial(rnd6_5_NA)
        Call fPadraoInicial(rnd6_6_NA)
        Call fPadraoInicial(rnd6_7_NA)
        Call fPadraoInicial(rnd6_8_NA)


        'Grupo 7
        Call fPadraoInicial(rnd7_1_NA)
        Call fPadraoInicial(rnd7_2_NA)
        Call fPadraoInicial(rnd7_3_NA)
        Call fPadraoInicial(rnd7_4_NA)
        Call fPadraoInicial(rnd7_5_NA)
        Call fPadraoInicial(rnd7_6_NA)
        Call fPadraoInicial(rnd7_7_NA)
        Call fPadraoInicial(rnd7_8_NA)
        Call fPadraoInicial(rnd7_9_NA)
        Call fPadraoInicial(rnd7_10_NA)
        Call fPadraoInicial(rnd7_11_NA)
        Call fPadraoInicial(rnd7_12_NA)
        Call fPadraoInicial(rnd7_13_NA)
        Call fPadraoInicial(rnd7_14_NA)
        Call fPadraoInicial(rnd7_15_NA)
        Call fPadraoInicial(rnd7_16_NA)
        Call fPadraoInicial(rnd7_17_NA)
        Call fPadraoInicial(rnd7_18_NA)
        Call fPadraoInicial(rnd7_19_NA)


        'Grupo 11
        Call fPadraoInicial(rnd11_1_NA)
        Call fPadraoInicial(rnd11_2_NA)
        Call fPadraoInicial(rnd11_3_NA)
        Call fPadraoInicial(rnd11_4_NA)
        Call fPadraoInicial(rnd11_5_NA)
        Call fPadraoInicial(rnd11_6_NA)
        Call fPadraoInicial(rnd11_7_NA)
        Call fPadraoInicial(rnd11_8_NA)
        Call fPadraoInicial(rnd11_9_NA)
        Call fPadraoInicial(rnd11_10_NA)
        Call fPadraoInicial(rnd11_11_NA)
        Call fPadraoInicial(rnd11_12_NA)
        Call fPadraoInicial(rnd11_13_NA)
        Call fPadraoInicial(rnd11_14_NA)
        Call fPadraoInicial(rnd11_15_NA)
        Call fPadraoInicial(rnd11_16_NA)
        Call fPadraoInicial(rnd11_17_NA)
        Call fPadraoInicial(rnd11_18_NA)
        Call fPadraoInicial(rnd11_19_NA)
        Call fPadraoInicial(rnd11_20_NA)
        Call fPadraoInicial(rnd11_21_NA)
        Call fPadraoInicial(rnd11_22_NA)

        'Grupo 12
        Call fPadraoInicial(rnd12_1_NA)
        Call fPadraoInicial(rnd12_2_NA)
        Call fPadraoInicial(rnd12_3_NA)
        Call fPadraoInicial(rnd12_4_NA)
        Call fPadraoInicial(rnd12_5_NA)
        Call fPadraoInicial(rnd12_6_NA)
        Call fPadraoInicial(rnd12_7_NA)

        'Grupo 13
        Call fPadraoInicial(rnd13_1_NA)
        Call fPadraoInicial(rnd13_2_NA)
        Call fPadraoInicial(rnd13_3_NA)
        Call fPadraoInicial(rnd13_4_NA)
        Call fPadraoInicial(rnd13_5_NA)
        Call fPadraoInicial(rnd13_6_NA)
        Call fPadraoInicial(rnd13_7_NA)
        Call fPadraoInicial(rnd13_8_NA)
        Call fPadraoInicial(rnd13_9_NA)
        Call fPadraoInicial(rnd13_10_NA)
        Call fPadraoInicial(rnd13_11_NA)
        Call fPadraoInicial(rnd13_12_NA)
        Call fPadraoInicial(rnd13_13_NA)

        'Grupo 14
        Call fPadraoInicial(rnd14_1_NA)
        Call fPadraoInicial(rnd14_2_NA)
        Call fPadraoInicial(rnd14_3_NA)
        Call fPadraoInicial(rnd14_4_NA)

        'Grupo 15
        Call fPadraoInicial(rnd15_1_NA)
        Call fPadraoInicial(rnd15_2_NA)
        Call fPadraoInicial(rnd15_3_NA)
        Call fPadraoInicial(rnd15_4_NA)
        Call fPadraoInicial(rnd15_5_NA)
        Call fPadraoInicial(rnd15_6_NA)

        'Grupo 16
        Call fPadraoInicial(rnd16_1_NA)
        Call fPadraoInicial(rnd16_2_NA)
        Call fPadraoInicial(rnd16_3_NA)


        'Grupo 17
        Call fPadraoInicial(rnd17_1_NA)
        Call fPadraoInicial(rnd17_2_NA)
        Call fPadraoInicial(rnd17_3_NA)
        Call fPadraoInicial(rnd17_4_NA)
        Call fPadraoInicial(rnd17_5_NA)
        Call fPadraoInicial(rnd17_6_NA)
        Call fPadraoInicial(rnd17_7_NA)
        Call fPadraoInicial(rnd17_8_NA)
        Call fPadraoInicial(rnd17_9_NA)
        Call fPadraoInicial(rnd17_10_NA)
        Call fPadraoInicial(rnd17_11_NA)
        Call fPadraoInicial(rnd17_12_NA)
        Call fPadraoInicial(rnd17_13_NA)
        Call fPadraoInicial(rnd17_14_NA)
        Call fPadraoInicial(rnd17_15_NA)
        Call fPadraoInicial(rnd17_16_NA)
        Call fPadraoInicial(rnd17_17_NA)
        Call fPadraoInicial(rnd17_18_NA)
        Call fPadraoInicial(rnd17_19_NA)
        Call fPadraoInicial(rnd17_20_NA)
        Call fPadraoInicial(rnd17_21_NA)

    End Sub

#Region " btnSalvarFoto"

#Region " btnSalvarFoto - Grupo 1.1"

    Protected Sub btnSalvarFoto1_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_1.Click
        Call UploadImagem(Me.upFile1_1, Me.txt1_1.Text, 1, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto1_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_2.Click
        Call UploadImagem(Me.upFile1_2, Me.txt1_2.Text, 1, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto1_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_3.Click
        Call UploadImagem(Me.upFile1_3, Me.txt1_3.Text, 1, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto1_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_4.Click
        Call UploadImagem(Me.upFile1_4, Me.txt1_4.Text, 1, 1, 4)
    End Sub


#End Region

#Region " btnSalvarFoto - Grupo 2.1"
    ' Grupo 2.1

    Protected Sub btnSalvarFoto2_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_1.Click
        Call UploadImagem(Me.upFile2_1, Me.txt2_1.Text, 2, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto2_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_2.Click
        Call UploadImagem(Me.upFile2_2, Me.txt2_2.Text, 2, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto2_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_3.Click
        Call UploadImagem(Me.upFile2_3, Me.txt2_3.Text, 2, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto2_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_4.Click
        Call UploadImagem(Me.upFile2_4, Me.txt2_4.Text, 2, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto2_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_5.Click
        Call UploadImagem(Me.upFile2_5, Me.txt2_5.Text, 2, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto2_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_6.Click
        Call UploadImagem(Me.upFile2_6, Me.txt2_6.Text, 2, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto2_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_7.Click
        Call UploadImagem(Me.upFile2_7, Me.txt2_7.Text, 2, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto2_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_8.Click
        Call UploadImagem(Me.upFile2_8, Me.txt2_8.Text, 2, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto2_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_9.Click
        Call UploadImagem(Me.upFile2_9, Me.txt2_9.Text, 2, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto2_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_10.Click
        Call UploadImagem(Me.upFile2_10, Me.txt2_10.Text, 2, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto2_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_11.Click
        Call UploadImagem(Me.upFile2_11, Me.txt2_11.Text, 2, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto2_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_12.Click
        Call UploadImagem(Me.upFile2_12, Me.txt2_12.Text, 2, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto2_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_13.Click
        Call UploadImagem(Me.upFile2_13, Me.txt2_13.Text, 2, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto2_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_14.Click
        Call UploadImagem(Me.upFile2_14, Me.txt2_14.Text, 2, 1, 14)
    End Sub

    Protected Sub btnSalvarFoto2_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_15.Click
        Call UploadImagem(Me.upFile2_15, Me.txt2_15.Text, 2, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto2_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_16.Click
        Call UploadImagem(Me.upFile2_16, Me.txt2_16.Text, 2, 1, 16)
    End Sub

    Protected Sub btnSalvarFoto2_17_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_17.Click
        Call UploadImagem(Me.upFile2_17, Me.txt2_17.Text, 2, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto2_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_18.Click
        Call UploadImagem(Me.upFile2_18, Me.txt2_18.Text, 2, 1, 18)
    End Sub

    Protected Sub btnSalvarFoto2_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_19.Click
        Call UploadImagem(Me.upFile2_19, Me.txt2_19.Text, 2, 1, 19)
    End Sub

    Protected Sub btnSalvarFoto2_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_20.Click
        Call UploadImagem(Me.upFile2_20, Me.txt2_20.Text, 2, 1, 20)
    End Sub



#End Region

#Region " btnSalvarFoto - Grupo3.1"

    Protected Sub btnSalvarFoto3_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_1.Click
        Call UploadImagem(Me.upFile3_1, Me.txt3_1.Text, 3, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto3_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_2.Click
        Call UploadImagem(Me.upFile3_2, Me.txt3_2.Text, 3, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto3_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_3.Click
        Call UploadImagem(Me.upFile3_3, Me.txt3_3.Text, 3, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto3_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_4.Click
        Call UploadImagem(Me.upFile3_4, Me.txt3_4.Text, 3, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto3_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_5.Click
        Call UploadImagem(Me.upFile3_5, Me.txt3_5.Text, 3, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto3_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_6.Click
        Call UploadImagem(Me.upFile3_6, Me.txt3_6.Text, 3, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto3_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_7.Click
        Call UploadImagem(Me.upFile3_7, Me.txt3_7.Text, 3, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto3_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_8.Click
        Call UploadImagem(Me.upFile3_8, Me.txt3_8.Text, 3, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto3_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_9.Click
        Call UploadImagem(Me.upFile3_9, Me.txt3_9.Text, 3, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto3_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_10.Click
        Call UploadImagem(Me.upFile3_10, Me.txt3_10.Text, 3, 1, 10)
    End Sub



#End Region

#Region " btnSalvarFoto - Grupo 4.1"

    'GRUPO 4 ************************************************************************************************************
    Protected Sub btnSalvarFoto4_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_1.Click
        Call UploadImagem(Me.upFile4_1, Me.txt4_1.Text, 4, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto4_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_2.Click
        Call UploadImagem(Me.upFile4_2, Me.txt4_2.Text, 4, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto4_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_3.Click
        Call UploadImagem(Me.upFile4_3, Me.txt4_3.Text, 4, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto4_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_4.Click
        Call UploadImagem(Me.upFile4_4, Me.txt4_4.Text, 4, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto4_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_5.Click
        Call UploadImagem(Me.upFile4_5, Me.txt4_5.Text, 4, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto4_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_6.Click
        Call UploadImagem(Me.upFile4_6, Me.txt4_6.Text, 4, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto4_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_7.Click
        Call UploadImagem(Me.upFile4_7, Me.txt4_7.Text, 4, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto4_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_8.Click
        Call UploadImagem(Me.upFile4_8, Me.txt4_8.Text, 4, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto4_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_9.Click
        Call UploadImagem(Me.upFile4_9, Me.txt4_9.Text, 4, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto4_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_10.Click
        Call UploadImagem(Me.upFile4_10, Me.txt4_10.Text, 4, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto4_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_11.Click
        Call UploadImagem(Me.upFile4_11, Me.txt4_11.Text, 4, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto4_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_12.Click
        Call UploadImagem(Me.upFile4_12, Me.txt4_12.Text, 4, 1, 12)
    End Sub


#End Region

#Region " btnSalvarFoto - Grupo 5.1"
    'GRUPO 5 *******************************************************************************************************************
    Protected Sub btnSalvarFoto5_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_1.Click
        Call UploadImagem(Me.upFile5_1, Me.txt5_1.Text, 5, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto5_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_2.Click
        Call UploadImagem(Me.upFile5_2, Me.txt5_2.Text, 5, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto5_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_3.Click
        Call UploadImagem(Me.upFile5_3, Me.txt5_3.Text, 5, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto5_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_4.Click
        Call UploadImagem(Me.upFile5_4, Me.txt5_4.Text, 5, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto5_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_5.Click
        Call UploadImagem(Me.upFile5_5, Me.txt5_5.Text, 5, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto5_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_6.Click
        Call UploadImagem(Me.upFile5_6, Me.txt5_6.Text, 5, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto5_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_7.Click
        Call UploadImagem(Me.upFile5_7, Me.txt5_7.Text, 5, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto5_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_8.Click
        Call UploadImagem(Me.upFile5_8, Me.txt5_8.Text, 5, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto5_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_9.Click
        Call UploadImagem(Me.upFile5_9, Me.txt5_9.Text, 5, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto5_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_10.Click
        Call UploadImagem(Me.upFile5_10, Me.txt5_10.Text, 5, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto5_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_11.Click
        Call UploadImagem(Me.upFile5_11, Me.txt5_11.Text, 5, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto5_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_12.Click
        Call UploadImagem(Me.upFile5_12, Me.txt5_12.Text, 5, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto5_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_13.Click
        Call UploadImagem(Me.upFile5_13, Me.txt5_13.Text, 5, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto5_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto5_14.Click
        Call UploadImagem(Me.upFile5_14, Me.txt5_14.Text, 5, 1, 14)
    End Sub



#End Region

#Region " btnSalvarFoto - Grupo 6.1"
    ' GRUPO 6 *************************************************************************************************************
    Protected Sub btnSalvarFoto6_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_1.Click
        Call UploadImagem(Me.upFile6_1, Me.txt6_1.Text, 6, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto6_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_2.Click
        Call UploadImagem(Me.upFile6_2, Me.txt6_2.Text, 6, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto6_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_3.Click
        Call UploadImagem(Me.upFile6_3, Me.txt6_3.Text, 6, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto6_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_4.Click
        Call UploadImagem(Me.upFile6_4, Me.txt6_4.Text, 6, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto6_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_5.Click
        Call UploadImagem(Me.upFile6_5, Me.txt6_5.Text, 6, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto6_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_6.Click
        Call UploadImagem(Me.upFile6_6, Me.txt6_6.Text, 6, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto6_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_7.Click
        Call UploadImagem(Me.upFile6_7, Me.txt6_7.Text, 6, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto6_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto6_6.Click
        Call UploadImagem(Me.upFile6_8, Me.txt6_8.Text, 6, 1, 8)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 7.1"

    Protected Sub btnSalvarFoto7_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_1.Click
        Call UploadImagem(Me.upFile7_1, Me.txt7_1.Text, 7, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto7_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_2.Click
        Call UploadImagem(Me.upFile7_2, Me.txt7_2.Text, 7, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto7_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_3.Click
        Call UploadImagem(Me.upFile7_3, Me.txt7_3.Text, 7, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto7_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_4.Click
        Call UploadImagem(Me.upFile7_4, Me.txt7_4.Text, 7, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto7_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_5.Click
        Call UploadImagem(Me.upFile7_5, Me.txt7_5.Text, 7, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto7_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_6.Click
        Call UploadImagem(Me.upFile7_6, Me.txt7_6.Text, 7, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto7_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_7.Click
        Call UploadImagem(Me.upFile7_7, Me.txt7_7.Text, 7, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto7_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_8.Click
        Call UploadImagem(Me.upFile7_8, Me.txt7_8.Text, 7, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto7_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_9.Click
        Call UploadImagem(Me.upFile7_9, Me.txt7_9.Text, 7, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto7_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_10.Click
        Call UploadImagem(Me.upFile7_10, Me.txt7_10.Text, 7, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto7_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_11.Click
        Call UploadImagem(Me.upFile7_11, Me.txt7_11.Text, 7, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto7_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_12.Click
        Call UploadImagem(Me.upFile7_12, Me.txt7_12.Text, 7, 1, 12)
    End Sub


    Protected Sub btnSalvarFoto7_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_13.Click
        Call UploadImagem(Me.upFile7_13, Me.txt7_13.Text, 7, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto7_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_14.Click
        Call UploadImagem(Me.upFile7_14, Me.txt7_14.Text, 7, 1, 14)
    End Sub

    Protected Sub btnSalvarFoto7_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_15.Click
        Call UploadImagem(Me.upFile7_15, Me.txt7_15.Text, 7, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto7_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_16.Click
        Call UploadImagem(Me.upFile7_16, Me.txt7_16.Text, 7, 1, 16)
    End Sub

    Protected Sub btnSalvarFoto7_17_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_17.Click
        Call UploadImagem(Me.upFile7_17, Me.txt7_17.Text, 7, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto7_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_18.Click
        Call UploadImagem(Me.upFile7_18, Me.txt7_18.Text, 7, 1, 18)
    End Sub

    Protected Sub btnSalvarFoto7_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_19.Click
        Call UploadImagem(Me.upFile7_19, Me.txt7_19.Text, 7, 1, 19)
    End Sub


#End Region

#Region " btnSalvarFoto - Grupo 11.1"

    Protected Sub btnSalvarFoto11_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_1.Click
        Call UploadImagem(Me.upFile11_1, Me.txt11_1.Text, 11, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto11_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_2.Click
        Call UploadImagem(Me.upFile11_2, Me.txt11_2.Text, 11, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto11_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_3.Click
        Call UploadImagem(Me.upFile11_3, Me.txt11_3.Text, 11, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto11_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_4.Click
        Call UploadImagem(Me.upFile11_4, Me.txt11_4.Text, 11, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto11_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_5.Click
        Call UploadImagem(Me.upFile11_5, Me.txt11_5.Text, 11, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto11_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_6.Click
        Call UploadImagem(Me.upFile11_6, Me.txt11_6.Text, 11, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto11_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_7.Click
        Call UploadImagem(Me.upFile11_7, Me.txt11_7.Text, 11, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto11_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_8.Click
        Call UploadImagem(Me.upFile11_8, Me.txt11_8.Text, 11, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto11_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_9.Click
        Call UploadImagem(Me.upFile11_9, Me.txt11_9.Text, 11, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto11_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_10.Click
        Call UploadImagem(Me.upFile11_10, Me.txt11_10.Text, 11, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto11_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_11.Click
        Call UploadImagem(Me.upFile11_11, Me.txt11_11.Text, 11, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto11_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_12.Click
        Call UploadImagem(Me.upFile11_12, Me.txt11_12.Text, 11, 1, 12)
    End Sub


    Protected Sub btnSalvarFoto11_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_13.Click
        Call UploadImagem(Me.upFile11_13, Me.txt11_13.Text, 11, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto11_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_14.Click
        Call UploadImagem(Me.upFile11_14, Me.txt11_14.Text, 11, 1, 14)
    End Sub

    Protected Sub btnSalvarFoto11_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_15.Click
        Call UploadImagem(Me.upFile11_15, Me.txt11_15.Text, 11, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto11_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_16.Click
        Call UploadImagem(Me.upFile11_16, Me.txt11_16.Text, 11, 1, 16)
    End Sub

    Protected Sub btnSalvarFoto11_111_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_17.Click
        Call UploadImagem(Me.upFile11_17, Me.txt11_17.Text, 11, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto11_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_18.Click
        Call UploadImagem(Me.upFile11_18, Me.txt11_18.Text, 11, 1, 18)
    End Sub

    Protected Sub btnSalvarFoto11_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_19.Click
        Call UploadImagem(Me.upFile11_19, Me.txt11_19.Text, 11, 1, 19)
    End Sub

    Protected Sub btnSalvarFoto11_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_20.Click
        Call UploadImagem(Me.upFile11_20, Me.txt11_20.Text, 11, 1, 20)
    End Sub

    Protected Sub btnSalvarFoto11_21_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_21.Click
        Call UploadImagem(Me.upFile11_21, Me.txt11_21.Text, 11, 1, 21)
    End Sub

    Protected Sub btnSalvarFoto11_22_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto11_22.Click
        Call UploadImagem(Me.upFile11_22, Me.txt11_22.Text, 11, 1, 22)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 12.1"

    Protected Sub btnSalvarFoto12_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_1.Click
        Call UploadImagem(Me.upFile12_1, Me.txt12_1.Text, 12, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto12_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_2.Click
        Call UploadImagem(Me.upFile12_2, Me.txt12_2.Text, 12, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto12_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_3.Click
        Call UploadImagem(Me.upFile12_3, Me.txt12_3.Text, 12, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto12_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_4.Click
        Call UploadImagem(Me.upFile12_4, Me.txt12_4.Text, 12, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto12_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_5.Click
        Call UploadImagem(Me.upFile12_5, Me.txt12_5.Text, 12, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto12_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_6.Click
        Call UploadImagem(Me.upFile12_6, Me.txt12_6.Text, 12, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto12_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto12_7.Click
        Call UploadImagem(Me.upFile12_7, Me.txt12_7.Text, 12, 1, 7)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 13.1"

    Protected Sub btnSalvarFoto13_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_1.Click
        Call UploadImagem(Me.upFile13_1, Me.txt13_1.Text, 13, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto13_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_2.Click
        Call UploadImagem(Me.upFile13_2, Me.txt13_2.Text, 13, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto13_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_3.Click
        Call UploadImagem(Me.upFile13_3, Me.txt13_3.Text, 13, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto13_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_4.Click
        Call UploadImagem(Me.upFile13_4, Me.txt13_4.Text, 13, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto13_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_5.Click
        Call UploadImagem(Me.upFile13_5, Me.txt13_5.Text, 13, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto13_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_6.Click
        Call UploadImagem(Me.upFile13_6, Me.txt13_6.Text, 13, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto13_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_7.Click
        Call UploadImagem(Me.upFile13_7, Me.txt13_7.Text, 13, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto13_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_8.Click
        Call UploadImagem(Me.upFile13_8, Me.txt13_8.Text, 13, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto13_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_9.Click
        Call UploadImagem(Me.upFile13_9, Me.txt13_9.Text, 13, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto13_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_10.Click
        Call UploadImagem(Me.upFile13_10, Me.txt13_10.Text, 13, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto13_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_11.Click
        Call UploadImagem(Me.upFile13_11, Me.txt13_11.Text, 13, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto13_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_12.Click
        Call UploadImagem(Me.upFile13_12, Me.txt13_12.Text, 13, 1, 12)
    End Sub


    Protected Sub btnSalvarFoto13_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_13.Click
        Call UploadImagem(Me.upFile13_13, Me.txt13_13.Text, 13, 1, 13)
    End Sub


#End Region

#Region " btnSalvarFoto - Grupo 14.1"

    Protected Sub btnSalvarFoto14_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_1.Click
        Call UploadImagem(Me.upFile14_1, Me.txt14_1.Text, 14, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto14_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_2.Click
        Call UploadImagem(Me.upFile14_2, Me.txt14_2.Text, 14, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto14_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_3.Click
        Call UploadImagem(Me.upFile14_3, Me.txt14_3.Text, 14, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto14_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_4.Click
        Call UploadImagem(Me.upFile14_4, Me.txt14_4.Text, 14, 1, 4)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 15.1"

    Protected Sub btnSalvarFoto15_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_1.Click
        Call UploadImagem(Me.upFile15_1, Me.txt15_1.Text, 15, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto15_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_2.Click
        Call UploadImagem(Me.upFile15_2, Me.txt15_2.Text, 15, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto15_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_3.Click
        Call UploadImagem(Me.upFile15_3, Me.txt15_3.Text, 15, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto15_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_4.Click
        Call UploadImagem(Me.upFile15_4, Me.txt15_4.Text, 15, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto15_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_5.Click
        Call UploadImagem(Me.upFile15_5, Me.txt15_5.Text, 15, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto15_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto15_6.Click
        Call UploadImagem(Me.upFile15_6, Me.txt15_6.Text, 15, 1, 6)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 16.1"

    Protected Sub btnSalvarFoto16_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto16_1.Click
        Call UploadImagem(Me.upFile16_1, Me.txt16_1.Text, 16, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto16_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto16_2.Click
        Call UploadImagem(Me.upFile16_2, Me.txt16_2.Text, 16, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto16_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto16_3.Click
        Call UploadImagem(Me.upFile16_3, Me.txt16_3.Text, 16, 1, 3)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 17.1"

    Protected Sub btnSalvarFoto17_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_1.Click
        Call UploadImagem(Me.upFile17_1, Me.txt17_1.Text, 17, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto17_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_2.Click
        Call UploadImagem(Me.upFile17_2, Me.txt17_2.Text, 17, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto17_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_3.Click
        Call UploadImagem(Me.upFile17_3, Me.txt17_3.Text, 17, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto17_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_4.Click
        Call UploadImagem(Me.upFile17_4, Me.txt17_4.Text, 17, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto17_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_5.Click
        Call UploadImagem(Me.upFile17_5, Me.txt17_5.Text, 17, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto17_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_6.Click
        Call UploadImagem(Me.upFile17_6, Me.txt17_6.Text, 17, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto17_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_7.Click
        Call UploadImagem(Me.upFile17_7, Me.txt17_7.Text, 17, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto17_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_8.Click
        Call UploadImagem(Me.upFile17_8, Me.txt17_8.Text, 17, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto17_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_9.Click
        Call UploadImagem(Me.upFile17_9, Me.txt17_9.Text, 17, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto17_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_10.Click
        Call UploadImagem(Me.upFile17_10, Me.txt17_10.Text, 17, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto17_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_11.Click
        Call UploadImagem(Me.upFile17_11, Me.txt17_11.Text, 17, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto17_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_12.Click
        Call UploadImagem(Me.upFile17_12, Me.txt17_12.Text, 17, 1, 12)
    End Sub


    Protected Sub btnSalvarFoto17_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_13.Click
        Call UploadImagem(Me.upFile17_13, Me.txt17_13.Text, 17, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto17_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_14.Click
        Call UploadImagem(Me.upFile17_14, Me.txt17_14.Text, 17, 1, 14)
    End Sub

    Protected Sub btnSalvarFoto17_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_15.Click
        Call UploadImagem(Me.upFile17_15, Me.txt17_15.Text, 17, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto17_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_16.Click
        Call UploadImagem(Me.upFile17_16, Me.txt17_16.Text, 17, 1, 16)
    End Sub

    Protected Sub btnSalvarFoto17_117_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_17.Click
        Call UploadImagem(Me.upFile17_17, Me.txt17_17.Text, 17, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto17_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_18.Click
        Call UploadImagem(Me.upFile17_18, Me.txt17_18.Text, 17, 1, 18)
    End Sub

    Protected Sub btnSalvarFoto17_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_19.Click
        Call UploadImagem(Me.upFile17_19, Me.txt17_19.Text, 17, 1, 19)
    End Sub

    Protected Sub btnSalvarFoto17_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_20.Click
        Call UploadImagem(Me.upFile17_20, Me.txt17_20.Text, 17, 1, 20)
    End Sub

    Protected Sub btnSalvarFoto17_21_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto17_21.Click
        Call UploadImagem(Me.upFile17_21, Me.txt17_21.Text, 17, 1, 21)
    End Sub

#End Region


#End Region



    Private Sub Linkar(ByVal link As String, ByVal iFilial As String)
        Dim url As String = link & "?iFilial=" & iFilial & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub

    Protected Sub btnPDF_Click(sender As Object, e As EventArgs) Handles btnPDF.Click

        oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
        Call Linkar("RelatorioChecklist_F001.aspx", Me.cboFilial.CallFilial)



    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call HabilitarGerarRelatorio()
    End Sub

    Private Sub HabilitarGerarRelatorio()

        Select Case Me.cboFilial.CallFilial
            Case 1
                Me.btnPDF.Enabled = True
            Case Else
                Me.btnPDF.Enabled = False
        End Select
    End Sub



End Class
