Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing

Partial Class MemberPages_CheckListCeasa
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
        CType(Master.FindControl("lblTitle"), Label).Text = "Check-list CEASA"
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
        On Error Resume Next
        Dim intLength As Integer
        Dim arrContent As Byte()

        If oUpload.PostedFile Is Nothing Then
            lblStatus.Text = "Nenhum arquivo selecionado."
            Exit Sub
        Else
            Dim fileName As String = oUpload.PostedFile.FileName
            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = ext.ToLower

            Dim imgType = oUpload.PostedFile.ContentType
            If ext = ".jpg" Then
            ElseIf ext = ".bmp" Then
            ElseIf ext = ".gif" Then
            ElseIf ext = ".png" Then
            ElseIf ext = "jpg" Then
            ElseIf ext = "bmp" Then
            ElseIf ext = "gif" Then
            ElseIf ext = "png" Then
            Else
                lblStatus.Text = "Somente gif, bmp, png or jpg formatos são válidos."
                Exit Sub
            End If

            intLength = Convert.ToInt32(oUpload.PostedFile.InputStream.Length)

            ReDim arrContent(intLength)

            oUpload.PostedFile.InputStream.Read(arrContent, 0, intLength)

            If Doc2SQLServer(iText, arrContent, intLength, imgType, Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, iSubgrupo, iCod) = True Then
                lblStatus.Text = "A imagem foi carregada com sucesso!!!"
            Else
                lblStatus.Text = "Um erro ocorreu ao carregar a imagem... Por favor, tente novamente."
            End If

        End If
    End Sub

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
           
            btnGrupo8.Enabled = False
            btnGrupo9.Enabled = False
            btnGrupo10.Enabled = False
        Else
           
            btnGrupo8.Enabled = True
            btnGrupo9.Enabled = True
            btnGrupo10.Enabled = True
     
        End If

    End Sub

    Private Sub fLimparTextBox(ByVal myTexto As TextBox)
        myTexto.Text = ""
    End Sub

    Private Sub LimparTextBox()

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
        Call fLimparTextBox(txt8_15)
        Call fLimparTextBox(txt8_16)


        'Grupo 9
        Call fLimparTextBox(txt9_1)
        Call fLimparTextBox(txt9_2)
        Call fLimparTextBox(txt9_3)
        Call fLimparTextBox(txt9_4)
        Call fLimparTextBox(txt9_5)
        Call fLimparTextBox(txt9_6)
        Call fLimparTextBox(txt9_7)


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


    End Sub

    Private Function DefinirPontuacao(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox) As Byte
        If rndSim.Checked = True Then DefinirPontuacao = 1
        If rndNao.Checked = True Then DefinirPontuacao = 0
        If rndNA.Checked = True Then DefinirPontuacao = 2
        Return DefinirPontuacao
    End Function

    Protected Sub btnGrupo8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo8.Click

        Dim userName As String
        Dim varIssue(16) As Byte

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
        varIssue(15) = DefinirPontuacao(rnd8_15_Sim, rnd8_15_Nao, rnd8_15_NA)
        varIssue(16) = DefinirPontuacao(rnd8_16_Sim, rnd8_16_Nao, rnd8_16_NA)


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
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 15, varIssue(15), userName, Me.txt8_15.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 16, varIssue(16), userName, Me.txt8_16.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1)
        Me.panTitle8.CssClass = "pnl_Verde"

    End Sub  ' Bloco 8 - 26 a 34. Total de 9 Perguntas

    Protected Sub btnGrupo9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo9.Click
        Dim userName As String
        Dim varIssue(7) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd9_1_Sim, rnd9_1_Nao, rnd9_1_NA)
        varIssue(2) = DefinirPontuacao(rnd9_2_Sim, rnd9_2_Nao, rnd9_2_NA)
        varIssue(3) = DefinirPontuacao(rnd9_3_Sim, rnd9_3_Nao, rnd9_3_NA)
        varIssue(4) = DefinirPontuacao(rnd9_4_Sim, rnd9_4_Nao, rnd9_4_NA)
        varIssue(5) = DefinirPontuacao(rnd9_5_Sim, rnd9_5_Nao, rnd9_5_NA)
        varIssue(6) = DefinirPontuacao(rnd9_6_Sim, rnd9_6_Nao, rnd9_6_NA)
        varIssue(7) = DefinirPontuacao(rnd9_7_Sim, rnd9_7_Nao, rnd9_7_NA)



        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 1, varIssue(1), userName, Me.txt9_1.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 2, varIssue(2), userName, Me.txt9_2.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 3, varIssue(3), userName, Me.txt9_3.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 4, varIssue(4), userName, Me.txt9_4.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 5, varIssue(5), userName, Me.txt9_5.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 6, varIssue(6), userName, Me.txt9_6.Text)
        oCh.SalvarChecklist(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 7, varIssue(7), userName, Me.txt9_7.Text)


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1)
        Me.panTitle9.CssClass = "pnl_Verde"
    End Sub  ' Bloco 9 - 35 a 42. Total de 8 Perguntas

    Protected Sub btnGrupo10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo10.Click
        Dim userName As String
        Dim varIssue(11) As Byte

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


        oCh.SalvarChecklistGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1)
        Me.panTitle10.CssClass = "pnl_Verde"
    End Sub  ' Bloco 10 - 43 a 54. Total de 10 Perguntas

    Private Sub TudoAzul()
       
        Me.panTitle8.CssClass = "pnl_Azul"
        Me.panTitle9.CssClass = "pnl_Azul"
        Me.panTitle10.CssClass = "pnl_Azul"
   

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
       
        Call BuscarChecklist_Grupo8(8)
        Call BuscarChecklist_Grupo9(9)
        Call BuscarChecklist_Grupo10(10)

        Call BuscarChecklist_GrupoCor()
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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 8)
        Call BCDet(oCh.Pontos, Me.txt8_8, oCh.Descricao, Me.rnd8_8_Sim, rnd8_8_Nao, Me.rnd8_8_NA)

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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 15)
        Call BCDet(oCh.Pontos, Me.txt8_15, oCh.Descricao, Me.rnd8_15_Sim, rnd8_15_Nao, Me.rnd8_15_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 16)
        Call BCDet(oCh.Pontos, Me.txt8_16, oCh.Descricao, Me.rnd8_16_Sim, rnd8_16_Nao, Me.rnd8_16_NA)


    End Sub

    Private Sub BuscarChecklist_Grupo9(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
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

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 10)
        Call BCDet(oCh.Pontos, Me.txt10_10, oCh.Descricao, Me.rnd10_10_Sim, rnd10_10_Nao, Me.rnd10_10_NA)

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

    End Sub

    Private Sub BuscarChecklist_GrupoCor()
        

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1)
        Call AtualizarCorTitulo(panTitle8, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1)
        Call AtualizarCorTitulo(panTitle9, oCh.Pontos)

        oCh.BuscarCheckListGrupo(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1)
        Call AtualizarCorTitulo(panTitle10, oCh.Pontos)

        
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
        Call fPadraoInicial(rnd8_15_NA)
        Call fPadraoInicial(rnd8_16_NA)

        'Grupo 9
        Call fPadraoInicial(rnd9_1_NA)
        Call fPadraoInicial(rnd9_2_NA)
        Call fPadraoInicial(rnd9_3_NA)
        Call fPadraoInicial(rnd9_4_NA)
        Call fPadraoInicial(rnd9_5_NA)
        Call fPadraoInicial(rnd9_6_NA)
        Call fPadraoInicial(rnd9_7_NA)

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

      
    End Sub

#Region " btnSalvarFoto"


#Region " btnSalvarFoto - Grupo 8.1"

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
        Call UploadImagem(Me.upFile8_11, Me.txt8_11.Text, 8, 1, 12)
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

    Protected Sub btnSalvarFoto8_15_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_15.Click
        Call UploadImagem(Me.upFile8_15, Me.txt8_15.Text, 8, 1, 15)
    End Sub

    Protected Sub btnSalvarFoto8_16_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto8_16.Click
        Call UploadImagem(Me.upFile8_16, Me.txt8_16.Text, 8, 1, 16)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 9.1"

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

    Protected Sub btnSalvarFoto9_9_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto9_7.Click
        Call UploadImagem(Me.upFile9_7, Me.txt9_7.Text, 9, 1, 7)
    End Sub

#End Region

#Region " btnSalvarFoto - Grupo 10.1"

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
