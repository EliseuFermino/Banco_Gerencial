
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Planejamento_Vendas_frmCadVendaSecaoAG23
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"

    Dim no As Double
    Dim varDepto, varSecao As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double
    Dim varFilial As String

    Dim oVem As New VendaEmpresaMes
    Dim oOrc As New Orcamento
    Dim oFun As New Funcoes
    Dim oData As New clDataDb

#Region " PAGE"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(54, User.Identity.Name)
            cboSecao.AutoPostBack = True

            cboAno.AnoInicial = 2012
            cboAno.AnoFinal = Year(DateAndTime.Now()) + 1
            cboAno.CallAno = Year(DateAndTime.Now())

            Call Definir_varFilial()
            If Month(Date.Today) > 9 Then
                cboAno.CallAno = Year(Now()) + 1
            Else
                cboAno.CallAno = Year(Now())
            End If

            cboMes.CallMes = 1

            cboFilial.AutoPostBack = True

            cboFilial.Visible_cboCorporacao = False

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call Definir_varFilial()
        Call mySESSION()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento " & Me.cboAno.CallAno & " - Perdas"
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        Me.lblTituloHistAg23.Text = "Histórico " & Me.cboAno.CallAno - 1

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete

        If Not IsPostBack Then
            'Me.cboSecao.CallSecaoDesc = "01-SECA PESADA"
            cboPosicao.CallPosicao = 3
            Call Atualizar()
            Call HabilitarSalvar()
        End If
        Call MudarNegativoParaVermelho()
    End Sub

#End Region

    Sub BuscaMetaVenda(ByVal iMes As String)
        oVem.BuscaSecao_VendaMargem_Ori(Me.cboAno.CallAno, iMes, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, 3, 1)
        Select Case iMes
            Case 1
                Me.txt_vlrVenda_01.Text = oVem.vlrOri
            Case 2
                Me.txt_vlrVenda_02.Text = oVem.vlrOri
            Case 3
                Me.txt_vlrVenda_03.Text = oVem.vlrOri
            Case 4
                Me.txt_vlrVenda_04.Text = oVem.vlrOri
            Case 5
                Me.txt_vlrVenda_05.Text = oVem.vlrOri
            Case 6
                Me.txt_vlrVenda_06.Text = oVem.vlrOri
            Case 7
                Me.txt_vlrVenda_07.Text = oVem.vlrOri
            Case 8
                Me.txt_vlrVenda_08.Text = oVem.vlrOri
            Case 9
                Me.txt_vlrVenda_09.Text = oVem.vlrOri
            Case 10
                Me.txt_vlrVenda_10.Text = oVem.vlrOri
            Case 11
                Me.txt_vlrVenda_11.Text = oVem.vlrOri
            Case 12
                Me.txt_vlrVenda_12.Text = oVem.vlrOri
        End Select
        Call Totalizar_MetaVenda()
    End Sub

    Sub BuscaVendaReal_Hist1(ByVal iFilial As String)
        If Month(Now()) = 1 Then    'Janeiro
            Call Preencher_Hist1_Meta_Mes01(iFilial)
            Call Preencher_Hist1_Meta_Mes02(iFilial)
            Call Preencher_Hist1_Meta_Mes03(iFilial)
            Call Preencher_Hist1_Meta_Mes04(iFilial)
            Call Preencher_Hist1_Meta_Mes05(iFilial)
            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 2 Then    'Fevereiro
            Call Preencher_Hist1_Mes01(iFilial)

            Call Preencher_Hist1_Meta_Mes02(iFilial)
            Call Preencher_Hist1_Meta_Mes03(iFilial)
            Call Preencher_Hist1_Meta_Mes04(iFilial)
            Call Preencher_Hist1_Meta_Mes05(iFilial)
            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 3 Then    'Março
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)

            Call Preencher_Hist1_Meta_Mes03(iFilial)
            Call Preencher_Hist1_Meta_Mes04(iFilial)
            Call Preencher_Hist1_Meta_Mes05(iFilial)
            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 4 Then    'Abril
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)

            Call Preencher_Hist1_Meta_Mes04(iFilial)
            Call Preencher_Hist1_Meta_Mes05(iFilial)
            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 5 Then    'Maio
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)

            Call Preencher_Hist1_Meta_Mes05(iFilial)
            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 6 Then    'Junho
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)

            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 7 Then    'Julho
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)

            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 8 Then    'Agosto
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)

            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 9 Then    'Setembro
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)
            Call Preencher_Hist1_Mes08(iFilial)

            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 10 Then    'Outubro
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)
            Call Preencher_Hist1_Mes08(iFilial)
            Call Preencher_Hist1_Mes09(iFilial)

            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 11 Then    'Novembro
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)
            Call Preencher_Hist1_Mes08(iFilial)
            Call Preencher_Hist1_Mes09(iFilial)
            Call Preencher_Hist1_Mes10(iFilial)

            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 12 Then    'Dezembro
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)
            Call Preencher_Hist1_Mes08(iFilial)
            Call Preencher_Hist1_Mes09(iFilial)
            Call Preencher_Hist1_Mes10(iFilial)
            Call Preencher_Hist1_Mes11(iFilial)

            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

    End Sub

#Region " Buscar Histórico Agenda 23"

    Public Sub BuscaVendaReal_Hist(ByVal txt_vlrHist As Label, ByVal txt_percHist As Label, iMes As Byte)
        oData.GetDataDB_Parameter4("Agenda23.uspBuscarAgenda23", Conexao.gerPerdas, "@Ano", cboAno.CallAno - 1, "@Mes", iMes, "@idFilial", cboFilial.CallFilial, "idSecao", cboSecao.CallSecao)
        txt_vlrHist.Text = oData.vlr
        txt_percHist.Text = oData.perc
    End Sub

    Private Sub Preencher_Hist1_Mes01(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_01, txt_percHist_01, 1)
    End Sub

    Private Sub Preencher_Hist1_Mes02(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_02, txt_percHist_02, 2)
    End Sub

    Private Sub Preencher_Hist1_Mes03(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_03, txt_percHist_03, 3)
    End Sub

    Private Sub Preencher_Hist1_Mes04(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_04, txt_percHist_04, 4)
    End Sub

    Private Sub Preencher_Hist1_Mes05(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_05, txt_percHist_05, 5)
    End Sub

    Private Sub Preencher_Hist1_Mes06(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_06, txt_percHist_06, 6)
    End Sub

    Private Sub Preencher_Hist1_Mes07(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_07, txt_percHist_07, 7)
    End Sub

    Private Sub Preencher_Hist1_Mes08(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_08, txt_percHist_08, 8)
    End Sub

    Private Sub Preencher_Hist1_Mes09(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_09, txt_percHist_09, 9)
    End Sub

    Private Sub Preencher_Hist1_Mes10(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_10, txt_percHist_10, 10)
    End Sub

    Private Sub Preencher_Hist1_Mes11(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_11, txt_percHist_11, 11)
    End Sub

    Private Sub Preencher_Hist1_Mes12(ByVal iFilial As String)
        BuscaVendaReal_Hist(txt_vlrHist_12, txt_percHist_12, 12)
    End Sub

#End Region

    Private Sub Preencher_Hist1_Meta(ByVal iMes As Byte, txt_vlrHist As Label, txt_percHist As Label, iFilial As Byte)
        oVem.BuscaRevSecaoMes(4, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, iMes, iFilial)
        txt_vlrHist.Text = oVem.vlrRev
        txt_percHist.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes01(ByVal iFilial As Byte)
        Preencher_Hist1_Meta(1, txt_vlrHist_01, txt_percHist_01, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes02(ByVal iFilial As String)
        Preencher_Hist1_Meta(2, txt_vlrHist_02, txt_percHist_02, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes03(ByVal iFilial As String)
        Preencher_Hist1_Meta(3, txt_vlrHist_03, txt_percHist_03, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes04(ByVal iFilial As String)
        Preencher_Hist1_Meta(4, txt_vlrHist_04, txt_percHist_04, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes05(ByVal iFilial As String)
        Preencher_Hist1_Meta(5, txt_vlrHist_05, txt_percHist_05, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes06(ByVal iFilial As String)
        Preencher_Hist1_Meta(6, txt_vlrHist_06, txt_percHist_06, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes07(ByVal iFilial As String)
        Preencher_Hist1_Meta(7, txt_vlrHist_07, txt_percHist_07, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes08(ByVal iFilial As String)
        Preencher_Hist1_Meta(8, txt_vlrHist_08, txt_percHist_08, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes09(ByVal iFilial As String)
        Preencher_Hist1_Meta(9, txt_vlrHist_09, txt_percHist_09, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes10(ByVal iFilial As String)
        Preencher_Hist1_Meta(10, txt_vlrHist_10, txt_percHist_10, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes11(ByVal iFilial As String)
        Preencher_Hist1_Meta(11, txt_vlrHist_11, txt_percHist_11, iFilial)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes12(ByVal iFilial As String)
        Preencher_Hist1_Meta(12, txt_vlrHist_12, txt_percHist_12, iFilial)
    End Sub

    Private Sub BuscarMetasCadastradas(iMes As Byte, ByVal iTipoSecao As Byte, ByVal txt_vlrMeta As TextBox, ByVal txt_percCresc As TextBox)

        oVem.BuscaSecao_VendaMargem_Ori(cboAno.CallAno, iMes, cboFilial.CallFilial, cboSecao.CallSecao, cboPosicao.CallPosicao, iTipoSecao)
        txt_vlrMeta.Text = oVem.vlrOri
        txt_percCresc.Text = oVem.percOri
    End Sub

    Private Sub BuscaMeta()

        'Agenda 23
        BuscarMetasCadastradas(1, 4, txt_vlrMeta01, txt_percCresc01)
        BuscarMetasCadastradas(2, 4, txt_vlrMeta02, txt_percCresc02)
        BuscarMetasCadastradas(3, 4, txt_vlrMeta03, txt_percCresc03)
        BuscarMetasCadastradas(4, 4, txt_vlrMeta04, txt_percCresc04)
        BuscarMetasCadastradas(5, 4, txt_vlrMeta05, txt_percCresc05)
        BuscarMetasCadastradas(6, 4, txt_vlrMeta06, txt_percCresc06)
        BuscarMetasCadastradas(7, 4, txt_vlrMeta07, txt_percCresc07)
        BuscarMetasCadastradas(8, 4, txt_vlrMeta08, txt_percCresc08)
        BuscarMetasCadastradas(9, 4, txt_vlrMeta09, txt_percCresc09)
        BuscarMetasCadastradas(10, 4, txt_vlrMeta10, txt_percCresc10)
        BuscarMetasCadastradas(11, 4, txt_vlrMeta11, txt_percCresc11)
        BuscarMetasCadastradas(12, 4, txt_vlrMeta12, txt_percCresc12)

        Call Totalizar_Meta()   'Totalizar Meta da Agenda 23

        Me.lblError.Text = oVem.varDesc
    End Sub


    Sub Atualizar()
        Dim varFilial As String

        Call ZerarCampos()
        varFilial = oOrc.DefinirFilial(cboFilial.CallFilial)

        Call BuscaVendaReal_Hist1(varFilial)
        Call BuscarVendaSecaoAno()
        Call Totalizar_HistoricoAgenda23()

        'Call BuscaVendaReal_Hist3(Me.cboAno.CallAno - 3, varFilial, Me.cboSecao.CallSecao, Me.lblDepto.Text)
        'Call BuscaVendaReal_Ano(varFilial)

        Call BuscaMetaVenda(1)
        Call BuscaMetaVenda(2)
        Call BuscaMetaVenda(3)
        Call BuscaMetaVenda(4)
        Call BuscaMetaVenda(5)
        Call BuscaMetaVenda(6)
        Call BuscaMetaVenda(7)
        Call BuscaMetaVenda(8)
        Call BuscaMetaVenda(9)
        Call BuscaMetaVenda(10)
        Call BuscaMetaVenda(11)
        Call BuscaMetaVenda(12)

        'Busca as Metas que foram digitadas e foram salvas
        Call BuscaMeta()
        Call HabilitarSalvar()

    End Sub

#Region " Totalizadores"


    Sub Totalizar_HistoricoAgenda23()
        oFun.Totalizar12Mes_Label(txt_vlrHist_Total, txt_vlrHist_01, txt_vlrHist_02, txt_vlrHist_03, txt_vlrHist_03,
                                  txt_vlrHist_05, txt_vlrHist_06, txt_vlrHist_07, txt_vlrHist_08, txt_vlrHist_09,
                                  txt_vlrHist_10, txt_vlrHist_11, txt_vlrHist_12)
        txt_percHist_Total.Text = oFun.Calculate(txt_vlrHist_Total.Text, Me.lblVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub


    Sub Totalizar_MetaVenda()
        oFun.Totalizar12Mes_TextBox(txt_vlrVenda_Total, txt_vlrVenda_01, txt_vlrVenda_02, txt_vlrVenda_03, txt_vlrVenda_04,
                                    txt_vlrVenda_05, txt_vlrVenda_06, txt_vlrVenda_07, txt_vlrVenda_08,
                                    txt_vlrVenda_09, txt_vlrVenda_10, txt_vlrVenda_11, txt_vlrVenda_12)
    End Sub

    Sub Totalizar_Meta()
        oFun.Totalizar12Mes_TextBox(lbl_vlrMetaTotal, txt_vlrMeta01, txt_vlrMeta02, txt_vlrMeta03, txt_vlrMeta04,
                                    txt_vlrMeta05, txt_vlrMeta06, txt_vlrMeta07, txt_vlrMeta08, txt_vlrMeta09,
                                    txt_vlrMeta10, txt_vlrMeta11, txt_vlrMeta12)
        Me.lblCrescAno.Text = oFun.Calculate(lbl_vlrMetaTotal.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

#End Region

    Sub ZerarCampos()
        '*********  Histórico - 3  **************************
        Me.txt_vlrHist_01.Text = 0
        Me.txt_vlrHist_02.Text = 0
        Me.txt_vlrHist_03.Text = 0
        Me.txt_vlrHist_04.Text = 0
        Me.txt_vlrHist_05.Text = 0
        Me.txt_vlrHist_06.Text = 0
        Me.txt_vlrHist_07.Text = 0
        Me.txt_vlrHist_08.Text = 0
        Me.txt_vlrHist_09.Text = 0
        Me.txt_vlrHist_10.Text = 0
        Me.txt_vlrHist_11.Text = 0
        Me.txt_vlrHist_12.Text = 0
        Me.txt_vlrHist_Total.Text = 0

        Me.txt_percHist_01.Text = 0
        Me.txt_percHist_02.Text = 0
        Me.txt_percHist_03.Text = 0
        Me.txt_percHist_04.Text = 0
        Me.txt_percHist_05.Text = 0
        Me.txt_percHist_06.Text = 0
        Me.txt_percHist_07.Text = 0
        Me.txt_percHist_08.Text = 0
        Me.txt_percHist_09.Text = 0
        Me.txt_percHist_10.Text = 0
        Me.txt_percHist_11.Text = 0
        Me.txt_percHist_12.Text = 0

     

        '*********  Meta de Venda e Participação  **************************
        Me.txt_vlrVenda_01.Text = 0
        Me.txt_vlrVenda_02.Text = 0
        Me.txt_vlrVenda_03.Text = 0
        Me.txt_vlrVenda_04.Text = 0
        Me.txt_vlrVenda_05.Text = 0
        Me.txt_vlrVenda_06.Text = 0
        Me.txt_vlrVenda_07.Text = 0
        Me.txt_vlrVenda_08.Text = 0
        Me.txt_vlrVenda_09.Text = 0
        Me.txt_vlrVenda_10.Text = 0
        Me.txt_vlrVenda_11.Text = 0
        Me.txt_vlrVenda_12.Text = 0
        Me.txt_vlrVenda_Total.Text = 0

        '*********  Meta de Venda e Participação  **************************
        Me.txt_vlrMeta01.Text = 0
        Me.txt_vlrMeta02.Text = 0
        Me.txt_vlrMeta03.Text = 0
        Me.txt_vlrMeta04.Text = 0
        Me.txt_vlrMeta05.Text = 0
        Me.txt_vlrMeta06.Text = 0
        Me.txt_vlrMeta07.Text = 0
        Me.txt_vlrMeta08.Text = 0
        Me.txt_vlrMeta09.Text = 0
        Me.txt_vlrMeta10.Text = 0
        Me.txt_vlrMeta11.Text = 0
        Me.txt_vlrMeta12.Text = 0
        Me.lbl_vlrMetaTotal.Text = 0

        Me.txt_percCresc01.Text = 0
        Me.txt_percCresc02.Text = 0
        Me.txt_percCresc03.Text = 0
        Me.txt_percCresc04.Text = 0
        Me.txt_percCresc05.Text = 0
        Me.txt_percCresc06.Text = 0
        Me.txt_percCresc07.Text = 0
        Me.txt_percCresc08.Text = 0
        Me.txt_percCresc09.Text = 0
        Me.txt_percCresc10.Text = 0
        Me.txt_percCresc11.Text = 0
        Me.txt_percCresc12.Text = 0


    End Sub

    

    Private Sub Definir_varFilial()
        oOrc.DefinirFilial(Me.cboFilial.CallFilial)
    End Sub

    Private Sub SalvarT()
        'Agenda 23
        Salvar("4", Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta01.Text, Me.txt_percCresc01.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta02.Text, Me.txt_percCresc02.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta03.Text, Me.txt_percCresc03.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta04.Text, Me.txt_percCresc04.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta05.Text, Me.txt_percCresc05.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta06.Text, Me.txt_percCresc06.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta07.Text, Me.txt_percCresc07.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta08.Text, Me.txt_percCresc08.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta09.Text, Me.txt_percCresc09.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta10.Text, Me.txt_percCresc10.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta11.Text, Me.txt_percCresc11.Text, Me.cboPosicao.CallPosicao)
        Salvar("4", Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta12.Text, Me.txt_percCresc12.Text, Me.cboPosicao.CallPosicao)
        '     Salvar("4", Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMetaTotal.Text, Me.lblCrescAno.Text, Me.cboPosicao.CallPosicao)

             ''Quebra Fisica
        'Salvar("6", Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_01.Text, Me.txt_percHist_QM_01.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_02.Text, Me.txt_percHist_QM_02.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_03.Text, Me.txt_percHist_QM_03.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_04.Text, Me.txt_percHist_QM_04.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_05.Text, Me.txt_percHist_QM_05.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_06.Text, Me.txt_percHist_QM_06.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_07.Text, Me.txt_percHist_QM_07.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_08.Text, Me.txt_percHist_QM_08.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_09.Text, Me.txt_percHist_QM_09.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_10.Text, Me.txt_percHist_QM_10.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_11.Text, Me.txt_percHist_QM_11.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_12.Text, Me.txt_percHist_QM_12.Text, Me.lblDepto.Text)
        'Salvar("6", Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QM_Total.Text, Me.txt_percHist_QM_Total.Text, Me.lblDepto.Text)

    End Sub

    Public Function Salvar(ByVal idTipoSecao As Byte, ByVal Ano As Int16, _
                           ByVal Mes As Byte, ByVal idFilial As Byte, ByVal idSecao As Int16, ByVal vlr As Double, _
                           ByVal percCresc As Double, ByVal idPosicao As Byte) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspSalvarQuebraSecao_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = idTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Ano

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Mes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = idFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = idSecao

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@percCresc", SqlDbType.Money))
        comando.Parameters("@percCresc").Value = percCresc

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = idPosicao


        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Classe: Salvar. Erro " & ex.Message & ".")

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Sub HabilitarSalvar()
        oOrc.HabilitarSalvar(btnSalvar1, cboAno.CallAno, cboPosicao.CallPosicao, 6, User.Identity.Name)
    End Sub

    Sub Busca_CodDepto()
        Dim oCad As New Cadastro
        oCad.Busca_CodDepto(Me.cboSecao.CallSecao)
        Me.lblDepto.Text = oCad.varDeptoID
    End Sub


#Region " CALCULAR QUEBRA FISICA"

    Private Sub Calcular_QuebraFisica(ByVal txt_vlrHist1 As Label, ByVal txt_vlrMeta As TextBox, ByVal txt_vlrHist2 As TextBox,
                                  ByVal txt_vlrHist_QS As Label, ByVal txt_vlrHist_QM As Label, ByVal txt_percHist1 As Label, ByVal txt_vlrVenda As TextBox, ByVal txt_percHist_QS As Label)

        txt_vlrHist1.Text = oFun.Calculate(txt_vlrMeta.Text, txt_vlrHist2.Text, Funcoes.CalculateType.Sum).ToString("n0")
        txt_vlrHist_QS.Text = oFun.Calculate(txt_vlrHist1.Text, txt_vlrHist_QM.Text, Funcoes.CalculateType.Sum).ToString("n0")

        If CDbl(txt_vlrHist1.Text) <> 0 Then
            txt_percHist1.Text = oFun.Calculate(txt_vlrHist1.Text, txt_vlrVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
            txt_percHist_QS.Text = oFun.Calculate(txt_vlrHist_QS.Text, txt_vlrVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Else
            txt_percHist1.Text = 0
        End If
    End Sub

#End Region

#Region " DIGITAÇÃO"

    Protected Sub Digita_Valor(ByVal txt_percCresc As TextBox, ByVal txt_vlrMeta As TextBox, ByVal txt_vlrVenda As TextBox, ByVal txt_Focus As TextBox,
                               ByVal txt_vlrHist1 As Label, ByVal txt_vlrHist2 As TextBox, ByVal txt_vlrHist_QS As Label, ByVal txt_vlrHist_QM As Label,
                                            ByVal txt_percHist1 As Label, ByVal txt_percHist_QS As Label)

        txt_percCresc.Text = oFun.Calculate(txt_vlrMeta.Text, txt_vlrVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Digita_Complemento(txt_Focus, txt_vlrHist1, txt_vlrHist2, txt_vlrHist_QS, txt_vlrHist_QM, txt_percHist1, txt_percHist_QS, txt_vlrMeta, txt_vlrVenda)

    End Sub

    Protected Sub Digita_Percentual(ByVal txt_vlrMeta As TextBox, ByVal txt_percCresc As TextBox, ByVal txt_vlrVenda As TextBox, ByVal txt_Focus As TextBox,
                                            ByVal txt_vlrHist1 As Label, ByVal txt_vlrHist2 As TextBox, ByVal txt_vlrHist_QS As Label, ByVal txt_vlrHist_QM As Label,
                                            ByVal txt_percHist1 As Label, ByVal txt_percHist_QS As Label)
        txt_vlrMeta.Text = oFun.Calculate(txt_percCresc.Text, txt_vlrVenda.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Digita_Complemento(txt_Focus, txt_vlrHist1, txt_vlrHist2, txt_vlrHist_QS, txt_vlrHist_QM, txt_percHist1, txt_percHist_QS, txt_vlrMeta, txt_vlrVenda)
    End Sub

    Private Sub Digita_Complemento(ByVal txt_Focus As TextBox, ByVal txt_vlrHist1 As Label, ByVal txt_vlrHist2 As TextBox, ByVal txt_vlrHist_QS As Label,
                                   ByVal txt_vlrHist_QM As Label, ByVal txt_percHist1 As Label, ByVal txt_percHist_QS As Label, ByVal txt_vlrMeta As TextBox, ByVal txt_vlrVenda As TextBox)
        txt_Focus.Focus()
        Calcular_QuebraFisica(txt_vlrHist1, txt_vlrMeta, txt_vlrHist2, txt_vlrHist_QS, txt_vlrHist_QM, txt_percHist1, txt_vlrVenda, txt_percHist_QS)

        CDbl(txt_vlrHist2.Text).ToString("n0")
    End Sub
#End Region

#Region " METAS"


#End Region

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call HabilitarSalvar()
        Me.lblTituloHistAg23.Text = "Ag. 23 - " & Me.cboAno.CallAno - 1
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call Busca_CodDepto()
        Call Atualizar()
    End Sub

    Sub mySESSION()
        Session("IDPOSICAO") = Me.cboPosicao.CallPosicao    'Define a posição atual da Posição
        Session("IDFILIAL") = Me.cboFilial.CallFilial
        'Session("VALUE1") = 7
    End Sub

    Private Sub BuscarVendaSecaoAno()
        oVem.BuscaRea_SecaoAno(Me.cboAno.CallAno - 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
        Me.lblVenda.Text = oVem.vlrOri
    End Sub

    Protected Sub btnConsultarMes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConsultarMes.Click
        Call Linkar("viewQuebraOriginalMes.aspx", Me.cboFilial.CallFilial)
    End Sub

    Private Sub Linkar(ByVal link As String, ByVal idFilial As String)
        Dim url As String = link & "?idFilial=" & idFilial & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub

    Protected Sub btnConsultarAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConsultarAno.Click
        Call Linkar("viewQuebraOriginalAno.aspx", Me.cboFilial.CallFilial)
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Call Busca_CodDepto()
        Call Atualizar()
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call Busca_CodDepto()
        Call Atualizar()
    End Sub

#Region " Cor Vermelha"

    Sub MudarNegativoParaVermelho()
        On Error Resume Next

        'Historico Agenda 23
        Call MudarCorNegativo(Me.txt_vlrHist_01, Me.txt_percHist_01)
        Call MudarCorNegativo(Me.txt_vlrHist_02, Me.txt_percHist_02)
        Call MudarCorNegativo(Me.txt_vlrHist_03, Me.txt_percHist_03)
        Call MudarCorNegativo(Me.txt_vlrHist_04, Me.txt_percHist_04)
        Call MudarCorNegativo(Me.txt_vlrHist_05, Me.txt_percHist_05)
        Call MudarCorNegativo(Me.txt_vlrHist_06, Me.txt_percHist_06)
        Call MudarCorNegativo(Me.txt_vlrHist_07, Me.txt_percHist_07)
        Call MudarCorNegativo(Me.txt_vlrHist_08, Me.txt_percHist_08)
        Call MudarCorNegativo(Me.txt_vlrHist_09, Me.txt_percHist_09)
        Call MudarCorNegativo(Me.txt_vlrHist_10, Me.txt_percHist_10)
        Call MudarCorNegativo(Me.txt_vlrHist_11, Me.txt_percHist_11)
        Call MudarCorNegativo(Me.txt_vlrHist_12, Me.txt_percHist_12)
        Call MudarCorNegativo(Me.txt_vlrHist_Total, Me.txt_percHist_Total)

        'META DA AGENDA 23
        Call MudarCorNegativo_TextBox(txt_vlrMeta01, txt_percCresc01)
        Call MudarCorNegativo_TextBox(txt_vlrMeta02, txt_percCresc02)
        Call MudarCorNegativo_TextBox(txt_vlrMeta03, txt_percCresc03)
        Call MudarCorNegativo_TextBox(txt_vlrMeta04, txt_percCresc04)
        Call MudarCorNegativo_TextBox(txt_vlrMeta05, txt_percCresc05)
        Call MudarCorNegativo_TextBox(txt_vlrMeta06, txt_percCresc06)
        Call MudarCorNegativo_TextBox(txt_vlrMeta07, txt_percCresc07)
        Call MudarCorNegativo_TextBox(txt_vlrMeta08, txt_percCresc08)
        Call MudarCorNegativo_TextBox(txt_vlrMeta09, txt_percCresc09)
        Call MudarCorNegativo_TextBox(txt_vlrMeta10, txt_percCresc10)
        Call MudarCorNegativo_TextBox(txt_vlrMeta11, txt_percCresc11)
        Call MudarCorNegativo_TextBox(txt_vlrMeta12, txt_percCresc12)
        Call MudarCorNegativo_TextBox(lbl_vlrMetaTotal, lblCrescAno)


    End Sub

    Sub MudarCorNegativo(ByVal iText As Label, ByVal iPerc As Label)
        oFun.Label_RedIsNegative(iText)
        oFun.Label_RedIsNegative(iPerc)
    End Sub

    Sub MudarCorNegativo_TextBox(ByVal iText As TextBox, ByVal iPerc As TextBox)
        oFun.TextBox_RedIsNegative(iText, Drawing.Color.Blue)
        oFun.TextBox_RedIsNegative(iPerc, Drawing.Color.Blue)
    End Sub

#End Region

    Protected Sub btnSalvar1_Click(sender As Object, e As EventArgs) Handles btnSalvar1.Click
        If Me.lbl_vlrMetaTotal.Text = Nothing Then
            Beep()
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        ElseIf CDbl(Me.lbl_vlrMetaTotal.Text) > 0 Then
            Beep()
            oVem.UserMsgBox(Me, "Você deve digitar o valor da meta da agenda 23 negativo (sinal de - na frente)!!!")
        Else
            Call SalvarT()
            oVem.UserMsgBox(Me, "As Quebras foram salvas com sucesso!!!")
        End If
    End Sub
End Class
