Imports System.IO
Imports System.Drawing.Imaging
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_CheckListCondor
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
        CType(Master.FindControl("lblTitle"), Label).Text = "Check-list"
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If oDa.ExecuteStoredProcedure_Scalar("uspBuscarStatusLoja_SuperHiper", Conexao.gerCheckList, "@idFilial", cboFilial.CallFilial) = 207 Then
            panDados4.Visible = False
            panTitle4.Visible = False

            panDados5.Visible = False
            panTitle5.Visible = False

            EnabledControls(rnd7_1_Sim, rnd7_1_Nao, rnd7_1_NA, txt7_1, imgFoto7_1, btnSalvarFoto7_1, False)
            EnabledControls(rnd7_2_Sim, rnd7_2_Nao, rnd7_2_NA, txt7_2, imgFoto7_2, btnSalvarFoto7_2, False)
            EnabledControls(rnd7_3_Sim, rnd7_3_Nao, rnd7_3_NA, txt7_3, imgFoto7_3, btnSalvarFoto7_3, False)
            EnabledControls(rnd2_24_Sim, rnd2_24_Nao, rnd2_24_NA, txt2_24, imgFoto2_24, btnSalvarFoto2_24, False)

        Else
            panDados4.Visible = True
            panTitle4.Visible = True

            panDados5.Visible = True
            panTitle5.Visible = True

            EnabledControls(rnd7_1_Sim, rnd7_1_Nao, rnd7_1_NA, txt7_1, imgFoto7_1, btnSalvarFoto7_1, True)
            EnabledControls(rnd7_2_Sim, rnd7_2_Nao, rnd7_2_NA, txt7_2, imgFoto7_2, btnSalvarFoto7_2, True)
            EnabledControls(rnd7_3_Sim, rnd7_3_Nao, rnd7_3_NA, txt7_3, imgFoto7_3, btnSalvarFoto7_3, True)
            EnabledControls(rnd2_24_Sim, rnd2_24_Nao, rnd2_24_NA, txt2_24, imgFoto2_24, btnSalvarFoto2_24, True)

        End If

        If cboFilial.CallFilial = 8 Or cboFilial.CallFilial = 13 Or cboFilial.CallFilial = 15 Or cboFilial.CallFilial = 17 Or cboFilial.CallFilial = 28 Or cboFilial.CallFilial = 34 Then
            EnabledControls(rnd7_6_Sim, rnd7_6_Nao, rnd7_6_NA, txt7_6, imgFoto7_6, btnSalvarFoto7_6, False)
        Else
            EnabledControls(rnd7_6_Sim, rnd7_6_Nao, rnd7_6_NA, txt7_6, imgFoto7_6, btnSalvarFoto7_6, True)
        End If

        If cboFilial.CallFilial = 7 Then
            EnabledControls(rnd7_1_Sim, rnd7_1_Nao, rnd7_1_NA, txt7_1, imgFoto7_1, btnSalvarFoto7_1, False)
            EnabledControls(rnd7_2_Sim, rnd7_2_Nao, rnd7_2_NA, txt7_2, imgFoto7_2, btnSalvarFoto7_2, False)
            EnabledControls(rnd7_3_Sim, rnd7_3_Nao, rnd7_3_NA, txt7_3, imgFoto7_3, btnSalvarFoto7_3, False)
            EnabledControls(rnd7_9_Sim, rnd7_9_Nao, rnd7_9_NA, txt7_9, imgFoto7_9, btnSalvarFoto7_9, False)
        End If

        If cboFilial.CallFilial = 18 Then
            EnabledControls(rnd7_9_Sim, rnd7_9_Nao, rnd7_9_NA, txt7_9, imgFoto7_9, btnSalvarFoto7_9, False)
            EnabledControls(rnd7_14_Sim, rnd7_14_Nao, rnd7_14_NA, txt7_14, imgFoto7_14, btnSalvarFoto7_14, False)
        End If

        If cboFilial.CallFilial = 8 Then
            EnabledControls(rnd4_2_Sim, rnd4_2_Nao, rnd4_2_NA, txt4_2, imgFoto4_2, btnSalvarFoto4_2, False)
        Else
            EnabledControls(rnd4_2_Sim, rnd4_2_Nao, rnd4_2_NA, txt4_2, imgFoto4_2, btnSalvarFoto4_2, True)
        End If

        If cboFilial.CallFilial = 28 Then
            EnabledControls(rnd7_8_Sim, rnd7_8_Nao, rnd7_8_NA, txt7_8, imgFoto7_8, btnSalvarFoto7_8, False)
        Else
            EnabledControls(rnd7_8_Sim, rnd7_8_Nao, rnd7_8_NA, txt7_8, imgFoto7_8, btnSalvarFoto7_8, True)
        End If

        If cboFilial.CallFilial = 49 Then
            EnabledControls(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA, txt4_3, imgFoto4_3, btnSalvarFoto4_3, False)
        Else
            EnabledControls(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA, txt4_3, imgFoto4_3, btnSalvarFoto4_3, True)
        End If

        ' LOJAS QUE NÃO TEM CFTV
        If oDa.ExecuteStoredProcedure_Scalar("uspBuscarStatusLoja_CFTV", Conexao.gerCheckList, "@idFilial", cboFilial.CallFilial) = 3 Then
            EnabledControls(rnd7_10_Sim, rnd7_10_Nao, rnd7_10_NA, txt7_10, imgFoto7_10, btnSalvarFoto7_10, False)
        Else
            EnabledControls(rnd7_10_Sim, rnd7_10_Nao, rnd7_10_NA, txt7_10, imgFoto7_10, btnSalvarFoto7_10, True)
        End If

        ' HSA - Pergunta 15.3
        If cboFilial.CallFilial = 3 Or cboFilial.CallFilial = 9 Or cboFilial.CallFilial = 13 Or cboFilial.CallFilial = 14 Or cboFilial.CallFilial = 15 Or cboFilial.CallFilial = 18 Or cboFilial.CallFilial = 19 Or cboFilial.CallFilial = 20 Or cboFilial.CallFilial = 24 Or cboFilial.CallFilial = 25 Then
            EnabledControls(rnd15_3_Sim, rnd15_3_Nao, rnd15_3_NA, txt15_3, imgFoto15_3, btnSalvarFoto15_3, False)
        Else
            EnabledControls(rnd15_3_Sim, rnd15_3_Nao, rnd15_3_NA, txt15_3, imgFoto15_3, btnSalvarFoto15_3, True)
        End If

    End Sub


#End Region

    Private Sub EnabledControls(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox, ByVal txtDesc As TextBox, ByVal myAchar As ImageButton, ByVal mySalvar As ImageButton, ByVal myBoolean As Boolean)
        rndSim.Enabled = myBoolean
        rndNao.Enabled = myBoolean
        rndNA.Enabled = myBoolean
        txtDesc.Enabled = myBoolean
        myAchar.Visible = myBoolean
        mySalvar.Visible = myBoolean

    End Sub


    Private Sub UploadImagem(ByVal oUpload As Object, ByVal iText As String, ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte)

        If oUpload.hasfile = False Then
            lblStatus.Text = "Nenhuma imagem foi carregada!!!"
            Exit Sub
        End If


        If oUpload.HasFile Then

            Dim intLength As Integer
            Dim arrContent As Byte()

            Dim bytes As Byte()
            Dim contentType As String = oUpload.PostedFile.ContentType
            Dim fileName As String = oUpload.PostedFile.FileName
            Dim filePath As String = fileName
            Dim image As System.Drawing.Image = System.Drawing.Image.FromStream(oUpload.PostedFile.InputStream)

            Dim image_height As Integer = image.Height
            Dim image_width As Integer = image.Width
            Dim max_height As Integer = 270
            Dim max_width As Integer = 480

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
        Else

        End If

    End Sub

    Public Function ThumbnailCallback() As Boolean
        Return False
    End Function

    'Protected Function Doc2SQLServer(ByVal title As String, ByVal Content As Byte(), ByVal Length As Integer, _
    '                                 ByVal strType As String, ByVal iDia As Date, ByVal iFilial As Byte, _
    '                                 ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte) As Boolean

    '    Try

    '        Dim cnn As Data.SqlClient.SqlConnection
    '        Dim cmd As Data.SqlClient.SqlCommand
    '        Dim param As Data.SqlClient.SqlParameter
    '        Dim strSQL As String

    '        strSQL = "Insert Into Fotos.tblFilial_" & cboFilial.CallFilial & " (imgData,imgTitle,imgType,imgLength,Dia,idFilial,idGrupo,idSubgrupo,idCod) Values(@content,@title,@type,@length,@dia, @idFilial, @idGrupo, @idSubgrupo, @idCod)"

    '        cnn = New Data.SqlClient.SqlConnection(Conexao.gerCheckList)
    '        cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)

    '        param = New Data.SqlClient.SqlParameter("@content", Data.SqlDbType.VarBinary)
    '        param.Value = Content
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@title", Data.SqlDbType.VarChar)
    '        param.Value = title
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@type", Data.SqlDbType.VarChar)
    '        param.Value = strType
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@length", Data.SqlDbType.BigInt)
    '        param.Value = Length
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@dia", Data.SqlDbType.Date)
    '        param.Value = iDia
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@idFilial", Data.SqlDbType.TinyInt)
    '        param.Value = iFilial
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@idGrupo", Data.SqlDbType.TinyInt)
    '        param.Value = iGrupo
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@idSubgrupo", Data.SqlDbType.TinyInt)
    '        param.Value = iSubgrupo
    '        cmd.Parameters.Add(param)

    '        param = New Data.SqlClient.SqlParameter("@idCod", Data.SqlDbType.TinyInt)
    '        param.Value = iCod
    '        cmd.Parameters.Add(param)

    '        cnn.Open()
    '        cmd.ExecuteNonQuery()
    '        cnn.Close()
    '        cnn.Dispose()

    '        Return True

    '    Catch ex As Exception
    '        lblStatus.Text = Err.Number.ToString() & " - " & Err.Description
    '        Return False
    '    Finally


    '    End Try

    'End Function

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
            btnGrupo8.Enabled = False
            btnGrupo9.Enabled = False
            btnGrupo10.Enabled = False
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
            btnGrupo8.Enabled = True
            btnGrupo9.Enabled = True
            btnGrupo10.Enabled = True
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
        Call fLimparTextBox(txt1_5)
        Call fLimparTextBox(txt1_6)
        Call fLimparTextBox(txt1_7)
        Call fLimparTextBox(txt1_8)
        Call fLimparTextBox(txt1_9)
        Call fLimparTextBox(txt1_10)
        Call fLimparTextBox(txt1_11)
        Call fLimparTextBox(txt1_12)
        Call fLimparTextBox(txt1_13)
        Call fLimparTextBox(txt1_14)
        Call fLimparTextBox(txt1_15)
        Call fLimparTextBox(txt1_16)
        Call fLimparTextBox(txt1_17)
        Call fLimparTextBox(txt1_18)
        Call fLimparTextBox(txt1_19)
        Call fLimparTextBox(txt1_20)
        Call fLimparTextBox(txt1_21)
        Call fLimparTextBox(txt1_22)
        Call fLimparTextBox(txt1_23)
        Call fLimparTextBox(txt1_24)
        Call fLimparTextBox(txt1_25)

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
        Call fLimparTextBox(txt2_41)

        Call fLimparTextBox(txt2_14)
        Call fLimparTextBox(txt2_15)
        Call fLimparTextBox(txt2_16)
        Call fLimparTextBox(txt2_17)
        Call fLimparTextBox(txt2_18)
        Call fLimparTextBox(txt2_19)
        Call fLimparTextBox(txt2_20)
        Call fLimparTextBox(txt2_21)
        Call fLimparTextBox(txt2_22)

        Call fLimparTextBox(txt2_23)
        Call fLimparTextBox(txt2_24)
        Call fLimparTextBox(txt2_25)
        Call fLimparTextBox(txt2_26)
        Call fLimparTextBox(txt2_27)
        Call fLimparTextBox(txt2_28)
        Call fLimparTextBox(txt2_29)

        Call fLimparTextBox(txt2_30)
        Call fLimparTextBox(txt2_31)
        Call fLimparTextBox(txt2_32)
        Call fLimparTextBox(txt2_33)
        Call fLimparTextBox(txt2_34)
        Call fLimparTextBox(txt2_35)
        Call fLimparTextBox(txt2_36)
        Call fLimparTextBox(txt2_37)
        Call fLimparTextBox(txt2_38)
        Call fLimparTextBox(txt2_39)
        Call fLimparTextBox(txt2_40)
        Call fLimparTextBox(txt2_41)
        Call fLimparTextBox(txt2_42)

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
        Call fLimparTextBox(txt3_11)
        Call fLimparTextBox(txt3_12)
        Call fLimparTextBox(txt3_13)
        Call fLimparTextBox(txt3_14)

        Call fLimparTextBox(txt3_15)
        Call fLimparTextBox(txt3_16)
        Call fLimparTextBox(txt3_17)
        Call fLimparTextBox(txt3_18)
        Call fLimparTextBox(txt3_19)
        Call fLimparTextBox(txt3_20)
        Call fLimparTextBox(txt3_21)
        Call fLimparTextBox(txt3_22)
        Call fLimparTextBox(txt3_23)
        Call fLimparTextBox(txt3_24)
        Call fLimparTextBox(txt3_25)

        Call fLimparTextBox(txt3_26)
        Call fLimparTextBox(txt3_27)
        Call fLimparTextBox(txt3_28)
        Call fLimparTextBox(txt3_29)
        Call fLimparTextBox(txt3_30)
        Call fLimparTextBox(txt3_31)
        Call fLimparTextBox(txt3_32)
        Call fLimparTextBox(txt3_33)
        Call fLimparTextBox(txt3_34)

        Call fLimparTextBox(txt3_35)
        Call fLimparTextBox(txt3_36)
        Call fLimparTextBox(txt3_37)
        Call fLimparTextBox(txt3_38)
        Call fLimparTextBox(txt3_39)
        Call fLimparTextBox(txt3_40)
        Call fLimparTextBox(txt3_41)
        Call fLimparTextBox(txt3_42)

        Call fLimparTextBox(txt3_43)
        Call fLimparTextBox(txt3_44)
        Call fLimparTextBox(txt3_45)
        Call fLimparTextBox(txt3_46)
        Call fLimparTextBox(txt3_47)
        Call fLimparTextBox(txt3_48)
        Call fLimparTextBox(txt3_49)
        Call fLimparTextBox(txt3_50)
        Call fLimparTextBox(txt3_51)
        Call fLimparTextBox(txt3_52)
        Call fLimparTextBox(txt3_53)
        Call fLimparTextBox(txt3_54)

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
        Call fLimparTextBox(txt4_21)
        Call fLimparTextBox(txt4_22)
        Call fLimparTextBox(txt4_23)

        Call fLimparTextBox(txt4_11)
        Call fLimparTextBox(txt4_12)
        Call fLimparTextBox(txt4_13)

        Call fLimparTextBox(txt4_14)
        Call fLimparTextBox(txt4_15)
        Call fLimparTextBox(txt4_16)
        Call fLimparTextBox(txt4_17)
        Call fLimparTextBox(txt4_18)
        Call fLimparTextBox(txt4_19)
        Call fLimparTextBox(txt4_20)
 

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

        'Grupo 6
        Call fLimparTextBox(txt6_1)
        Call fLimparTextBox(txt6_2)
        Call fLimparTextBox(txt6_3)
        Call fLimparTextBox(txt6_4)
        Call fLimparTextBox(txt6_5)
        Call fLimparTextBox(txt6_6)
        Call fLimparTextBox(txt6_7)
        Call fLimparTextBox(txt6_8)
        Call fLimparTextBox(txt6_9)


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

        'Grupo 8
        Call fLimparTextBox(txt8_1)
        Call fLimparTextBox(txt8_2)
        Call fLimparTextBox(txt8_3)
        Call fLimparTextBox(txt8_4)
        Call fLimparTextBox(txt8_5)
        Call fLimparTextBox(txt8_6)
        Call fLimparTextBox(txt8_7)
        Call fLimparTextBox(txt8_8)
        Call fLimparTextBox(txt8_9)
        Call fLimparTextBox(txt8_10)
        Call fLimparTextBox(txt8_11)
        Call fLimparTextBox(txt8_12)
        Call fLimparTextBox(txt8_13)
        Call fLimparTextBox(txt8_14)

        'Grupo 9
        Call fLimparTextBox(txt9_1)
        Call fLimparTextBox(txt9_2)
        Call fLimparTextBox(txt9_3)
        Call fLimparTextBox(txt9_4)
        Call fLimparTextBox(txt9_5)
        Call fLimparTextBox(txt9_6)
        Call fLimparTextBox(txt9_7)
        Call fLimparTextBox(txt9_8)
        Call fLimparTextBox(txt9_9)
        Call fLimparTextBox(txt9_10)
        Call fLimparTextBox(txt9_11)
        Call fLimparTextBox(txt9_12)
        Call fLimparTextBox(txt9_13)

        'Grupo 10
        Call fLimparTextBox(txt10_1)
        Call fLimparTextBox(txt10_2)
        Call fLimparTextBox(txt10_3)
        Call fLimparTextBox(txt10_4)
        Call fLimparTextBox(txt10_5)
        Call fLimparTextBox(txt10_6)
        Call fLimparTextBox(txt10_7)
        Call fLimparTextBox(txt10_8)
        Call fLimparTextBox(txt10_9)
        Call fLimparTextBox(txt10_10)
        Call fLimparTextBox(txt10_11)
        Call fLimparTextBox(txt10_12)
        Call fLimparTextBox(txt10_13)
        Call fLimparTextBox(txt10_14)

        'Grupo 11
        Call fLimparTextBox(txt11_1)
        Call fLimparTextBox(txt11_2)
        Call fLimparTextBox(txt11_3)
        Call fLimparTextBox(txt11_4)
        Call fLimparTextBox(txt11_5)
        Call fLimparTextBox(txt11_6)
        Call fLimparTextBox(txt11_7)
        Call fLimparTextBox(txt11_8)
        Call fLimparTextBox(txt11_9)
        Call fLimparTextBox(txt11_10)
        Call fLimparTextBox(txt11_11)
        Call fLimparTextBox(txt11_12)
        Call fLimparTextBox(txt11_13)

        'Grupo 12
        Call fLimparTextBox(txt12_1)
        Call fLimparTextBox(txt12_2)
        Call fLimparTextBox(txt12_3)
        Call fLimparTextBox(txt12_4)
        Call fLimparTextBox(txt12_5)

        'Grupo 13
        Call fLimparTextBox(txt13_1)

        'Grupo 14
        Call fLimparTextBox(txt14_1)
        Call fLimparTextBox(txt14_2)
        Call fLimparTextBox(txt14_3)

        'Grupo 15
        Call fLimparTextBox(txt15_1)
        Call fLimparTextBox(txt15_2)
        Call fLimparTextBox(txt15_3)
        Call fLimparTextBox(txt15_4)
        Call fLimparTextBox(txt15_5)

    End Sub

    Private Function DefinirPontuacao(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox) As Byte
        If rndSim.Checked = True Then DefinirPontuacao = 1
        If rndNao.Checked = True Then DefinirPontuacao = 0
        If rndNA.Checked = True Then DefinirPontuacao = 2
        Return DefinirPontuacao
    End Function

    Protected Sub btnGrupo1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo1.Click

        Dim userName As String
        Dim varIssue(25) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd1_1_Sim, rnd1_1_Nao, rnd1_1_NA)
        varIssue(2) = DefinirPontuacao(rnd1_2_Sim, rnd1_2_Nao, rnd1_2_NA)
        varIssue(3) = DefinirPontuacao(rnd1_3_Sim, rnd1_3_Nao, rnd1_3_NA)
        varIssue(4) = DefinirPontuacao(rnd1_4_Sim, rnd1_4_Nao, rnd1_4_NA)
        varIssue(5) = DefinirPontuacao(rnd1_5_Sim, rnd1_5_Nao, rnd1_5_NA)
        varIssue(6) = DefinirPontuacao(rnd1_6_Sim, rnd1_6_Nao, rnd1_6_NA)
        varIssue(7) = DefinirPontuacao(rnd1_7_Sim, rnd1_7_Nao, rnd1_7_NA)
        varIssue(8) = DefinirPontuacao(rnd1_8_Sim, rnd1_8_Nao, rnd1_8_NA)
        varIssue(9) = DefinirPontuacao(rnd1_9_Sim, rnd1_9_Nao, rnd1_9_NA)
        varIssue(10) = DefinirPontuacao(rnd1_10_Sim, rnd1_10_Nao, rnd1_10_NA)
        varIssue(11) = DefinirPontuacao(rnd1_11_Sim, rnd1_11_Nao, rnd1_11_NA)
        varIssue(12) = DefinirPontuacao(rnd1_12_Sim, rnd1_12_Nao, rnd1_12_NA)
        varIssue(13) = DefinirPontuacao(rnd1_13_Sim, rnd1_13_Nao, rnd1_13_NA)
        varIssue(14) = DefinirPontuacao(rnd1_14_Sim, rnd1_14_Nao, rnd1_14_NA)
        varIssue(15) = DefinirPontuacao(rnd1_15_Sim, rnd1_15_Nao, rnd1_15_NA)
        varIssue(16) = DefinirPontuacao(rnd1_16_Sim, rnd1_16_Nao, rnd1_16_NA)
        varIssue(17) = DefinirPontuacao(rnd1_17_Sim, rnd1_17_Nao, rnd1_17_NA)
        varIssue(18) = DefinirPontuacao(rnd1_18_Sim, rnd1_18_Nao, rnd1_18_NA)
        varIssue(19) = DefinirPontuacao(rnd1_19_Sim, rnd1_19_Nao, rnd1_19_NA)
        varIssue(20) = DefinirPontuacao(rnd1_20_Sim, rnd1_20_Nao, rnd1_20_NA)
        varIssue(21) = DefinirPontuacao(rnd1_21_Sim, rnd1_21_Nao, rnd1_21_NA)
        varIssue(22) = DefinirPontuacao(rnd1_22_Sim, rnd1_22_Nao, rnd1_22_NA)
        varIssue(23) = DefinirPontuacao(rnd1_23_Sim, rnd1_23_Nao, rnd1_23_NA)
        varIssue(24) = DefinirPontuacao(rnd1_24_Sim, rnd1_24_Nao, rnd1_24_NA)
        varIssue(25) = DefinirPontuacao(rnd1_25_Sim, rnd1_25_Nao, rnd1_25_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 1, varIssue(1), userName, Me.txt1_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 2, varIssue(2), userName, Me.txt1_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 3, varIssue(3), userName, Me.txt1_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 4, varIssue(4), userName, Me.txt1_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 5, varIssue(5), userName, Me.txt1_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 6, varIssue(6), userName, Me.txt1_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 7, varIssue(7), userName, Me.txt1_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 8, varIssue(8), userName, Me.txt1_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 9, varIssue(9), userName, Me.txt1_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 10, varIssue(10), userName, Me.txt1_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 11, varIssue(11), userName, Me.txt1_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 12, varIssue(12), userName, Me.txt1_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 13, varIssue(13), userName, Me.txt1_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 14, varIssue(14), userName, Me.txt1_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 15, varIssue(15), userName, Me.txt1_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 16, varIssue(16), userName, Me.txt1_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 17, varIssue(17), userName, Me.txt1_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 18, varIssue(18), userName, Me.txt1_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 19, varIssue(19), userName, Me.txt1_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 20, varIssue(20), userName, Me.txt1_20.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 21, varIssue(21), userName, Me.txt1_21.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 22, varIssue(22), userName, Me.txt1_22.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 23, varIssue(23), userName, Me.txt1_23.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 24, varIssue(24), userName, Me.txt1_24.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1, 25, varIssue(25), userName, Me.txt1_25.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1)
        Me.panTitle1.CssClass = "pnl_Verde"
    End Sub    ' Bloco 1 - 1 a 25. Total de 14 Perguntas

    Protected Sub btnGrupo2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo2.Click

        Dim userName As String
        Dim varIssue(14) As Byte

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
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 11, varIssue(11), userName, Me.txt2_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 12, varIssue(12), userName, Me.txt2_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 13, varIssue(13), userName, Me.txt2_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1, 14, varIssue(14), userName, Me.txt2_14.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1)
        Me.panTitle2.CssClass = "pnl_Verde"
    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo3.Click
        Dim varIssue(10) As Byte
        Dim userName As String

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd2_15_Sim, rnd2_15_Nao, rnd2_15_NA)
        varIssue(2) = DefinirPontuacao(rnd2_16_Sim, rnd2_16_Nao, rnd2_16_NA)
        varIssue(3) = DefinirPontuacao(rnd2_17_Sim, rnd2_17_Nao, rnd2_17_NA)
        varIssue(4) = DefinirPontuacao(rnd2_18_Sim, rnd2_18_Nao, rnd2_18_NA)
        varIssue(5) = DefinirPontuacao(rnd2_19_Sim, rnd2_19_Nao, rnd2_19_NA)
        varIssue(6) = DefinirPontuacao(rnd2_20_Sim, rnd2_20_Nao, rnd2_20_NA)
        varIssue(7) = DefinirPontuacao(rnd2_21_Sim, rnd2_21_Nao, rnd2_21_NA)
        varIssue(8) = DefinirPontuacao(rnd2_22_Sim, rnd2_22_Nao, rnd2_22_NA)
        varIssue(9) = DefinirPontuacao(rnd2_23_Sim, rnd2_23_Nao, rnd2_23_NA)
        varIssue(10) = DefinirPontuacao(rnd2_24_Sim, rnd2_24_Nao, rnd2_24_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 15, varIssue(1), userName, Me.txt2_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 16, varIssue(2), userName, Me.txt2_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 17, varIssue(3), userName, Me.txt2_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 18, varIssue(4), userName, Me.txt2_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 19, varIssue(5), userName, Me.txt2_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 20, varIssue(6), userName, Me.txt2_20.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 21, varIssue(7), userName, Me.txt2_21.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 22, varIssue(8), userName, Me.txt2_22.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 23, varIssue(9), userName, Me.txt2_23.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2, 24, varIssue(10), userName, Me.txt2_24.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2)
        Me.panTitle3.CssClass = "pnl_Verde"
    End Sub   ' Bloco 2 - 14 a 22. Total de 9 Perguntas

    Protected Sub btnGrupo4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo4.Click

        Dim userName As String
        Dim varIssue(7) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd2_25_Sim, rnd2_25_Nao, rnd2_25_NA)
        varIssue(2) = DefinirPontuacao(rnd2_26_Sim, rnd2_26_Nao, rnd2_26_NA)
        varIssue(3) = DefinirPontuacao(rnd2_27_Sim, rnd2_27_Nao, rnd2_27_NA)
        varIssue(4) = DefinirPontuacao(rnd2_28_Sim, rnd2_28_Nao, rnd2_28_NA)
        varIssue(5) = DefinirPontuacao(rnd2_29_Sim, rnd2_29_Nao, rnd2_29_NA)
        varIssue(6) = DefinirPontuacao(rnd2_30_Sim, rnd2_30_Nao, rnd2_30_NA)
        varIssue(7) = DefinirPontuacao(rnd2_31_Sim, rnd2_31_Nao, rnd2_31_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 25, varIssue(1), userName, Me.txt2_25.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 26, varIssue(2), userName, Me.txt2_26.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 27, varIssue(3), userName, Me.txt2_27.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 28, varIssue(4), userName, Me.txt2_28.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 29, varIssue(5), userName, Me.txt2_29.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 30, varIssue(6), userName, Me.txt2_30.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3, 31, varIssue(7), userName, Me.txt2_31.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3)
        Me.panTitle4.CssClass = "pnl_Verde"
    End Sub  ' Bloco 2 - 23 a 29. Total de 7 Perguntas

    Protected Sub btnGrupo5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo5.Click

        Dim userName As String
        Dim varIssue(11) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd2_32_Sim, rnd2_32_Nao, rnd2_32_NA)
        varIssue(2) = DefinirPontuacao(rnd2_33_Sim, rnd2_33_Nao, rnd2_33_NA)
        varIssue(3) = DefinirPontuacao(rnd2_34_Sim, rnd2_34_Nao, rnd2_34_NA)
        varIssue(4) = DefinirPontuacao(rnd2_35_Sim, rnd2_35_Nao, rnd2_35_NA)
        varIssue(5) = DefinirPontuacao(rnd2_36_Sim, rnd2_36_Nao, rnd2_36_NA)
        varIssue(6) = DefinirPontuacao(rnd2_37_Sim, rnd2_37_Nao, rnd2_37_NA)
        varIssue(7) = DefinirPontuacao(rnd2_38_Sim, rnd2_38_Nao, rnd2_38_NA)
        varIssue(8) = DefinirPontuacao(rnd2_39_Sim, rnd2_39_Nao, rnd2_39_NA)
        varIssue(9) = DefinirPontuacao(rnd2_40_Sim, rnd2_40_Nao, rnd2_40_NA)
        varIssue(10) = DefinirPontuacao(rnd2_41_Sim, rnd2_41_Nao, rnd2_41_NA)
        varIssue(11) = DefinirPontuacao(rnd2_42_Sim, rnd2_42_Nao, rnd2_42_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 32, varIssue(1), userName, Me.txt2_32.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 33, varIssue(2), userName, Me.txt2_33.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 34, varIssue(3), userName, Me.txt2_34.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 35, varIssue(4), userName, Me.txt2_35.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 36, varIssue(5), userName, Me.txt2_36.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 37, varIssue(6), userName, Me.txt2_37.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 38, varIssue(7), userName, Me.txt2_38.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 39, varIssue(8), userName, Me.txt2_39.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 40, varIssue(9), userName, Me.txt2_40.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 41, varIssue(10), userName, Me.txt2_41.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4, 42, varIssue(11), userName, Me.txt2_42.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4)
        Me.panTitle5.CssClass = "pnl_Verde"
    End Sub  ' Bloco 2 - 30 a 42. Total de 11 Perguntas

    Protected Sub btnGrupo6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo6.Click

        Dim userName As String
        Dim varIssue(14) As Byte

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
        varIssue(11) = DefinirPontuacao(rnd3_11_Sim, rnd3_11_Nao, rnd3_11_NA)
        varIssue(12) = DefinirPontuacao(rnd3_12_Sim, rnd3_12_Nao, rnd3_12_NA)
        varIssue(13) = DefinirPontuacao(rnd3_13_Sim, rnd3_13_Nao, rnd3_13_NA)
        varIssue(14) = DefinirPontuacao(rnd3_14_Sim, rnd3_14_Nao, rnd3_14_NA)

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
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 11, varIssue(11), userName, Me.txt3_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 12, varIssue(12), userName, Me.txt3_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 13, varIssue(13), userName, Me.txt3_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1, 14, varIssue(14), userName, Me.txt3_14.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1)
        Me.panTitle6.CssClass = "pnl_Verde"
    End Sub  ' Bloco 3 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo7.Click
        ' Botão Salvar
        ' Salvar os itens do 3.10 ao 3.17 que esta no Grupo 3 - Armazenamento(Câmaras) - Fiambreria e Laticinios - Grupo 2 - (8 perguntas, 10 a 17)
        Dim userName As String
        Dim varIssue(11) As Byte

        userName = User.Identity.Name


        varIssue(1) = DefinirPontuacao(rnd3_15_Sim, rnd3_15_Nao, rnd3_15_NA)
        varIssue(2) = DefinirPontuacao(rnd3_16_Sim, rnd3_16_Nao, rnd3_16_NA)
        varIssue(3) = DefinirPontuacao(rnd3_17_Sim, rnd3_17_Nao, rnd3_17_NA)
        varIssue(4) = DefinirPontuacao(rnd3_18_Sim, rnd3_18_Nao, rnd3_18_NA)
        varIssue(5) = DefinirPontuacao(rnd3_19_Sim, rnd3_19_Nao, rnd3_19_NA)
        varIssue(6) = DefinirPontuacao(rnd3_20_Sim, rnd3_20_Nao, rnd3_20_NA)
        varIssue(7) = DefinirPontuacao(rnd3_21_Sim, rnd3_21_Nao, rnd3_21_NA)
        varIssue(8) = DefinirPontuacao(rnd3_22_Sim, rnd3_22_Nao, rnd3_22_NA)
        varIssue(9) = DefinirPontuacao(rnd3_23_Sim, rnd3_23_Nao, rnd3_23_NA)
        varIssue(10) = DefinirPontuacao(rnd3_24_Sim, rnd3_24_Nao, rnd3_24_NA)
        varIssue(11) = DefinirPontuacao(rnd3_25_Sim, rnd3_25_Nao, rnd3_25_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 15, varIssue(1), userName, Me.txt3_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 16, varIssue(2), userName, Me.txt3_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 17, varIssue(3), userName, Me.txt3_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 18, varIssue(4), userName, Me.txt3_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 19, varIssue(5), userName, Me.txt3_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 20, varIssue(6), userName, Me.txt3_20.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 21, varIssue(7), userName, Me.txt3_21.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 22, varIssue(8), userName, Me.txt3_22.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 23, varIssue(9), userName, Me.txt3_23.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 24, varIssue(10), userName, Me.txt3_24.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2, 25, varIssue(11), userName, Me.txt3_25.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2)
        Me.panTitle7.CssClass = "pnl_Verde"
    End Sub  ' Bloco 3 - 15 a 25. Total de 10 Perguntas

    Protected Sub btnGrupo8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo8.Click

        Dim userName As String
        Dim varIssue(9) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd3_26_Sim, rnd3_26_Nao, rnd3_26_NA)
        varIssue(2) = DefinirPontuacao(rnd3_27_Sim, rnd3_27_Nao, rnd3_27_NA)
        varIssue(3) = DefinirPontuacao(rnd3_28_Sim, rnd3_28_Nao, rnd3_28_NA)
        varIssue(4) = DefinirPontuacao(rnd3_29_Sim, rnd3_29_Nao, rnd3_29_NA)
        varIssue(5) = DefinirPontuacao(rnd3_30_Sim, rnd3_30_Nao, rnd3_30_NA)
        varIssue(6) = DefinirPontuacao(rnd3_31_Sim, rnd3_31_Nao, rnd3_31_NA)
        varIssue(7) = DefinirPontuacao(rnd3_32_Sim, rnd3_32_Nao, rnd3_32_NA)
        varIssue(8) = DefinirPontuacao(rnd3_33_Sim, rnd3_33_Nao, rnd3_33_NA)
        varIssue(9) = DefinirPontuacao(rnd3_34_Sim, rnd3_34_Nao, rnd3_34_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 26, varIssue(1), userName, Me.txt3_26.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 27, varIssue(2), userName, Me.txt3_27.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 28, varIssue(3), userName, Me.txt3_28.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 29, varIssue(4), userName, Me.txt3_29.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 30, varIssue(5), userName, Me.txt3_30.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 31, varIssue(6), userName, Me.txt3_31.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 32, varIssue(7), userName, Me.txt3_32.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 33, varIssue(8), userName, Me.txt3_33.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3, 34, varIssue(9), userName, Me.txt3_34.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3)
        Me.panTitle8.CssClass = "pnl_Verde"

    End Sub  ' Bloco 3 - 26 a 34. Total de 9 Perguntas

    Protected Sub btnGrupo9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo9.Click
        Dim userName As String
        Dim varIssue(8) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd3_35_Sim, rnd3_35_Nao, rnd3_35_NA)
        varIssue(2) = DefinirPontuacao(rnd3_36_Sim, rnd3_36_Nao, rnd3_36_NA)
        varIssue(3) = DefinirPontuacao(rnd3_37_Sim, rnd3_37_Nao, rnd3_37_NA)
        varIssue(4) = DefinirPontuacao(rnd3_38_Sim, rnd3_38_Nao, rnd3_38_NA)
        varIssue(5) = DefinirPontuacao(rnd3_39_Sim, rnd3_39_Nao, rnd3_39_NA)
        varIssue(6) = DefinirPontuacao(rnd3_40_Sim, rnd3_40_Nao, rnd3_40_NA)
        varIssue(7) = DefinirPontuacao(rnd3_41_Sim, rnd3_41_Nao, rnd3_41_NA)
        varIssue(8) = DefinirPontuacao(rnd3_42_Sim, rnd3_42_Nao, rnd3_42_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 35, varIssue(1), userName, Me.txt3_35.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 36, varIssue(2), userName, Me.txt3_36.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 37, varIssue(3), userName, Me.txt3_37.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 38, varIssue(4), userName, Me.txt3_38.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 39, varIssue(5), userName, Me.txt3_39.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 40, varIssue(6), userName, Me.txt3_40.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 41, varIssue(7), userName, Me.txt3_41.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4, 42, varIssue(8), userName, Me.txt3_42.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4)
        Me.panTitle9.CssClass = "pnl_Verde"
    End Sub  ' Bloco 3 - 35 a 42. Total de 8 Perguntas

    Protected Sub btnGrupo10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo10.Click
        Dim userName As String
        Dim varIssue(12) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd3_43_Sim, rnd3_43_Nao, rnd3_43_NA)
        varIssue(2) = DefinirPontuacao(rnd3_44_Sim, rnd3_44_Nao, rnd3_44_NA)
        varIssue(3) = DefinirPontuacao(rnd3_45_Sim, rnd3_45_Nao, rnd3_45_NA)
        varIssue(4) = DefinirPontuacao(rnd3_46_Sim, rnd3_46_Nao, rnd3_46_NA)
        varIssue(5) = DefinirPontuacao(rnd3_47_Sim, rnd3_47_Nao, rnd3_47_NA)
        varIssue(6) = DefinirPontuacao(rnd3_48_Sim, rnd3_48_Nao, rnd3_48_NA)
        varIssue(7) = DefinirPontuacao(rnd3_49_Sim, rnd3_49_Nao, rnd3_49_NA)
        varIssue(8) = DefinirPontuacao(rnd3_50_Sim, rnd3_50_Nao, rnd3_50_NA)
        varIssue(9) = DefinirPontuacao(rnd3_51_Sim, rnd3_51_Nao, rnd3_51_NA)
        varIssue(10) = DefinirPontuacao(rnd3_52_Sim, rnd3_52_Nao, rnd3_52_NA)
        varIssue(11) = DefinirPontuacao(rnd3_53_Sim, rnd3_53_Nao, rnd3_53_NA)
        varIssue(12) = DefinirPontuacao(rnd3_54_Sim, rnd3_54_Nao, rnd3_54_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 43, varIssue(1), userName, Me.txt3_43.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 44, varIssue(2), userName, Me.txt3_44.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 45, varIssue(3), userName, Me.txt3_45.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 46, varIssue(4), userName, Me.txt3_46.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 47, varIssue(5), userName, Me.txt3_47.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 48, varIssue(6), userName, Me.txt3_48.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 49, varIssue(7), userName, Me.txt3_49.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 50, varIssue(8), userName, Me.txt3_50.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 51, varIssue(9), userName, Me.txt3_51.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 52, varIssue(10), userName, Me.txt3_52.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5, 53, varIssue(11), userName, Me.txt3_53.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 6, 54, varIssue(12), userName, Me.txt3_54.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5)
        Me.panTitle10.CssClass = "pnl_Verde"
    End Sub  ' Bloco 3 - 43 a 54. Total de 10 Perguntas

    Protected Sub btnGrupo11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo11.Click
        Dim userName As String
        Dim varIssue(3) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd4_1_Sim, rnd4_1_Nao, rnd4_1_NA)
        varIssue(2) = DefinirPontuacao(rnd4_2_Sim, rnd4_2_Nao, rnd4_2_NA)
        varIssue(3) = DefinirPontuacao(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 1, varIssue(1), userName, Me.txt4_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 2, varIssue(2), userName, Me.txt4_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1, 3, varIssue(3), userName, Me.txt4_3.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1)
        Me.panTitle11.CssClass = "pnl_Verde"
    End Sub  ' Bloco 4 - 1 a 3. Total de 3 Perguntasrnd8

    Protected Sub btnGrupo12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo12.Click
        Dim userName As String
        Dim varIssue(10) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd4_4_Sim, rnd4_4_Nao, rnd4_4_NA)
        varIssue(2) = DefinirPontuacao(rnd4_5_Sim, rnd4_5_Nao, rnd4_5_NA)
        varIssue(3) = DefinirPontuacao(rnd4_6_Sim, rnd4_6_Nao, rnd4_6_NA)
        varIssue(4) = DefinirPontuacao(rnd4_7_Sim, rnd4_7_Nao, rnd4_7_NA)
        varIssue(5) = DefinirPontuacao(rnd4_8_Sim, rnd4_8_Nao, rnd4_8_NA)
        varIssue(6) = DefinirPontuacao(rnd4_9_Sim, rnd4_9_Nao, rnd4_9_NA)
        varIssue(7) = DefinirPontuacao(rnd4_10_Sim, rnd4_10_Nao, rnd4_10_NA)
        varIssue(8) = DefinirPontuacao(rnd4_21_Sim, rnd4_21_Nao, rnd4_21_NA)
        varIssue(9) = DefinirPontuacao(rnd4_22_Sim, rnd4_22_Nao, rnd4_22_NA)
        varIssue(10) = DefinirPontuacao(rnd4_23_Sim, rnd4_23_Nao, rnd4_23_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 4, varIssue(1), userName, Me.txt4_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 5, varIssue(2), userName, Me.txt4_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 6, varIssue(3), userName, Me.txt4_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 7, varIssue(4), userName, Me.txt4_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 8, varIssue(5), userName, Me.txt4_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 9, varIssue(6), userName, Me.txt4_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 10, varIssue(7), userName, Me.txt4_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 21, varIssue(8), userName, Me.txt4_21.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 22, varIssue(9), userName, Me.txt4_22.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2, 23, varIssue(10), userName, Me.txt4_23.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2)
        Me.panTitle12.CssClass = "pnl_Verde"
    End Sub  ' Bloco 4 - 4 a 10. Total de 7 Perguntas

    Protected Sub btnGrupo13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo13.Click
        Dim userName As String
        Dim varIssue(3) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd4_11_Sim, rnd4_11_Nao, rnd4_11_NA)
        varIssue(2) = DefinirPontuacao(rnd4_12_Sim, rnd4_12_Nao, rnd4_12_NA)
        varIssue(3) = DefinirPontuacao(rnd4_13_Sim, rnd4_13_Nao, rnd4_13_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 3, 11, varIssue(1), userName, Me.txt4_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 3, 12, varIssue(2), userName, Me.txt4_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 3, 13, varIssue(3), userName, Me.txt4_13.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 3)
        Me.panTitle13.CssClass = "pnl_Verde"
    End Sub  ' Bloco 4 - 11 a 13. Total de 3 Perguntas

    Protected Sub btnGrupo14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo14.Click
        Dim userName As String
        Dim varIssue(7) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd4_14_Sim, rnd4_14_Nao, rnd4_14_NA)
        varIssue(2) = DefinirPontuacao(rnd4_15_Sim, rnd4_15_Nao, rnd4_15_NA)
        varIssue(3) = DefinirPontuacao(rnd4_16_Sim, rnd4_16_Nao, rnd4_16_NA)
        varIssue(4) = DefinirPontuacao(rnd4_17_Sim, rnd4_17_Nao, rnd4_17_NA)
        varIssue(5) = DefinirPontuacao(rnd4_18_Sim, rnd4_18_Nao, rnd4_18_NA)
        varIssue(6) = DefinirPontuacao(rnd4_19_Sim, rnd4_19_Nao, rnd4_19_NA)
        varIssue(7) = DefinirPontuacao(rnd4_20_Sim, rnd4_20_Nao, rnd4_20_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 14, varIssue(1), userName, Me.txt4_14.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 15, varIssue(2), userName, Me.txt4_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 16, varIssue(3), userName, Me.txt4_16.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 17, varIssue(4), userName, Me.txt4_17.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 18, varIssue(5), userName, Me.txt4_18.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 19, varIssue(6), userName, Me.txt4_19.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4, 20, varIssue(7), userName, Me.txt4_20.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4)
        Me.panTitle14.CssClass = "pnl_Verde"
    End Sub  ' Bloco 4 - 14 a 20. Total de 7 Perguntas

    Protected Sub btnGrupo15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo15.Click
        Dim userName As String
        Dim varIssue(12) As Byte
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

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1)
        Me.panTitle15.CssClass = "pnl_Verde"
    End Sub  ' Bloco 5 - 1 a 12. Total de 12 Perguntas

    Protected Sub btnGrupo16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo16.Click
        Dim userName As String
        Dim varIssue(9) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd6_1_Sim, rnd6_1_Nao, rnd6_1_NA)
        varIssue(2) = DefinirPontuacao(rnd6_2_Sim, rnd6_2_Nao, rnd6_2_NA)
        varIssue(3) = DefinirPontuacao(rnd6_3_Sim, rnd6_3_Nao, rnd6_3_NA)
        varIssue(4) = DefinirPontuacao(rnd6_4_Sim, rnd6_4_Nao, rnd6_4_NA)
        varIssue(5) = DefinirPontuacao(rnd6_5_Sim, rnd6_5_Nao, rnd6_5_NA)
        varIssue(6) = DefinirPontuacao(rnd6_6_Sim, rnd6_6_Nao, rnd6_6_NA)
        varIssue(7) = DefinirPontuacao(rnd6_7_Sim, rnd6_7_Nao, rnd6_7_NA)
        varIssue(8) = DefinirPontuacao(rnd6_8_Sim, rnd6_8_Nao, rnd6_8_NA)
        varIssue(9) = DefinirPontuacao(rnd6_9_Sim, rnd6_9_Nao, rnd6_9_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 1, varIssue(1), userName, Me.txt6_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 2, varIssue(2), userName, Me.txt6_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 3, varIssue(3), userName, Me.txt6_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 4, varIssue(4), userName, Me.txt6_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 5, varIssue(5), userName, Me.txt6_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 6, varIssue(6), userName, Me.txt6_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 7, varIssue(7), userName, Me.txt6_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 8, varIssue(8), userName, Me.txt6_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1, 9, varIssue(9), userName, Me.txt6_9.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1)
        Me.panTitle16.CssClass = "pnl_Verde"
    End Sub  ' Bloco 6 - 1 a 6. Total de 6 Perguntas

    Protected Sub btnGrupo17_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo17.Click
        Dim userName As String
        Dim varIssue(18) As Byte
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

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1)
        Me.panTitle17.CssClass = "pnl_Verde"
    End Sub  ' Bloco 7 - 1 a 12. Total de 6 Perguntas

    Protected Sub btnGrupo18_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo18.Click

        Dim userName As String
        Dim varIssue(14) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd8_1_Sim, rnd8_1_Nao, rnd8_1_NA)
        varIssue(2) = DefinirPontuacao(rnd8_2_Sim, rnd8_2_Nao, rnd8_2_NA)
        varIssue(3) = DefinirPontuacao(rnd8_3_Sim, rnd8_3_Nao, rnd8_3_NA)
        varIssue(4) = DefinirPontuacao(rnd8_4_Sim, rnd8_4_Nao, rnd8_4_NA)
        varIssue(5) = DefinirPontuacao(rnd8_5_Sim, rnd8_5_Nao, rnd8_5_NA)
        varIssue(6) = DefinirPontuacao(rnd8_6_Sim, rnd8_6_Nao, rnd8_6_NA)
        varIssue(7) = DefinirPontuacao(rnd8_7_Sim, rnd8_7_Nao, rnd8_7_NA)
        varIssue(8) = DefinirPontuacao(rnd8_8_Sim, rnd8_8_Nao, rnd8_8_NA)
        varIssue(9) = DefinirPontuacao(rnd8_9_Sim, rnd8_9_Nao, rnd8_9_NA)
        varIssue(10) = DefinirPontuacao(rnd8_10_Sim, rnd8_10_Nao, rnd8_10_NA)
        varIssue(11) = DefinirPontuacao(rnd8_11_Sim, rnd8_11_Nao, rnd8_11_NA)
        varIssue(12) = DefinirPontuacao(rnd8_12_Sim, rnd8_12_Nao, rnd8_12_NA)
        varIssue(13) = DefinirPontuacao(rnd8_13_Sim, rnd8_13_Nao, rnd8_13_NA)
        varIssue(14) = DefinirPontuacao(rnd8_14_Sim, rnd8_14_Nao, rnd8_14_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 1, varIssue(1), userName, Me.txt8_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 2, varIssue(2), userName, Me.txt8_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 3, varIssue(3), userName, Me.txt8_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 4, varIssue(4), userName, Me.txt8_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 5, varIssue(5), userName, Me.txt8_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 6, varIssue(6), userName, Me.txt8_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 7, varIssue(7), userName, Me.txt8_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 8, varIssue(8), userName, Me.txt8_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 9, varIssue(9), userName, Me.txt8_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 10, varIssue(10), userName, Me.txt8_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 11, varIssue(11), userName, Me.txt8_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 12, varIssue(12), userName, Me.txt8_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 13, varIssue(13), userName, Me.txt8_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 14, varIssue(14), userName, Me.txt8_14.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1)
        Me.panTitle18.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo19_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo19.Click

        Dim userName As String
        Dim varIssue(13) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd9_1_Sim, rnd9_1_Nao, rnd9_1_NA)
        varIssue(2) = DefinirPontuacao(rnd9_2_Sim, rnd9_2_Nao, rnd9_2_NA)
        varIssue(3) = DefinirPontuacao(rnd9_3_Sim, rnd9_3_Nao, rnd9_3_NA)
        varIssue(4) = DefinirPontuacao(rnd9_4_Sim, rnd9_4_Nao, rnd9_4_NA)
        varIssue(5) = DefinirPontuacao(rnd9_5_Sim, rnd9_5_Nao, rnd9_5_NA)
        varIssue(6) = DefinirPontuacao(rnd9_6_Sim, rnd9_6_Nao, rnd9_6_NA)
        varIssue(7) = DefinirPontuacao(rnd9_7_Sim, rnd9_7_Nao, rnd9_7_NA)
        varIssue(8) = DefinirPontuacao(rnd9_8_Sim, rnd9_8_Nao, rnd9_8_NA)
        varIssue(9) = DefinirPontuacao(rnd9_9_Sim, rnd9_9_Nao, rnd9_9_NA)
        varIssue(10) = DefinirPontuacao(rnd9_10_Sim, rnd9_10_Nao, rnd9_10_NA)
        varIssue(11) = DefinirPontuacao(rnd9_11_Sim, rnd9_11_Nao, rnd9_11_NA)
        varIssue(12) = DefinirPontuacao(rnd9_12_Sim, rnd9_12_Nao, rnd9_12_NA)
        varIssue(13) = DefinirPontuacao(rnd9_13_Sim, rnd9_13_Nao, rnd9_13_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 1, varIssue(1), userName, Me.txt9_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 2, varIssue(2), userName, Me.txt9_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 3, varIssue(3), userName, Me.txt9_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 4, varIssue(4), userName, Me.txt9_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 5, varIssue(5), userName, Me.txt9_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 6, varIssue(6), userName, Me.txt9_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 7, varIssue(7), userName, Me.txt9_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 8, varIssue(8), userName, Me.txt9_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 9, varIssue(9), userName, Me.txt9_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 10, varIssue(10), userName, Me.txt9_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 11, varIssue(11), userName, Me.txt9_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 12, varIssue(12), userName, Me.txt9_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 13, varIssue(13), userName, Me.txt9_13.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1)
        Me.panTitle19.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo20_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo20.Click

        Dim userName As String
        Dim varIssue(14) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd10_1_Sim, rnd10_1_Nao, rnd10_1_NA)
        varIssue(2) = DefinirPontuacao(rnd10_2_Sim, rnd10_2_Nao, rnd10_2_NA)
        varIssue(3) = DefinirPontuacao(rnd10_3_Sim, rnd10_3_Nao, rnd10_3_NA)
        varIssue(4) = DefinirPontuacao(rnd10_4_Sim, rnd10_4_Nao, rnd10_4_NA)
        varIssue(5) = DefinirPontuacao(rnd10_5_Sim, rnd10_5_Nao, rnd10_5_NA)
        varIssue(6) = DefinirPontuacao(rnd10_6_Sim, rnd10_6_Nao, rnd10_6_NA)
        varIssue(7) = DefinirPontuacao(rnd10_7_Sim, rnd10_7_Nao, rnd10_7_NA)
        varIssue(8) = DefinirPontuacao(rnd10_8_Sim, rnd10_8_Nao, rnd10_8_NA)
        varIssue(9) = DefinirPontuacao(rnd10_9_Sim, rnd10_9_Nao, rnd10_9_NA)
        varIssue(10) = DefinirPontuacao(rnd10_10_Sim, rnd10_10_Nao, rnd10_10_NA)
        varIssue(11) = DefinirPontuacao(rnd10_11_Sim, rnd10_11_Nao, rnd10_11_NA)
        varIssue(12) = DefinirPontuacao(rnd10_12_Sim, rnd10_12_Nao, rnd10_12_NA)
        varIssue(13) = DefinirPontuacao(rnd10_13_Sim, rnd10_13_Nao, rnd10_13_NA)
        varIssue(14) = DefinirPontuacao(rnd10_14_Sim, rnd10_14_Nao, rnd10_14_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 1, varIssue(1), userName, Me.txt10_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 2, varIssue(2), userName, Me.txt10_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 3, varIssue(3), userName, Me.txt10_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 4, varIssue(4), userName, Me.txt10_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 5, varIssue(5), userName, Me.txt10_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 6, varIssue(6), userName, Me.txt10_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 7, varIssue(7), userName, Me.txt10_7.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 8, varIssue(8), userName, Me.txt10_8.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 9, varIssue(9), userName, Me.txt10_9.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 10, varIssue(10), userName, Me.txt10_10.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 11, varIssue(11), userName, Me.txt10_11.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 12, varIssue(12), userName, Me.txt10_12.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 13, varIssue(13), userName, Me.txt10_13.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 14, varIssue(14), userName, Me.txt10_14.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1)
        Me.panTitle20.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo21_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo21.Click

        Dim userName As String
        Dim varIssue(13) As Byte

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


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1)
        Me.panTitle21.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo22_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo22.Click

        Dim userName As String
        Dim varIssue(5) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd12_1_Sim, rnd12_1_Nao, rnd12_1_NA)
        varIssue(2) = DefinirPontuacao(rnd12_2_Sim, rnd12_2_Nao, rnd12_2_NA)
        varIssue(3) = DefinirPontuacao(rnd12_3_Sim, rnd12_3_Nao, rnd12_3_NA)
        varIssue(4) = DefinirPontuacao(rnd12_4_Sim, rnd12_4_Nao, rnd12_4_NA)
        varIssue(5) = DefinirPontuacao(rnd12_5_Sim, rnd12_5_Nao, rnd12_5_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 1, varIssue(1), userName, Me.txt12_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 2, varIssue(2), userName, Me.txt12_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 3, varIssue(3), userName, Me.txt12_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 4, varIssue(4), userName, Me.txt12_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1, 5, varIssue(5), userName, Me.txt12_5.Text)
       

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1)
        Me.panTitle22.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo23_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo23.Click

        Dim userName As String
        Dim varIssue(1) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd13_1_Sim, rnd13_1_Nao, rnd13_1_NA)

        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1, 1, varIssue(1), userName, Me.txt13_1.Text)

        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1)
        Me.panTitle23.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo24_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo24.Click

        Dim userName As String
        Dim varIssue(3) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd14_1_Sim, rnd14_1_Nao, rnd14_1_NA)
        varIssue(2) = DefinirPontuacao(rnd14_2_Sim, rnd14_2_Nao, rnd14_2_NA)
        varIssue(3) = DefinirPontuacao(rnd14_3_Sim, rnd14_3_Nao, rnd14_3_NA)



        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 1, varIssue(1), userName, Me.txt14_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 2, varIssue(2), userName, Me.txt14_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1, 3, varIssue(3), userName, Me.txt14_3.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1)
        Me.panTitle24.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas

    Protected Sub btnGrupo25_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo25.Click

        Dim userName As String
        Dim varIssue(5) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd15_1_Sim, rnd15_1_Nao, rnd15_1_NA)
        varIssue(2) = DefinirPontuacao(rnd15_2_Sim, rnd15_2_Nao, rnd15_2_NA)
        varIssue(3) = DefinirPontuacao(rnd15_3_Sim, rnd15_3_Nao, rnd15_3_NA)
        varIssue(4) = DefinirPontuacao(rnd15_4_Sim, rnd15_4_Nao, rnd15_4_NA)
        varIssue(5) = DefinirPontuacao(rnd15_5_Sim, rnd15_5_Nao, rnd15_5_NA)


        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 1, varIssue(1), userName, Me.txt15_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 2, varIssue(2), userName, Me.txt15_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 3, varIssue(3), userName, Me.txt15_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 4, varIssue(4), userName, Me.txt15_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1, 5, varIssue(5), userName, Me.txt15_5.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1)
        Me.panTitle25.CssClass = "pnl_Verde"

    End Sub   ' Bloco 2 - 1 a 14. Total de 14 Perguntas


    Private Sub TudoAzul()
        Me.panTitle1.CssClass = "pnl_Azul"
        Me.panTitle2.CssClass = "pnl_Azul"
        Me.panTitle3.CssClass = "pnl_Azul"
        Me.panTitle4.CssClass = "pnl_Azul"
        Me.panTitle5.CssClass = "pnl_Azul"
        Me.panTitle6.CssClass = "pnl_Azul"
        Me.panTitle7.CssClass = "pnl_Azul"
        Me.panTitle8.CssClass = "pnl_Azul"
        Me.panTitle9.CssClass = "pnl_Azul"
        Me.panTitle10.CssClass = "pnl_Azul"
        Me.panTitle11.CssClass = "pnl_Azul"
        Me.panTitle12.CssClass = "pnl_Azul"
        Me.panTitle13.CssClass = "pnl_Azul"
        Me.panTitle14.CssClass = "pnl_Azul"
        Me.panTitle15.CssClass = "pnl_Azul"
        Me.panTitle16.CssClass = "pnl_Azul"
        Me.panTitle17.CssClass = "pnl_Azul"

        Me.panTitle18.CssClass = "pnl_Azul"
        Me.panTitle19.CssClass = "pnl_Azul"
        Me.panTitle20.CssClass = "pnl_Azul"
        Me.panTitle21.CssClass = "pnl_Azul"
        Me.panTitle22.CssClass = "pnl_Azul"
        Me.panTitle23.CssClass = "pnl_Azul"
        Me.panTitle24.CssClass = "pnl_Azul"
        Me.panTitle25.CssClass = "pnl_Azul"

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
        Call BuscarChecklist_Grupo8(8)

        Call BuscarChecklist_Grupo9(9)
        Call BuscarChecklist_Grupo10(10)
        Call BuscarChecklist_Grupo11(11)
        Call BuscarChecklist_Grupo12(12)
        Call BuscarChecklist_Grupo13(13)
        Call BuscarChecklist_Grupo14(14)
        Call BuscarChecklist_Grupo15(15)

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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt1_5, oCh.Descricao, Me.rnd1_5_Sim, rnd1_5_Nao, Me.rnd1_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt1_6, oCh.Descricao, Me.rnd1_6_Sim, rnd1_6_Nao, Me.rnd1_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt1_7, oCh.Descricao, Me.rnd1_7_Sim, rnd1_7_Nao, Me.rnd1_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt1_8, oCh.Descricao, Me.rnd1_8_Sim, rnd1_8_Nao, Me.rnd1_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt1_9, oCh.Descricao, Me.rnd1_9_Sim, rnd1_9_Nao, Me.rnd1_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt1_10, oCh.Descricao, Me.rnd1_10_Sim, rnd1_10_Nao, Me.rnd1_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt1_11, oCh.Descricao, Me.rnd1_11_Sim, rnd1_11_Nao, Me.rnd1_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt1_12, oCh.Descricao, Me.rnd1_12_Sim, rnd1_12_Nao, Me.rnd1_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt1_13, oCh.Descricao, Me.rnd1_13_Sim, rnd1_13_Nao, Me.rnd1_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt1_14, oCh.Descricao, Me.rnd1_14_Sim, rnd1_14_Nao, Me.rnd1_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt1_15, oCh.Descricao, Me.rnd1_15_Sim, rnd1_15_Nao, Me.rnd1_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt1_16, oCh.Descricao, Me.rnd1_16_Sim, rnd1_16_Nao, Me.rnd1_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 17)
        Call BCDet(oCh.Pontos, Me.txt1_17, oCh.Descricao, Me.rnd1_17_Sim, rnd1_17_Nao, Me.rnd1_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 18)
        Call BCDet(oCh.Pontos, Me.txt1_18, oCh.Descricao, Me.rnd1_18_Sim, rnd1_18_Nao, Me.rnd1_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 19)
        Call BCDet(oCh.Pontos, Me.txt1_19, oCh.Descricao, Me.rnd1_19_Sim, rnd1_19_Nao, Me.rnd1_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 20)
        Call BCDet(oCh.Pontos, Me.txt1_20, oCh.Descricao, Me.rnd1_20_Sim, rnd1_20_Nao, Me.rnd1_20_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 21)
        Call BCDet(oCh.Pontos, Me.txt1_21, oCh.Descricao, Me.rnd1_21_Sim, rnd1_21_Nao, Me.rnd1_21_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 22)
        Call BCDet(oCh.Pontos, Me.txt1_22, oCh.Descricao, Me.rnd1_22_Sim, rnd1_22_Nao, Me.rnd1_22_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 23)
        Call BCDet(oCh.Pontos, Me.txt1_23, oCh.Descricao, Me.rnd1_23_Sim, rnd1_23_Nao, Me.rnd1_23_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 24)
        Call BCDet(oCh.Pontos, Me.txt1_24, oCh.Descricao, Me.rnd1_24_Sim, rnd1_24_Nao, Me.rnd1_24_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 25)
        Call BCDet(oCh.Pontos, Me.txt1_25, oCh.Descricao, Me.rnd1_25_Sim, rnd1_25_Nao, Me.rnd1_25_NA)

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




        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 15)
        Call BCDet(oCh.Pontos, Me.txt2_15, oCh.Descricao, Me.rnd2_15_Sim, rnd2_15_Nao, Me.rnd2_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 16)
        Call BCDet(oCh.Pontos, Me.txt2_16, oCh.Descricao, Me.rnd2_16_Sim, rnd2_16_Nao, Me.rnd2_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 17)
        Call BCDet(oCh.Pontos, Me.txt2_17, oCh.Descricao, Me.rnd2_17_Sim, rnd2_17_Nao, Me.rnd2_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 18)
        Call BCDet(oCh.Pontos, Me.txt2_18, oCh.Descricao, Me.rnd2_18_Sim, rnd2_18_Nao, Me.rnd2_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 19)
        Call BCDet(oCh.Pontos, Me.txt2_19, oCh.Descricao, Me.rnd2_19_Sim, rnd2_19_Nao, Me.rnd2_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 20)
        Call BCDet(oCh.Pontos, Me.txt2_20, oCh.Descricao, Me.rnd2_20_Sim, rnd2_20_Nao, Me.rnd2_20_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 21)
        Call BCDet(oCh.Pontos, Me.txt2_21, oCh.Descricao, Me.rnd2_21_Sim, rnd2_21_Nao, Me.rnd2_21_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 22)
        Call BCDet(oCh.Pontos, Me.txt2_22, oCh.Descricao, Me.rnd2_22_Sim, rnd2_22_Nao, Me.rnd2_22_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 23)
        Call BCDet(oCh.Pontos, Me.txt2_23, oCh.Descricao, Me.rnd2_23_Sim, rnd2_23_Nao, Me.rnd2_23_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 24)
        Call BCDet(oCh.Pontos, Me.txt2_24, oCh.Descricao, Me.rnd2_24_Sim, rnd2_24_Nao, Me.rnd2_24_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 25)
        Call BCDet(oCh.Pontos, Me.txt2_25, oCh.Descricao, Me.rnd2_25_Sim, rnd2_25_Nao, Me.rnd2_25_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 26)
        Call BCDet(oCh.Pontos, Me.txt2_26, oCh.Descricao, Me.rnd2_26_Sim, rnd2_26_Nao, Me.rnd2_26_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 27)
        Call BCDet(oCh.Pontos, Me.txt2_27, oCh.Descricao, Me.rnd2_27_Sim, rnd2_27_Nao, Me.rnd2_27_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 28)
        Call BCDet(oCh.Pontos, Me.txt2_28, oCh.Descricao, Me.rnd2_28_Sim, rnd2_28_Nao, Me.rnd2_28_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 29)
        Call BCDet(oCh.Pontos, Me.txt2_29, oCh.Descricao, Me.rnd2_29_Sim, rnd2_29_Nao, Me.rnd2_29_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 30)
        Call BCDet(oCh.Pontos, Me.txt2_30, oCh.Descricao, Me.rnd2_30_Sim, rnd2_30_Nao, Me.rnd2_30_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 31)
        Call BCDet(oCh.Pontos, Me.txt2_31, oCh.Descricao, Me.rnd2_31_Sim, rnd2_31_Nao, Me.rnd2_31_NA)


        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 32)
        Call BCDet(oCh.Pontos, Me.txt2_32, oCh.Descricao, Me.rnd2_32_Sim, rnd2_32_Nao, Me.rnd2_32_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 33)
        Call BCDet(oCh.Pontos, Me.txt2_33, oCh.Descricao, Me.rnd2_33_Sim, rnd2_33_Nao, Me.rnd2_33_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 34)
        Call BCDet(oCh.Pontos, Me.txt2_34, oCh.Descricao, Me.rnd2_34_Sim, rnd2_34_Nao, Me.rnd2_34_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 35)
        Call BCDet(oCh.Pontos, Me.txt2_35, oCh.Descricao, Me.rnd2_35_Sim, rnd2_35_Nao, Me.rnd2_35_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 36)
        Call BCDet(oCh.Pontos, Me.txt2_36, oCh.Descricao, Me.rnd2_36_Sim, rnd2_36_Nao, Me.rnd2_36_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 37)
        Call BCDet(oCh.Pontos, Me.txt2_37, oCh.Descricao, Me.rnd2_37_Sim, rnd2_37_Nao, Me.rnd2_37_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 38)
        Call BCDet(oCh.Pontos, Me.txt2_38, oCh.Descricao, Me.rnd2_38_Sim, rnd2_38_Nao, Me.rnd2_38_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 39)
        Call BCDet(oCh.Pontos, Me.txt2_39, oCh.Descricao, Me.rnd2_39_Sim, rnd2_39_Nao, Me.rnd2_39_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 40)
        Call BCDet(oCh.Pontos, Me.txt2_40, oCh.Descricao, Me.rnd2_40_Sim, rnd2_40_Nao, Me.rnd2_40_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 41)
        Call BCDet(oCh.Pontos, Me.txt2_41, oCh.Descricao, Me.rnd2_41_Sim, rnd2_41_Nao, Me.rnd2_41_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 42)
        Call BCDet(oCh.Pontos, Me.txt2_42, oCh.Descricao, Me.rnd2_42_Sim, rnd2_42_Nao, Me.rnd2_42_NA)
      
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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt3_11, oCh.Descricao, Me.rnd3_11_Sim, rnd3_11_Nao, Me.rnd3_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt3_12, oCh.Descricao, Me.rnd3_12_Sim, rnd3_12_Nao, Me.rnd3_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt3_13, oCh.Descricao, Me.rnd3_13_Sim, rnd3_13_Nao, Me.rnd3_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt3_14, oCh.Descricao, Me.rnd3_14_Sim, rnd3_14_Nao, Me.rnd3_14_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 15)
        Call BCDet(oCh.Pontos, Me.txt3_15, oCh.Descricao, Me.rnd3_15_Sim, rnd3_15_Nao, Me.rnd3_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 16)
        Call BCDet(oCh.Pontos, Me.txt3_16, oCh.Descricao, Me.rnd3_16_Sim, rnd3_16_Nao, Me.rnd3_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 17)
        Call BCDet(oCh.Pontos, Me.txt3_17, oCh.Descricao, Me.rnd3_17_Sim, rnd3_17_Nao, Me.rnd3_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 18)
        Call BCDet(oCh.Pontos, Me.txt3_18, oCh.Descricao, Me.rnd3_18_Sim, rnd3_18_Nao, Me.rnd3_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 19)
        Call BCDet(oCh.Pontos, Me.txt3_19, oCh.Descricao, Me.rnd3_19_Sim, rnd3_19_Nao, Me.rnd3_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 20)
        Call BCDet(oCh.Pontos, Me.txt3_20, oCh.Descricao, Me.rnd3_20_Sim, rnd3_20_Nao, Me.rnd3_20_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 21)
        Call BCDet(oCh.Pontos, Me.txt3_21, oCh.Descricao, Me.rnd3_21_Sim, rnd3_21_Nao, Me.rnd3_21_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 22)
        Call BCDet(oCh.Pontos, Me.txt3_22, oCh.Descricao, Me.rnd3_22_Sim, rnd3_22_Nao, Me.rnd3_22_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 23)
        Call BCDet(oCh.Pontos, Me.txt3_23, oCh.Descricao, Me.rnd3_23_Sim, rnd3_23_Nao, Me.rnd3_23_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 24)
        Call BCDet(oCh.Pontos, Me.txt3_24, oCh.Descricao, Me.rnd3_24_Sim, rnd3_24_Nao, Me.rnd3_24_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 25)
        Call BCDet(oCh.Pontos, Me.txt3_25, oCh.Descricao, Me.rnd3_25_Sim, rnd3_25_Nao, Me.rnd3_25_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 26)
        Call BCDet(oCh.Pontos, Me.txt3_26, oCh.Descricao, Me.rnd3_26_Sim, rnd3_26_Nao, Me.rnd3_26_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 27)
        Call BCDet(oCh.Pontos, Me.txt3_27, oCh.Descricao, Me.rnd3_27_Sim, rnd3_27_Nao, Me.rnd3_27_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 28)
        Call BCDet(oCh.Pontos, Me.txt3_28, oCh.Descricao, Me.rnd3_28_Sim, rnd3_28_Nao, Me.rnd3_28_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 29)
        Call BCDet(oCh.Pontos, Me.txt3_29, oCh.Descricao, Me.rnd3_29_Sim, rnd3_29_Nao, Me.rnd3_29_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 30)
        Call BCDet(oCh.Pontos, Me.txt3_30, oCh.Descricao, Me.rnd3_30_Sim, rnd3_30_Nao, Me.rnd3_30_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 31)
        Call BCDet(oCh.Pontos, Me.txt3_31, oCh.Descricao, Me.rnd3_31_Sim, rnd3_31_Nao, Me.rnd3_31_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 32)
        Call BCDet(oCh.Pontos, Me.txt3_32, oCh.Descricao, Me.rnd3_32_Sim, rnd3_32_Nao, Me.rnd3_32_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 33)
        Call BCDet(oCh.Pontos, Me.txt3_33, oCh.Descricao, Me.rnd3_33_Sim, rnd3_33_Nao, Me.rnd3_33_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 34)
        Call BCDet(oCh.Pontos, Me.txt3_34, oCh.Descricao, Me.rnd3_34_Sim, rnd3_34_Nao, Me.rnd3_34_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 35)
        Call BCDet(oCh.Pontos, Me.txt3_35, oCh.Descricao, Me.rnd3_35_Sim, rnd3_35_Nao, Me.rnd3_35_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 36)
        Call BCDet(oCh.Pontos, Me.txt3_36, oCh.Descricao, Me.rnd3_36_Sim, rnd3_36_Nao, Me.rnd3_36_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 37)
        Call BCDet(oCh.Pontos, Me.txt3_37, oCh.Descricao, Me.rnd3_37_Sim, rnd3_37_Nao, Me.rnd3_37_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 38)
        Call BCDet(oCh.Pontos, Me.txt3_38, oCh.Descricao, Me.rnd3_38_Sim, rnd3_38_Nao, Me.rnd3_38_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 39)
        Call BCDet(oCh.Pontos, Me.txt3_39, oCh.Descricao, Me.rnd3_39_Sim, rnd3_39_Nao, Me.rnd3_39_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 40)
        Call BCDet(oCh.Pontos, Me.txt3_40, oCh.Descricao, Me.rnd3_40_Sim, rnd3_40_Nao, Me.rnd3_40_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 41)
        Call BCDet(oCh.Pontos, Me.txt3_41, oCh.Descricao, Me.rnd3_41_Sim, rnd3_41_Nao, Me.rnd3_41_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 42)
        Call BCDet(oCh.Pontos, Me.txt3_42, oCh.Descricao, Me.rnd3_42_Sim, rnd3_42_Nao, Me.rnd3_42_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 43)
        Call BCDet(oCh.Pontos, Me.txt3_43, oCh.Descricao, Me.rnd3_43_Sim, rnd3_43_Nao, Me.rnd3_43_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 44)
        Call BCDet(oCh.Pontos, Me.txt3_44, oCh.Descricao, Me.rnd3_44_Sim, rnd3_44_Nao, Me.rnd3_44_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 45)
        Call BCDet(oCh.Pontos, Me.txt3_45, oCh.Descricao, Me.rnd3_45_Sim, rnd3_45_Nao, Me.rnd3_45_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 46)
        Call BCDet(oCh.Pontos, Me.txt3_46, oCh.Descricao, Me.rnd3_46_Sim, rnd3_46_Nao, Me.rnd3_46_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 47)
        Call BCDet(oCh.Pontos, Me.txt3_47, oCh.Descricao, Me.rnd3_47_Sim, rnd3_47_Nao, Me.rnd3_47_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 48)
        Call BCDet(oCh.Pontos, Me.txt3_48, oCh.Descricao, Me.rnd3_48_Sim, rnd3_48_Nao, Me.rnd3_48_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 49)
        Call BCDet(oCh.Pontos, Me.txt3_49, oCh.Descricao, Me.rnd3_49_Sim, rnd3_49_Nao, Me.rnd3_49_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 50)
        Call BCDet(oCh.Pontos, Me.txt3_50, oCh.Descricao, Me.rnd3_50_Sim, rnd3_50_Nao, Me.rnd3_50_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 51)
        Call BCDet(oCh.Pontos, Me.txt3_51, oCh.Descricao, Me.rnd3_51_Sim, rnd3_51_Nao, Me.rnd3_51_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 52)
        Call BCDet(oCh.Pontos, Me.txt3_52, oCh.Descricao, Me.rnd3_52_Sim, rnd3_52_Nao, Me.rnd3_52_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 5, 53)
        Call BCDet(oCh.Pontos, Me.txt3_53, oCh.Descricao, Me.rnd3_53_Sim, rnd3_53_Nao, Me.rnd3_53_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 6, 54)
        Call BCDet(oCh.Pontos, Me.txt3_54, oCh.Descricao, Me.rnd3_54_Sim, rnd3_54_Nao, Me.rnd3_54_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo4(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt4_1, oCh.Descricao, Me.rnd4_1_Sim, rnd4_1_Nao, Me.rnd4_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt4_2, oCh.Descricao, Me.rnd4_2_Sim, rnd4_2_Nao, Me.rnd4_2_NA)


        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt4_3, oCh.Descricao, Me.rnd4_3_Sim, rnd4_3_Nao, Me.rnd4_3_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 4)
        Call BCDet(oCh.Pontos, Me.txt4_4, oCh.Descricao, Me.rnd4_4_Sim, rnd4_4_Nao, Me.rnd4_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 5)
        Call BCDet(oCh.Pontos, Me.txt4_5, oCh.Descricao, Me.rnd4_5_Sim, rnd4_5_Nao, Me.rnd4_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 6)
        Call BCDet(oCh.Pontos, Me.txt4_6, oCh.Descricao, Me.rnd4_6_Sim, rnd4_6_Nao, Me.rnd4_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 7)
        Call BCDet(oCh.Pontos, Me.txt4_7, oCh.Descricao, Me.rnd4_7_Sim, rnd4_7_Nao, Me.rnd4_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 8)
        Call BCDet(oCh.Pontos, Me.txt4_8, oCh.Descricao, Me.rnd4_8_Sim, rnd4_8_Nao, Me.rnd4_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 9)
        Call BCDet(oCh.Pontos, Me.txt4_9, oCh.Descricao, Me.rnd4_9_Sim, rnd4_9_Nao, Me.rnd4_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 10)
        Call BCDet(oCh.Pontos, Me.txt4_10, oCh.Descricao, Me.rnd4_10_Sim, rnd4_10_Nao, Me.rnd4_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 21)
        Call BCDet(oCh.Pontos, Me.txt4_21, oCh.Descricao, Me.rnd4_21_Sim, rnd4_21_Nao, Me.rnd4_21_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 22)
        Call BCDet(oCh.Pontos, Me.txt4_22, oCh.Descricao, Me.rnd4_22_Sim, rnd4_22_Nao, Me.rnd4_22_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 2, 23)
        Call BCDet(oCh.Pontos, Me.txt4_23, oCh.Descricao, Me.rnd4_23_Sim, rnd4_23_Nao, Me.rnd4_23_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 11)
        Call BCDet(oCh.Pontos, Me.txt4_11, oCh.Descricao, Me.rnd4_11_Sim, rnd4_11_Nao, Me.rnd4_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 12)
        Call BCDet(oCh.Pontos, Me.txt4_12, oCh.Descricao, Me.rnd4_12_Sim, rnd4_12_Nao, Me.rnd4_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 3, 13)
        Call BCDet(oCh.Pontos, Me.txt4_13, oCh.Descricao, Me.rnd4_13_Sim, rnd4_13_Nao, Me.rnd4_13_NA)



        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 14)
        Call BCDet(oCh.Pontos, Me.txt4_14, oCh.Descricao, Me.rnd4_14_Sim, rnd4_14_Nao, Me.rnd4_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 15)
        Call BCDet(oCh.Pontos, Me.txt4_15, oCh.Descricao, Me.rnd4_15_Sim, rnd4_15_Nao, Me.rnd4_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 16)
        Call BCDet(oCh.Pontos, Me.txt4_16, oCh.Descricao, Me.rnd4_16_Sim, rnd4_16_Nao, Me.rnd4_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 17)
        Call BCDet(oCh.Pontos, Me.txt4_17, oCh.Descricao, Me.rnd4_17_Sim, rnd4_17_Nao, Me.rnd4_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 18)
        Call BCDet(oCh.Pontos, Me.txt4_18, oCh.Descricao, Me.rnd4_18_Sim, rnd4_18_Nao, Me.rnd4_18_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 19)
        Call BCDet(oCh.Pontos, Me.txt4_19, oCh.Descricao, Me.rnd4_19_Sim, rnd4_19_Nao, Me.rnd4_19_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 4, 20)
        Call BCDet(oCh.Pontos, Me.txt4_20, oCh.Descricao, Me.rnd4_20_Sim, rnd4_20_Nao, Me.rnd4_20_NA)

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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt6_9, oCh.Descricao, Me.rnd6_9_Sim, rnd6_9_Nao, Me.rnd6_9_NA)

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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt7_13, oCh.Descricao, Me.rnd7_13_Sim, rnd7_13_Nao, Me.rnd7_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt7_14, oCh.Descricao, Me.rnd7_14_Sim, rnd7_14_Nao, Me.rnd7_14_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt7_15, oCh.Descricao, Me.rnd7_15_Sim, rnd7_15_Nao, Me.rnd7_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt7_16, oCh.Descricao, Me.rnd7_16_Sim, rnd7_16_Nao, Me.rnd7_16_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 17)
        Call BCDet(oCh.Pontos, Me.txt7_17, oCh.Descricao, Me.rnd7_17_Sim, rnd7_17_Nao, Me.rnd7_17_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 18)
        Call BCDet(oCh.Pontos, Me.txt7_18, oCh.Descricao, Me.rnd7_18_Sim, rnd7_18_Nao, Me.rnd7_18_NA)


    End Sub


    Private Sub BuscarChecklist_Grupo8(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt8_1, oCh.Descricao, Me.rnd8_1_Sim, rnd8_1_Nao, Me.rnd8_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt8_2, oCh.Descricao, Me.rnd8_2_Sim, rnd8_2_Nao, Me.rnd8_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt8_3, oCh.Descricao, Me.rnd8_3_Sim, rnd8_3_Nao, Me.rnd8_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt8_4, oCh.Descricao, Me.rnd8_4_Sim, rnd8_4_Nao, Me.rnd8_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt8_5, oCh.Descricao, Me.rnd8_5_Sim, rnd8_5_Nao, Me.rnd8_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt8_6, oCh.Descricao, Me.rnd8_6_Sim, rnd8_6_Nao, Me.rnd8_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt8_7, oCh.Descricao, Me.rnd8_7_Sim, rnd8_7_Nao, Me.rnd8_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt8_8, oCh.Descricao, Me.rnd8_8_Sim, rnd8_8_Nao, Me.rnd8_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt8_9, oCh.Descricao, Me.rnd8_9_Sim, rnd8_9_Nao, Me.rnd8_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt8_10, oCh.Descricao, Me.rnd8_10_Sim, rnd8_10_Nao, Me.rnd8_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt8_11, oCh.Descricao, Me.rnd8_11_Sim, rnd8_11_Nao, Me.rnd8_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt8_12, oCh.Descricao, Me.rnd8_12_Sim, rnd8_12_Nao, Me.rnd8_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt8_13, oCh.Descricao, Me.rnd8_13_Sim, rnd8_13_Nao, Me.rnd8_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt8_14, oCh.Descricao, Me.rnd8_14_Sim, rnd8_14_Nao, Me.rnd8_14_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo9(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt9_1, oCh.Descricao, Me.rnd9_1_Sim, rnd9_1_Nao, Me.rnd9_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt9_2, oCh.Descricao, Me.rnd9_2_Sim, rnd9_2_Nao, Me.rnd9_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt9_3, oCh.Descricao, Me.rnd9_3_Sim, rnd9_3_Nao, Me.rnd9_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt9_4, oCh.Descricao, Me.rnd9_4_Sim, rnd9_4_Nao, Me.rnd9_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt9_5, oCh.Descricao, Me.rnd9_5_Sim, rnd9_5_Nao, Me.rnd9_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt9_6, oCh.Descricao, Me.rnd9_6_Sim, rnd9_6_Nao, Me.rnd9_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt9_7, oCh.Descricao, Me.rnd9_7_Sim, rnd9_7_Nao, Me.rnd9_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt9_8, oCh.Descricao, Me.rnd9_8_Sim, rnd9_8_Nao, Me.rnd9_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt9_9, oCh.Descricao, Me.rnd9_9_Sim, rnd9_9_Nao, Me.rnd9_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt9_10, oCh.Descricao, Me.rnd9_10_Sim, rnd9_10_Nao, Me.rnd9_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt9_11, oCh.Descricao, Me.rnd9_11_Sim, rnd9_11_Nao, Me.rnd9_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt9_12, oCh.Descricao, Me.rnd9_12_Sim, rnd9_12_Nao, Me.rnd9_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt9_13, oCh.Descricao, Me.rnd9_13_Sim, rnd9_13_Nao, Me.rnd9_13_NA)




    End Sub

    Private Sub BuscarChecklist_Grupo10(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt10_1, oCh.Descricao, Me.rnd10_1_Sim, rnd10_1_Nao, Me.rnd10_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt10_2, oCh.Descricao, Me.rnd10_2_Sim, rnd10_2_Nao, Me.rnd10_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt10_3, oCh.Descricao, Me.rnd10_3_Sim, rnd10_3_Nao, Me.rnd10_3_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 4)
        Call BCDet(oCh.Pontos, Me.txt10_4, oCh.Descricao, Me.rnd10_4_Sim, rnd10_4_Nao, Me.rnd10_4_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 5)
        Call BCDet(oCh.Pontos, Me.txt10_5, oCh.Descricao, Me.rnd10_5_Sim, rnd10_5_Nao, Me.rnd10_5_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt10_6, oCh.Descricao, Me.rnd10_6_Sim, rnd10_6_Nao, Me.rnd10_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt10_7, oCh.Descricao, Me.rnd10_7_Sim, rnd10_7_Nao, Me.rnd10_7_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt10_8, oCh.Descricao, Me.rnd10_8_Sim, rnd10_8_Nao, Me.rnd10_8_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 9)
        Call BCDet(oCh.Pontos, Me.txt10_9, oCh.Descricao, Me.rnd10_9_Sim, rnd10_9_Nao, Me.rnd10_9_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt10_10, oCh.Descricao, Me.rnd10_10_Sim, rnd10_10_Nao, Me.rnd10_10_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 11)
        Call BCDet(oCh.Pontos, Me.txt10_11, oCh.Descricao, Me.rnd10_11_Sim, rnd10_11_Nao, Me.rnd10_11_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 12)
        Call BCDet(oCh.Pontos, Me.txt10_12, oCh.Descricao, Me.rnd10_12_Sim, rnd10_12_Nao, Me.rnd10_12_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 13)
        Call BCDet(oCh.Pontos, Me.txt10_13, oCh.Descricao, Me.rnd10_13_Sim, rnd10_13_Nao, Me.rnd10_13_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 14)
        Call BCDet(oCh.Pontos, Me.txt10_14, oCh.Descricao, Me.rnd10_14_Sim, rnd10_14_Nao, Me.rnd10_14_NA)


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



    End Sub

    Private Sub BuscarChecklist_Grupo12(ByVal iGrupo As Byte)

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


    End Sub

    Private Sub BuscarChecklist_Grupo13(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt13_1, oCh.Descricao, Me.rnd13_1_Sim, rnd13_1_Nao, Me.rnd13_1_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo14(ByVal iGrupo As Byte)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt14_1, oCh.Descricao, Me.rnd14_1_Sim, rnd14_1_Nao, Me.rnd14_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt14_2, oCh.Descricao, Me.rnd14_2_Sim, rnd14_2_Nao, Me.rnd14_2_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 3)
        Call BCDet(oCh.Pontos, Me.txt14_3, oCh.Descricao, Me.rnd14_3_Sim, rnd14_3_Nao, Me.rnd14_3_NA)

    End Sub

    Private Sub BuscarChecklist_Grupo15(ByVal iGrupo As Byte)

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


    End Sub




    Private Sub BuscarChecklist_GrupoCor()
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 1, 1)
        Call AtualizarCorTitulo(panTitle1, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 1)
        Call AtualizarCorTitulo(panTitle2, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 2)
        Call AtualizarCorTitulo(panTitle3, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 3)
        Call AtualizarCorTitulo(panTitle4, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 2, 4)
        Call AtualizarCorTitulo(panTitle5, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 1)
        Call AtualizarCorTitulo(panTitle6, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 2)
        Call AtualizarCorTitulo(panTitle7, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 3)
        Call AtualizarCorTitulo(panTitle8, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 4)
        Call AtualizarCorTitulo(panTitle9, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 3, 5)
        Call AtualizarCorTitulo(panTitle10, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 1)
        Call AtualizarCorTitulo(panTitle11, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 2)
        Call AtualizarCorTitulo(panTitle12, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 3)
        Call AtualizarCorTitulo(panTitle13, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 4, 4)
        Call AtualizarCorTitulo(panTitle14, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 5, 1)
        Call AtualizarCorTitulo(panTitle15, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 6, 1)
        Call AtualizarCorTitulo(panTitle16, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 7, 1)
        Call AtualizarCorTitulo(panTitle17, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1)
        Call AtualizarCorTitulo(panTitle18, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1)
        Call AtualizarCorTitulo(panTitle19, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1)
        Call AtualizarCorTitulo(panTitle20, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 11, 1)
        Call AtualizarCorTitulo(panTitle21, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 12, 1)
        Call AtualizarCorTitulo(panTitle22, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 13, 1)
        Call AtualizarCorTitulo(panTitle23, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 14, 1)
        Call AtualizarCorTitulo(panTitle24, oCh.Pontos)
        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 15, 1)
        Call AtualizarCorTitulo(panTitle25, oCh.Pontos)
       
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
        Call fPadraoInicial(rnd1_5_NA)
        Call fPadraoInicial(rnd1_6_NA)
        Call fPadraoInicial(rnd1_7_NA)
        Call fPadraoInicial(rnd1_8_NA)
        Call fPadraoInicial(rnd1_9_NA)
        Call fPadraoInicial(rnd1_10_NA)
        Call fPadraoInicial(rnd1_11_NA)
        Call fPadraoInicial(rnd1_12_NA)
        Call fPadraoInicial(rnd1_13_NA)
        Call fPadraoInicial(rnd1_14_NA)
        Call fPadraoInicial(rnd1_15_NA)
        Call fPadraoInicial(rnd1_16_NA)
        Call fPadraoInicial(rnd1_17_NA)
        Call fPadraoInicial(rnd1_18_NA)
        Call fPadraoInicial(rnd1_20_NA)
        Call fPadraoInicial(rnd1_21_NA)
        Call fPadraoInicial(rnd1_22_NA)
        Call fPadraoInicial(rnd1_23_NA)
        Call fPadraoInicial(rnd1_24_NA)
        Call fPadraoInicial(rnd1_25_NA)

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
        Call fPadraoInicial(rnd2_21_NA)
        Call fPadraoInicial(rnd2_22_NA)

        Call fPadraoInicial(rnd2_23_NA)
        Call fPadraoInicial(rnd2_24_NA)
        Call fPadraoInicial(rnd2_25_NA)
        Call fPadraoInicial(rnd2_26_NA)
        Call fPadraoInicial(rnd2_27_NA)
        Call fPadraoInicial(rnd2_28_NA)
        Call fPadraoInicial(rnd2_29_NA)

        Call fPadraoInicial(rnd2_30_NA)
        Call fPadraoInicial(rnd2_31_NA)
        Call fPadraoInicial(rnd2_32_NA)
        Call fPadraoInicial(rnd2_33_NA)
        Call fPadraoInicial(rnd2_34_NA)
        Call fPadraoInicial(rnd2_35_NA)
        Call fPadraoInicial(rnd2_36_NA)
        Call fPadraoInicial(rnd2_37_NA)
        Call fPadraoInicial(rnd2_38_NA)
        Call fPadraoInicial(rnd2_39_NA)
        Call fPadraoInicial(rnd2_40_NA)

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
        Call fPadraoInicial(rnd3_11_NA)
        Call fPadraoInicial(rnd3_12_NA)
        Call fPadraoInicial(rnd3_13_NA)
        Call fPadraoInicial(rnd3_14_NA)

        Call fPadraoInicial(rnd3_15_NA)
        Call fPadraoInicial(rnd3_16_NA)
        Call fPadraoInicial(rnd3_17_NA)
        Call fPadraoInicial(rnd3_18_NA)
        Call fPadraoInicial(rnd3_19_NA)
        Call fPadraoInicial(rnd3_20_NA)
        Call fPadraoInicial(rnd3_21_NA)
        Call fPadraoInicial(rnd3_22_NA)
        Call fPadraoInicial(rnd3_23_NA)
        Call fPadraoInicial(rnd3_24_NA)
        Call fPadraoInicial(rnd3_25_NA)

        Call fPadraoInicial(rnd3_26_NA)
        Call fPadraoInicial(rnd3_27_NA)
        Call fPadraoInicial(rnd3_28_NA)
        Call fPadraoInicial(rnd3_29_NA)
        Call fPadraoInicial(rnd3_30_NA)
        Call fPadraoInicial(rnd3_31_NA)
        Call fPadraoInicial(rnd3_32_NA)
        Call fPadraoInicial(rnd3_33_NA)
        Call fPadraoInicial(rnd3_34_NA)

        Call fPadraoInicial(rnd3_35_NA)
        Call fPadraoInicial(rnd3_36_NA)
        Call fPadraoInicial(rnd3_37_NA)
        Call fPadraoInicial(rnd3_38_NA)
        Call fPadraoInicial(rnd3_39_NA)
        Call fPadraoInicial(rnd3_40_NA)
        Call fPadraoInicial(rnd3_41_NA)
        Call fPadraoInicial(rnd3_42_NA)

        Call fPadraoInicial(rnd3_43_NA)
        Call fPadraoInicial(rnd3_44_NA)
        Call fPadraoInicial(rnd3_45_NA)
        Call fPadraoInicial(rnd3_46_NA)
        Call fPadraoInicial(rnd3_47_NA)
        Call fPadraoInicial(rnd3_48_NA)
        Call fPadraoInicial(rnd3_49_NA)
        Call fPadraoInicial(rnd3_50_NA)
        Call fPadraoInicial(rnd3_51_NA)
        Call fPadraoInicial(rnd3_52_NA)
        Call fPadraoInicial(rnd3_53_NA)
        Call fPadraoInicial(rnd3_54_NA)

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
        Call fPadraoInicial(rnd4_21_NA)
        Call fPadraoInicial(rnd4_22_NA)
        Call fPadraoInicial(rnd4_23_NA)

        Call fPadraoInicial(rnd4_11_NA)
        Call fPadraoInicial(rnd4_12_NA)
        Call fPadraoInicial(rnd4_13_NA)

        Call fPadraoInicial(rnd4_14_NA)
        Call fPadraoInicial(rnd4_15_NA)
        Call fPadraoInicial(rnd4_16_NA)
        Call fPadraoInicial(rnd4_17_NA)
        Call fPadraoInicial(rnd4_18_NA)
        Call fPadraoInicial(rnd4_19_NA)
        Call fPadraoInicial(rnd4_20_NA)

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

        'Grupo 6
        Call fPadraoInicial(rnd6_1_NA)
        Call fPadraoInicial(rnd6_2_NA)
        Call fPadraoInicial(rnd6_3_NA)
        Call fPadraoInicial(rnd6_4_NA)
        Call fPadraoInicial(rnd6_5_NA)
        Call fPadraoInicial(rnd6_6_NA)
        Call fPadraoInicial(rnd6_7_NA)
        Call fPadraoInicial(rnd6_8_NA)
        Call fPadraoInicial(rnd6_9_NA)

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

        'Grupo 8
        Call fPadraoInicial(rnd8_1_NA)
        Call fPadraoInicial(rnd8_2_NA)
        Call fPadraoInicial(rnd8_3_NA)
        Call fPadraoInicial(rnd8_4_NA)
        Call fPadraoInicial(rnd8_5_NA)
        Call fPadraoInicial(rnd8_6_NA)
        Call fPadraoInicial(rnd8_7_NA)
        Call fPadraoInicial(rnd8_8_NA)
        Call fPadraoInicial(rnd8_9_NA)
        Call fPadraoInicial(rnd8_10_NA)
        Call fPadraoInicial(rnd8_11_NA)
        Call fPadraoInicial(rnd8_12_NA)
        Call fPadraoInicial(rnd8_13_NA)
        Call fPadraoInicial(rnd8_14_NA)

        'Grupo 9
        Call fPadraoInicial(rnd9_1_NA)
        Call fPadraoInicial(rnd9_2_NA)
        Call fPadraoInicial(rnd9_3_NA)
        Call fPadraoInicial(rnd9_4_NA)
        Call fPadraoInicial(rnd9_5_NA)
        Call fPadraoInicial(rnd9_6_NA)
        Call fPadraoInicial(rnd9_7_NA)
        Call fPadraoInicial(rnd9_8_NA)
        Call fPadraoInicial(rnd9_9_NA)
        Call fPadraoInicial(rnd9_10_NA)
        Call fPadraoInicial(rnd9_11_NA)
        Call fPadraoInicial(rnd9_12_NA)
        Call fPadraoInicial(rnd9_13_NA)

        'Grupo 10
        Call fPadraoInicial(rnd10_1_NA)
        Call fPadraoInicial(rnd10_2_NA)
        Call fPadraoInicial(rnd10_3_NA)
        Call fPadraoInicial(rnd10_4_NA)
        Call fPadraoInicial(rnd10_5_NA)
        Call fPadraoInicial(rnd10_6_NA)
        Call fPadraoInicial(rnd10_7_NA)
        Call fPadraoInicial(rnd10_8_NA)
        Call fPadraoInicial(rnd10_9_NA)
        Call fPadraoInicial(rnd10_10_NA)
        Call fPadraoInicial(rnd10_11_NA)
        Call fPadraoInicial(rnd10_12_NA)
        Call fPadraoInicial(rnd10_13_NA)
        Call fPadraoInicial(rnd10_14_NA)

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

        'Grupo 12
        Call fPadraoInicial(rnd12_1_NA)
        Call fPadraoInicial(rnd12_2_NA)
        Call fPadraoInicial(rnd12_3_NA)
        Call fPadraoInicial(rnd12_4_NA)
        Call fPadraoInicial(rnd12_5_NA)
     
        'Grupo 13
        Call fPadraoInicial(rnd13_1_NA)

        'Grupo 14
        Call fPadraoInicial(rnd14_1_NA)
        Call fPadraoInicial(rnd14_2_NA)
        Call fPadraoInicial(rnd14_3_NA)

        'Grupo 15
        Call fPadraoInicial(rnd15_1_NA)
        Call fPadraoInicial(rnd15_2_NA)
        Call fPadraoInicial(rnd15_3_NA)
        Call fPadraoInicial(rnd15_4_NA)
        Call fPadraoInicial(rnd15_5_NA)

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

    Protected Sub btnSalvarFoto1_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_5.Click
        Call UploadImagem(Me.upFile1_5, Me.txt1_5.Text, 1, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto1_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_6.Click
        Call UploadImagem(Me.upFile1_6, Me.txt1_6.Text, 1, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto1_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_7.Click
        Call UploadImagem(Me.upFile1_7, Me.txt1_7.Text, 1, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto1_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_8.Click
        Call UploadImagem(Me.upFile1_8, Me.txt1_8.Text, 1, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto1_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_9.Click
        Call UploadImagem(Me.upFile1_9, Me.txt1_9.Text, 1, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto1_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_10.Click
        Call UploadImagem(Me.upFile1_10, Me.txt1_10.Text, 1, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto1_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_11.Click
        Call UploadImagem(Me.upFile1_11, Me.txt1_11.Text, 1, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto1_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_12.Click
        Call UploadImagem(Me.upFile1_12, Me.txt1_12.Text, 1, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto1_13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_13.Click
        Call UploadImagem(Me.upFile1_13, Me.txt1_13.Text, 1, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto1_14_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_14.Click
        Call UploadImagem(Me.upFile1_14, Me.txt1_14.Text, 1, 1, 14)
    End Sub

    Protected Sub btnSalvarFoto1_15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_15.Click
        Call UploadImagem(Me.upFile1_15, Me.txt1_15.Text, 1, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto1_16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_16.Click
        Call UploadImagem(Me.upFile1_16, Me.txt1_16.Text, 1, 1, 16)
    End Sub

    Protected Sub btnSalvarFoto1_17_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_17.Click
        Call UploadImagem(Me.upFile1_17, Me.txt1_17.Text, 1, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto1_18_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_18.Click
        Call UploadImagem(Me.upFile1_18, Me.txt1_18.Text, 1, 1, 18)
    End Sub

    Protected Sub btnSalvarFoto1_19_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_19.Click
        Call UploadImagem(Me.upFile1_19, Me.txt1_19.Text, 1, 1, 19)
    End Sub

    Protected Sub btnSalvarFoto1_20_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_20.Click
        Call UploadImagem(Me.upFile1_20, Me.txt1_20.Text, 1, 1, 20)
    End Sub

    Protected Sub btnSalvarFoto1_21_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_21.Click
        Call UploadImagem(Me.upFile1_21, Me.txt1_21.Text, 1, 1, 21)
    End Sub

    Protected Sub btnSalvarFoto1_22_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_22.Click
        Call UploadImagem(Me.upFile1_22, Me.txt1_22.Text, 1, 1, 22)
    End Sub

    Protected Sub btnSalvarFoto1_23_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_23.Click
        Call UploadImagem(Me.upFile1_23, Me.txt1_23.Text, 1, 1, 23)
    End Sub

    Protected Sub btnSalvarFoto1_24_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_24.Click
        Call UploadImagem(Me.upFile1_24, Me.txt1_24.Text, 1, 1, 24)
    End Sub

    Protected Sub btnSalvarFoto1_25_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto1_25.Click
        Call UploadImagem(Me.upFile1_25, Me.txt1_25.Text, 1, 1, 25)
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
        Call UploadImagem(Me.upFile2_11, Me.txt2_11.Text, 2, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto2_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_12.Click
        Call UploadImagem(Me.upFile2_12, Me.txt2_12.Text, 2, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto2_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_13.Click
        Call UploadImagem(Me.upFile2_13, Me.txt2_13.Text, 2, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto2_41_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_41.Click
        Call UploadImagem(Me.upFile2_41, Me.txt2_41.Text, 2, 1, 41)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 2.2"

    ' Grupo 2.2

    Protected Sub btnSalvarFoto2_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_14.Click
        Call UploadImagem(Me.upFile2_14, Me.txt2_14.Text, 2, 2, 14)
    End Sub

    Protected Sub btnSalvarFoto2_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_15.Click
        Call UploadImagem(Me.upFile2_15, Me.txt2_15.Text, 2, 2, 15)
    End Sub

    Protected Sub btnSalvarFoto2_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_16.Click
        Call UploadImagem(Me.upFile2_16, Me.txt2_16.Text, 2, 2, 16)
    End Sub

    Protected Sub btnSalvarFoto2_17_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_17.Click
        Call UploadImagem(Me.upFile2_17, Me.txt2_17.Text, 2, 2, 17)
    End Sub

    Protected Sub btnSalvarFoto2_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_18.Click
        Call UploadImagem(Me.upFile2_18, Me.txt2_18.Text, 2, 2, 18)
    End Sub

    Protected Sub btnSalvarFoto2_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_19.Click
        Call UploadImagem(Me.upFile2_19, Me.txt2_19.Text, 2, 2, 19)
    End Sub

    Protected Sub btnSalvarFoto2_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_20.Click
        Call UploadImagem(Me.upFile2_20, Me.txt2_20.Text, 2, 2, 20)
    End Sub

    Protected Sub btnSalvarFoto2_21_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_21.Click
        Call UploadImagem(Me.upFile2_21, Me.txt2_21.Text, 2, 2, 21)
    End Sub

    Protected Sub btnSalvarFoto2_22_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_22.Click
        Call UploadImagem(Me.upFile2_22, Me.txt2_22.Text, 2, 2, 22)
    End Sub
#End Region

    Protected Sub btnSalvarFoto2_23_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_23.Click
        Call UploadImagem(Me.upFile2_23, Me.txt2_23.Text, 2, 2, 23)
    End Sub

    Protected Sub btnSalvarFoto2_24_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_24.Click
        Call UploadImagem(Me.upFile2_24, Me.txt2_24.Text, 2, 2, 24)
    End Sub

#Region " btnSalvarFoto - Grupo 2.3"
    ' Grupo 2.3



    Protected Sub btnSalvarFoto2_25_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_25.Click
        Call UploadImagem(Me.upFile2_25, Me.txt2_25.Text, 2, 3, 25)
    End Sub

    Protected Sub btnSalvarFoto2_26_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_26.Click
        Call UploadImagem(Me.upFile2_26, Me.txt2_26.Text, 2, 3, 26)
    End Sub

    Protected Sub btnSalvarFoto2_27_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_27.Click
        Call UploadImagem(Me.upFile2_27, Me.txt2_27.Text, 2, 3, 27)
    End Sub

    Protected Sub btnSalvarFoto2_28_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_28.Click
        Call UploadImagem(Me.upFile2_28, Me.txt2_28.Text, 2, 3, 28)
    End Sub

    Protected Sub btnSalvarFoto2_29_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_29.Click
        Call UploadImagem(Me.upFile2_29, Me.txt2_29.Text, 2, 3, 29)
    End Sub
#End Region

#Region " btnSalvarFoto - Grupo 2.4"
    ' Grupo 2.4

    Protected Sub btnSalvarFoto2_30_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_30.Click
        Call UploadImagem(Me.upFile2_30, Me.txt2_30.Text, 2, 3, 30)
    End Sub

    Protected Sub btnSalvarFoto2_31_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_31.Click
        Call UploadImagem(Me.upFile2_31, Me.txt2_31.Text, 2, 3, 31)
    End Sub

    Protected Sub btnSalvarFoto2_32_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_32.Click
        Call UploadImagem(Me.upFile2_32, Me.txt2_32.Text, 2, 3, 32)
    End Sub

    Protected Sub btnSalvarFoto2_33_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_33.Click
        Call UploadImagem(Me.upFile2_33, Me.txt2_33.Text, 2, 4, 33)
    End Sub

    Protected Sub btnSalvarFoto2_34_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_34.Click
        Call UploadImagem(Me.upFile2_34, Me.txt2_34.Text, 2, 4, 34)
    End Sub

    Protected Sub btnSalvarFoto2_35_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_35.Click
        Call UploadImagem(Me.upFile2_35, Me.txt2_35.Text, 2, 4, 35)
    End Sub

    Protected Sub btnSalvarFoto2_36_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_36.Click
        Call UploadImagem(Me.upFile2_36, Me.txt2_36.Text, 2, 4, 36)
    End Sub

    Protected Sub btnSalvarFoto2_37_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_37.Click
        Call UploadImagem(Me.upFile2_37, Me.txt2_37.Text, 2, 4, 37)
    End Sub

    Protected Sub btnSalvarFoto2_38_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_38.Click
        Call UploadImagem(Me.upFile2_38, Me.txt2_38.Text, 2, 4, 38)
    End Sub

    Protected Sub btnSalvarFoto2_39_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_39.Click
        Call UploadImagem(Me.upFile2_39, Me.txt2_39.Text, 2, 4, 39)
    End Sub

    Protected Sub btnSalvarFoto2_40_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto2_40.Click
        Call UploadImagem(Me.upFile2_40, Me.txt2_40.Text, 2, 4, 40)
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

    Protected Sub btnSalvarFoto3_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_11.Click
        Call UploadImagem(Me.upFile3_11, Me.txt3_11.Text, 3, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto3_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_12.Click
        Call UploadImagem(Me.upFile3_12, Me.txt3_12.Text, 3, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto3_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_13.Click
        Call UploadImagem(Me.upFile3_13, Me.txt3_13.Text, 3, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto3_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_14.Click
        Call UploadImagem(Me.upFile3_14, Me.txt3_14.Text, 3, 1, 14)
    End Sub
#End Region

#Region " btnSalvarFoto - Grupo3.2"

    Protected Sub btnSalvarFoto3_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_15.Click
        Call UploadImagem(Me.upFile3_15, Me.txt3_15.Text, 3, 2, 15)
    End Sub

    Protected Sub btnSalvarFoto3_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_16.Click
        Call UploadImagem(Me.upFile3_16, Me.txt3_16.Text, 3, 2, 16)
    End Sub

    Protected Sub btnSalvarFoto3_17_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_17.Click
        Call UploadImagem(Me.upFile3_17, Me.txt3_17.Text, 3, 2, 17)
    End Sub

    Protected Sub btnSalvarFoto3_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_18.Click
        Call UploadImagem(Me.upFile3_18, Me.txt3_18.Text, 3, 2, 18)
    End Sub

    Protected Sub btnSalvarFoto3_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_19.Click
        Call UploadImagem(Me.upFile3_19, Me.txt3_19.Text, 3, 2, 19)
    End Sub

    Protected Sub btnSalvarFoto3_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_20.Click
        Call UploadImagem(Me.upFile3_20, Me.txt3_20.Text, 3, 2, 20)
    End Sub

    Protected Sub btnSalvarFoto3_21_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_21.Click
        Call UploadImagem(Me.upFile3_21, Me.txt3_21.Text, 3, 2, 21)
    End Sub

    Protected Sub btnSalvarFoto3_22_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_22.Click
        Call UploadImagem(Me.upFile3_22, Me.txt3_22.Text, 3, 2, 22)
    End Sub

    Protected Sub btnSalvarFoto3_23_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_23.Click
        Call UploadImagem(Me.upFile3_23, Me.txt3_23.Text, 3, 2, 23)
    End Sub

    Protected Sub btnSalvarFoto3_24_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_24.Click
        Call UploadImagem(Me.upFile3_24, Me.txt3_24.Text, 3, 2, 24)
    End Sub

    Protected Sub btnSalvarFoto3_25_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_25.Click
        Call UploadImagem(Me.upFile3_25, Me.txt3_25.Text, 3, 2, 25)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 3.3"

    Protected Sub btnSalvarFoto3_26_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_26.Click
        Call UploadImagem(Me.upFile3_26, Me.txt3_26.Text, 3, 3, 26)
    End Sub

    Protected Sub btnSalvarFoto3_27_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_27.Click
        Call UploadImagem(Me.upFile3_27, Me.txt3_27.Text, 3, 3, 27)
    End Sub

    Protected Sub btnSalvarFoto3_28_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_28.Click
        Call UploadImagem(Me.upFile3_28, Me.txt3_28.Text, 3, 3, 28)
    End Sub

    Protected Sub btnSalvarFoto3_29_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_29.Click
        Call UploadImagem(Me.upFile3_29, Me.txt3_29.Text, 3, 3, 29)
    End Sub

    Protected Sub btnSalvarFoto3_30_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_30.Click
        Call UploadImagem(Me.upFile3_30, Me.txt3_30.Text, 3, 3, 30)
    End Sub

    Protected Sub btnSalvarFoto3_31_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_31.Click
        Call UploadImagem(Me.upFile3_31, Me.txt3_31.Text, 3, 3, 31)
    End Sub

    Protected Sub btnSalvarFoto3_32_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_32.Click
        Call UploadImagem(Me.upFile3_32, Me.txt3_32.Text, 3, 3, 32)
    End Sub

    Protected Sub btnSalvarFoto3_33_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_33.Click
        Call UploadImagem(Me.upFile3_33, Me.txt3_33.Text, 3, 3, 33)
    End Sub

    Protected Sub btnSalvarFoto3_34_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_34.Click
        Call UploadImagem(Me.upFile3_34, Me.txt3_34.Text, 3, 3, 34)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 3.4"

    Protected Sub btnSalvarFoto3_35_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_35.Click
        Call UploadImagem(Me.upFile3_35, Me.txt3_35.Text, 3, 4, 35)
    End Sub

    Protected Sub btnSalvarFoto3_36_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_36.Click
        Call UploadImagem(Me.upFile3_36, Me.txt3_36.Text, 3, 4, 36)
    End Sub

    Protected Sub btnSalvarFoto3_37_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_37.Click
        Call UploadImagem(Me.upFile3_37, Me.txt3_37.Text, 3, 4, 37)
    End Sub

    Protected Sub btnSalvarFoto3_38_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_38.Click
        Call UploadImagem(Me.upFile3_38, Me.txt3_38.Text, 3, 4, 38)
    End Sub

    Protected Sub btnSalvarFoto3_39_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_39.Click
        Call UploadImagem(Me.upFile3_39, Me.txt3_39.Text, 3, 4, 39)
    End Sub

    Protected Sub btnSalvarFoto3_40_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_40.Click
        Call UploadImagem(Me.upFile3_40, Me.txt3_40.Text, 3, 4, 40)
    End Sub

    Protected Sub btnSalvarFoto3_41_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_41.Click
        Call UploadImagem(Me.upFile3_41, Me.txt3_41.Text, 3, 4, 41)
    End Sub

    Protected Sub btnSalvarFoto3_42_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_42.Click
        Call UploadImagem(Me.upFile3_42, Me.txt3_42.Text, 3, 4, 42)
    End Sub
#End Region

#Region " btnSalvarFoto - Grupo 3.5"

    Protected Sub btnSalvarFoto3_43_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_43.Click
        Call UploadImagem(Me.upFile3_43, Me.txt3_43.Text, 3, 5, 43)
    End Sub

    Protected Sub btnSalvarFoto3_44_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_44.Click
        Call UploadImagem(Me.upFile3_44, Me.txt3_44.Text, 3, 5, 44)
    End Sub

    Protected Sub btnSalvarFoto3_45_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_45.Click
        Call UploadImagem(Me.upFile3_45, Me.txt3_45.Text, 3, 5, 45)
    End Sub

    Protected Sub btnSalvarFoto3_46_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_46.Click
        Call UploadImagem(Me.upFile3_46, Me.txt3_46.Text, 3, 5, 46)
    End Sub

    Protected Sub btnSalvarFoto3_47_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_47.Click
        Call UploadImagem(Me.upFile3_47, Me.txt3_47.Text, 3, 5, 47)
    End Sub

    Protected Sub btnSalvarFoto3_48_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_48.Click
        Call UploadImagem(Me.upFile3_48, Me.txt3_48.Text, 3, 5, 48)
    End Sub

    Protected Sub btnSalvarFoto3_49_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_49.Click
        Call UploadImagem(Me.upFile3_49, Me.txt3_49.Text, 3, 5, 49)
    End Sub

    Protected Sub btnSalvarFoto3_50_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_50.Click
        Call UploadImagem(Me.upFile3_50, Me.txt3_50.Text, 3, 5, 50)
    End Sub

    Protected Sub btnSalvarFoto3_51_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_51.Click
        Call UploadImagem(Me.upFile3_51, Me.txt3_51.Text, 3, 5, 51)
    End Sub

    Protected Sub btnSalvarFoto3_53_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_53.Click
        Call UploadImagem(Me.upFile3_53, Me.txt3_53.Text, 3, 5, 53)
    End Sub

    Protected Sub btnSalvarFoto3_54_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto3_54.Click
        Call UploadImagem(Me.upFile3_54, Me.txt3_54.Text, 3, 5, 54)
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
#End Region

#Region " btnSalvarFoto - Grupo 4.2"
    Protected Sub btnSalvarFoto4_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_4.Click
        Call UploadImagem(Me.upFile4_4, Me.txt4_4.Text, 4, 2, 4)
    End Sub

    Protected Sub btnSalvarFoto4_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_5.Click
        Call UploadImagem(Me.upFile4_5, Me.txt4_5.Text, 4, 2, 5)
    End Sub

    Protected Sub btnSalvarFoto4_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_6.Click
        Call UploadImagem(Me.upFile4_6, Me.txt4_6.Text, 4, 2, 6)
    End Sub

    Protected Sub btnSalvarFoto4_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_7.Click
        Call UploadImagem(Me.upFile4_7, Me.txt4_7.Text, 4, 2, 7)
    End Sub

    Protected Sub btnSalvarFoto4_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_8.Click
        Call UploadImagem(Me.upFile4_8, Me.txt4_8.Text, 4, 2, 8)
    End Sub

    Protected Sub btnSalvarFoto4_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_9.Click
        Call UploadImagem(Me.upFile4_9, Me.txt4_9.Text, 4, 2, 9)
    End Sub

    Protected Sub btnSalvarFoto4_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_10.Click
        Call UploadImagem(Me.upFile4_10, Me.txt4_10.Text, 4, 2, 10)
    End Sub

    Protected Sub btnSalvarFoto4_21_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_21.Click
        Call UploadImagem(Me.upFile4_21, Me.txt4_21.Text, 4, 2, 21)
    End Sub

    Protected Sub btnSalvarFoto4_22_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_22.Click
        Call UploadImagem(Me.upFile4_22, Me.txt4_22.Text, 4, 2, 22)
    End Sub

    Protected Sub btnSalvarFoto4_23_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_23.Click
        Call UploadImagem(Me.upFile4_23, Me.txt4_23.Text, 4, 2, 23)
    End Sub


#End Region ' Bloco 2 - 11 a 13. Total de 3 Perguntas

#Region " btnSalvarFoto - Grupo 4.3"

    Protected Sub btnSalvarFoto4_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_11.Click
        Call UploadImagem(Me.upFile4_11, Me.txt4_11.Text, 4, 3, 11)
    End Sub

    Protected Sub btnSalvarFoto4_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_12.Click
        Call UploadImagem(Me.upFile4_12, Me.txt4_12.Text, 4, 3, 12)
    End Sub

    Protected Sub btnSalvarFoto4_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_13.Click
        Call UploadImagem(Me.upFile4_13, Me.txt4_13.Text, 4, 3, 13)
    End Sub
#End Region  ' Bloco 3 - 11 a 13. Total de 3 Perguntas

#Region " btnSalvarFoto - Grupo 4.4"

    Protected Sub btnSalvarFoto4_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_14.Click
        Call UploadImagem(Me.upFile4_14, Me.txt4_14.Text, 4, 4, 14)
    End Sub

    Protected Sub btnSalvarFoto4_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_15.Click
        Call UploadImagem(Me.upFile4_15, Me.txt4_15.Text, 4, 4, 15)
    End Sub

    Protected Sub btnSalvarFoto4_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_16.Click
        Call UploadImagem(Me.upFile4_16, Me.txt4_16.Text, 4, 4, 16)
    End Sub

    Protected Sub btnSalvarFoto4_17_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_17.Click
        Call UploadImagem(Me.upFile4_17, Me.txt4_17.Text, 4, 4, 17)
    End Sub

    Protected Sub btnSalvarFoto4_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_18.Click
        Call UploadImagem(Me.upFile4_18, Me.txt4_18.Text, 4, 4, 18)
    End Sub

    Protected Sub btnSalvarFoto4_19_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_19.Click
        Call UploadImagem(Me.upFile4_19, Me.txt4_19.Text, 4, 4, 19)
    End Sub

    Protected Sub btnSalvarFoto4_20_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto4_20.Click
        Call UploadImagem(Me.upFile4_20, Me.txt4_20.Text, 4, 4, 20)
    End Sub

#End Region  ' Bloco 4 - 14 a 20. Total de 7 Perguntas

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

    Protected Sub btnSalvarFoto7_17_1Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_17.Click
        Call UploadImagem(Me.upFile7_17, Me.txt7_17.Text, 7, 1, 17)
    End Sub

    Protected Sub btnSalvarFoto7_18_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto7_18.Click
        Call UploadImagem(Me.upFile7_18, Me.txt7_18.Text, 7, 1, 18)
    End Sub

#End Region


#Region " btnSalvarFoto - Grupo 8"
    Protected Sub btnSalvarFoto8_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_1.Click
        Call UploadImagem(Me.upFile8_1, Me.txt8_1.Text, 8, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto8_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_2.Click
        Call UploadImagem(Me.upFile8_2, Me.txt8_2.Text, 8, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto8_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_3.Click
        Call UploadImagem(Me.upFile8_3, Me.txt8_3.Text, 8, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto8_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_4.Click
        Call UploadImagem(Me.upFile8_4, Me.txt8_4.Text, 8, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto8_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_5.Click
        Call UploadImagem(Me.upFile8_5, Me.txt8_5.Text, 8, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto8_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_6.Click
        Call UploadImagem(Me.upFile8_6, Me.txt8_6.Text, 8, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto8_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_7.Click
        Call UploadImagem(Me.upFile8_7, Me.txt8_7.Text, 8, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto8_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_8.Click
        Call UploadImagem(Me.upFile8_8, Me.txt8_8.Text, 8, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto8_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_9.Click
        Call UploadImagem(Me.upFile8_9, Me.txt8_9.Text, 8, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto8_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_10.Click
        Call UploadImagem(Me.upFile8_10, Me.txt8_10.Text, 8, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto8_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_11.Click
        Call UploadImagem(Me.upFile8_11, Me.txt8_11.Text, 8, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto8_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_12.Click
        Call UploadImagem(Me.upFile8_12, Me.txt8_12.Text, 8, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto8_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_13.Click
        Call UploadImagem(Me.upFile8_13, Me.txt8_13.Text, 8, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto8_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_14.Click
        Call UploadImagem(Me.upFile8_14, Me.txt8_14.Text, 8, 1, 14)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 9"
    Protected Sub btnSalvarFoto9_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_1.Click
        Call UploadImagem(Me.upFile9_1, Me.txt9_1.Text, 9, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto9_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_2.Click
        Call UploadImagem(Me.upFile9_2, Me.txt9_2.Text, 9, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto9_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_3.Click
        Call UploadImagem(Me.upFile9_3, Me.txt9_3.Text, 9, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto9_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_4.Click
        Call UploadImagem(Me.upFile9_4, Me.txt9_4.Text, 9, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto9_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_5.Click
        Call UploadImagem(Me.upFile9_5, Me.txt9_5.Text, 9, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto9_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_6.Click
        Call UploadImagem(Me.upFile9_6, Me.txt9_6.Text, 9, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto9_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_7.Click
        Call UploadImagem(Me.upFile9_7, Me.txt9_7.Text, 9, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto9_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_8.Click
        Call UploadImagem(Me.upFile9_8, Me.txt9_8.Text, 9, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto9_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_9.Click
        Call UploadImagem(Me.upFile9_9, Me.txt9_9.Text, 9, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto9_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_10.Click
        Call UploadImagem(Me.upFile9_10, Me.txt9_10.Text, 9, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto9_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_11.Click
        Call UploadImagem(Me.upFile9_11, Me.txt9_11.Text, 9, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto9_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_12.Click
        Call UploadImagem(Me.upFile9_12, Me.txt9_12.Text, 9, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto9_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_13.Click
        Call UploadImagem(Me.upFile9_13, Me.txt9_13.Text, 9, 1, 13)
    End Sub


#End Region

#Region " btnSalvarFoto - Grupo 10"
    Protected Sub btnSalvarFoto10_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_1.Click
        Call UploadImagem(Me.upFile10_1, Me.txt10_1.Text, 10, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto10_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_2.Click
        Call UploadImagem(Me.upFile10_2, Me.txt10_2.Text, 10, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto10_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_3.Click
        Call UploadImagem(Me.upFile10_3, Me.txt10_3.Text, 10, 1, 3)
    End Sub

    Protected Sub btnSalvarFoto10_4_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_4.Click
        Call UploadImagem(Me.upFile10_4, Me.txt10_4.Text, 10, 1, 4)
    End Sub

    Protected Sub btnSalvarFoto10_5_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_5.Click
        Call UploadImagem(Me.upFile10_5, Me.txt10_5.Text, 10, 1, 5)
    End Sub

    Protected Sub btnSalvarFoto10_6_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_6.Click
        Call UploadImagem(Me.upFile10_6, Me.txt10_6.Text, 10, 1, 6)
    End Sub

    Protected Sub btnSalvarFoto10_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_7.Click
        Call UploadImagem(Me.upFile10_7, Me.txt10_7.Text, 10, 1, 7)
    End Sub

    Protected Sub btnSalvarFoto10_8_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_8.Click
        Call UploadImagem(Me.upFile10_8, Me.txt10_8.Text, 10, 1, 8)
    End Sub

    Protected Sub btnSalvarFoto10_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_9.Click
        Call UploadImagem(Me.upFile10_9, Me.txt10_9.Text, 10, 1, 9)
    End Sub

    Protected Sub btnSalvarFoto10_10_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_10.Click
        Call UploadImagem(Me.upFile10_10, Me.txt10_10.Text, 10, 1, 10)
    End Sub

    Protected Sub btnSalvarFoto10_11_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_11.Click
        Call UploadImagem(Me.upFile10_11, Me.txt10_11.Text, 10, 1, 11)
    End Sub

    Protected Sub btnSalvarFoto10_12_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_12.Click
        Call UploadImagem(Me.upFile10_12, Me.txt10_12.Text, 10, 1, 12)
    End Sub

    Protected Sub btnSalvarFoto10_13_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_13.Click
        Call UploadImagem(Me.upFile10_13, Me.txt10_13.Text, 10, 1, 13)
    End Sub

    Protected Sub btnSalvarFoto10_14_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_14.Click
        Call UploadImagem(Me.upFile10_14, Me.txt10_14.Text, 10, 1, 14)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 11"
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
        Call UploadImagem(Me.upFile11_9, Me.txt11_11.Text, 11, 1, 9)
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


#End Region

#Region " btnSalvarFoto - Grupo 12"
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

#End Region

#Region " btnSalvarFoto - Grupo 13"
    Protected Sub btnSalvarFoto13_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto13_1.Click
        Call UploadImagem(Me.upFile13_1, Me.txt13_1.Text, 13, 1, 1)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 14"
    Protected Sub btnSalvarFoto14_1_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_1.Click
        Call UploadImagem(Me.upFile14_1, Me.txt14_1.Text, 14, 1, 1)
    End Sub

    Protected Sub btnSalvarFoto14_2_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_2.Click
        Call UploadImagem(Me.upFile14_2, Me.txt14_2.Text, 14, 1, 2)
    End Sub

    Protected Sub btnSalvarFoto14_3_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto14_3.Click
        Call UploadImagem(Me.upFile14_3, Me.txt14_3.Text, 14, 1, 3)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 15"
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

        Select Case Me.cboFilial.CallFilial
            Case 3
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F003.aspx", Me.cboFilial.CallFilial)
            Case 4
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F004.aspx", Me.cboFilial.CallFilial)
            Case 5
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F005.aspx", Me.cboFilial.CallFilial)
            Case 6
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F006.aspx", Me.cboFilial.CallFilial)
            Case 7
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F007.aspx", Me.cboFilial.CallFilial)
            Case 8
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F008.aspx", Me.cboFilial.CallFilial)
            Case 9
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F009.aspx", Me.cboFilial.CallFilial)
            Case 10
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F010.aspx", Me.cboFilial.CallFilial)
            Case 11
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F011.aspx", Me.cboFilial.CallFilial)
            Case 13
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F013.aspx", Me.cboFilial.CallFilial)
            Case 14
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F014.aspx", Me.cboFilial.CallFilial)
            Case 15
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F015.aspx", Me.cboFilial.CallFilial)
            Case 17
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F017.aspx", Me.cboFilial.CallFilial)
            Case 18
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F018.aspx", Me.cboFilial.CallFilial)
            Case 19
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F019.aspx", Me.cboFilial.CallFilial)
            Case 20
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F020.aspx", Me.cboFilial.CallFilial)
            Case 21
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F021.aspx", Me.cboFilial.CallFilial)
            Case 22
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F022.aspx", Me.cboFilial.CallFilial)
            Case 23
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F023.aspx", Me.cboFilial.CallFilial)
            Case 24
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F024.aspx", Me.cboFilial.CallFilial)
            Case 25
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F025.aspx", Me.cboFilial.CallFilial)
            Case 26
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F026.aspx", Me.cboFilial.CallFilial)
            Case 27
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F027.aspx", Me.cboFilial.CallFilial)
            Case 28
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F028.aspx", Me.cboFilial.CallFilial)
            Case 29
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F029.aspx", Me.cboFilial.CallFilial)
            Case 30
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F030.aspx", Me.cboFilial.CallFilial)
            Case 31
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F031.aspx", Me.cboFilial.CallFilial)
            Case 32
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F032.aspx", Me.cboFilial.CallFilial)
            Case 33
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F033.aspx", Me.cboFilial.CallFilial)
            Case 34
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F034.aspx", Me.cboFilial.CallFilial)
            Case 36
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F036.aspx", Me.cboFilial.CallFilial)
            Case 37
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F037.aspx", Me.cboFilial.CallFilial)
            Case 38
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F038.aspx", Me.cboFilial.CallFilial)
            Case 39
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F039.aspx", Me.cboFilial.CallFilial)
            Case 40
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F040.aspx", Me.cboFilial.CallFilial)
            Case 41
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F041.aspx", Me.cboFilial.CallFilial)
            Case 42
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F042.aspx", Me.cboFilial.CallFilial)
            Case 43
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F043.aspx", Me.cboFilial.CallFilial)
            Case 44
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F044.aspx", Me.cboFilial.CallFilial)
            Case 45
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F045.aspx", Me.cboFilial.CallFilial)
            Case 46
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F046.aspx", Me.cboFilial.CallFilial)
            Case 47
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F047.aspx", Me.cboFilial.CallFilial)
            Case 48
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F048.aspx", Me.cboFilial.CallFilial)
            Case 49
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F049.aspx", Me.cboFilial.CallFilial)
            Case 50
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F050.aspx", Me.cboFilial.CallFilial)
            Case 51
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F051.aspx", Me.cboFilial.CallFilial)
            Case 52
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F052.aspx", Me.cboFilial.CallFilial)
            Case 53
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F053.aspx", Me.cboFilial.CallFilial)
            Case 54
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F054.aspx", Me.cboFilial.CallFilial)
            Case 55
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F055.aspx", Me.cboFilial.CallFilial)
            Case 56
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F056.aspx", Me.cboFilial.CallFilial)
            Case 57
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F057.aspx", Me.cboFilial.CallFilial)
            Case 58
                oCh.GerarRelatorio(Me.cboDia.CallDia, Me.cboFilial.CallFilial)
                Call Linkar("RelatorioChecklist_F058.aspx", Me.cboFilial.CallFilial)
        End Select

    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call HabilitarGerarRelatorio()
    End Sub

    Private Sub HabilitarGerarRelatorio()

        Select Case Me.cboFilial.CallFilial
            Case 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58
                Me.btnPDF.Enabled = True
            Case Else
                Me.btnPDF.Enabled = False
        End Select
    End Sub

    Protected Sub UpdatePanel1_PreRender(sender As Object, e As EventArgs) Handles UpdatePanel1.PreRender


        Select Case CByte(cboFilial.CallFilial)
            Case 3, 8, 13, 15, 17, 18, 28, 34
                EnabledControls(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA, txt4_3, imgFoto4_3, btnSalvarFoto4_3, False)
            Case Else
                EnabledControls(rnd4_3_Sim, rnd4_3_Nao, rnd4_3_NA, txt4_3, imgFoto4_3, btnSalvarFoto4_3, True)
        End Select

    End Sub


    
End Class
