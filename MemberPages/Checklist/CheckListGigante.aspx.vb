Imports System.IO
Imports System.Drawing.Imaging
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing

Partial Class MemberPages_CheckListGigante
    Inherits System.Web.UI.Page

    Dim oCh As New Check
    Dim oDa As New clDataDb
    Private vFilial As Int16
    Private vIsLoja As Boolean
    Private vDepartamento As String
    Dim oProj As New Projeto
    Dim selects As New preencheSelects
    Dim oVem As New VendaEmpresaMes
    Public Event ListTipoChanged(ByVal sender As Object, ByVal e As EventArgs)


#Region "Page init"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            vDepartamento = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
            Session("sDEPARTAMENTO") = vDepartamento
            vIsLoja = oProj.Isloja

            If vIsLoja Then
                vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
                Session("sFILIAL") = vFilial
            Else
                If Session("sFILIAL") IsNot Nothing Then
                    If Session("sFILIAL").ToString() <> "" Then
                        vFilial = Session("sFILIAL")
                    Else
                        vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
                        Session("sFILIAL") = vFilial
                    End If
                Else
                    vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
                    Session("sFILIAL") = vFilial
                End If

            End If

            If Session("sFILIAL") < 100 Then
                Session("sFILIAL") = selFilial.SelectedValue
                Response.Redirect("CheckListCordor.aspx")
            End If

            'Call Define_Corporacao()
            'Call Define_Filial()

            Call carregaSelects()

            oVem.AtualizarEstatisticaPrograma(66, User.Identity.Name)

            txtData.Value = DateTime.Now.ToString("yyyy-MM-dd")

            Call PadraoInicial()
            Call HabilitarGerarRelatorio()

            Call BuscarChecklist()
            Call colorMenu()

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim query As String = "Select * From [Checklist].[listaMenus_Atacado] Where idFilial = @idFilial"

        con.Open()

        Dim data As SqlDataReader
        Dim adapter As New SqlDataAdapter
        Dim parameter As New SqlParameter
        Dim command As SqlCommand = New SqlCommand(query, con)
        With command.Parameters
            .Add(New SqlParameter("@idFilial", selFilial.SelectedValue))
        End With
        command.Connection = con
        adapter.SelectCommand = command
        data = command.ExecuteReader()

        While data.Read
            If data.HasRows = True Then

                If (data(1) = 0) Then
                    btnMenu_14.Enabled = False
                Else
                    btnMenu_14.Enabled = True
                End If

                If (data(2) = 0) Then
                    btnMenu_15.Enabled = False
                Else
                    btnMenu_15.Enabled = True
                End If

            End If
        End While

        con.Close()
        command.Dispose()

    End Sub

#End Region

#Region "Carregamentos/Funções internas da página"
    Private Sub colorMenu()
        Dim arrayColors(19) As Integer
        arrayColors = Session("sMenuColor")

        If (arrayColors(0) >= 18) Then btnMenu_1.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_1.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(1) >= 3) Then btnMenu_2.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_2.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(2) >= 8) Then btnMenu_3.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_3.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(3) >= 13) Then btnMenu_4.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_4.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(4) >= 7) Then btnMenu_5.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_5.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(5) >= 16) Then btnMenu_6.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_6.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(6) >= 9) Then btnMenu_7.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_7.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(7) >= 15) Then btnMenu_8.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_8.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(8) >= 11) Then btnMenu_9.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_9.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(9) >= 8) Then btnMenu_10.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_10.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(10) >= 3) Then btnMenu_11.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_11.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(11) >= 9) Then btnMenu_12.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_12.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(12) >= 13) Then btnMenu_13.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_13.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(13) >= 10) Then btnMenu_14.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_14.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(14) >= 5) Then btnMenu_15.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_15.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(15) >= 12) Then btnMenu_16.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_16.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(16) >= 12) Then btnMenu_17.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_17.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(17) >= 7) Then btnMenu_18.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_18.BackColor = Color.FromArgb(46, 77, 123)
        If (arrayColors(18) >= 5) Then btnMenu_19.BackColor = Color.FromArgb(120, 167, 149) Else btnMenu_19.BackColor = Color.FromArgb(46, 77, 123)

    End Sub

    Private Sub EnabledControls(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox, ByVal txtDesc As TextBox, ByVal myAchar As ImageButton, ByVal mySalvar As ImageButton, ByVal myBoolean As Boolean)
        rndSim.Enabled = myBoolean
        rndNao.Enabled = myBoolean
        rndNA.Enabled = myBoolean
        txtDesc.Enabled = myBoolean
        myAchar.Visible = myBoolean
        mySalvar.Visible = myBoolean

    End Sub

    Private Sub fLimparTextBox(ByVal myTexto As TextBox)
        myTexto.Text = ""
    End Sub

    Private Sub LimparTextBox()

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
        Call fLimparTextBox(txt2_1)
        Call fLimparTextBox(txt2_2)
        Call fLimparTextBox(txt2_3)
        Call fLimparTextBox(txt3_1)
        Call fLimparTextBox(txt3_2)
        Call fLimparTextBox(txt3_3)
        Call fLimparTextBox(txt3_4)
        Call fLimparTextBox(txt3_5)
        Call fLimparTextBox(txt3_6)
        Call fLimparTextBox(txt3_7)
        Call fLimparTextBox(txt3_8)
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
        Call fLimparTextBox(txt4_13)
        Call fLimparTextBox(txt5_1)
        Call fLimparTextBox(txt5_2)
        Call fLimparTextBox(txt5_3)
        Call fLimparTextBox(txt5_4)
        Call fLimparTextBox(txt5_5)
        Call fLimparTextBox(txt5_6)
        Call fLimparTextBox(txt5_7)
        Call fLimparTextBox(txt6_1)
        Call fLimparTextBox(txt6_2)
        Call fLimparTextBox(txt6_3)
        Call fLimparTextBox(txt6_4)
        Call fLimparTextBox(txt6_5)
        Call fLimparTextBox(txt6_6)
        Call fLimparTextBox(txt6_7)
        Call fLimparTextBox(txt6_8)
        Call fLimparTextBox(txt6_9)
        Call fLimparTextBox(txt6_10)
        Call fLimparTextBox(txt6_11)
        Call fLimparTextBox(txt6_12)
        Call fLimparTextBox(txt6_13)
        Call fLimparTextBox(txt6_14)
        Call fLimparTextBox(txt6_15)
        Call fLimparTextBox(txt6_16)
        Call fLimparTextBox(txt7_1)
        Call fLimparTextBox(txt7_2)
        Call fLimparTextBox(txt7_3)
        Call fLimparTextBox(txt7_4)
        Call fLimparTextBox(txt7_5)
        Call fLimparTextBox(txt7_6)
        Call fLimparTextBox(txt7_7)
        Call fLimparTextBox(txt7_8)
        Call fLimparTextBox(txt7_9)
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
        Call fLimparTextBox(txt10_1)
        Call fLimparTextBox(txt10_2)
        Call fLimparTextBox(txt10_3)
        Call fLimparTextBox(txt10_4)
        Call fLimparTextBox(txt10_5)
        Call fLimparTextBox(txt10_6)
        Call fLimparTextBox(txt10_7)
        Call fLimparTextBox(txt10_8)
        Call fLimparTextBox(txt11_1)
        Call fLimparTextBox(txt11_2)
        Call fLimparTextBox(txt11_3)
        Call fLimparTextBox(txt12_1)
        Call fLimparTextBox(txt12_2)
        Call fLimparTextBox(txt12_3)
        Call fLimparTextBox(txt12_4)
        Call fLimparTextBox(txt12_5)
        Call fLimparTextBox(txt12_6)
        Call fLimparTextBox(txt12_7)
        Call fLimparTextBox(txt12_8)
        Call fLimparTextBox(txt12_9)
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
        Call fLimparTextBox(txt14_1)
        Call fLimparTextBox(txt14_2)
        Call fLimparTextBox(txt14_3)
        Call fLimparTextBox(txt14_4)
        Call fLimparTextBox(txt14_5)
        Call fLimparTextBox(txt14_6)
        Call fLimparTextBox(txt14_7)
        Call fLimparTextBox(txt14_8)
        Call fLimparTextBox(txt14_9)
        Call fLimparTextBox(txt14_10)
        Call fLimparTextBox(txt15_1)
        Call fLimparTextBox(txt15_2)
        Call fLimparTextBox(txt15_3)
        Call fLimparTextBox(txt15_4)
        Call fLimparTextBox(txt15_5)
        Call fLimparTextBox(txt16_1)
        Call fLimparTextBox(txt16_2)
        Call fLimparTextBox(txt16_3)
        Call fLimparTextBox(txt16_4)
        Call fLimparTextBox(txt16_5)
        Call fLimparTextBox(txt16_6)
        Call fLimparTextBox(txt16_7)
        Call fLimparTextBox(txt16_8)
        Call fLimparTextBox(txt16_9)
        Call fLimparTextBox(txt16_10)
        Call fLimparTextBox(txt16_11)
        Call fLimparTextBox(txt16_12)
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
        Call fLimparTextBox(txt18_1)
        Call fLimparTextBox(txt18_2)
        Call fLimparTextBox(txt18_3)
        Call fLimparTextBox(txt18_4)
        Call fLimparTextBox(txt18_5)
        Call fLimparTextBox(txt18_6)
        Call fLimparTextBox(txt18_7)
        Call fLimparTextBox(txt19_1)
        Call fLimparTextBox(txt19_2)
        Call fLimparTextBox(txt19_3)
        Call fLimparTextBox(txt19_4)
        Call fLimparTextBox(txt19_5)


    End Sub

    Private Function DefinirPontuacao(ByVal rndSim As CheckBox, ByVal rndNao As CheckBox, ByVal rndNA As CheckBox) As Byte
        Dim qtd = Session("qtdRespostas")

        If rndSim.Checked = True Then DefinirPontuacao = 1
        If rndNao.Checked = True Then DefinirPontuacao = 0
        If rndNA.Checked = True Then DefinirPontuacao = 2

        If DefinirPontuacao <> 2 Then Session("qtdRespostas") = qtd + 1

        Return DefinirPontuacao
    End Function

    Private Sub carregaSelects()

        selects.Define_Corporacao(Session("sDEPARTAMENTO"), selTipo)
        Session("sCORPORACAO") = selTipo.SelectedItem.Value
        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)

    End Sub
    Protected Sub selTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles selTipo.SelectedIndexChanged

        'If Session("sDEPARTAMENTO") <> "loja" Then
        '    Define_Filial()
        '    RaiseEvent ListTipoChanged(sender, e)
        'End If
        'HabilitarGerarRelatorio()

        Session("sCORPORACAO") = selTipo.SelectedItem.Value
        selects.Define_Filial(selTipo.SelectedItem.Value, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)

    End Sub

    Protected Sub selFilial_SelectedIndexChanged(sender As Object, e As EventArgs)
        Call HabilitarGerarRelatorio()


    End Sub

    Private Sub BuscarChecklist()
        On Error Resume Next
        Dim arrayTotal(20) As Integer
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SP_GERA_RELATORIO_CHEKLIST_ATACADO")

                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Add(New SqlParameter("@dia", SqlDbType.VarChar))
                cmd.Parameters("@dia").Value = txtData.Value

                cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
                cmd.Parameters("@idFilial").Value = selFilial.SelectedValue.ToString()

                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        For Each tabela In ds.Tables(0).Rows

                            If (tabela(9) = 1 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt1_1, tabela(5), Me.rnd1_1_Sim, rnd1_1_Nao, Me.rnd1_1_NA)
                            If (tabela(9) = 1 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt1_2, tabela(5), Me.rnd1_2_Sim, rnd1_2_Nao, Me.rnd1_2_NA)
                            If (tabela(9) = 1 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt1_3, tabela(5), Me.rnd1_3_Sim, rnd1_3_Nao, Me.rnd1_3_NA)
                            If (tabela(9) = 1 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt1_4, tabela(5), Me.rnd1_4_Sim, rnd1_4_Nao, Me.rnd1_4_NA)
                            If (tabela(9) = 1 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt1_5, tabela(5), Me.rnd1_5_Sim, rnd1_5_Nao, Me.rnd1_5_NA)
                            If (tabela(9) = 1 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt1_6, tabela(5), Me.rnd1_6_Sim, rnd1_6_Nao, Me.rnd1_6_NA)
                            If (tabela(9) = 1 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt1_7, tabela(5), Me.rnd1_7_Sim, rnd1_7_Nao, Me.rnd1_7_NA)
                            If (tabela(9) = 1 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt1_8, tabela(5), Me.rnd1_8_Sim, rnd1_8_Nao, Me.rnd1_8_NA)
                            If (tabela(9) = 1 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt1_9, tabela(5), Me.rnd1_9_Sim, rnd1_9_Nao, Me.rnd1_9_NA)
                            If (tabela(9) = 1 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt1_10, tabela(5), Me.rnd1_10_Sim, rnd1_10_Nao, Me.rnd1_10_NA)
                            If (tabela(9) = 1 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt1_11, tabela(5), Me.rnd1_11_Sim, rnd1_11_Nao, Me.rnd1_11_NA)
                            If (tabela(9) = 1 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt1_12, tabela(5), Me.rnd1_12_Sim, rnd1_12_Nao, Me.rnd1_12_NA)
                            If (tabela(9) = 1 And tabela(11) = 13) Then Call BCDet(tabela(8), Me.txt1_13, tabela(5), Me.rnd1_13_Sim, rnd1_13_Nao, Me.rnd1_13_NA)
                            If (tabela(9) = 1 And tabela(11) = 14) Then Call BCDet(tabela(8), Me.txt1_14, tabela(5), Me.rnd1_14_Sim, rnd1_14_Nao, Me.rnd1_14_NA)
                            If (tabela(9) = 1 And tabela(11) = 15) Then Call BCDet(tabela(8), Me.txt1_15, tabela(5), Me.rnd1_15_Sim, rnd1_15_Nao, Me.rnd1_15_NA)
                            If (tabela(9) = 1 And tabela(11) = 16) Then Call BCDet(tabela(8), Me.txt1_16, tabela(5), Me.rnd1_16_Sim, rnd1_16_Nao, Me.rnd1_16_NA)
                            If (tabela(9) = 1 And tabela(11) = 17) Then Call BCDet(tabela(8), Me.txt1_17, tabela(5), Me.rnd1_17_Sim, rnd1_17_Nao, Me.rnd1_17_NA)
                            If (tabela(9) = 1 And tabela(11) = 18) Then Call BCDet(tabela(8), Me.txt1_18, tabela(5), Me.rnd1_18_Sim, rnd1_18_Nao, Me.rnd1_18_NA)
                            If (tabela(9) = 2 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt2_1, tabela(5), Me.rnd2_1_Sim, rnd2_1_Nao, Me.rnd2_1_NA)
                            If (tabela(9) = 2 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt2_2, tabela(5), Me.rnd2_2_Sim, rnd2_2_Nao, Me.rnd2_2_NA)
                            If (tabela(9) = 2 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt2_3, tabela(5), Me.rnd2_3_Sim, rnd2_3_Nao, Me.rnd2_3_NA)
                            If (tabela(9) = 3 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt3_1, tabela(5), Me.rnd3_1_Sim, rnd3_1_Nao, Me.rnd3_1_NA)
                            If (tabela(9) = 3 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt3_2, tabela(5), Me.rnd3_2_Sim, rnd3_2_Nao, Me.rnd3_2_NA)
                            If (tabela(9) = 3 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt3_3, tabela(5), Me.rnd3_3_Sim, rnd3_3_Nao, Me.rnd3_3_NA)
                            If (tabela(9) = 3 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt3_4, tabela(5), Me.rnd3_4_Sim, rnd3_4_Nao, Me.rnd3_4_NA)
                            If (tabela(9) = 3 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt3_5, tabela(5), Me.rnd3_5_Sim, rnd3_5_Nao, Me.rnd3_5_NA)
                            If (tabela(9) = 3 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt3_6, tabela(5), Me.rnd3_6_Sim, rnd3_6_Nao, Me.rnd3_6_NA)
                            If (tabela(9) = 3 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt3_7, tabela(5), Me.rnd3_7_Sim, rnd3_7_Nao, Me.rnd3_7_NA)
                            If (tabela(9) = 3 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt3_8, tabela(5), Me.rnd3_8_Sim, rnd3_8_Nao, Me.rnd3_8_NA)
                            If (tabela(9) = 4 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt4_1, tabela(5), Me.rnd4_1_Sim, rnd4_1_Nao, Me.rnd4_1_NA)
                            If (tabela(9) = 4 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt4_2, tabela(5), Me.rnd4_2_Sim, rnd4_2_Nao, Me.rnd4_2_NA)
                            If (tabela(9) = 4 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt4_3, tabela(5), Me.rnd4_3_Sim, rnd4_3_Nao, Me.rnd4_3_NA)
                            If (tabela(9) = 4 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt4_4, tabela(5), Me.rnd4_4_Sim, rnd4_4_Nao, Me.rnd4_4_NA)
                            If (tabela(9) = 4 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt4_5, tabela(5), Me.rnd4_5_Sim, rnd4_5_Nao, Me.rnd4_5_NA)
                            If (tabela(9) = 4 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt4_6, tabela(5), Me.rnd4_6_Sim, rnd4_6_Nao, Me.rnd4_6_NA)
                            If (tabela(9) = 4 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt4_7, tabela(5), Me.rnd4_7_Sim, rnd4_7_Nao, Me.rnd4_7_NA)
                            If (tabela(9) = 4 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt4_8, tabela(5), Me.rnd4_8_Sim, rnd4_8_Nao, Me.rnd4_8_NA)
                            If (tabela(9) = 4 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt4_9, tabela(5), Me.rnd4_9_Sim, rnd4_9_Nao, Me.rnd4_9_NA)
                            If (tabela(9) = 4 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt4_10, tabela(5), Me.rnd4_10_Sim, rnd4_10_Nao, Me.rnd4_10_NA)
                            If (tabela(9) = 4 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt4_11, tabela(5), Me.rnd4_11_Sim, rnd4_11_Nao, Me.rnd4_11_NA)
                            If (tabela(9) = 4 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt4_12, tabela(5), Me.rnd4_12_Sim, rnd4_12_Nao, Me.rnd4_12_NA)
                            If (tabela(9) = 4 And tabela(11) = 13) Then Call BCDet(tabela(8), Me.txt4_13, tabela(5), Me.rnd4_13_Sim, rnd4_13_Nao, Me.rnd4_13_NA)
                            If (tabela(9) = 5 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt5_1, tabela(5), Me.rnd5_1_Sim, rnd5_1_Nao, Me.rnd5_1_NA)
                            If (tabela(9) = 5 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt5_2, tabela(5), Me.rnd5_2_Sim, rnd5_2_Nao, Me.rnd5_2_NA)
                            If (tabela(9) = 5 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt5_3, tabela(5), Me.rnd5_3_Sim, rnd5_3_Nao, Me.rnd5_3_NA)
                            If (tabela(9) = 5 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt5_4, tabela(5), Me.rnd5_4_Sim, rnd5_4_Nao, Me.rnd5_4_NA)
                            If (tabela(9) = 5 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt5_5, tabela(5), Me.rnd5_5_Sim, rnd5_5_Nao, Me.rnd5_5_NA)
                            If (tabela(9) = 5 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt5_6, tabela(5), Me.rnd5_6_Sim, rnd5_6_Nao, Me.rnd5_6_NA)
                            If (tabela(9) = 5 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt5_7, tabela(5), Me.rnd5_7_Sim, rnd5_7_Nao, Me.rnd5_7_NA)
                            If (tabela(9) = 6 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt6_1, tabela(5), Me.rnd6_1_Sim, rnd6_1_Nao, Me.rnd6_1_NA)
                            If (tabela(9) = 6 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt6_2, tabela(5), Me.rnd6_2_Sim, rnd6_2_Nao, Me.rnd6_2_NA)
                            If (tabela(9) = 6 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt6_3, tabela(5), Me.rnd6_3_Sim, rnd6_3_Nao, Me.rnd6_3_NA)
                            If (tabela(9) = 6 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt6_4, tabela(5), Me.rnd6_4_Sim, rnd6_4_Nao, Me.rnd6_4_NA)
                            If (tabela(9) = 6 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt6_5, tabela(5), Me.rnd6_5_Sim, rnd6_5_Nao, Me.rnd6_5_NA)
                            If (tabela(9) = 6 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt6_6, tabela(5), Me.rnd6_6_Sim, rnd6_6_Nao, Me.rnd6_6_NA)
                            If (tabela(9) = 6 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt6_7, tabela(5), Me.rnd6_7_Sim, rnd6_7_Nao, Me.rnd6_7_NA)
                            If (tabela(9) = 6 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt6_8, tabela(5), Me.rnd6_8_Sim, rnd6_8_Nao, Me.rnd6_8_NA)
                            If (tabela(9) = 6 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt6_9, tabela(5), Me.rnd6_9_Sim, rnd6_9_Nao, Me.rnd6_9_NA)
                            If (tabela(9) = 6 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt6_10, tabela(5), Me.rnd6_10_Sim, rnd6_10_Nao, Me.rnd6_10_NA)
                            If (tabela(9) = 6 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt6_11, tabela(5), Me.rnd6_11_Sim, rnd6_11_Nao, Me.rnd6_11_NA)
                            If (tabela(9) = 6 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt6_12, tabela(5), Me.rnd6_12_Sim, rnd6_12_Nao, Me.rnd6_12_NA)
                            If (tabela(9) = 6 And tabela(11) = 13) Then Call BCDet(tabela(8), Me.txt6_13, tabela(5), Me.rnd6_13_Sim, rnd6_13_Nao, Me.rnd6_13_NA)
                            If (tabela(9) = 6 And tabela(11) = 14) Then Call BCDet(tabela(8), Me.txt6_14, tabela(5), Me.rnd6_14_Sim, rnd6_14_Nao, Me.rnd6_14_NA)
                            If (tabela(9) = 6 And tabela(11) = 15) Then Call BCDet(tabela(8), Me.txt6_15, tabela(5), Me.rnd6_15_Sim, rnd6_15_Nao, Me.rnd6_15_NA)
                            If (tabela(9) = 6 And tabela(11) = 16) Then Call BCDet(tabela(8), Me.txt6_16, tabela(5), Me.rnd6_16_Sim, rnd6_16_Nao, Me.rnd6_16_NA)
                            If (tabela(9) = 7 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt7_1, tabela(5), Me.rnd7_1_Sim, rnd7_1_Nao, Me.rnd7_1_NA)
                            If (tabela(9) = 7 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt7_2, tabela(5), Me.rnd7_2_Sim, rnd7_2_Nao, Me.rnd7_2_NA)
                            If (tabela(9) = 7 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt7_3, tabela(5), Me.rnd7_3_Sim, rnd7_3_Nao, Me.rnd7_3_NA)
                            If (tabela(9) = 7 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt7_4, tabela(5), Me.rnd7_4_Sim, rnd7_4_Nao, Me.rnd7_4_NA)
                            If (tabela(9) = 7 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt7_5, tabela(5), Me.rnd7_5_Sim, rnd7_5_Nao, Me.rnd7_5_NA)
                            If (tabela(9) = 7 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt7_6, tabela(5), Me.rnd7_6_Sim, rnd7_6_Nao, Me.rnd7_6_NA)
                            If (tabela(9) = 7 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt7_7, tabela(5), Me.rnd7_7_Sim, rnd7_7_Nao, Me.rnd7_7_NA)
                            If (tabela(9) = 7 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt7_8, tabela(5), Me.rnd7_8_Sim, rnd7_8_Nao, Me.rnd7_8_NA)
                            If (tabela(9) = 7 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt7_9, tabela(5), Me.rnd7_9_Sim, rnd7_9_Nao, Me.rnd7_9_NA)
                            If (tabela(9) = 8 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt8_1, tabela(5), Me.rnd8_1_Sim, rnd8_1_Nao, Me.rnd8_1_NA)
                            If (tabela(9) = 8 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt8_2, tabela(5), Me.rnd8_2_Sim, rnd8_2_Nao, Me.rnd8_2_NA)
                            If (tabela(9) = 8 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt8_3, tabela(5), Me.rnd8_3_Sim, rnd8_3_Nao, Me.rnd8_3_NA)
                            If (tabela(9) = 8 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt8_4, tabela(5), Me.rnd8_4_Sim, rnd8_4_Nao, Me.rnd8_4_NA)
                            If (tabela(9) = 8 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt8_5, tabela(5), Me.rnd8_5_Sim, rnd8_5_Nao, Me.rnd8_5_NA)
                            If (tabela(9) = 8 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt8_6, tabela(5), Me.rnd8_6_Sim, rnd8_6_Nao, Me.rnd8_6_NA)
                            If (tabela(9) = 8 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt8_7, tabela(5), Me.rnd8_7_Sim, rnd8_7_Nao, Me.rnd8_7_NA)
                            If (tabela(9) = 8 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt8_8, tabela(5), Me.rnd8_8_Sim, rnd8_8_Nao, Me.rnd8_8_NA)
                            If (tabela(9) = 8 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt8_9, tabela(5), Me.rnd8_9_Sim, rnd8_9_Nao, Me.rnd8_9_NA)
                            If (tabela(9) = 8 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt8_10, tabela(5), Me.rnd8_10_Sim, rnd8_10_Nao, Me.rnd8_10_NA)
                            If (tabela(9) = 8 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt8_11, tabela(5), Me.rnd8_11_Sim, rnd8_11_Nao, Me.rnd8_11_NA)
                            If (tabela(9) = 8 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt8_12, tabela(5), Me.rnd8_12_Sim, rnd8_12_Nao, Me.rnd8_12_NA)
                            If (tabela(9) = 8 And tabela(11) = 13) Then Call BCDet(tabela(8), Me.txt8_13, tabela(5), Me.rnd8_13_Sim, rnd8_13_Nao, Me.rnd8_13_NA)
                            If (tabela(9) = 8 And tabela(11) = 14) Then Call BCDet(tabela(8), Me.txt8_14, tabela(5), Me.rnd8_14_Sim, rnd8_14_Nao, Me.rnd8_14_NA)
                            If (tabela(9) = 8 And tabela(11) = 15) Then Call BCDet(tabela(8), Me.txt8_15, tabela(5), Me.rnd8_15_Sim, rnd8_15_Nao, Me.rnd8_15_NA)
                            If (tabela(9) = 9 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt9_1, tabela(5), Me.rnd9_1_Sim, rnd9_1_Nao, Me.rnd9_1_NA)
                            If (tabela(9) = 9 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt9_2, tabela(5), Me.rnd9_2_Sim, rnd9_2_Nao, Me.rnd9_2_NA)
                            If (tabela(9) = 9 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt9_3, tabela(5), Me.rnd9_3_Sim, rnd9_3_Nao, Me.rnd9_3_NA)
                            If (tabela(9) = 9 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt9_4, tabela(5), Me.rnd9_4_Sim, rnd9_4_Nao, Me.rnd9_4_NA)
                            If (tabela(9) = 9 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt9_5, tabela(5), Me.rnd9_5_Sim, rnd9_5_Nao, Me.rnd9_5_NA)
                            If (tabela(9) = 9 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt9_6, tabela(5), Me.rnd9_6_Sim, rnd9_6_Nao, Me.rnd9_6_NA)
                            If (tabela(9) = 9 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt9_7, tabela(5), Me.rnd9_7_Sim, rnd9_7_Nao, Me.rnd9_7_NA)
                            If (tabela(9) = 9 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt9_8, tabela(5), Me.rnd9_8_Sim, rnd9_8_Nao, Me.rnd9_8_NA)
                            If (tabela(9) = 9 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt9_9, tabela(5), Me.rnd9_9_Sim, rnd9_9_Nao, Me.rnd9_9_NA)
                            If (tabela(9) = 9 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt9_10, tabela(5), Me.rnd9_10_Sim, rnd9_10_Nao, Me.rnd9_10_NA)
                            If (tabela(9) = 9 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt9_11, tabela(5), Me.rnd9_11_Sim, rnd9_11_Nao, Me.rnd9_11_NA)
                            If (tabela(9) = 10 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt10_1, tabela(5), Me.rnd10_1_Sim, rnd10_1_Nao, Me.rnd10_1_NA)
                            If (tabela(9) = 10 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt10_2, tabela(5), Me.rnd10_2_Sim, rnd10_2_Nao, Me.rnd10_2_NA)
                            If (tabela(9) = 10 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt10_3, tabela(5), Me.rnd10_3_Sim, rnd10_3_Nao, Me.rnd10_3_NA)
                            If (tabela(9) = 10 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt10_4, tabela(5), Me.rnd10_4_Sim, rnd10_4_Nao, Me.rnd10_4_NA)
                            If (tabela(9) = 10 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt10_5, tabela(5), Me.rnd10_5_Sim, rnd10_5_Nao, Me.rnd10_5_NA)
                            If (tabela(9) = 10 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt10_6, tabela(5), Me.rnd10_6_Sim, rnd10_6_Nao, Me.rnd10_6_NA)
                            If (tabela(9) = 10 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt10_7, tabela(5), Me.rnd10_7_Sim, rnd10_7_Nao, Me.rnd10_7_NA)
                            If (tabela(9) = 10 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt10_8, tabela(5), Me.rnd10_8_Sim, rnd10_8_Nao, Me.rnd10_8_NA)
                            If (tabela(9) = 11 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt11_1, tabela(5), Me.rnd11_1_Sim, rnd11_1_Nao, Me.rnd11_1_NA)
                            If (tabela(9) = 11 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt11_2, tabela(5), Me.rnd11_2_Sim, rnd11_2_Nao, Me.rnd11_2_NA)
                            If (tabela(9) = 11 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt11_3, tabela(5), Me.rnd11_3_Sim, rnd11_3_Nao, Me.rnd11_3_NA)
                            If (tabela(9) = 12 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt12_1, tabela(5), Me.rnd12_1_Sim, rnd12_1_Nao, Me.rnd12_1_NA)
                            If (tabela(9) = 12 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt12_2, tabela(5), Me.rnd12_2_Sim, rnd12_2_Nao, Me.rnd12_2_NA)
                            If (tabela(9) = 12 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt12_3, tabela(5), Me.rnd12_3_Sim, rnd12_3_Nao, Me.rnd12_3_NA)
                            If (tabela(9) = 12 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt12_4, tabela(5), Me.rnd12_4_Sim, rnd12_4_Nao, Me.rnd12_4_NA)
                            If (tabela(9) = 12 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt12_5, tabela(5), Me.rnd12_5_Sim, rnd12_5_Nao, Me.rnd12_5_NA)
                            If (tabela(9) = 12 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt12_6, tabela(5), Me.rnd12_6_Sim, rnd12_6_Nao, Me.rnd12_6_NA)
                            If (tabela(9) = 12 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt12_7, tabela(5), Me.rnd12_7_Sim, rnd12_7_Nao, Me.rnd12_7_NA)
                            If (tabela(9) = 12 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt12_8, tabela(5), Me.rnd12_8_Sim, rnd12_8_Nao, Me.rnd12_8_NA)
                            If (tabela(9) = 12 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt12_9, tabela(5), Me.rnd12_9_Sim, rnd12_9_Nao, Me.rnd12_9_NA)
                            If (tabela(9) = 13 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt13_1, tabela(5), Me.rnd13_1_Sim, rnd13_1_Nao, Me.rnd13_1_NA)
                            If (tabela(9) = 13 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt13_2, tabela(5), Me.rnd13_2_Sim, rnd13_2_Nao, Me.rnd13_2_NA)
                            If (tabela(9) = 13 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt13_3, tabela(5), Me.rnd13_3_Sim, rnd13_3_Nao, Me.rnd13_3_NA)
                            If (tabela(9) = 13 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt13_4, tabela(5), Me.rnd13_4_Sim, rnd13_4_Nao, Me.rnd13_4_NA)
                            If (tabela(9) = 13 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt13_5, tabela(5), Me.rnd13_5_Sim, rnd13_5_Nao, Me.rnd13_5_NA)
                            If (tabela(9) = 13 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt13_6, tabela(5), Me.rnd13_6_Sim, rnd13_6_Nao, Me.rnd13_6_NA)
                            If (tabela(9) = 13 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt13_7, tabela(5), Me.rnd13_7_Sim, rnd13_7_Nao, Me.rnd13_7_NA)
                            If (tabela(9) = 13 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt13_8, tabela(5), Me.rnd13_8_Sim, rnd13_8_Nao, Me.rnd13_8_NA)
                            If (tabela(9) = 13 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt13_9, tabela(5), Me.rnd13_9_Sim, rnd13_9_Nao, Me.rnd13_9_NA)
                            If (tabela(9) = 13 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt13_10, tabela(5), Me.rnd13_10_Sim, rnd13_10_Nao, Me.rnd13_10_NA)
                            If (tabela(9) = 13 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt13_11, tabela(5), Me.rnd13_11_Sim, rnd13_11_Nao, Me.rnd13_11_NA)
                            If (tabela(9) = 13 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt13_12, tabela(5), Me.rnd13_12_Sim, rnd13_12_Nao, Me.rnd13_12_NA)
                            If (tabela(9) = 13 And tabela(11) = 13) Then Call BCDet(tabela(8), Me.txt13_13, tabela(5), Me.rnd13_13_Sim, rnd13_13_Nao, Me.rnd13_13_NA)
                            If (tabela(9) = 14 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt14_1, tabela(5), Me.rnd14_1_Sim, rnd14_1_Nao, Me.rnd14_1_NA)
                            If (tabela(9) = 14 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt14_2, tabela(5), Me.rnd14_2_Sim, rnd14_2_Nao, Me.rnd14_2_NA)
                            If (tabela(9) = 14 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt14_3, tabela(5), Me.rnd14_3_Sim, rnd14_3_Nao, Me.rnd14_3_NA)
                            If (tabela(9) = 14 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt14_4, tabela(5), Me.rnd14_4_Sim, rnd14_4_Nao, Me.rnd14_4_NA)
                            If (tabela(9) = 14 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt14_5, tabela(5), Me.rnd14_5_Sim, rnd14_5_Nao, Me.rnd14_5_NA)
                            If (tabela(9) = 14 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt14_6, tabela(5), Me.rnd14_6_Sim, rnd14_6_Nao, Me.rnd14_6_NA)
                            If (tabela(9) = 14 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt14_7, tabela(5), Me.rnd14_7_Sim, rnd14_7_Nao, Me.rnd14_7_NA)
                            If (tabela(9) = 14 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt14_8, tabela(5), Me.rnd14_8_Sim, rnd14_8_Nao, Me.rnd14_8_NA)
                            If (tabela(9) = 14 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt14_9, tabela(5), Me.rnd14_9_Sim, rnd14_9_Nao, Me.rnd14_9_NA)
                            If (tabela(9) = 14 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt14_10, tabela(5), Me.rnd14_10_Sim, rnd14_10_Nao, Me.rnd14_10_NA)
                            If (tabela(9) = 15 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt15_1, tabela(5), Me.rnd15_1_Sim, rnd15_1_Nao, Me.rnd15_1_NA)
                            If (tabela(9) = 15 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt15_2, tabela(5), Me.rnd15_2_Sim, rnd15_2_Nao, Me.rnd15_2_NA)
                            If (tabela(9) = 15 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt15_3, tabela(5), Me.rnd15_3_Sim, rnd15_3_Nao, Me.rnd15_3_NA)
                            If (tabela(9) = 15 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt15_4, tabela(5), Me.rnd15_4_Sim, rnd15_4_Nao, Me.rnd15_4_NA)
                            If (tabela(9) = 15 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt15_5, tabela(5), Me.rnd15_5_Sim, rnd15_5_Nao, Me.rnd15_5_NA)
                            If (tabela(9) = 16 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt16_1, tabela(5), Me.rnd16_1_Sim, rnd16_1_Nao, Me.rnd16_1_NA)
                            If (tabela(9) = 16 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt16_2, tabela(5), Me.rnd16_2_Sim, rnd16_2_Nao, Me.rnd16_2_NA)
                            If (tabela(9) = 16 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt16_3, tabela(5), Me.rnd16_3_Sim, rnd16_3_Nao, Me.rnd16_3_NA)
                            If (tabela(9) = 16 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt16_4, tabela(5), Me.rnd16_4_Sim, rnd16_4_Nao, Me.rnd16_4_NA)
                            If (tabela(9) = 16 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt16_5, tabela(5), Me.rnd16_5_Sim, rnd16_5_Nao, Me.rnd16_5_NA)
                            If (tabela(9) = 16 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt16_6, tabela(5), Me.rnd16_6_Sim, rnd16_6_Nao, Me.rnd16_6_NA)
                            If (tabela(9) = 16 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt16_7, tabela(5), Me.rnd16_7_Sim, rnd16_7_Nao, Me.rnd16_7_NA)
                            If (tabela(9) = 16 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt16_8, tabela(5), Me.rnd16_8_Sim, rnd16_8_Nao, Me.rnd16_8_NA)
                            If (tabela(9) = 16 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt16_9, tabela(5), Me.rnd16_9_Sim, rnd16_9_Nao, Me.rnd16_9_NA)
                            If (tabela(9) = 16 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt16_10, tabela(5), Me.rnd16_10_Sim, rnd16_10_Nao, Me.rnd16_10_NA)
                            If (tabela(9) = 16 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt16_11, tabela(5), Me.rnd16_11_Sim, rnd16_11_Nao, Me.rnd16_11_NA)
                            If (tabela(9) = 16 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt16_12, tabela(5), Me.rnd16_12_Sim, rnd16_12_Nao, Me.rnd16_12_NA)
                            If (tabela(9) = 17 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt17_1, tabela(5), Me.rnd17_1_Sim, rnd17_1_Nao, Me.rnd17_1_NA)
                            If (tabela(9) = 17 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt17_2, tabela(5), Me.rnd17_2_Sim, rnd17_2_Nao, Me.rnd17_2_NA)
                            If (tabela(9) = 17 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt17_3, tabela(5), Me.rnd17_3_Sim, rnd17_3_Nao, Me.rnd17_3_NA)
                            If (tabela(9) = 17 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt17_4, tabela(5), Me.rnd17_4_Sim, rnd17_4_Nao, Me.rnd17_4_NA)
                            If (tabela(9) = 17 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt17_5, tabela(5), Me.rnd17_5_Sim, rnd17_5_Nao, Me.rnd17_5_NA)
                            If (tabela(9) = 17 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt17_6, tabela(5), Me.rnd17_6_Sim, rnd17_6_Nao, Me.rnd17_6_NA)
                            If (tabela(9) = 17 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt17_7, tabela(5), Me.rnd17_7_Sim, rnd17_7_Nao, Me.rnd17_7_NA)
                            If (tabela(9) = 17 And tabela(11) = 8) Then Call BCDet(tabela(8), Me.txt17_8, tabela(5), Me.rnd17_8_Sim, rnd17_8_Nao, Me.rnd17_8_NA)
                            If (tabela(9) = 17 And tabela(11) = 9) Then Call BCDet(tabela(8), Me.txt17_9, tabela(5), Me.rnd17_9_Sim, rnd17_9_Nao, Me.rnd17_9_NA)
                            If (tabela(9) = 17 And tabela(11) = 10) Then Call BCDet(tabela(8), Me.txt17_10, tabela(5), Me.rnd17_10_Sim, rnd17_10_Nao, Me.rnd17_10_NA)
                            If (tabela(9) = 17 And tabela(11) = 11) Then Call BCDet(tabela(8), Me.txt17_11, tabela(5), Me.rnd17_11_Sim, rnd17_11_Nao, Me.rnd17_11_NA)
                            If (tabela(9) = 17 And tabela(11) = 12) Then Call BCDet(tabela(8), Me.txt17_12, tabela(5), Me.rnd17_12_Sim, rnd17_12_Nao, Me.rnd17_12_NA)
                            If (tabela(9) = 18 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt18_1, tabela(5), Me.rnd18_1_Sim, rnd18_1_Nao, Me.rnd18_1_NA)
                            If (tabela(9) = 18 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt18_2, tabela(5), Me.rnd18_2_Sim, rnd18_2_Nao, Me.rnd18_2_NA)
                            If (tabela(9) = 18 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt18_3, tabela(5), Me.rnd18_3_Sim, rnd18_3_Nao, Me.rnd18_3_NA)
                            If (tabela(9) = 18 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt18_4, tabela(5), Me.rnd18_4_Sim, rnd18_4_Nao, Me.rnd18_4_NA)
                            If (tabela(9) = 18 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt18_5, tabela(5), Me.rnd18_5_Sim, rnd18_5_Nao, Me.rnd18_5_NA)
                            If (tabela(9) = 18 And tabela(11) = 6) Then Call BCDet(tabela(8), Me.txt18_6, tabela(5), Me.rnd18_6_Sim, rnd18_6_Nao, Me.rnd18_6_NA)
                            If (tabela(9) = 18 And tabela(11) = 7) Then Call BCDet(tabela(8), Me.txt18_7, tabela(5), Me.rnd18_7_Sim, rnd18_7_Nao, Me.rnd18_7_NA)
                            If (tabela(9) = 19 And tabela(11) = 1) Then Call BCDet(tabela(8), Me.txt19_1, tabela(5), Me.rnd19_1_Sim, rnd19_1_Nao, Me.rnd19_1_NA)
                            If (tabela(9) = 19 And tabela(11) = 2) Then Call BCDet(tabela(8), Me.txt19_2, tabela(5), Me.rnd19_2_Sim, rnd19_2_Nao, Me.rnd19_2_NA)
                            If (tabela(9) = 19 And tabela(11) = 3) Then Call BCDet(tabela(8), Me.txt19_3, tabela(5), Me.rnd19_3_Sim, rnd19_3_Nao, Me.rnd19_3_NA)
                            If (tabela(9) = 19 And tabela(11) = 4) Then Call BCDet(tabela(8), Me.txt19_4, tabela(5), Me.rnd19_4_Sim, rnd19_4_Nao, Me.rnd19_4_NA)
                            If (tabela(9) = 19 And tabela(11) = 5) Then Call BCDet(tabela(8), Me.txt19_5, tabela(5), Me.rnd19_5_Sim, rnd19_5_Nao, Me.rnd19_5_NA)

                            If (tabela(9) = 1) Then arrayTotal(0) = arrayTotal(0) + 1
                            If (tabela(9) = 2) Then arrayTotal(1) = arrayTotal(1) + 1
                            If (tabela(9) = 3) Then arrayTotal(2) = arrayTotal(2) + 1
                            If (tabela(9) = 4) Then arrayTotal(3) = arrayTotal(3) + 1
                            If (tabela(9) = 5) Then arrayTotal(4) = arrayTotal(4) + 1
                            If (tabela(9) = 6) Then arrayTotal(5) = arrayTotal(5) + 1
                            If (tabela(9) = 7) Then arrayTotal(6) = arrayTotal(6) + 1
                            If (tabela(9) = 8) Then arrayTotal(7) = arrayTotal(7) + 1
                            If (tabela(9) = 9) Then arrayTotal(8) = arrayTotal(8) + 1
                            If (tabela(9) = 10) Then arrayTotal(9) = arrayTotal(9) + 1
                            If (tabela(9) = 11) Then arrayTotal(10) = arrayTotal(10) + 1
                            If (tabela(9) = 12) Then arrayTotal(11) = arrayTotal(11) + 1
                            If (tabela(9) = 13) Then arrayTotal(12) = arrayTotal(12) + 1
                            If (tabela(9) = 14) Then arrayTotal(13) = arrayTotal(13) + 1
                            If (tabela(9) = 15) Then arrayTotal(14) = arrayTotal(14) + 1
                            If (tabela(9) = 16) Then arrayTotal(15) = arrayTotal(15) + 1
                            If (tabela(9) = 17) Then arrayTotal(16) = arrayTotal(16) + 1
                            If (tabela(9) = 18) Then arrayTotal(17) = arrayTotal(17) + 1
                            If (tabela(9) = 19) Then arrayTotal(18) = arrayTotal(18) + 1

                        Next
                    End Using
                End Using

                cmd.Dispose()
            End Using
            con.Dispose()
        End Using

        Session("sMenuColor") = arrayTotal

    End Sub

    Private Sub fPadraoInicial(ByVal rndNA As CheckBox)
        rndNA.Checked = True
    End Sub

    Private Sub PadraoInicial()

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
        Call fPadraoInicial(rnd2_1_NA)
        Call fPadraoInicial(rnd2_2_NA)
        Call fPadraoInicial(rnd2_3_NA)
        Call fPadraoInicial(rnd3_1_NA)
        Call fPadraoInicial(rnd3_2_NA)
        Call fPadraoInicial(rnd3_3_NA)
        Call fPadraoInicial(rnd3_4_NA)
        Call fPadraoInicial(rnd3_5_NA)
        Call fPadraoInicial(rnd3_6_NA)
        Call fPadraoInicial(rnd3_7_NA)
        Call fPadraoInicial(rnd3_8_NA)
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
        Call fPadraoInicial(rnd4_13_NA)
        Call fPadraoInicial(rnd5_1_NA)
        Call fPadraoInicial(rnd5_2_NA)
        Call fPadraoInicial(rnd5_3_NA)
        Call fPadraoInicial(rnd5_4_NA)
        Call fPadraoInicial(rnd5_5_NA)
        Call fPadraoInicial(rnd5_6_NA)
        Call fPadraoInicial(rnd5_7_NA)
        Call fPadraoInicial(rnd6_1_NA)
        Call fPadraoInicial(rnd6_2_NA)
        Call fPadraoInicial(rnd6_3_NA)
        Call fPadraoInicial(rnd6_4_NA)
        Call fPadraoInicial(rnd6_5_NA)
        Call fPadraoInicial(rnd6_6_NA)
        Call fPadraoInicial(rnd6_7_NA)
        Call fPadraoInicial(rnd6_8_NA)
        Call fPadraoInicial(rnd6_9_NA)
        Call fPadraoInicial(rnd6_10_NA)
        Call fPadraoInicial(rnd6_11_NA)
        Call fPadraoInicial(rnd6_12_NA)
        Call fPadraoInicial(rnd6_13_NA)
        Call fPadraoInicial(rnd6_14_NA)
        Call fPadraoInicial(rnd6_15_NA)
        Call fPadraoInicial(rnd6_16_NA)
        Call fPadraoInicial(rnd7_1_NA)
        Call fPadraoInicial(rnd7_2_NA)
        Call fPadraoInicial(rnd7_3_NA)
        Call fPadraoInicial(rnd7_4_NA)
        Call fPadraoInicial(rnd7_5_NA)
        Call fPadraoInicial(rnd7_6_NA)
        Call fPadraoInicial(rnd7_7_NA)
        Call fPadraoInicial(rnd7_8_NA)
        Call fPadraoInicial(rnd7_9_NA)
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
        Call fPadraoInicial(rnd10_1_NA)
        Call fPadraoInicial(rnd10_2_NA)
        Call fPadraoInicial(rnd10_3_NA)
        Call fPadraoInicial(rnd10_4_NA)
        Call fPadraoInicial(rnd10_5_NA)
        Call fPadraoInicial(rnd10_6_NA)
        Call fPadraoInicial(rnd10_7_NA)
        Call fPadraoInicial(rnd10_8_NA)
        Call fPadraoInicial(rnd11_1_NA)
        Call fPadraoInicial(rnd11_2_NA)
        Call fPadraoInicial(rnd11_3_NA)
        Call fPadraoInicial(rnd12_1_NA)
        Call fPadraoInicial(rnd12_2_NA)
        Call fPadraoInicial(rnd12_3_NA)
        Call fPadraoInicial(rnd12_4_NA)
        Call fPadraoInicial(rnd12_5_NA)
        Call fPadraoInicial(rnd12_6_NA)
        Call fPadraoInicial(rnd12_7_NA)
        Call fPadraoInicial(rnd12_8_NA)
        Call fPadraoInicial(rnd12_9_NA)
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
        Call fPadraoInicial(rnd14_1_NA)
        Call fPadraoInicial(rnd14_2_NA)
        Call fPadraoInicial(rnd14_3_NA)
        Call fPadraoInicial(rnd14_4_NA)
        Call fPadraoInicial(rnd14_5_NA)
        Call fPadraoInicial(rnd14_6_NA)
        Call fPadraoInicial(rnd14_7_NA)
        Call fPadraoInicial(rnd14_8_NA)
        Call fPadraoInicial(rnd14_9_NA)
        Call fPadraoInicial(rnd14_10_NA)
        Call fPadraoInicial(rnd15_1_NA)
        Call fPadraoInicial(rnd15_2_NA)
        Call fPadraoInicial(rnd15_3_NA)
        Call fPadraoInicial(rnd15_4_NA)
        Call fPadraoInicial(rnd15_5_NA)
        Call fPadraoInicial(rnd16_1_NA)
        Call fPadraoInicial(rnd16_2_NA)
        Call fPadraoInicial(rnd16_3_NA)
        Call fPadraoInicial(rnd16_4_NA)
        Call fPadraoInicial(rnd16_5_NA)
        Call fPadraoInicial(rnd16_6_NA)
        Call fPadraoInicial(rnd16_7_NA)
        Call fPadraoInicial(rnd16_8_NA)
        Call fPadraoInicial(rnd16_9_NA)
        Call fPadraoInicial(rnd16_10_NA)
        Call fPadraoInicial(rnd16_11_NA)
        Call fPadraoInicial(rnd16_12_NA)
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
        Call fPadraoInicial(rnd18_1_NA)
        Call fPadraoInicial(rnd18_2_NA)
        Call fPadraoInicial(rnd18_3_NA)
        Call fPadraoInicial(rnd18_4_NA)
        Call fPadraoInicial(rnd18_5_NA)
        Call fPadraoInicial(rnd18_6_NA)
        Call fPadraoInicial(rnd18_7_NA)
        Call fPadraoInicial(rnd19_1_NA)
        Call fPadraoInicial(rnd19_2_NA)
        Call fPadraoInicial(rnd19_3_NA)
        Call fPadraoInicial(rnd19_4_NA)
        Call fPadraoInicial(rnd19_5_NA)

    End Sub

    Private Sub BCDet(ByVal myPontos As Byte, ByVal myText As TextBox, ByVal myDesc As String,
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

    Public Function ThumbnailCallback() As Boolean
        Return False
    End Function

    Private Sub UploadImagem(ByVal oUpload As Object, ByVal iText As String, ByVal iGrupo As Byte, ByVal iSubgrupo As Byte, ByVal iCod As Byte)

        If oUpload.hasfile = False Then
            ScriptManager.RegisterStartupScript(oUpload, Me.GetType(), "Script", "alertError();", True)
            Exit Sub

        Else

            'ScriptManager.RegisterStartupScript(oUpload, Me.GetType(), "Script", "alertSucessImg();", True)
            'Exit Sub

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
                Dim query As String = "Insert Into Fotos.tblFilial_" & selFilial.SelectedValue & " (imgData,imgTitle,imgType,imgLength,Dia,idFilial,idGrupo,idSubgrupo,idCod) Values(@content,@title,@type,@length,@dia, @idFilial, @idGrupo, @idSubgrupo, @idCod)"
                Using cmd As SqlCommand = New SqlCommand(query)
                    cmd.Connection = con
                    cmd.Parameters.AddWithValue("@content", bytes)
                    cmd.Parameters.AddWithValue("@title", fileName)
                    cmd.Parameters.AddWithValue("@type", contentType)

                    cmd.Parameters.AddWithValue("@length", intLength)
                    cmd.Parameters.AddWithValue("@dia", txtData.Value)
                    cmd.Parameters.AddWithValue("@idFilial", selFilial.SelectedValue)
                    cmd.Parameters.AddWithValue("@idGrupo", iGrupo)
                    cmd.Parameters.AddWithValue("@idSubgrupo", iSubgrupo)
                    cmd.Parameters.AddWithValue("@idCod", iCod)

                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()

                    ScriptManager.RegisterStartupScript(oUpload, Me.GetType(), "Script", "alertSucessImg();", True)

                End Using
            End Using

        End If

    End Sub

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAtualizar.Click

        If selFilial.SelectedValue < 100 Then
            Session("sFILIAL") = selFilial.SelectedValue
            Response.Redirect("CheckListCondor.aspx")
        End If

        Call LimparTextBox()
        Call PadraoInicial()
        Call HabilitarGerarRelatorio()
        Call BuscarChecklist()
        Call colorMenu()
        Dim data = txtData.Value
        Dim hoje = Now().Date

        Try

            If data < hoje Then

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
                btnGrupo18.Enabled = False
                btnGrupo19.Enabled = False

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
                btnGrupo18.Enabled = True
                btnGrupo19.Enabled = True

            End If

        Catch ex As Exception

        End Try

        If selFilial.SelectedValue < 100 Then
            Session("sFILIAL") = selFilial.SelectedValue
            Response.Redirect("CheckListCondor.aspx")
        End If

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "maxData();", True)

    End Sub

#End Region

#Region "Botões enviar de cada bloco"

    Protected Sub btnGrupo1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo1.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(18) As Byte
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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 1, varIssue(1), userName, Me.txt1_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 2, varIssue(2), userName, Me.txt1_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 3, varIssue(3), userName, Me.txt1_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 4, varIssue(4), userName, Me.txt1_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 5, varIssue(5), userName, Me.txt1_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 6, varIssue(6), userName, Me.txt1_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 7, varIssue(7), userName, Me.txt1_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 8, varIssue(8), userName, Me.txt1_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 9, varIssue(9), userName, Me.txt1_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 10, varIssue(10), userName, Me.txt1_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 11, varIssue(11), userName, Me.txt1_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 12, varIssue(12), userName, Me.txt1_12.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 13, varIssue(13), userName, Me.txt1_13.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 14, varIssue(14), userName, Me.txt1_14.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 15, varIssue(15), userName, Me.txt1_15.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 16, varIssue(16), userName, Me.txt1_16.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 17, varIssue(17), userName, Me.txt1_17.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 1, 1, 18, varIssue(18), userName, Me.txt1_18.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 1, 1)
        'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alertErro();", True)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)
        If Session("qtdRespostas").ToString() = "18" Then btnMenu_1.BackColor = Color.FromArgb(120, 167, 149)

        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo2.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(3) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd2_1_Sim, rnd2_1_Nao, rnd2_1_NA)
        varIssue(2) = DefinirPontuacao(rnd2_2_Sim, rnd2_2_Nao, rnd2_2_NA)
        varIssue(3) = DefinirPontuacao(rnd2_3_Sim, rnd2_3_Nao, rnd2_3_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 2, 1, 1, varIssue(1), userName, Me.txt2_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 2, 1, 2, varIssue(2), userName, Me.txt2_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 2, 1, 3, varIssue(3), userName, Me.txt2_3.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 2, 1)

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "3" Then btnMenu_2.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo3.Click
        Session("qtdRespostas") = 0
        Dim varIssue(8) As Byte
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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 1, varIssue(1), userName, Me.txt3_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 2, varIssue(2), userName, Me.txt3_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 3, varIssue(3), userName, Me.txt3_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 4, varIssue(4), userName, Me.txt3_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 5, varIssue(5), userName, Me.txt3_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 6, varIssue(6), userName, Me.txt3_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 7, varIssue(7), userName, Me.txt3_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 3, 1, 8, varIssue(8), userName, Me.txt3_8.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 3, 1)
        'Me.panTitle3.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "8" Then btnMenu_3.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo4.Click
        Session("qtdRespostas") = 0

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
        varIssue(13) = DefinirPontuacao(rnd4_13_Sim, rnd4_13_Nao, rnd4_13_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 1, varIssue(1), userName, Me.txt4_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 2, varIssue(2), userName, Me.txt4_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 3, varIssue(3), userName, Me.txt4_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 4, varIssue(4), userName, Me.txt4_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 5, varIssue(5), userName, Me.txt4_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 6, varIssue(6), userName, Me.txt4_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 7, varIssue(7), userName, Me.txt4_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 8, varIssue(8), userName, Me.txt4_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 9, varIssue(9), userName, Me.txt4_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 10, varIssue(10), userName, Me.txt4_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 11, varIssue(11), userName, Me.txt4_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 12, varIssue(12), userName, Me.txt4_12.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 4, 1, 13, varIssue(13), userName, Me.txt4_13.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 4, 1)
        'Me.panTitle4.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "13" Then btnMenu_4.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo5.Click

        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(7) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd5_1_Sim, rnd5_1_Nao, rnd5_1_NA)
        varIssue(2) = DefinirPontuacao(rnd5_2_Sim, rnd5_2_Nao, rnd5_2_NA)
        varIssue(3) = DefinirPontuacao(rnd5_3_Sim, rnd5_3_Nao, rnd5_3_NA)
        varIssue(4) = DefinirPontuacao(rnd5_4_Sim, rnd5_4_Nao, rnd5_4_NA)
        varIssue(5) = DefinirPontuacao(rnd5_5_Sim, rnd5_5_Nao, rnd5_5_NA)
        varIssue(6) = DefinirPontuacao(rnd5_6_Sim, rnd5_6_Nao, rnd5_6_NA)
        varIssue(7) = DefinirPontuacao(rnd5_7_Sim, rnd5_7_Nao, rnd5_7_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 1, varIssue(1), userName, Me.txt5_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 2, varIssue(2), userName, Me.txt5_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 3, varIssue(3), userName, Me.txt5_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 4, varIssue(4), userName, Me.txt5_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 5, varIssue(5), userName, Me.txt5_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 6, varIssue(6), userName, Me.txt5_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 5, 1, 7, varIssue(7), userName, Me.txt5_7.Text)



        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 5, 1)
        'Me.panTitle5.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "7" Then btnMenu_5.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo6.Click

        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(16) As Byte

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
        varIssue(10) = DefinirPontuacao(rnd6_10_Sim, rnd6_10_Nao, rnd6_10_NA)
        varIssue(11) = DefinirPontuacao(rnd6_11_Sim, rnd6_11_Nao, rnd6_11_NA)
        varIssue(12) = DefinirPontuacao(rnd6_12_Sim, rnd6_12_Nao, rnd6_12_NA)
        varIssue(13) = DefinirPontuacao(rnd6_13_Sim, rnd6_13_Nao, rnd6_13_NA)
        varIssue(14) = DefinirPontuacao(rnd6_14_Sim, rnd6_14_Nao, rnd6_14_NA)
        varIssue(15) = DefinirPontuacao(rnd6_15_Sim, rnd6_15_Nao, rnd6_15_NA)
        varIssue(16) = DefinirPontuacao(rnd6_16_Sim, rnd6_16_Nao, rnd6_16_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 1, varIssue(1), userName, Me.txt6_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 2, varIssue(2), userName, Me.txt6_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 3, varIssue(3), userName, Me.txt6_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 4, varIssue(4), userName, Me.txt6_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 5, varIssue(5), userName, Me.txt6_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 6, varIssue(6), userName, Me.txt6_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 7, varIssue(7), userName, Me.txt6_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 8, varIssue(8), userName, Me.txt6_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 9, varIssue(9), userName, Me.txt6_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 10, varIssue(10), userName, Me.txt6_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 11, varIssue(11), userName, Me.txt6_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 12, varIssue(12), userName, Me.txt6_12.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 13, varIssue(13), userName, Me.txt6_13.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 14, varIssue(14), userName, Me.txt6_14.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 15, varIssue(15), userName, Me.txt6_15.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 6, 1, 16, varIssue(16), userName, Me.txt6_16.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 6, 1)
        'Me.panTitle6.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "16" Then btnMenu_6.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo7.Click
        ' Botão Salvar
        ' Salvar os itens do 3.10 ao 3.17 que esta no Grupo 3 - Armazenamento(Câmaras) - Fiambreria e Laticinios - Grupo 2 - (8 perguntas, 10 a 17)
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(9) As Byte

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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 1, varIssue(1), userName, Me.txt7_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 2, varIssue(2), userName, Me.txt7_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 3, varIssue(3), userName, Me.txt7_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 4, varIssue(4), userName, Me.txt7_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 5, varIssue(5), userName, Me.txt7_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 6, varIssue(6), userName, Me.txt7_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 7, varIssue(7), userName, Me.txt7_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 8, varIssue(8), userName, Me.txt7_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 7, 1, 9, varIssue(9), userName, Me.txt7_9.Text)


        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 7, 1)
        'Me.panTitle7.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "9" Then btnMenu_7.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo8.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(15) As Byte

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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 1, varIssue(1), userName, Me.txt8_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 2, varIssue(2), userName, Me.txt8_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 3, varIssue(3), userName, Me.txt8_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 4, varIssue(4), userName, Me.txt8_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 5, varIssue(5), userName, Me.txt8_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 6, varIssue(6), userName, Me.txt8_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 7, varIssue(7), userName, Me.txt8_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 8, varIssue(8), userName, Me.txt8_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 9, varIssue(9), userName, Me.txt8_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 10, varIssue(10), userName, Me.txt8_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 11, varIssue(11), userName, Me.txt8_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 12, varIssue(12), userName, Me.txt8_12.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 13, varIssue(13), userName, Me.txt8_13.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 14, varIssue(14), userName, Me.txt8_14.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 8, 1, 15, varIssue(15), userName, Me.txt8_15.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 8, 1)
        'Me.panTitle8.CssClass = "pnl_Verde"

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "15" Then btnMenu_8.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo9.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(11) As Byte

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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 1, varIssue(1), userName, Me.txt9_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 2, varIssue(2), userName, Me.txt9_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 3, varIssue(3), userName, Me.txt9_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 4, varIssue(4), userName, Me.txt9_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 5, varIssue(5), userName, Me.txt9_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 6, varIssue(6), userName, Me.txt9_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 7, varIssue(7), userName, Me.txt9_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 8, varIssue(8), userName, Me.txt9_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 9, varIssue(9), userName, Me.txt9_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 10, varIssue(10), userName, Me.txt9_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 9, 1, 11, varIssue(11), userName, Me.txt9_11.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 9, 1)
        'Me.panTitle9.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "11" Then btnMenu_9.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo10.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(8) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd10_1_Sim, rnd10_1_Nao, rnd10_1_NA)
        varIssue(2) = DefinirPontuacao(rnd10_2_Sim, rnd10_2_Nao, rnd10_2_NA)
        varIssue(3) = DefinirPontuacao(rnd10_3_Sim, rnd10_3_Nao, rnd10_3_NA)
        varIssue(4) = DefinirPontuacao(rnd10_4_Sim, rnd10_4_Nao, rnd10_4_NA)
        varIssue(5) = DefinirPontuacao(rnd10_5_Sim, rnd10_5_Nao, rnd10_5_NA)
        varIssue(6) = DefinirPontuacao(rnd10_6_Sim, rnd10_6_Nao, rnd10_6_NA)
        varIssue(7) = DefinirPontuacao(rnd10_7_Sim, rnd10_7_Nao, rnd10_7_NA)
        varIssue(8) = DefinirPontuacao(rnd10_8_Sim, rnd10_8_Nao, rnd10_8_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 1, varIssue(1), userName, Me.txt10_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 2, varIssue(2), userName, Me.txt10_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 3, varIssue(3), userName, Me.txt10_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 4, varIssue(4), userName, Me.txt10_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 5, varIssue(5), userName, Me.txt10_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 6, varIssue(6), userName, Me.txt10_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 7, varIssue(7), userName, Me.txt10_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 10, 1, 8, varIssue(8), userName, Me.txt10_8.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 10, 1)
        'Me.panTitle10.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "8" Then btnMenu_10.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo11.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(3) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd11_1_Sim, rnd11_1_Nao, rnd11_1_NA)
        varIssue(2) = DefinirPontuacao(rnd11_2_Sim, rnd11_2_Nao, rnd11_2_NA)
        varIssue(3) = DefinirPontuacao(rnd11_3_Sim, rnd11_3_Nao, rnd11_3_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 11, 1, 1, varIssue(1), userName, Me.txt11_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 11, 1, 2, varIssue(2), userName, Me.txt11_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 11, 1, 3, varIssue(3), userName, Me.txt11_3.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 11, 1)
        'Me.panTitle11.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "3" Then btnMenu_11.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo12.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(9) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd12_1_Sim, rnd12_1_Nao, rnd12_1_NA)
        varIssue(2) = DefinirPontuacao(rnd12_2_Sim, rnd12_2_Nao, rnd12_2_NA)
        varIssue(3) = DefinirPontuacao(rnd12_3_Sim, rnd12_3_Nao, rnd12_3_NA)
        varIssue(4) = DefinirPontuacao(rnd12_4_Sim, rnd12_4_Nao, rnd12_4_NA)
        varIssue(5) = DefinirPontuacao(rnd12_5_Sim, rnd12_5_Nao, rnd12_5_NA)
        varIssue(6) = DefinirPontuacao(rnd12_6_Sim, rnd12_6_Nao, rnd12_6_NA)
        varIssue(7) = DefinirPontuacao(rnd12_7_Sim, rnd12_7_Nao, rnd12_7_NA)
        varIssue(8) = DefinirPontuacao(rnd12_8_Sim, rnd12_8_Nao, rnd12_8_NA)
        varIssue(9) = DefinirPontuacao(rnd12_9_Sim, rnd12_9_Nao, rnd12_9_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 1, varIssue(1), userName, Me.txt12_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 2, varIssue(2), userName, Me.txt12_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 3, varIssue(3), userName, Me.txt12_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 4, varIssue(4), userName, Me.txt12_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 5, varIssue(5), userName, Me.txt12_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 6, varIssue(6), userName, Me.txt12_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 7, varIssue(7), userName, Me.txt12_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 8, varIssue(8), userName, Me.txt12_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 12, 1, 9, varIssue(9), userName, Me.txt12_9.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 12, 1)
        'Me.panTitle12.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "9" Then btnMenu_12.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo13.Click
        Session("qtdRespostas") = 0
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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 1, varIssue(1), userName, Me.txt13_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 2, varIssue(2), userName, Me.txt13_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 3, varIssue(3), userName, Me.txt13_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 4, varIssue(4), userName, Me.txt13_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 5, varIssue(5), userName, Me.txt13_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 6, varIssue(6), userName, Me.txt13_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 7, varIssue(7), userName, Me.txt13_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 8, varIssue(8), userName, Me.txt13_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 9, varIssue(9), userName, Me.txt13_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 10, varIssue(10), userName, Me.txt13_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 11, varIssue(11), userName, Me.txt13_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 12, varIssue(12), userName, Me.txt13_12.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 13, 1, 13, varIssue(13), userName, Me.txt13_13.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 13, 1)
        'Me.panTitle13.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "13" Then btnMenu_13.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo14_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo14.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(10) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd14_1_Sim, rnd14_1_Nao, rnd14_1_NA)
        varIssue(2) = DefinirPontuacao(rnd14_2_Sim, rnd14_2_Nao, rnd14_2_NA)
        varIssue(3) = DefinirPontuacao(rnd14_3_Sim, rnd14_3_Nao, rnd14_3_NA)
        varIssue(4) = DefinirPontuacao(rnd14_4_Sim, rnd14_4_Nao, rnd14_4_NA)
        varIssue(5) = DefinirPontuacao(rnd14_5_Sim, rnd14_5_Nao, rnd14_5_NA)
        varIssue(6) = DefinirPontuacao(rnd14_6_Sim, rnd14_6_Nao, rnd14_6_NA)
        varIssue(7) = DefinirPontuacao(rnd14_7_Sim, rnd14_7_Nao, rnd14_7_NA)
        varIssue(8) = DefinirPontuacao(rnd14_8_Sim, rnd14_8_Nao, rnd14_8_NA)
        varIssue(9) = DefinirPontuacao(rnd14_9_Sim, rnd14_9_Nao, rnd14_9_NA)
        varIssue(10) = DefinirPontuacao(rnd14_10_Sim, rnd14_10_Nao, rnd14_10_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 1, varIssue(1), userName, Me.txt14_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 2, varIssue(2), userName, Me.txt14_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 3, varIssue(3), userName, Me.txt14_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 4, varIssue(4), userName, Me.txt14_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 5, varIssue(5), userName, Me.txt14_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 6, varIssue(6), userName, Me.txt14_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 7, varIssue(7), userName, Me.txt14_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 8, varIssue(8), userName, Me.txt14_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 9, varIssue(9), userName, Me.txt14_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 14, 1, 10, varIssue(10), userName, Me.txt14_10.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 14, 1)
        'Me.panTitle14.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "10" Then btnMenu_14.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo15.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(5) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd15_1_Sim, rnd15_1_Nao, rnd15_1_NA)
        varIssue(2) = DefinirPontuacao(rnd15_2_Sim, rnd15_2_Nao, rnd15_2_NA)
        varIssue(3) = DefinirPontuacao(rnd15_3_Sim, rnd15_3_Nao, rnd15_3_NA)
        varIssue(4) = DefinirPontuacao(rnd15_4_Sim, rnd15_4_Nao, rnd15_4_NA)
        varIssue(5) = DefinirPontuacao(rnd15_5_Sim, rnd15_5_Nao, rnd15_5_NA)


        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 15, 1, 1, varIssue(1), userName, Me.txt15_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 15, 1, 2, varIssue(2), userName, Me.txt15_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 15, 1, 3, varIssue(3), userName, Me.txt15_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 15, 1, 4, varIssue(4), userName, Me.txt15_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 15, 1, 5, varIssue(5), userName, Me.txt15_5.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 15, 1)
        'Me.panTitle15.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "5" Then btnMenu_15.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo16_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo16.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(12) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd16_1_Sim, rnd16_1_Nao, rnd16_1_NA)
        varIssue(2) = DefinirPontuacao(rnd16_2_Sim, rnd16_2_Nao, rnd16_2_NA)
        varIssue(3) = DefinirPontuacao(rnd16_3_Sim, rnd16_3_Nao, rnd16_3_NA)
        varIssue(4) = DefinirPontuacao(rnd16_4_Sim, rnd16_4_Nao, rnd16_4_NA)
        varIssue(5) = DefinirPontuacao(rnd16_5_Sim, rnd16_5_Nao, rnd16_5_NA)
        varIssue(6) = DefinirPontuacao(rnd16_6_Sim, rnd16_6_Nao, rnd16_6_NA)
        varIssue(7) = DefinirPontuacao(rnd16_7_Sim, rnd16_7_Nao, rnd16_7_NA)
        varIssue(8) = DefinirPontuacao(rnd16_8_Sim, rnd16_8_Nao, rnd16_8_NA)
        varIssue(9) = DefinirPontuacao(rnd16_9_Sim, rnd16_9_Nao, rnd16_9_NA)
        varIssue(10) = DefinirPontuacao(rnd16_10_Sim, rnd16_10_Nao, rnd16_10_NA)
        varIssue(11) = DefinirPontuacao(rnd16_11_Sim, rnd16_11_Nao, rnd16_11_NA)
        varIssue(12) = DefinirPontuacao(rnd16_12_Sim, rnd16_12_Nao, rnd16_12_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 1, varIssue(1), userName, Me.txt16_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 2, varIssue(2), userName, Me.txt16_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 3, varIssue(3), userName, Me.txt16_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 4, varIssue(4), userName, Me.txt16_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 5, varIssue(5), userName, Me.txt16_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 6, varIssue(6), userName, Me.txt16_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 7, varIssue(7), userName, Me.txt16_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 8, varIssue(8), userName, Me.txt16_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 9, varIssue(9), userName, Me.txt16_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 10, varIssue(10), userName, Me.txt16_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 11, varIssue(11), userName, Me.txt16_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 16, 1, 12, varIssue(12), userName, Me.txt16_12.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 16, 1)
        'Me.panTitle16.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "12" Then btnMenu_16.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo17_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo17.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(12) As Byte
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

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 1, varIssue(1), userName, Me.txt17_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 2, varIssue(2), userName, Me.txt17_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 3, varIssue(3), userName, Me.txt17_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 4, varIssue(4), userName, Me.txt17_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 5, varIssue(5), userName, Me.txt17_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 6, varIssue(6), userName, Me.txt17_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 7, varIssue(7), userName, Me.txt17_7.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 8, varIssue(8), userName, Me.txt17_8.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 9, varIssue(9), userName, Me.txt17_9.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 10, varIssue(10), userName, Me.txt17_10.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 11, varIssue(11), userName, Me.txt17_11.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 17, 1, 12, varIssue(12), userName, Me.txt17_12.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 17, 1)
        'Me.panTitle17.CssClass = "pnl_Verde"
        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "12" Then btnMenu_17.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo18_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo18.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(7) As Byte

        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd18_1_Sim, rnd18_1_Nao, rnd18_1_NA)
        varIssue(2) = DefinirPontuacao(rnd18_2_Sim, rnd18_2_Nao, rnd18_2_NA)
        varIssue(3) = DefinirPontuacao(rnd18_3_Sim, rnd18_3_Nao, rnd18_3_NA)
        varIssue(4) = DefinirPontuacao(rnd18_4_Sim, rnd18_4_Nao, rnd18_4_NA)
        varIssue(5) = DefinirPontuacao(rnd18_5_Sim, rnd18_5_Nao, rnd18_5_NA)
        varIssue(6) = DefinirPontuacao(rnd18_6_Sim, rnd18_6_Nao, rnd18_6_NA)
        varIssue(7) = DefinirPontuacao(rnd18_7_Sim, rnd18_7_Nao, rnd18_7_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 1, varIssue(1), userName, Me.txt18_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 2, varIssue(2), userName, Me.txt18_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 3, varIssue(3), userName, Me.txt18_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 4, varIssue(4), userName, Me.txt18_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 5, varIssue(5), userName, Me.txt18_5.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 6, varIssue(6), userName, Me.txt18_6.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 18, 1, 7, varIssue(7), userName, Me.txt18_7.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 18, 1)
        'Me.panTitle18.CssClass = "pnl_Verde"

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "7" Then btnMenu_18.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

    Protected Sub btnGrupo19_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGrupo19.Click
        Session("qtdRespostas") = 0
        Dim userName As String
        Dim varIssue(5) As Byte
        userName = User.Identity.Name

        varIssue(1) = DefinirPontuacao(rnd19_1_Sim, rnd19_1_Nao, rnd19_1_NA)
        varIssue(2) = DefinirPontuacao(rnd19_2_Sim, rnd19_2_Nao, rnd19_2_NA)
        varIssue(3) = DefinirPontuacao(rnd19_3_Sim, rnd19_3_Nao, rnd19_3_NA)
        varIssue(4) = DefinirPontuacao(rnd19_4_Sim, rnd19_4_Nao, rnd19_4_NA)
        varIssue(5) = DefinirPontuacao(rnd19_5_Sim, rnd19_5_Nao, rnd19_5_NA)

        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 19, 1, 1, varIssue(1), userName, Me.txt19_1.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 19, 1, 2, varIssue(2), userName, Me.txt19_2.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 19, 1, 3, varIssue(3), userName, Me.txt19_3.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 19, 1, 4, varIssue(4), userName, Me.txt19_4.Text)
        oCh.SalvarChecklist(txtData.Value, Me.selFilial.SelectedValue, 19, 1, 5, varIssue(5), userName, Me.txt19_5.Text)

        oCh.SalvarChecklistGrupo(txtData.Value, Me.selFilial.SelectedValue, 19, 1)
        'Me.panTitle18.CssClass = "pnl_Verde"

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

        If Session("qtdRespostas").ToString() = "5" Then btnMenu_19.BackColor = Color.FromArgb(120, 167, 149)
        btnVoltar_Click(sender, e)
    End Sub

#End Region

#Region "Botões SalvarFoto"
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
    Protected Sub btnSalvarFoto2_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto2_1.Click
        Call UploadImagem(Me.upFile2_1, Me.txt2_1.Text, 2, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto2_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto2_2.Click
        Call UploadImagem(Me.upFile2_2, Me.txt2_2.Text, 2, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto2_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto2_3.Click
        Call UploadImagem(Me.upFile2_3, Me.txt2_3.Text, 2, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto3_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_1.Click
        Call UploadImagem(Me.upFile3_1, Me.txt3_1.Text, 3, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto3_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_2.Click
        Call UploadImagem(Me.upFile3_2, Me.txt3_2.Text, 3, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto3_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_3.Click
        Call UploadImagem(Me.upFile3_3, Me.txt3_3.Text, 3, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto3_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_4.Click
        Call UploadImagem(Me.upFile3_4, Me.txt3_4.Text, 3, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto3_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_5.Click
        Call UploadImagem(Me.upFile3_5, Me.txt3_5.Text, 3, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto3_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_6.Click
        Call UploadImagem(Me.upFile3_6, Me.txt3_6.Text, 3, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto3_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_7.Click
        Call UploadImagem(Me.upFile3_7, Me.txt3_7.Text, 3, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto3_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto3_8.Click
        Call UploadImagem(Me.upFile3_8, Me.txt3_8.Text, 3, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto4_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_1.Click
        Call UploadImagem(Me.upFile4_1, Me.txt4_1.Text, 4, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto4_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_2.Click
        Call UploadImagem(Me.upFile4_2, Me.txt4_2.Text, 4, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto4_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_3.Click
        Call UploadImagem(Me.upFile4_3, Me.txt4_3.Text, 4, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto4_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_4.Click
        Call UploadImagem(Me.upFile4_4, Me.txt4_4.Text, 4, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto4_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_5.Click
        Call UploadImagem(Me.upFile4_5, Me.txt4_5.Text, 4, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto4_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_6.Click
        Call UploadImagem(Me.upFile4_6, Me.txt4_6.Text, 4, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto4_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_7.Click
        Call UploadImagem(Me.upFile4_7, Me.txt4_7.Text, 4, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto4_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_8.Click
        Call UploadImagem(Me.upFile4_8, Me.txt4_8.Text, 4, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto4_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_9.Click
        Call UploadImagem(Me.upFile4_9, Me.txt4_9.Text, 4, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto4_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_10.Click
        Call UploadImagem(Me.upFile4_10, Me.txt4_10.Text, 4, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto4_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_11.Click
        Call UploadImagem(Me.upFile4_11, Me.txt4_11.Text, 4, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto4_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_12.Click
        Call UploadImagem(Me.upFile4_12, Me.txt4_12.Text, 4, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto4_13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto4_13.Click
        Call UploadImagem(Me.upFile4_13, Me.txt4_13.Text, 4, 1, 13)
    End Sub
    Protected Sub btnSalvarFoto5_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_1.Click
        Call UploadImagem(Me.upFile5_1, Me.txt5_1.Text, 5, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto5_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_2.Click
        Call UploadImagem(Me.upFile5_2, Me.txt5_2.Text, 5, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto5_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_3.Click
        Call UploadImagem(Me.upFile5_3, Me.txt5_3.Text, 5, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto5_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_4.Click
        Call UploadImagem(Me.upFile5_4, Me.txt5_4.Text, 5, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto5_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_5.Click
        Call UploadImagem(Me.upFile5_5, Me.txt5_5.Text, 5, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto5_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_6.Click
        Call UploadImagem(Me.upFile5_6, Me.txt5_6.Text, 5, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto5_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto5_7.Click
        Call UploadImagem(Me.upFile5_7, Me.txt5_7.Text, 5, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto6_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_1.Click
        Call UploadImagem(Me.upFile6_1, Me.txt6_1.Text, 6, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto6_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_2.Click
        Call UploadImagem(Me.upFile6_2, Me.txt6_2.Text, 6, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto6_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_3.Click
        Call UploadImagem(Me.upFile6_3, Me.txt6_3.Text, 6, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto6_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_4.Click
        Call UploadImagem(Me.upFile6_4, Me.txt6_4.Text, 6, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto6_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_5.Click
        Call UploadImagem(Me.upFile6_5, Me.txt6_5.Text, 6, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto6_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_6.Click
        Call UploadImagem(Me.upFile6_6, Me.txt6_6.Text, 6, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto6_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_7.Click
        Call UploadImagem(Me.upFile6_7, Me.txt6_7.Text, 6, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto6_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_8.Click
        Call UploadImagem(Me.upFile6_8, Me.txt6_8.Text, 6, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto6_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_9.Click
        Call UploadImagem(Me.upFile6_9, Me.txt6_9.Text, 6, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto6_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_10.Click
        Call UploadImagem(Me.upFile6_10, Me.txt6_10.Text, 6, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto6_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_11.Click
        Call UploadImagem(Me.upFile6_11, Me.txt6_11.Text, 6, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto6_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_12.Click
        Call UploadImagem(Me.upFile6_12, Me.txt6_12.Text, 6, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto6_13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_13.Click
        Call UploadImagem(Me.upFile6_13, Me.txt6_13.Text, 6, 1, 13)
    End Sub
    Protected Sub btnSalvarFoto6_14_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_14.Click
        Call UploadImagem(Me.upFile6_14, Me.txt6_14.Text, 6, 1, 14)
    End Sub
    Protected Sub btnSalvarFoto6_15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_15.Click
        Call UploadImagem(Me.upFile6_15, Me.txt6_15.Text, 6, 1, 15)
    End Sub
    Protected Sub btnSalvarFoto6_16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto6_16.Click
        Call UploadImagem(Me.upFile6_16, Me.txt6_16.Text, 6, 1, 16)
    End Sub
    Protected Sub btnSalvarFoto7_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_1.Click
        Call UploadImagem(Me.upFile7_1, Me.txt7_1.Text, 7, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto7_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_2.Click
        Call UploadImagem(Me.upFile7_2, Me.txt7_2.Text, 7, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto7_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_3.Click
        Call UploadImagem(Me.upFile7_3, Me.txt7_3.Text, 7, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto7_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_4.Click
        Call UploadImagem(Me.upFile7_4, Me.txt7_4.Text, 7, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto7_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_5.Click
        Call UploadImagem(Me.upFile7_5, Me.txt7_5.Text, 7, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto7_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_6.Click
        Call UploadImagem(Me.upFile7_6, Me.txt7_6.Text, 7, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto7_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_7.Click
        Call UploadImagem(Me.upFile7_7, Me.txt7_7.Text, 7, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto7_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_8.Click
        Call UploadImagem(Me.upFile7_8, Me.txt7_8.Text, 7, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto7_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto7_9.Click
        Call UploadImagem(Me.upFile7_9, Me.txt7_9.Text, 7, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto8_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_1.Click
        Call UploadImagem(Me.upFile8_1, Me.txt8_1.Text, 8, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto8_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_2.Click
        Call UploadImagem(Me.upFile8_2, Me.txt8_2.Text, 8, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto8_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_3.Click
        Call UploadImagem(Me.upFile8_3, Me.txt8_3.Text, 8, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto8_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_4.Click
        Call UploadImagem(Me.upFile8_4, Me.txt8_4.Text, 8, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto8_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_5.Click
        Call UploadImagem(Me.upFile8_5, Me.txt8_5.Text, 8, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto8_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_6.Click
        Call UploadImagem(Me.upFile8_6, Me.txt8_6.Text, 8, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto8_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_7.Click
        Call UploadImagem(Me.upFile8_7, Me.txt8_7.Text, 8, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto8_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_8.Click
        Call UploadImagem(Me.upFile8_8, Me.txt8_8.Text, 8, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto8_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_9.Click
        Call UploadImagem(Me.upFile8_9, Me.txt8_9.Text, 8, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto8_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_10.Click
        Call UploadImagem(Me.upFile8_10, Me.txt8_10.Text, 8, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto8_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_11.Click
        Call UploadImagem(Me.upFile8_11, Me.txt8_11.Text, 8, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto8_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_12.Click
        Call UploadImagem(Me.upFile8_12, Me.txt8_12.Text, 8, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto8_13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_13.Click
        Call UploadImagem(Me.upFile8_13, Me.txt8_13.Text, 8, 1, 13)
    End Sub
    Protected Sub btnSalvarFoto8_14_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_14.Click
        Call UploadImagem(Me.upFile8_14, Me.txt8_14.Text, 8, 1, 14)
    End Sub
    Protected Sub btnSalvarFoto8_15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto8_15.Click
        Call UploadImagem(Me.upFile8_15, Me.txt8_15.Text, 8, 1, 15)
    End Sub
    Protected Sub btnSalvarFoto9_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_1.Click
        Call UploadImagem(Me.upFile9_1, Me.txt9_1.Text, 9, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto9_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_2.Click
        Call UploadImagem(Me.upFile9_2, Me.txt9_2.Text, 9, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto9_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_3.Click
        Call UploadImagem(Me.upFile9_3, Me.txt9_3.Text, 9, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto9_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_4.Click
        Call UploadImagem(Me.upFile9_4, Me.txt9_4.Text, 9, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto9_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_5.Click
        Call UploadImagem(Me.upFile9_5, Me.txt9_5.Text, 9, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto9_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_6.Click
        Call UploadImagem(Me.upFile9_6, Me.txt9_6.Text, 9, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto9_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_7.Click
        Call UploadImagem(Me.upFile9_7, Me.txt9_7.Text, 9, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto9_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_8.Click
        Call UploadImagem(Me.upFile9_8, Me.txt9_8.Text, 9, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto9_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_9.Click
        Call UploadImagem(Me.upFile9_9, Me.txt9_9.Text, 9, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto9_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_10.Click
        Call UploadImagem(Me.upFile9_10, Me.txt9_10.Text, 9, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto9_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto9_11.Click
        Call UploadImagem(Me.upFile9_11, Me.txt9_11.Text, 9, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto10_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_1.Click
        Call UploadImagem(Me.upFile10_1, Me.txt10_1.Text, 10, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto10_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_2.Click
        Call UploadImagem(Me.upFile10_2, Me.txt10_2.Text, 10, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto10_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_3.Click
        Call UploadImagem(Me.upFile10_3, Me.txt10_3.Text, 10, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto10_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_4.Click
        Call UploadImagem(Me.upFile10_4, Me.txt10_4.Text, 10, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto10_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_5.Click
        Call UploadImagem(Me.upFile10_5, Me.txt10_5.Text, 10, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto10_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_6.Click
        Call UploadImagem(Me.upFile10_6, Me.txt10_6.Text, 10, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto10_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_7.Click
        Call UploadImagem(Me.upFile10_7, Me.txt10_7.Text, 10, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto10_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto10_8.Click
        Call UploadImagem(Me.upFile10_8, Me.txt10_8.Text, 10, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto11_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto11_1.Click
        Call UploadImagem(Me.upFile11_1, Me.txt11_1.Text, 11, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto11_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto11_2.Click
        Call UploadImagem(Me.upFile11_2, Me.txt11_2.Text, 11, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto11_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto11_3.Click
        Call UploadImagem(Me.upFile11_3, Me.txt11_3.Text, 11, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto12_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_1.Click
        Call UploadImagem(Me.upFile12_1, Me.txt12_1.Text, 12, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto12_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_2.Click
        Call UploadImagem(Me.upFile12_2, Me.txt12_2.Text, 12, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto12_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_3.Click
        Call UploadImagem(Me.upFile12_3, Me.txt12_3.Text, 12, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto12_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_4.Click
        Call UploadImagem(Me.upFile12_4, Me.txt12_4.Text, 12, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto12_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_5.Click
        Call UploadImagem(Me.upFile12_5, Me.txt12_5.Text, 12, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto12_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_6.Click
        Call UploadImagem(Me.upFile12_6, Me.txt12_6.Text, 12, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto12_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_7.Click
        Call UploadImagem(Me.upFile12_7, Me.txt12_7.Text, 12, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto12_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_8.Click
        Call UploadImagem(Me.upFile12_8, Me.txt12_8.Text, 12, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto12_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto12_9.Click
        Call UploadImagem(Me.upFile12_9, Me.txt12_9.Text, 12, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto13_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_1.Click
        Call UploadImagem(Me.upFile13_1, Me.txt13_1.Text, 13, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto13_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_2.Click
        Call UploadImagem(Me.upFile13_2, Me.txt13_2.Text, 13, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto13_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_3.Click
        Call UploadImagem(Me.upFile13_3, Me.txt13_3.Text, 13, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto13_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_4.Click
        Call UploadImagem(Me.upFile13_4, Me.txt13_4.Text, 13, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto13_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_5.Click
        Call UploadImagem(Me.upFile13_5, Me.txt13_5.Text, 13, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto13_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_6.Click
        Call UploadImagem(Me.upFile13_6, Me.txt13_6.Text, 13, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto13_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_7.Click
        Call UploadImagem(Me.upFile13_7, Me.txt13_7.Text, 13, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto13_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_8.Click
        Call UploadImagem(Me.upFile13_8, Me.txt13_8.Text, 13, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto13_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_9.Click
        Call UploadImagem(Me.upFile13_9, Me.txt13_9.Text, 13, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto13_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_10.Click
        Call UploadImagem(Me.upFile13_10, Me.txt13_10.Text, 13, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto13_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_11.Click
        Call UploadImagem(Me.upFile13_11, Me.txt13_11.Text, 13, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto13_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_12.Click
        Call UploadImagem(Me.upFile13_12, Me.txt13_12.Text, 13, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto13_13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto13_13.Click
        Call UploadImagem(Me.upFile13_13, Me.txt13_13.Text, 13, 1, 13)
    End Sub
    Protected Sub btnSalvarFoto14_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_1.Click
        Call UploadImagem(Me.upFile14_1, Me.txt14_1.Text, 14, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto14_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_2.Click
        Call UploadImagem(Me.upFile14_2, Me.txt14_2.Text, 14, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto14_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_3.Click
        Call UploadImagem(Me.upFile14_3, Me.txt14_3.Text, 14, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto14_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_4.Click
        Call UploadImagem(Me.upFile14_4, Me.txt14_4.Text, 14, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto14_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_5.Click
        Call UploadImagem(Me.upFile14_5, Me.txt14_5.Text, 14, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto14_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_6.Click
        Call UploadImagem(Me.upFile14_6, Me.txt14_6.Text, 14, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto14_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_7.Click
        Call UploadImagem(Me.upFile14_7, Me.txt14_7.Text, 14, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto14_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_8.Click
        Call UploadImagem(Me.upFile14_8, Me.txt14_8.Text, 14, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto14_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_9.Click
        Call UploadImagem(Me.upFile14_9, Me.txt14_9.Text, 14, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto14_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto14_10.Click
        Call UploadImagem(Me.upFile14_10, Me.txt14_10.Text, 14, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto15_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto15_1.Click
        Call UploadImagem(Me.upFile15_1, Me.txt15_1.Text, 15, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto15_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto15_2.Click
        Call UploadImagem(Me.upFile15_2, Me.txt15_2.Text, 15, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto15_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto15_3.Click
        Call UploadImagem(Me.upFile15_3, Me.txt15_3.Text, 15, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto15_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto15_4.Click
        Call UploadImagem(Me.upFile15_4, Me.txt15_4.Text, 15, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto15_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto15_5.Click
        Call UploadImagem(Me.upFile15_5, Me.txt15_5.Text, 15, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto16_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_1.Click
        Call UploadImagem(Me.upFile16_1, Me.txt16_1.Text, 16, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto16_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_2.Click
        Call UploadImagem(Me.upFile16_2, Me.txt16_2.Text, 16, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto16_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_3.Click
        Call UploadImagem(Me.upFile16_3, Me.txt16_3.Text, 16, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto16_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_4.Click
        Call UploadImagem(Me.upFile16_4, Me.txt16_4.Text, 16, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto16_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_5.Click
        Call UploadImagem(Me.upFile16_5, Me.txt16_5.Text, 16, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto16_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_6.Click
        Call UploadImagem(Me.upFile16_6, Me.txt16_6.Text, 16, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto16_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_7.Click
        Call UploadImagem(Me.upFile16_7, Me.txt16_7.Text, 16, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto16_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_8.Click
        Call UploadImagem(Me.upFile16_8, Me.txt16_8.Text, 16, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto16_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_9.Click
        Call UploadImagem(Me.upFile16_9, Me.txt16_9.Text, 16, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto16_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_10.Click
        Call UploadImagem(Me.upFile16_10, Me.txt16_10.Text, 16, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto16_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_11.Click
        Call UploadImagem(Me.upFile16_11, Me.txt16_11.Text, 16, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto16_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto16_12.Click
        Call UploadImagem(Me.upFile16_12, Me.txt16_12.Text, 16, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto17_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_1.Click
        Call UploadImagem(Me.upFile17_1, Me.txt17_1.Text, 17, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto17_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_2.Click
        Call UploadImagem(Me.upFile17_2, Me.txt17_2.Text, 17, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto17_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_3.Click
        Call UploadImagem(Me.upFile17_3, Me.txt17_3.Text, 17, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto17_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_4.Click
        Call UploadImagem(Me.upFile17_4, Me.txt17_4.Text, 17, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto17_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_5.Click
        Call UploadImagem(Me.upFile17_5, Me.txt17_5.Text, 17, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto17_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_6.Click
        Call UploadImagem(Me.upFile17_6, Me.txt17_6.Text, 17, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto17_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_7.Click
        Call UploadImagem(Me.upFile17_7, Me.txt17_7.Text, 17, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto17_8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_8.Click
        Call UploadImagem(Me.upFile17_8, Me.txt17_8.Text, 17, 1, 8)
    End Sub
    Protected Sub btnSalvarFoto17_9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_9.Click
        Call UploadImagem(Me.upFile17_9, Me.txt17_9.Text, 17, 1, 9)
    End Sub
    Protected Sub btnSalvarFoto17_10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_10.Click
        Call UploadImagem(Me.upFile17_10, Me.txt17_10.Text, 17, 1, 10)
    End Sub
    Protected Sub btnSalvarFoto17_11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_11.Click
        Call UploadImagem(Me.upFile17_11, Me.txt17_11.Text, 17, 1, 11)
    End Sub
    Protected Sub btnSalvarFoto17_12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto17_12.Click
        Call UploadImagem(Me.upFile17_12, Me.txt17_12.Text, 17, 1, 12)
    End Sub
    Protected Sub btnSalvarFoto18_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_1.Click
        Call UploadImagem(Me.upFile18_1, Me.txt18_1.Text, 18, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto18_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_2.Click
        Call UploadImagem(Me.upFile18_2, Me.txt18_2.Text, 18, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto18_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_3.Click
        Call UploadImagem(Me.upFile18_3, Me.txt18_3.Text, 18, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto18_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_4.Click
        Call UploadImagem(Me.upFile18_4, Me.txt18_4.Text, 18, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto18_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_5.Click
        Call UploadImagem(Me.upFile18_5, Me.txt18_5.Text, 18, 1, 5)
    End Sub
    Protected Sub btnSalvarFoto18_6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_6.Click
        Call UploadImagem(Me.upFile18_6, Me.txt18_6.Text, 18, 1, 6)
    End Sub
    Protected Sub btnSalvarFoto18_7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto18_7.Click
        Call UploadImagem(Me.upFile18_7, Me.txt18_7.Text, 18, 1, 7)
    End Sub
    Protected Sub btnSalvarFoto19_1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto19_1.Click
        Call UploadImagem(Me.upFile19_1, Me.txt19_1.Text, 19, 1, 1)
    End Sub
    Protected Sub btnSalvarFoto19_2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto19_2.Click
        Call UploadImagem(Me.upFile19_2, Me.txt19_2.Text, 19, 1, 2)
    End Sub
    Protected Sub btnSalvarFoto19_3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto19_3.Click
        Call UploadImagem(Me.upFile19_3, Me.txt19_3.Text, 19, 1, 3)
    End Sub
    Protected Sub btnSalvarFoto19_4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto19_4.Click
        Call UploadImagem(Me.upFile19_4, Me.txt19_4.Text, 19, 1, 4)
    End Sub
    Protected Sub btnSalvarFoto19_5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSalvarFoto19_5.Click
        Call UploadImagem(Me.upFile19_5, Me.txt19_5.Text, 19, 1, 5)
    End Sub

#End Region

#Region "Eventos MENU"

    Protected Sub btnMenu_1_Click(sender As Object, e As EventArgs)
        panDados1.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_2_Click(sender As Object, e As EventArgs)
        panDados2.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_3_Click(sender As Object, e As EventArgs)
        panDados3.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_4_Click(sender As Object, e As EventArgs)
        panDados4.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_5_Click(sender As Object, e As EventArgs)
        panDados5.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_6_Click(sender As Object, e As EventArgs)
        panDados6.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_7_Click(sender As Object, e As EventArgs)
        panDados7.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_8_Click(sender As Object, e As EventArgs)
        panDados8.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_9_Click(sender As Object, e As EventArgs)
        panDados9.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_10_Click(sender As Object, e As EventArgs)
        panDados10.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_11_Click(sender As Object, e As EventArgs)
        panDados11.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_12_Click(sender As Object, e As EventArgs)
        panDados12.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_13_Click(sender As Object, e As EventArgs)
        panDados13.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_14_Click(sender As Object, e As EventArgs)
        panDados14.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_15_Click(sender As Object, e As EventArgs)
        panDados15.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_16_Click(sender As Object, e As EventArgs)
        panDados16.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_17_Click(sender As Object, e As EventArgs)
        panDados17.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_18_Click(sender As Object, e As EventArgs)
        panDados18.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnMenu_19_Click(sender As Object, e As EventArgs)
        panDados19.Visible = True
        divMenu.Visible = False
        divVoltar.Visible = True
    End Sub

    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs)
        panDados1.Visible = False
        panDados2.Visible = False
        panDados3.Visible = False
        panDados4.Visible = False
        panDados5.Visible = False
        panDados6.Visible = False
        panDados7.Visible = False
        panDados8.Visible = False
        panDados9.Visible = False
        panDados10.Visible = False
        panDados11.Visible = False
        panDados12.Visible = False
        panDados13.Visible = False
        panDados14.Visible = False
        panDados15.Visible = False
        panDados16.Visible = False
        panDados17.Visible = False
        panDados18.Visible = False
        panDados19.Visible = False
        divVoltar.Visible = False
        divMenu.Visible = True
    End Sub



#End Region

#Region "Evento Gerar Relatório"

    Private Sub carregaRelatorio()
        Dim html As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SP_GERA_RELATORIO_CHEKLIST")

                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Add(New SqlParameter("@dia", SqlDbType.VarChar))
                cmd.Parameters("@dia").Value = txtData.Value

                cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
                cmd.Parameters("@idFilial").Value = selFilial.SelectedValue.ToString()

                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        For Each tabela In ds.Tables(0).Rows

                            html += <![CDATA[<div Class="row row-cols-auto" style="align-content: center; align-items: center;">
                            <div Class="col-1"><br /></div>
                            <div Class="col-6">
                            <div Class="row justify-content-between">
                            <div Class="col-2">
                            <strong> Filial: <b style="color: white">-----</b></strong>]]>.Value()

                            html += tabela(0)

                            html += <![CDATA[<b style="color: white">-------</b>
                            <strong> Dia: <b style="color: white">----</b></strong>]]>.Value()

                            html += tabela(1)

                            html += <![CDATA[</div>
                            </div>
                            <hr>
                            <div Class="row justify-content-between">
                            <div Class="col-2">
                            <strong> Grupo: <b style="color: white">---</b></strong>]]>.Value()

                            html += tabela(2)

                            html += <![CDATA[
                            <b style="color: white">-------</b>
                            <strong> Sub-Grupo: <b style="color: white">-----</b></strong>]]>.Value()

                            html += tabela(3)

                            html += <![CDATA[</div>
                            </div>
                            <hr>
                            <div Class="row justify-content-between">
                            <div Class="col-2" style="color: #0000FF">
                            <strong> Pergunta: </strong>
                            <a style="color: #0010FF"> ]]>.Value().ToString()

                            html += Replace(tabela(4), "–", "-")

                            html += <![CDATA[</a>
                            </div>
                            <hr>
                            <div Class="row justify-content-between" >
                            <div Class="col-2" style="color: #FF0000">
                            <strong> Resposta: </strong>
                            <a style="color: #FF0001"> ]]>.Value()

                            html += tabela(5)

                            If (tabela(7).ToString.Length > 0) Then
                                html += <![CDATA[</a><br /><b style="color: white">_</b>
                                </div>                              
                                <div Class="col-4">]]>.Value()

                                Dim imageBytes() As Byte = tabela(6)
                                html += "<img src='"
                                html += String.Format("data:image/{0};base64,{1}", "png", Convert.ToBase64String(imageBytes))
                                html += "' >"
                            Else
                                html += <![CDATA[</a>
                                </div>
                                <div Class="col-4">]]>.Value()

                            End If

                            html += <![CDATA[</div>
                            <div Class="col-1"></div>
                            </div>
                            _____________________________________________________________________________]]>.Value()

                        Next
                    End Using
                End Using
            End Using
        End Using

        renderRel.InnerHtml = html

    End Sub

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

        oCh.GerarRelatorio(txtData.Value, Me.selFilial.SelectedValue)
        If (selFilial.SelectedValue <= 9) Then
            Call Linkar("RelatorioChecklist_F00" + selFilial.SelectedValue + ".aspx", Me.selFilial.SelectedValue)
        ElseIf (selFilial.SelectedValue <= 100) Then
            Call Linkar("RelatorioChecklist_F0" + selFilial.SelectedValue + ".aspx", Me.selFilial.SelectedValue)
        Else
            Call Linkar("RelatorioChecklist_F" + selFilial.SelectedValue + ".aspx", Me.selFilial.SelectedValue)
        End If

        'Call carregaRelatorio()
        ' ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "createPDF();", True)

    End Sub

    Private Sub HabilitarGerarRelatorio()

        Select Case Me.selFilial.SelectedValue
            Case 1, 2, 35, 12, 59
                Me.btnPDF.Enabled = False
            Case Else
                Me.btnPDF.Enabled = True
        End Select
    End Sub


#End Region

End Class
