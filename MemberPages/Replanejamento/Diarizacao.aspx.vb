Imports System.Math
Imports System.Data
Imports System.Data.SqlClient


Partial Class MemberPages_Planejamento_Diarizacao
    Inherits System.Web.UI.Page

    Dim strConn As String = clData_gerManager.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Private connBI As String = clDataDb_gerBI.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerBI;User ID=sa;Password=rd700@1"

    Dim strTrigger, strTriggerMeta, strTriggerRev, strUser, varCodPessoalAdm As String
    Dim varTodasContas As Integer
    Dim varFilial As String
    Dim oVem As New VendaEmpresaMes
    Dim oBI As New BI
    Dim oDW As New clData_DW_Condor


    Private Sub MudarLegendasDia()

        MudarLegendasDia_Det(lbl_Dia1, "01")
        MudarLegendasDia_Det(lbl_Dia2, "02")
        MudarLegendasDia_Det(lbl_Dia3, "03")
        MudarLegendasDia_Det(lbl_Dia4, "04")
        MudarLegendasDia_Det(lbl_Dia5, "05")
        MudarLegendasDia_Det(lbl_Dia6, "06")
        MudarLegendasDia_Det(lbl_Dia7, "07")
        MudarLegendasDia_Det(lbl_Dia8, "08")
        MudarLegendasDia_Det(lbl_Dia9, "09")
        MudarLegendasDia_Det(lbl_Dia10, "10")
        MudarLegendasDia_Det(lbl_Dia11, "11")

        MudarLegendasDia_Det(lbl_Dia12, "12")
        MudarLegendasDia_Det(lbl_Dia13, "13")
        MudarLegendasDia_Det(lbl_Dia14, "14")
        MudarLegendasDia_Det(lbl_Dia15, "15")
        MudarLegendasDia_Det(lbl_Dia16, "16")
        MudarLegendasDia_Det(lbl_Dia17, "17")
        MudarLegendasDia_Det(lbl_Dia18, "18")
        MudarLegendasDia_Det(lbl_Dia19, "19")
        MudarLegendasDia_Det(lbl_Dia20, "20")
        MudarLegendasDia_Det(lbl_Dia21, "21")
        MudarLegendasDia_Det(lbl_Dia22, "22")

        MudarLegendasDia_Det(lbl_Dia23, "23")
        MudarLegendasDia_Det(lbl_Dia24, "24")
        MudarLegendasDia_Det(lbl_Dia25, "25")
        MudarLegendasDia_Det(lbl_Dia26, "26")
        MudarLegendasDia_Det(lbl_Dia27, "27")
        MudarLegendasDia_Det(lbl_Dia28, "28")


        Select Case cboMes.CallMes
            Case 1, 3, 5, 7, 8, 10, 12
                MudarLegendasDia_Det(lbl_Dia29, "29")
                MudarLegendasDia_Det(lbl_Dia30, "30")
                MudarLegendasDia_Det(lbl_Dia31, "31")
            Case 4, 6, 9, 11
                MudarLegendasDia_Det(lbl_Dia29, "29")
                MudarLegendasDia_Det(lbl_Dia30, "30")
            Case 2
                If oVem.LeapYear(cboAno.CallAno) = True Then MudarLegendasDia_Det(lbl_Dia29, "29")
        End Select


    End Sub


    Private Sub MudarLegendasDia_Det(ByVal lblTexto As Label, ByVal Dia As Byte)

        If cboMes.CallMes < 10 Then
            If Dia < 10 Then
                lblTexto.Text = "0" & Dia & "/0" & Session("sMES") & "/" & Session("sANO")
            Else
                lblTexto.Text = Dia & "/0" & Session("sMES") & "/" & Session("sANO")
            End If
        Else
            If Dia < 10 Then
                lblTexto.Text = "0" & Dia & "/" & Session("sMES") & "/" & Session("sANO")
            Else
                lblTexto.Text = Dia & "/" & Session("sMES") & "/" & Session("sANO")
            End If
        End If
        

    End Sub

    Private Sub ZerarCampos()
        Me.txt_Dia1.Text = 0
        Me.txt_Dia2.Text = 0
        Me.txt_Dia3.Text = 0
        Me.txt_Dia4.Text = 0
        Me.txt_Dia5.Text = 0
        Me.txt_Dia6.Text = 0
        Me.txt_Dia7.Text = 0
        Me.txt_Dia8.Text = 0
        Me.txt_Dia9.Text = 0

        Me.txt_Dia10.Text = 0
        Me.txt_Dia11.Text = 0
        Me.txt_Dia12.Text = 0
        Me.txt_Dia13.Text = 0
        Me.txt_Dia14.Text = 0
        Me.txt_Dia15.Text = 0
        Me.txt_Dia16.Text = 0
        Me.txt_Dia17.Text = 0
        Me.txt_Dia18.Text = 0
        Me.txt_Dia19.Text = 0

        Me.txt_Dia20.Text = 0
        Me.txt_Dia21.Text = 0
        Me.txt_Dia22.Text = 0
        Me.txt_Dia23.Text = 0
        Me.txt_Dia24.Text = 0
        Me.txt_Dia25.Text = 0
        Me.txt_Dia26.Text = 0
        Me.txt_Dia27.Text = 0
        Me.txt_Dia28.Text = 0

        Select Case cboMes.CallMes
            Case 1, 3, 5, 7, 8, 10, 12
                Me.txt_Dia29.Text = 0
                Me.txt_Dia30.Text = 0
                Me.txt_Dia31.Text = 0
            Case 4, 6, 9, 11
                Me.txt_Dia29.Text = 0
                Me.txt_Dia30.Text = 0
            Case 2
                If oVem.LeapYear(cboAno.CallAno) = True Then Me.txt_Dia29.Text = 0
        End Select

    End Sub

    
    Sub Totalizar()
    Dim no As Double
    Dim Dia(31) As Double

        Double.TryParse(lblTotal.Text, no)

    If Me.txt_Dia1.Text = "" Then Me.txt_Dia1.Text = 0
    If Me.txt_Dia2.Text = "" Then Me.txt_Dia2.Text = 0
    If Me.txt_Dia3.Text = "" Then Me.txt_Dia3.Text = 0
    If Me.txt_Dia4.Text = "" Then Me.txt_Dia4.Text = 0
    If Me.txt_Dia5.Text = "" Then Me.txt_Dia5.Text = 0
    If Me.txt_Dia6.Text = "" Then Me.txt_Dia6.Text = 0
    If Me.txt_Dia7.Text = "" Then Me.txt_Dia7.Text = 0
    If Me.txt_Dia8.Text = "" Then Me.txt_Dia8.Text = 0
    If Me.txt_Dia9.Text = "" Then Me.txt_Dia9.Text = 0

    If Me.txt_Dia10.Text = "" Then Me.txt_Dia10.Text = 0
    If Me.txt_Dia11.Text = "" Then Me.txt_Dia11.Text = 0
    If Me.txt_Dia12.Text = "" Then Me.txt_Dia12.Text = 0
    If Me.txt_Dia13.Text = "" Then Me.txt_Dia13.Text = 0
    If Me.txt_Dia14.Text = "" Then Me.txt_Dia14.Text = 0
    If Me.txt_Dia15.Text = "" Then Me.txt_Dia15.Text = 0
    If Me.txt_Dia16.Text = "" Then Me.txt_Dia16.Text = 0
    If Me.txt_Dia17.Text = "" Then Me.txt_Dia17.Text = 0
    If Me.txt_Dia18.Text = "" Then Me.txt_Dia18.Text = 0
    If Me.txt_Dia19.Text = "" Then Me.txt_Dia19.Text = 0

    If Me.txt_Dia20.Text = "" Then Me.txt_Dia20.Text = 0
    If Me.txt_Dia21.Text = "" Then Me.txt_Dia21.Text = 0
    If Me.txt_Dia22.Text = "" Then Me.txt_Dia22.Text = 0
    If Me.txt_Dia23.Text = "" Then Me.txt_Dia23.Text = 0
    If Me.txt_Dia24.Text = "" Then Me.txt_Dia24.Text = 0
    If Me.txt_Dia25.Text = "" Then Me.txt_Dia25.Text = 0
    If Me.txt_Dia26.Text = "" Then Me.txt_Dia26.Text = 0
    If Me.txt_Dia27.Text = "" Then Me.txt_Dia27.Text = 0
    If Me.txt_Dia28.Text = "" Then Me.txt_Dia28.Text = 0
    If Me.txt_Dia29.Text = "" Then Me.txt_Dia29.Text = 0

    If Me.txt_Dia30.Text = "" Then Me.txt_Dia30.Text = 0
    If Me.txt_Dia31.Text = "" Then Me.txt_Dia31.Text = 0

    Dia(0) = CDbl(Me.txt_Dia1.Text)
    Dia(1) = CDbl(Me.txt_Dia2.Text)
    Dia(2) = CDbl(Me.txt_Dia3.Text)
    Dia(3) = CDbl(Me.txt_Dia4.Text)
    Dia(4) = CDbl(Me.txt_Dia5.Text)
    Dia(5) = CDbl(Me.txt_Dia6.Text)
    Dia(6) = CDbl(Me.txt_Dia7.Text)
    Dia(7) = CDbl(Me.txt_Dia8.Text)
    Dia(8) = CDbl(Me.txt_Dia9.Text)

    Dia(9) = CDbl(Me.txt_Dia10.Text)
    Dia(10) = CDbl(Me.txt_Dia11.Text)
    Dia(11) = CDbl(Me.txt_Dia12.Text)
    Dia(12) = CDbl(Me.txt_Dia13.Text)
    Dia(13) = CDbl(Me.txt_Dia14.Text)
    Dia(14) = CDbl(Me.txt_Dia15.Text)
    Dia(15) = CDbl(Me.txt_Dia16.Text)
    Dia(16) = CDbl(Me.txt_Dia17.Text)
    Dia(17) = CDbl(Me.txt_Dia18.Text)
    Dia(18) = CDbl(Me.txt_Dia19.Text)

    Dia(19) = CDbl(Me.txt_Dia20.Text)
    Dia(20) = CDbl(Me.txt_Dia21.Text)
    Dia(21) = CDbl(Me.txt_Dia22.Text)
    Dia(22) = CDbl(Me.txt_Dia23.Text)
    Dia(23) = CDbl(Me.txt_Dia24.Text)
    Dia(24) = CDbl(Me.txt_Dia25.Text)
    Dia(25) = CDbl(Me.txt_Dia26.Text)
    Dia(26) = CDbl(Me.txt_Dia27.Text)
    Dia(27) = CDbl(Me.txt_Dia28.Text)
    Dia(28) = CDbl(Me.txt_Dia29.Text)

    Dia(29) = CDbl(Me.txt_Dia30.Text)
    Dia(30) = CDbl(Me.txt_Dia31.Text)


    no = 0
    no += Dia(0)
    no += Dia(1)
    no += Dia(2)
    no += Dia(3)
    no += Dia(4)
    no += Dia(5)
    no += Dia(6)
    no += Dia(7)
    no += Dia(8)
    no += Dia(9)

    no += Dia(10)
    no += Dia(11)
    no += Dia(12)
    no += Dia(13)
    no += Dia(14)
    no += Dia(15)
    no += Dia(16)
    no += Dia(17)
    no += Dia(18)
    no += Dia(19)

    no += Dia(20)
    no += Dia(21)
    no += Dia(22)
    no += Dia(23)
    no += Dia(24)
    no += Dia(25)
    no += Dia(26)
    no += Dia(27)
    no += Dia(28)
    no += Dia(29)

    no += Dia(30)
    no += Dia(31)

       

        Me.lblTotal.Text = Format(no, "#,##0")


'        If IsNothing(Me.lbl_vlrMetaTotal.Text) Then
'            Me.lbl_percMetaTotal.Text = 0
'        ElseIf IsNothing(Me.lbl_vlrHist1_Total.Text) Then
'            Me.lbl_percMetaTotal.Text = 0
'        Else
'            Me.lbl_percMetaTotal.Text = CalcularCrescimento(Me.lbl_vlrMetaTotal.Text, Me.lbl_vlrHist1_Total.Text)
'        End If


'        'If CSng(Me.txt_vlrMeta01.Text) < 0 Then Me.txt_vlrMeta01.ForeColor = Drawing.Color.Red

'        ''If CSng(Me.txt_vlrMeta01.Text) >= 0 Then Me.txt_vlrMeta01.ForeColor = Drawing.Color.Black

End Sub

'****************************************

    Sub DefinirOpcaoSalvar()
        Me.btnSalvar.btnSalvar_Enabled = True
        Call mySession()
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call DefinirOpcaoSalvar()
        'Call Atualizar()
    End Sub

  
    Private Sub TriggerSalvar()

        Call Salvar()

    End Sub

    Private Sub Salvar()
        Dim oVem As New VendaEmpresaMes
        'Salvar Subgrupo - Mes
        SalvarVendaDia(CDate(Me.lbl_Dia1.Text), CDec(Me.txt_Dia1.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia2.Text), CDec(Me.txt_Dia2.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia3.Text), CDec(Me.txt_Dia3.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia4.Text), CDec(Me.txt_Dia4.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia5.Text), CDec(Me.txt_Dia5.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia6.Text), CDec(Me.txt_Dia6.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia7.Text), CDec(Me.txt_Dia7.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia8.Text), CDec(Me.txt_Dia8.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia9.Text), CDec(Me.txt_Dia9.Text))

        SalvarVendaDia(CDate(Me.lbl_Dia10.Text), CDec(Me.txt_Dia10.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia11.Text), CDec(Me.txt_Dia11.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia12.Text), CDec(Me.txt_Dia12.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia13.Text), CDec(Me.txt_Dia13.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia14.Text), CDec(Me.txt_Dia14.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia15.Text), CDec(Me.txt_Dia15.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia16.Text), CDec(Me.txt_Dia16.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia17.Text), CDec(Me.txt_Dia17.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia18.Text), CDec(Me.txt_Dia18.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia19.Text), CDec(Me.txt_Dia19.Text))

        SalvarVendaDia(CDate(Me.lbl_Dia20.Text), CDec(Me.txt_Dia20.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia21.Text), CDec(Me.txt_Dia21.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia22.Text), CDec(Me.txt_Dia22.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia23.Text), CDec(Me.txt_Dia23.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia24.Text), CDec(Me.txt_Dia24.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia25.Text), CDec(Me.txt_Dia25.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia26.Text), CDec(Me.txt_Dia26.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia27.Text), CDec(Me.txt_Dia27.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia28.Text), CDec(Me.txt_Dia28.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia29.Text), CDec(Me.txt_Dia29.Text))

        SalvarVendaDia(CDate(Me.lbl_Dia30.Text), CDec(Me.txt_Dia30.Text))
        SalvarVendaDia(CDate(Me.lbl_Dia31.Text), CDec(Me.txt_Dia31.Text))




        

    End Sub

    Sub SalvarVendaDia(ByVal myDia As Date, ByVal myVlr As Decimal)
        Dim sConnStr As String = connBI
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("Metas.usp_IncluirVendaPorDiaDasLojas", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Dia", Data.SqlDbType.Date))
        cmdTest.Parameters("@Dia").Value = myDia

        cmdTest.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        cmdTest.Parameters.Add(New SqlParameter("@vlr", Data.SqlDbType.Money))
        cmdTest.Parameters("@vlr").Value = myVlr

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()
    End Sub

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
    End Sub


#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(185, User.Identity.Name)

            Me.btnSalvar.btnSalvar_Text = "Salvar"

            Me.cboFilial.Visible_cboCorporacao = True

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = 2026

            If Month(Now()) > 11 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Me.cboMes.CallMes = 1
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Diarização - PGR185"
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboMes.Visible_Ano = False
            MudarLegendasDia()



            Me.txt_Dia1.Focus()
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call BuscarMetaDeVendaPorDia()
            Call mySession()
            Me.ASPxGridView1.DataBind()
            'If Me.cboFilial.IsLoja = True Then Me.ASPxGridView1.Visible = False
        End If

    End Sub

#End Region

    Private Sub BuscarMetaDeVendaPorDia()
        Me.txt_Dia1.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia1.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia2.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia2.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia3.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia3.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia4.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia4.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia5.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia5.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia6.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia6.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia7.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia7.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia8.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia8.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia9.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia9.Text), Me.cboFilial.CallFilial)

        Me.txt_Dia10.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia10.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia11.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia11.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia12.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia12.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia13.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia13.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia14.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia14.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia15.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia15.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia16.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia16.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia17.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia17.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia18.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia18.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia19.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia19.Text), Me.cboFilial.CallFilial)

        Me.txt_Dia20.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia20.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia21.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia21.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia22.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia22.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia23.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia23.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia24.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia24.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia25.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia25.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia26.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia26.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia27.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia27.Text), Me.cboFilial.CallFilial)
        Me.txt_Dia28.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia28.Text), Me.cboFilial.CallFilial)

        lbl_Dia29.Visible = True
        txt_Dia29.Visible = True
        lbl_Dia30.Visible = True
        txt_Dia30.Visible = True
        lbl_Dia31.Visible = True
        txt_Dia31.Visible = True

        Select Case cboMes.CallMes
            Case 1, 3, 5, 7, 8, 10, 12

                Me.txt_Dia29.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia29.Text), Me.cboFilial.CallFilial)
                Me.txt_Dia30.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia30.Text), Me.cboFilial.CallFilial)
                Me.txt_Dia31.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia31.Text), Me.cboFilial.CallFilial)
            Case 4, 6, 9, 11
                Me.txt_Dia29.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia29.Text), Me.cboFilial.CallFilial)
                Me.txt_Dia30.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia30.Text), Me.cboFilial.CallFilial)

                lbl_Dia31.Visible = False
                txt_Dia31.Visible = False
            Case 2

                lbl_Dia29.Visible = False
                txt_Dia29.Visible = False
                lbl_Dia30.Visible = False
                txt_Dia30.Visible = False
                lbl_Dia31.Visible = False
                txt_Dia31.Visible = False

                If oVem.LeapYear(cboAno.CallAno) = True Then

                    Me.txt_Dia29.Text = BuscaMetaVendaDia(CDate(Me.lbl_Dia29.Text), Me.cboFilial.CallFilial)
                End If

        End Select

        Funcao_FormatarCampos(Me.txt_Dia1)
        Funcao_FormatarCampos(Me.txt_Dia2)
        Funcao_FormatarCampos(Me.txt_Dia3)
        Funcao_FormatarCampos(Me.txt_Dia4)
        Funcao_FormatarCampos(Me.txt_Dia5)
        Funcao_FormatarCampos(Me.txt_Dia6)
        Funcao_FormatarCampos(Me.txt_Dia7)
        Funcao_FormatarCampos(Me.txt_Dia8)
        Funcao_FormatarCampos(Me.txt_Dia9)

        Funcao_FormatarCampos(Me.txt_Dia10)
        Funcao_FormatarCampos(Me.txt_Dia11)
        Funcao_FormatarCampos(Me.txt_Dia12)
        Funcao_FormatarCampos(Me.txt_Dia13)
        Funcao_FormatarCampos(Me.txt_Dia14)
        Funcao_FormatarCampos(Me.txt_Dia15)
        Funcao_FormatarCampos(Me.txt_Dia16)
        Funcao_FormatarCampos(Me.txt_Dia17)
        Funcao_FormatarCampos(Me.txt_Dia18)
        Funcao_FormatarCampos(Me.txt_Dia19)

        Funcao_FormatarCampos(Me.txt_Dia20)
        Funcao_FormatarCampos(Me.txt_Dia21)
        Funcao_FormatarCampos(Me.txt_Dia22)
        Funcao_FormatarCampos(Me.txt_Dia23)
        Funcao_FormatarCampos(Me.txt_Dia24)
        Funcao_FormatarCampos(Me.txt_Dia25)
        Funcao_FormatarCampos(Me.txt_Dia26)
        Funcao_FormatarCampos(Me.txt_Dia27)
        Funcao_FormatarCampos(Me.txt_Dia28)
        Funcao_FormatarCampos(Me.txt_Dia29)

        Funcao_FormatarCampos(Me.txt_Dia30)
        Funcao_FormatarCampos(Me.txt_Dia31)

        oVem.BuscaRevGrupoMes(1, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblTotal_MetaRevista.Text = oVem.vlrRev

    End Sub

    Protected Sub btnSalvar_BotaoClick(sender As Object, e As EventArgs) Handles btnSalvar.BotaoClick

        Call Salvar()
        Call mySession()
        Me.ASPxGridView1.DataBind()
        oVem.UserMsgBox(Me, "As metas foram salvas com sucesso!!!")
    End Sub




    Protected Sub txt_Dia1_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia1.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia1)
        Funcao_Focus(Me.txt_Dia2)
    End Sub

    Protected Sub txt_Dia2_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia2.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia2)
        Funcao_Focus(Me.txt_Dia3)
    End Sub

    Protected Sub txt_Dia3_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia3.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia3)
        Funcao_Focus(Me.txt_Dia4)
    End Sub

    Protected Sub txt_Dia4_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia4.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia4)
        Funcao_Focus(Me.txt_Dia5)
    End Sub

    Protected Sub txt_Dia5_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia5.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia5)
        Funcao_Focus(Me.txt_Dia6)
    End Sub

    Protected Sub txt_Dia6_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia6.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia6)
        Funcao_Focus(Me.txt_Dia7)
    End Sub

    Protected Sub txt_Dia7_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia7.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia7)
        Funcao_Focus(Me.txt_Dia8)
    End Sub

    Protected Sub txt_Dia8_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia8.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia8)
        Funcao_Focus(Me.txt_Dia9)
    End Sub

    Protected Sub txt_Dia9_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia9.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia9)
        Funcao_Focus(Me.txt_Dia10)
    End Sub

    Protected Sub txt_Dia10_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia10.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia10)
        Funcao_Focus(Me.txt_Dia11)
    End Sub

    Protected Sub txt_Dia11_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia11.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia11)
        Funcao_Focus(Me.txt_Dia12)
    End Sub

    Protected Sub txt_Dia12_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia12.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia12)
        Funcao_Focus(Me.txt_Dia13)
    End Sub

    Protected Sub txt_Dia13_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia13.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia13)
        Funcao_Focus(Me.txt_Dia14)
    End Sub

    Protected Sub txt_Dia14_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia14.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia14)
        Funcao_Focus(Me.txt_Dia15)
    End Sub

    Protected Sub txt_Dia15_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia15.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia15)
        Funcao_Focus(Me.txt_Dia16)
    End Sub

    Protected Sub txt_Dia16_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia16.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia16)
        Funcao_Focus(Me.txt_Dia17)
    End Sub

    Protected Sub txt_Dia17_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia17.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia17)
        Funcao_Focus(Me.txt_Dia18)
    End Sub

    Protected Sub txt_Dia18_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia18.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia18)
        Funcao_Focus(Me.txt_Dia19)
    End Sub

    Protected Sub txt_Dia19_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia19.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia19)
        Funcao_Focus(Me.txt_Dia20)
    End Sub

    Protected Sub txt_Dia20_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia20.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia20)
        Funcao_Focus(Me.txt_Dia21)
    End Sub

    Protected Sub txt_Dia21_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia21.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia21)
        Funcao_Focus(Me.txt_Dia22)
    End Sub

    Protected Sub txt_Dia22_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia22.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia22)
        Funcao_Focus(Me.txt_Dia23)
    End Sub

    Protected Sub txt_Dia23_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia23.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia23)
        Funcao_Focus(Me.txt_Dia24)
    End Sub

    Protected Sub txt_Dia24_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia24.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia24)
        Funcao_Focus(Me.txt_Dia25)
    End Sub

    Protected Sub txt_Dia25_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia25.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia25)
        Funcao_Focus(Me.txt_Dia26)
    End Sub

    Protected Sub txt_Dia26_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia26.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia26)
        Funcao_Focus(Me.txt_Dia27)
    End Sub

    Protected Sub txt_Dia27_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia27.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia27)
        Funcao_Focus(Me.txt_Dia28)
    End Sub

    Protected Sub txt_Dia28_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia28.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia28)
        Funcao_Focus(Me.txt_Dia29)
    End Sub

    Protected Sub txt_Dia29_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia29.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia29)
        Funcao_Focus(Me.txt_Dia30)
    End Sub

    Protected Sub txt_Dia30_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia30.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia30)
        Funcao_Focus(Me.txt_Dia31)
    End Sub

    Protected Sub txt_Dia31_TextChanged(sender As Object, e As EventArgs) Handles txt_Dia31.TextChanged
        Funcao_FormatarCampos(Me.txt_Dia31)
        Funcao_Focus(Me.txt_Dia30)
    End Sub

    Private Sub Funcao_Focus(ByVal iValor As TextBox)
        iValor.Focus()
    End Sub

    Private Sub Funcao_FormatarCampos(ByVal iValor As TextBox)
        iValor.Text = Format(CDec(iValor.Text), "#,##0.00")
        Call Totalizar()
    End Sub


    Public Function BuscaMetaVendaDia(ByVal iDia As Date, ByVal iFilial As Int16) As Double

        Dim con As New SqlConnection(connBI)
        Dim comando As New SqlCommand("Metas.usp_BuscarVendasPorDiaDaLoja", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.Date))
        comando.Parameters("@Dia").Value = iDia

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                BuscaMetaVendaDia = CDbl(reader5.GetSqlMoney(0)).ToString("n2")

            End While

        Catch ex As Exception
            'Beep()
            oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
        Return BuscaMetaVendaDia
    End Function


    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        If cboFilial.CallCorporacao = 5 Then
            Session("sTIPO") = 5
        Else
            Session("sTIPO") = 3
        End If

        MudarLegendasDia()
        Call mySession()
        Call BuscarMetaDeVendaPorDia()
        Me.ASPxGridView1.DataBind()
    End Sub
End Class
