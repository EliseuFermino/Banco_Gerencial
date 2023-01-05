Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing

Imports System
Imports System.Data
Imports System.Data.Common
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Class MemberPages_CheckList_Confeitaria
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


            Session("sEAN") = 20671

        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Check-list Confeitaria"
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender


        'cboFilial.Enabled_cboFilial = False
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

        'Grupo 9
        Call fLimparTextBox(txt9_1)
        Call fLimparTextBox(txt9_2)
   


        'Grupo 10
        Call fLimparTextBox(txt10_1)
        Call fLimparTextBox(txt10_2)
        Call fLimparTextBox(txt10_3)
        Call fLimparTextBox(txt10_4)
        Call fLimparTextBox(txt10_5)
        Call fLimparTextBox(txt10_6)
        Call fLimparTextBox(txt10_7)



    End Sub

    Private Function DefinirPontuacao(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox) As Byte
        If rndSim.Checked = True Then DefinirPontuacao = 1
        If rndNao.Checked = True Then DefinirPontuacao = 0
        If rndNA.Checked = True Then DefinirPontuacao = 2
        Return DefinirPontuacao
    End Function

    Protected Sub btnGrupo8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo8.Click

        Dim userName As String
        Dim varIssue(1) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd8_1_Sim, rnd8_1_Nao, rnd8_1_NA)

        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1, 1, varIssue(1), userName, Me.txt8_1.Text, cboProduto.Value)

        oCh.SalvarChecklistGrupo_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 8, 1)
        Me.panTitle8.CssClass = "pnl_Verde"

    End Sub  ' Bloco 8 - 26 a 34. Total de 9 Perguntas

    Protected Sub btnGrupo9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo9.Click
        Dim userName As String
        Dim varIssue(2) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd9_1_Sim, rnd9_1_Nao, rnd9_1_NA)
        varIssue(2) = DefinirPontuacao(rnd9_2_Sim, rnd9_2_Nao, rnd9_2_NA)

        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 1, varIssue(1), userName, Me.txt9_1.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1, 2, varIssue(2), userName, Me.txt9_2.Text, cboProduto.Value)

        oCh.SalvarChecklistGrupo_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 9, 1)
        Me.panTitle9.CssClass = "pnl_Verde"
    End Sub  ' Bloco 9 - 35 a 42. Total de 8 Perguntas

    Protected Sub btnGrupo10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo10.Click
        Dim userName As String
        Dim varIssue(7) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd10_1_Sim, rnd10_1_Nao, rnd10_1_NA)
        varIssue(2) = DefinirPontuacao(rnd10_2_Sim, rnd10_2_Nao, rnd10_2_NA)
        varIssue(3) = DefinirPontuacao(rnd10_3_Sim, rnd10_3_Nao, rnd10_3_NA)
        varIssue(4) = DefinirPontuacao(rnd10_4_Sim, rnd10_4_Nao, rnd10_4_NA)
        varIssue(5) = DefinirPontuacao(rnd10_5_Sim, rnd10_5_Nao, rnd10_5_NA)
        varIssue(6) = DefinirPontuacao(rnd10_6_Sim, rnd10_6_Nao, rnd10_6_NA)
        varIssue(7) = DefinirPontuacao(rnd10_7_Sim, rnd10_7_Nao, rnd10_7_NA)


        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 1, varIssue(1), userName, Me.txt10_1.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 2, varIssue(2), userName, Me.txt10_2.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 3, varIssue(3), userName, Me.txt10_3.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 4, varIssue(4), userName, Me.txt10_4.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 5, varIssue(5), userName, Me.txt10_5.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 6, varIssue(6), userName, Me.txt10_6.Text, cboProduto.Value)
        oCh.SalvarChecklist_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1, 7, varIssue(7), userName, Me.txt10_7.Text, cboProduto.Value)


        oCh.SalvarChecklistGrupo_Confeitaria(Me.cboDia.CallDia, Me.cboFilial.CallFilial, 10, 1)
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

    End Sub

    Private Sub BuscarChecklist_Grupo9(ByVal iGrupo As Byte)

        'Grupo 4 *****************************************************************************************************************
        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 1)
        Call BCDet(oCh.Pontos, Me.txt9_1, oCh.Descricao, Me.rnd9_1_Sim, rnd9_1_Nao, Me.rnd9_1_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 2)
        Call BCDet(oCh.Pontos, Me.txt9_2, oCh.Descricao, Me.rnd9_2_Sim, rnd9_2_Nao, Me.rnd9_2_NA)

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


        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 6)
        Call BCDet(oCh.Pontos, Me.txt10_6, oCh.Descricao, Me.rnd10_6_Sim, rnd10_6_Nao, Me.rnd10_6_NA)

        oCh.BuscarCheckList(Me.cboDia.CallDia, Me.cboFilial.CallFilial, iGrupo, 1, 7)
        Call BCDet(oCh.Pontos, Me.txt10_7, oCh.Descricao, Me.rnd10_7_Sim, rnd10_7_Nao, Me.rnd10_7_NA)

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

        'Grupo 9
        Call fPadraoInicial(rnd9_1_NA)
        Call fPadraoInicial(rnd9_2_NA)

        'Grupo 10
        Call fPadraoInicial(rnd10_1_NA)
        Call fPadraoInicial(rnd10_2_NA)
        Call fPadraoInicial(rnd10_3_NA)
        Call fPadraoInicial(rnd10_4_NA)
        Call fPadraoInicial(rnd10_5_NA)
        Call fPadraoInicial(rnd10_6_NA)
        Call fPadraoInicial(rnd10_7_NA)

    End Sub

#Region " btnSalvarFoto"



#Region " btnSalvarFoto - Grupo 10.1"



    Protected Sub btnSalvarFoto10_7_Click(sender As Object, e As ImageClickEventArgs) Handles btnSalvarFoto10_7.Click
        Call UploadImagem(Me.upFile10_7, Me.txt10_7.Text, 10, 1, 7)
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



    ' ****************************************************************************************************************************************************************************************

    Protected Sub bi_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim dv As DataView = DirectCast(sds.Select(DataSourceSelectArguments.Empty), DataView)
        If dv.Table.Rows.Count > 0 AndAlso dv.Table.Rows(0)(1) IsNot DBNull.Value Then
            bi.ContentBytes = CType(dv.Table.Rows(0)(1), Byte())
        End If
    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As EventArgs)
        sds.Update()

        oCh.SalvarChecklist_Confeitaria_Unico(Me.cboDia.CallDia, Me.cboFilial.CallFilial, cboProduto.Value)

    End Sub
    Protected Sub sds_Updating(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
        ConvertAndPopulateParameter(e.Command.Parameters(1), bi.ContentBytes)
    End Sub

    Private Sub ConvertAndPopulateParameter(ByVal parameter As DbParameter, ByVal value() As Byte)
        Dim sqlVarBinaryParameter As SqlParameter = CType(parameter, SqlParameter)
        sqlVarBinaryParameter.SqlDbType = SqlDbType.VarBinary
        sqlVarBinaryParameter.Value = value
    End Sub


End Class
