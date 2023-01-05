
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Planejamento_Vendas_frmCadVendaSecao
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
        Call Calcular_update()
        Me.lblTituloHistAg23.Text = "Histórico " & Me.cboAno.CallAno - 1

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete

        If Not IsPostBack Then
            'Me.cboSecao.CallSecaoDesc = "01-SECA PESADA"
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

            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        'Calcular  Total
        Me.txt_vlrHist1_Total.Text = CDbl(CDbl(Me.txt_vlrHist1_01.Text) + CDbl(Me.txt_vlrHist1_02.Text) + CDbl(Me.txt_vlrHist1_03.Text) + _
                                    CDbl(Me.txt_vlrHist1_04.Text) + CDbl(Me.txt_vlrHist1_05.Text) + CDbl(Me.txt_vlrHist1_06.Text) + _
                                    CDbl(Me.txt_vlrHist1_07.Text) + CDbl(Me.txt_vlrHist1_08.Text) + CDbl(Me.txt_vlrHist1_09.Text) + _
                                    CDbl(Me.txt_vlrHist1_10.Text) + CDbl(Me.txt_vlrHist1_11.Text) + CDbl(Me.txt_vlrHist1_12.Text)).ToString("n0")

        'oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao, iDepto)
        'Me.txt_vlrHist1_Total.Text = oVem.vlrRea

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

    Sub BuscaHistorico_Divergencia(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 1, iSecao)
        percHist_Divergencia_01.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 2, iSecao)
        percHist_Divergencia_02.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 3, iSecao)
        percHist_Divergencia_03.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 4, iSecao)
        percHist_Divergencia_04.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 5, iSecao)
        percHist_Divergencia_05.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 6, iSecao)
        percHist_Divergencia_06.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 7, iSecao)
        percHist_Divergencia_07.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 8, iSecao)
        percHist_Divergencia_08.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 9, iSecao)
        percHist_Divergencia_09.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 10, iSecao)
        percHist_Divergencia_10.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 11, iSecao)
        percHist_Divergencia_11.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 1, 12, iSecao)
        percHist_Divergencia_12.Text = oVem.vlrRea
    End Sub

    Sub BuscaHistorico_QuebraMargem(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 1, iSecao)
        Me.txt_percHist_QM_01.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 2, iSecao)
        Me.txt_percHist_QM_02.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 3, iSecao)
        Me.txt_percHist_QM_03.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 4, iSecao)
        Me.txt_percHist_QM_04.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 5, iSecao)
        Me.txt_percHist_QM_05.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 6, iSecao)
        Me.txt_percHist_QM_06.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 7, iSecao)
        Me.txt_percHist_QM_07.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 8, iSecao)
        Me.txt_percHist_QM_08.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 9, iSecao)
        Me.txt_percHist_QM_09.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 10, iSecao)
        Me.txt_percHist_QM_10.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 11, iSecao)
        Me.txt_percHist_QM_11.Text = oVem.vlrRea

        oVem.BuscaReaQuebraSecao_Divegencia(iAno, iFilial, 2, 12, iSecao)
        Me.txt_percHist_QM_12.Text = oVem.vlrRea

        'Me.txt_vlrHist2_01.Text = oVem.vlrRea

        'Me.txt_vlrHist2_Total.Text = CDbl(CDbl(Me.txt_vlrHist2_01.Text) + CDbl(Me.txt_vlrHist2_02.Text) + CDbl(Me.txt_vlrHist2_03.Text) + _
        '                    CDbl(Me.txt_vlrHist2_04.Text) + CDbl(Me.txt_vlrHist2_05.Text) + CDbl(Me.txt_vlrHist2_06.Text) + _
        '                    CDbl(Me.txt_vlrHist2_07.Text) + CDbl(Me.txt_vlrHist2_08.Text) + CDbl(Me.txt_vlrHist2_09.Text) + _
        '                    CDbl(Me.txt_vlrHist2_10.Text) + CDbl(Me.txt_vlrHist2_11.Text) + CDbl(Me.txt_vlrHist2_12.Text)).ToString("n0")


        'oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao, iDepto)
        'Me.txt_vlrHist2_Total.Text = oVem.vlrRea

    End Sub

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iDepto As String)

        'BuscaVendaReal_Hist(txt_vlrHist_01, txt_percHist_01)


        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 1, iFilial, iSecao, 2)
        'Me.txt_vlrHist_01.Text = oVem.vlrRea
        'Me.txt_percHist_01.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 2, iFilial, iSecao, 2)
        'Me.txt_vlrHist_02.Text = oVem.vlrRea
        'Me.txt_percHist_02.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 3, iFilial, iSecao, 2)
        'Me.txt_vlrHist_03.Text = oVem.vlrRea
        'Me.txt_percHist_03.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 4, iFilial, iSecao, 2)
        'Me.txt_vlrHist_04.Text = oVem.vlrRea
        'Me.txt_percHist_04.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 5, iFilial, iSecao, 2)
        'Me.txt_vlrHist_05.Text = oVem.vlrRea
        'Me.txt_percHist_05.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 6, iFilial, iSecao, 2)
        'Me.txt_vlrHist_06.Text = oVem.vlrRea
        'Me.txt_percHist_06.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 7, iFilial, iSecao, 2)
        'Me.txt_vlrHist_07.Text = oVem.vlrRea
        'Me.txt_percHist_07.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 8, iFilial, iSecao, 2)
        'Me.txt_vlrHist_08.Text = oVem.vlrRea
        'Me.txt_percHist_08.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 9, iFilial, iSecao, 2)
        'Me.txt_vlrHist_09.Text = oVem.vlrRea
        'Me.txt_percHist_09.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 10, iFilial, iSecao, 2)
        'Me.txt_vlrHist_10.Text = oVem.vlrRea
        'Me.txt_percHist_10.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 11, iFilial, iSecao, 2)
        'Me.txt_vlrHist_11.Text = oVem.vlrRea
        'Me.txt_percHist_11.Text = oVem.percRea

        'oVem.BuscaSecao_VendaMargem_Rea(iAno, 12, iFilial, iSecao, 2)
        'Me.txt_vlrHist_12.Text = oVem.vlrRea
        'Me.txt_percHist_12.Text = oVem.percRea

        Me.txt_vlrHist_Total.Text = CDbl(CDbl(Me.txt_vlrHist_01.Text) + CDbl(Me.txt_vlrHist_02.Text) + CDbl(Me.txt_vlrHist_03.Text) + _
                            CDbl(Me.txt_vlrHist_04.Text) + CDbl(Me.txt_vlrHist_05.Text) + CDbl(Me.txt_vlrHist_06.Text) + _
                            CDbl(Me.txt_vlrHist_07.Text) + CDbl(Me.txt_vlrHist_08.Text) + CDbl(Me.txt_vlrHist_09.Text) + _
                            CDbl(Me.txt_vlrHist_10.Text) + CDbl(Me.txt_vlrHist_11.Text) + CDbl(Me.txt_vlrHist_12.Text)).ToString("n0")


        'oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao, iDepto, iComprador)
        'Me.txt_vlrHist3_Total.Text = oVem.vlrRea
        'Me.lblError.Text = oVem.varDesc
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

        'Divergência
        BuscarMetasCadastradas(1, 5, txt_vlrHist2_01, txt_percHist2_01)
        BuscarMetasCadastradas(2, 5, txt_vlrHist2_02, txt_percHist2_02)
        BuscarMetasCadastradas(3, 5, txt_vlrHist2_03, txt_percHist2_03)
        BuscarMetasCadastradas(4, 5, txt_vlrHist2_04, txt_percHist2_04)
        BuscarMetasCadastradas(5, 5, txt_vlrHist2_05, txt_percHist2_05)
        BuscarMetasCadastradas(6, 5, txt_vlrHist2_06, txt_percHist2_06)
        BuscarMetasCadastradas(7, 5, txt_vlrHist2_07, txt_percHist2_07)
        BuscarMetasCadastradas(8, 5, txt_vlrHist2_08, txt_percHist2_08)
        BuscarMetasCadastradas(9, 5, txt_vlrHist2_09, txt_percHist2_09)
        BuscarMetasCadastradas(10, 5, txt_vlrHist2_10, txt_percHist2_10)
        BuscarMetasCadastradas(11, 5, txt_vlrHist2_11, txt_percHist2_11)
        BuscarMetasCadastradas(12, 5, txt_vlrHist2_12, txt_percHist2_12)

        Call Totalizar_Meta()   'Totalizar Meta da Agenda 23
        Call Totalizar_Hist2()  'Totalizar Meta de Divergência
        Me.lblError.Text = oVem.varDesc
    End Sub


    Sub Atualizar()
        Dim varFilial As String

        Call ZerarCampos()
        varFilial = oOrc.DefinirFilial(cboFilial.CallFilial)

        Call BuscaVendaReal_Hist1(varFilial)
        Call BuscarVendaSecaoAno()
        Call Totalizar_HistoricoAgenda23()

        Call BuscaHistorico_Divergencia(Me.cboAno.CallAno - 1, varFilial, Me.cboSecao.CallSecao)
        Call BuscaHistorico_QuebraMargem(Me.cboAno.CallAno - 1, varFilial, Me.cboSecao.CallSecao)

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

        Call CalcularValorDivergencia()
        Call CalcularValorQuebraDivergencia()
        Call Calcular_update()

        'Busca as Metas que foram digitadas e foram salvas
        Call BuscaMeta()
        Call HabilitarSalvar()

    End Sub

#Region " Totalizadores"

    Sub Totalizar_Hist3()
        oFun.Totalizar12Mes_Label(txt_vlrHist_QM_Total, txt_vlrHist_QM_01, txt_vlrHist_QM_02, txt_vlrHist_QM_03, txt_vlrHist_QM_04,
                                  txt_vlrHist_QM_05, txt_vlrHist_QM_06, txt_vlrHist_QM_07, txt_vlrHist_QM_08, txt_vlrHist_QM_09,
                                  txt_vlrHist_QM_10, txt_vlrHist_QM_11, txt_vlrHist_QM_12)
        Me.txt_percHist_QM_Total.Text = oFun.Calculate(txt_vlrHist_QM_Total.Text, Me.txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")

    End Sub

    Sub Totalizar_Hist2()
        oFun.Totalizar12Mes_TextBox(txt_vlrHist2_Total, txt_vlrHist2_01, txt_vlrHist2_02, txt_vlrHist2_03, txt_vlrHist2_04,
                                  txt_vlrHist2_05, txt_vlrHist2_06, txt_vlrHist2_07, txt_vlrHist2_08, txt_vlrHist2_09,
                                  txt_vlrHist2_10, txt_vlrHist2_11, txt_vlrHist2_12)
        Me.txt_percHist2_Total.Text = oFun.Calculate(txt_vlrHist2_Total.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Sub Totalizar_Divergencia()
        oFun.Totalizar12Mes_Label(vlrHist_Divergencia_Total, vlrHist_Divergencia_01, vlrHist_Divergencia_02, vlrHist_Divergencia_03, vlrHist_Divergencia_04,
                                  vlrHist_Divergencia_05, vlrHist_Divergencia_06, vlrHist_Divergencia_07, vlrHist_Divergencia_08, vlrHist_Divergencia_09,
                                  vlrHist_Divergencia_10, vlrHist_Divergencia_11, vlrHist_Divergencia_12)
        Me.percHist_Divergencia_Total.Text = oFun.Calculate(vlrHist_Divergencia_Total.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Sub Totalizar_QuebraFisica()
        oFun.Totalizar12Mes_Label(txt_vlrHist1_Total, txt_vlrHist1_01, txt_vlrHist1_02, txt_vlrHist1_03, txt_vlrHist1_04,
                                  txt_vlrHist1_05, txt_vlrHist1_06, txt_vlrHist1_07, txt_vlrHist1_08, txt_vlrHist1_09,
                                  txt_vlrHist1_10, txt_vlrHist1_11, txt_vlrHist1_12)
        Me.txt_percHist1_Total.Text = oFun.Calculate(txt_vlrHist1_Total.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Sub Totalizar_HistoricoAgenda23()
        oFun.Totalizar12Mes_Label(txt_vlrHist_Total, txt_vlrHist_01, txt_vlrHist_02, txt_vlrHist_03, txt_vlrHist_03,
                                  txt_vlrHist_05, txt_vlrHist_06, txt_vlrHist_07, txt_vlrHist_08, txt_vlrHist_09,
                                  txt_vlrHist_10, txt_vlrHist_11, txt_vlrHist_12)
        txt_percHist_Total.Text = oFun.Calculate(txt_vlrHist_Total.Text, Me.lblVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Sub Totalizar_QuebraSecao()
        oFun.Totalizar12Mes_Label(txt_vlrHist_QS_Total, txt_vlrHist_QS_01, txt_vlrHist_QS_02, txt_vlrHist_QS_03, txt_vlrHist_QS_04,
                                  txt_vlrHist_QS_05, txt_vlrHist_QS_06, txt_vlrHist_QS_07, txt_vlrHist_QS_08,
                                  txt_vlrHist_QS_09, txt_vlrHist_QS_10, txt_vlrHist_QS_11, txt_vlrHist_QS_12)
        txt_percHist_QS_Total.Text = oFun.Calculate(txt_vlrHist_QS_Total.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Sub Totalizar_Hist1()
        oFun.Totalizar12Mes_Label(txt_vlrHist1_Total, txt_vlrHist1_01, txt_vlrHist1_02, txt_vlrHist1_03, txt_vlrHist1_04,
                       txt_vlrHist1_05, txt_vlrHist1_06, txt_vlrHist1_07, txt_vlrHist1_08, txt_vlrHist1_09,
                       txt_vlrHist1_10, txt_vlrHist1_11, txt_vlrHist1_12)
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

        '*********  Histórico - 2  **************************
        Me.txt_vlrHist2_01.Text = 0
        Me.txt_vlrHist2_02.Text = 0
        Me.txt_vlrHist2_03.Text = 0
        Me.txt_vlrHist2_04.Text = 0
        Me.txt_vlrHist2_05.Text = 0
        Me.txt_vlrHist2_06.Text = 0
        Me.txt_vlrHist2_07.Text = 0
        Me.txt_vlrHist2_08.Text = 0
        Me.txt_vlrHist2_09.Text = 0
        Me.txt_vlrHist2_10.Text = 0
        Me.txt_vlrHist2_11.Text = 0
        Me.txt_vlrHist2_12.Text = 0
        Me.txt_vlrHist2_Total.Text = 0

        Me.txt_percHist2_01.Text = 0
        Me.txt_percHist2_02.Text = 0
        Me.txt_percHist2_03.Text = 0
        Me.txt_percHist2_04.Text = 0
        Me.txt_percHist2_05.Text = 0
        Me.txt_percHist2_06.Text = 0
        Me.txt_percHist2_07.Text = 0
        Me.txt_percHist2_08.Text = 0
        Me.txt_percHist2_09.Text = 0
        Me.txt_percHist2_08.Text = 0
        Me.txt_percHist2_10.Text = 0
        Me.txt_percHist2_11.Text = 0
        Me.txt_percHist2_12.Text = 0

        '*********  Histórico - 1  **************************
        Me.txt_vlrHist1_01.Text = 0
        Me.txt_vlrHist1_02.Text = 0
        Me.txt_vlrHist1_03.Text = 0
        Me.txt_vlrHist1_04.Text = 0
        Me.txt_vlrHist1_05.Text = 0
        Me.txt_vlrHist1_06.Text = 0
        Me.txt_vlrHist1_07.Text = 0
        Me.txt_vlrHist1_08.Text = 0
        Me.txt_vlrHist1_09.Text = 0
        Me.txt_vlrHist1_10.Text = 0
        Me.txt_vlrHist1_11.Text = 0
        Me.txt_vlrHist1_12.Text = 0
        Me.txt_vlrHist1_Total.Text = 0

        Me.txt_percHist1_01.Text = 0
        Me.txt_percHist1_02.Text = 0
        Me.txt_percHist1_03.Text = 0
        Me.txt_percHist1_04.Text = 0
        Me.txt_percHist1_05.Text = 0
        Me.txt_percHist1_06.Text = 0
        Me.txt_percHist1_07.Text = 0
        Me.txt_percHist1_08.Text = 0
        Me.txt_percHist1_09.Text = 0
        Me.txt_percHist1_10.Text = 0
        Me.txt_percHist1_11.Text = 0
        Me.txt_percHist1_12.Text = 0

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

        '-------------------------------------
        Me.txt_vlrHist_QS_01.Text = 0
        Me.txt_vlrHist_QS_02.Text = 0
        Me.txt_vlrHist_QS_03.Text = 0
        Me.txt_vlrHist_QS_04.Text = 0
        Me.txt_vlrHist_QS_05.Text = 0
        Me.txt_vlrHist_QS_06.Text = 0
        Me.txt_vlrHist_QS_07.Text = 0
        Me.txt_vlrHist_QS_08.Text = 0
        Me.txt_vlrHist_QS_09.Text = 0
        Me.txt_vlrHist_QS_10.Text = 0
        Me.txt_vlrHist_QS_11.Text = 0
        Me.txt_vlrHist_QS_12.Text = 0
        Me.txt_vlrHist_QS_Total.Text = 0

        Me.txt_percHist_QS_01.Text = 0
        Me.txt_percHist_QS_02.Text = 0
        Me.txt_percHist_QS_03.Text = 0
        Me.txt_percHist_QS_04.Text = 0
        Me.txt_percHist_QS_05.Text = 0
        Me.txt_percHist_QS_06.Text = 0
        Me.txt_percHist_QS_07.Text = 0
        Me.txt_percHist_QS_08.Text = 0
        Me.txt_percHist_QS_09.Text = 0
        Me.txt_percHist_QS_10.Text = 0
        Me.txt_percHist_QS_11.Text = 0
        Me.txt_percHist_QS_12.Text = 0

        vlrHist_Divergencia_01.Text = 0
        vlrHist_Divergencia_02.Text = 0
        vlrHist_Divergencia_03.Text = 0
        vlrHist_Divergencia_04.Text = 0
        vlrHist_Divergencia_05.Text = 0
        vlrHist_Divergencia_06.Text = 0
        vlrHist_Divergencia_07.Text = 0
        vlrHist_Divergencia_08.Text = 0
        vlrHist_Divergencia_09.Text = 0
        vlrHist_Divergencia_10.Text = 0
        vlrHist_Divergencia_11.Text = 0
        vlrHist_Divergencia_12.Text = 0
        vlrHist_Divergencia_Total.Text = 0

        percHist_Divergencia_01.Text = 0
        percHist_Divergencia_02.Text = 0
        percHist_Divergencia_03.Text = 0
        percHist_Divergencia_04.Text = 0
        percHist_Divergencia_05.Text = 0
        percHist_Divergencia_06.Text = 0
        percHist_Divergencia_07.Text = 0
        percHist_Divergencia_08.Text = 0
        percHist_Divergencia_09.Text = 0
        percHist_Divergencia_10.Text = 0
        percHist_Divergencia_11.Text = 0
        percHist_Divergencia_12.Text = 0
        percHist_Divergencia_Total.Text = 0

    End Sub

    Private Sub Calcular_update()
        On Error Resume Next
        Call Calcular_QuebraFisica_Mes01()
        Call Calcular_QuebraFisica_Mes02()
        Call Calcular_QuebraFisica_Mes03()
        Call Calcular_QuebraFisica_Mes04()
        Call Calcular_QuebraFisica_Mes05()
        Call Calcular_QuebraFisica_Mes06()
        Call Calcular_QuebraFisica_Mes07()
        Call Calcular_QuebraFisica_Mes08()
        Call Calcular_QuebraFisica_Mes09()
        Call Calcular_QuebraFisica_Mes10()
        Call Calcular_QuebraFisica_Mes11()
        Call Calcular_QuebraFisica_Mes12()
        Call Calculacao()


    End Sub

    Private Sub Calculacao()
        Call Totalizar_QuebraFisica()
        Call Totalizar_QuebraSecao()
    End Sub



    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        Digita_Valor(txt_percCresc01, txt_vlrMeta01, txt_vlrVenda_01, txt_vlrMeta02,
             txt_vlrHist1_01, txt_vlrHist2_01, txt_vlrHist_QS_01, txt_vlrHist_QM_01, txt_percHist1_01, txt_percHist_QS_01)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        Digita_Valor(txt_percCresc02, txt_vlrMeta02, txt_vlrVenda_02, txt_vlrMeta03,
             txt_vlrHist1_02, txt_vlrHist2_02, txt_vlrHist_QS_02, txt_vlrHist_QM_02, txt_percHist1_02, txt_percHist_QS_02)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged
        Digita_Valor(txt_percCresc03, txt_vlrMeta03, txt_vlrVenda_03, txt_vlrMeta04,
             txt_vlrHist1_03, txt_vlrHist2_03, txt_vlrHist_QS_03, txt_vlrHist_QM_03, txt_percHist1_03, txt_percHist_QS_03)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged
        Digita_Valor(txt_percCresc04, txt_vlrMeta04, txt_vlrVenda_04, txt_vlrMeta05,
             txt_vlrHist1_04, txt_vlrHist2_04, txt_vlrHist_QS_04, txt_vlrHist_QM_04, txt_percHist1_04, txt_percHist_QS_04)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged
        Digita_Valor(txt_percCresc05, txt_vlrMeta05, txt_vlrVenda_05, txt_vlrMeta06,
             txt_vlrHist1_05, txt_vlrHist2_05, txt_vlrHist_QS_05, txt_vlrHist_QM_05, txt_percHist1_05, txt_percHist_QS_05)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged
        Digita_Valor(txt_percCresc06, txt_vlrMeta06, txt_vlrVenda_06, txt_vlrMeta07,
             txt_vlrHist1_06, txt_vlrHist2_06, txt_vlrHist_QS_06, txt_vlrHist_QM_06, txt_percHist1_06, txt_percHist_QS_06)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged
        Digita_Valor(txt_percCresc07, txt_vlrMeta07, txt_vlrVenda_07, txt_vlrMeta08,
             txt_vlrHist1_07, txt_vlrHist2_07, txt_vlrHist_QS_07, txt_vlrHist_QM_07, txt_percHist1_07, txt_percHist_QS_07)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged
        Digita_Valor(txt_percCresc08, txt_vlrMeta08, txt_vlrVenda_08, txt_vlrMeta09,
             txt_vlrHist1_08, txt_vlrHist2_08, txt_vlrHist_QS_08, txt_vlrHist_QM_08, txt_percHist1_08, txt_percHist_QS_08)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged
        Digita_Valor(txt_percCresc09, txt_vlrMeta09, txt_vlrVenda_09, txt_vlrMeta10,
             txt_vlrHist1_09, txt_vlrHist2_09, txt_vlrHist_QS_09, txt_vlrHist_QM_09, txt_percHist1_09, txt_percHist_QS_09)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged
        Digita_Valor(txt_percCresc10, txt_vlrMeta10, txt_vlrVenda_10, txt_vlrMeta11,
             txt_vlrHist1_10, txt_vlrHist2_10, txt_vlrHist_QS_10, txt_vlrHist_QM_10, txt_percHist1_10, txt_percHist_QS_10)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged
        Digita_Valor(txt_percCresc11, txt_vlrMeta11, txt_vlrVenda_11, txt_vlrMeta12,
             txt_vlrHist1_11, txt_vlrHist2_11, txt_vlrHist_QS_11, txt_vlrHist_QM_11, txt_percHist1_11, txt_percHist_QS_11)
        Totalizar_Meta()
    End Sub

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged
        Digita_Valor(txt_percCresc12, txt_vlrMeta12, txt_vlrVenda_12, txt_vlrMeta01,
             txt_vlrHist1_12, txt_vlrHist2_12, txt_vlrHist_QS_12, txt_vlrHist_QM_12, txt_percHist1_12, txt_percHist_QS_12)
        Totalizar_Meta()
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

        'Divergência
        Salvar(5, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_01.Text, Me.txt_percHist2_01.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_02.Text, Me.txt_percHist2_02.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_03.Text, Me.txt_percHist2_03.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_04.Text, Me.txt_percHist2_04.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_05.Text, Me.txt_percHist2_05.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_06.Text, Me.txt_percHist2_06.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_07.Text, Me.txt_percHist2_07.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_08.Text, Me.txt_percHist2_08.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_09.Text, Me.txt_percHist2_09.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_10.Text, Me.txt_percHist2_10.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_11.Text, Me.txt_percHist2_11.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_12.Text, Me.txt_percHist2_12.Text, Me.cboPosicao.CallPosicao)
        Salvar(5, Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist2_Total.Text, Me.txt_percHist2_Total.Text, Me.cboPosicao.CallPosicao)

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

        'Quebra Total
        Salvar("7", Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_01.Text, Me.txt_percHist_QS_01.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_02.Text, Me.txt_percHist_QS_02.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_03.Text, Me.txt_percHist_QS_03.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_04.Text, Me.txt_percHist_QS_04.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_05.Text, Me.txt_percHist_QS_05.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_06.Text, Me.txt_percHist_QS_06.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_07.Text, Me.txt_percHist_QS_07.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_08.Text, Me.txt_percHist_QS_08.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_09.Text, Me.txt_percHist_QS_09.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_10.Text, Me.txt_percHist_QS_10.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_11.Text, Me.txt_percHist_QS_11.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_12.Text, Me.txt_percHist_QS_12.Text, Me.cboPosicao.CallPosicao)
        Salvar("7", Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrHist_QS_Total.Text, Me.txt_percHist_QS_Total.Text, Me.cboPosicao.CallPosicao)

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

    Private Sub CalcularValorDivergencia()
        On Error Resume Next
        vlrHist_Divergencia_01.Text = oFun.Calculate(txt_vlrVenda_01.Text, percHist_Divergencia_01.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_02.Text = oFun.Calculate(txt_vlrVenda_02.Text, percHist_Divergencia_02.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_03.Text = oFun.Calculate(txt_vlrVenda_03.Text, percHist_Divergencia_03.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_04.Text = oFun.Calculate(txt_vlrVenda_04.Text, percHist_Divergencia_04.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_05.Text = oFun.Calculate(txt_vlrVenda_05.Text, percHist_Divergencia_05.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_06.Text = oFun.Calculate(txt_vlrVenda_06.Text, percHist_Divergencia_06.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_07.Text = oFun.Calculate(txt_vlrVenda_07.Text, percHist_Divergencia_07.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_08.Text = oFun.Calculate(txt_vlrVenda_08.Text, percHist_Divergencia_08.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_09.Text = oFun.Calculate(txt_vlrVenda_09.Text, percHist_Divergencia_09.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_10.Text = oFun.Calculate(txt_vlrVenda_10.Text, percHist_Divergencia_10.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_11.Text = oFun.Calculate(txt_vlrVenda_11.Text, percHist_Divergencia_11.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        vlrHist_Divergencia_12.Text = oFun.Calculate(txt_vlrVenda_12.Text, percHist_Divergencia_12.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")

        Call Totalizar_Divergencia()
    End Sub

    Private Sub CalcularValorQuebraDivergencia()

        Me.txt_vlrHist_QM_01.Text = oFun.Calculate(txt_vlrVenda_01.Text, txt_percHist_QM_01.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_02.Text = oFun.Calculate(txt_vlrVenda_02.Text, txt_percHist_QM_02.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_03.Text = oFun.Calculate(txt_vlrVenda_03.Text, txt_percHist_QM_03.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_04.Text = oFun.Calculate(txt_vlrVenda_04.Text, txt_percHist_QM_04.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_05.Text = oFun.Calculate(txt_vlrVenda_05.Text, txt_percHist_QM_05.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_06.Text = oFun.Calculate(txt_vlrVenda_06.Text, txt_percHist_QM_06.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_07.Text = oFun.Calculate(txt_vlrVenda_07.Text, txt_percHist_QM_07.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_08.Text = oFun.Calculate(txt_vlrVenda_08.Text, txt_percHist_QM_08.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_09.Text = oFun.Calculate(txt_vlrVenda_09.Text, txt_percHist_QM_09.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_10.Text = oFun.Calculate(txt_vlrVenda_10.Text, txt_percHist_QM_10.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_11.Text = oFun.Calculate(txt_vlrVenda_11.Text, txt_percHist_QM_11.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Me.txt_vlrHist_QM_12.Text = oFun.Calculate(txt_vlrVenda_12.Text, txt_percHist_QM_12.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
        Call Totalizar_Hist3()
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

    Private Sub Calcular_QuebraFisica_Mes01()
        Calcular_QuebraFisica(txt_vlrHist1_01, txt_vlrMeta01, txt_vlrHist2_01, txt_vlrHist_QS_01, txt_vlrHist_QM_01, txt_percHist1_01, txt_vlrVenda_01, txt_percHist_QS_01)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes02()
        Calcular_QuebraFisica(txt_vlrHist1_02, txt_vlrMeta02, txt_vlrHist2_02, txt_vlrHist_QS_02, txt_vlrHist_QM_02, txt_percHist1_02, txt_vlrVenda_02, txt_percHist_QS_02)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes03()
        Calcular_QuebraFisica(txt_vlrHist1_03, txt_vlrMeta03, txt_vlrHist2_03, txt_vlrHist_QS_03, txt_vlrHist_QM_03, txt_percHist1_03, txt_vlrVenda_03, txt_percHist_QS_03)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes04()
        Calcular_QuebraFisica(txt_vlrHist1_04, txt_vlrMeta04, txt_vlrHist2_04, txt_vlrHist_QS_04, txt_vlrHist_QM_04, txt_percHist1_04, txt_vlrVenda_04, txt_percHist_QS_04)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes05()
        Calcular_QuebraFisica(txt_vlrHist1_05, txt_vlrMeta05, txt_vlrHist2_05, txt_vlrHist_QS_05, txt_vlrHist_QM_05, txt_percHist1_05, txt_vlrVenda_05, txt_percHist_QS_05)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes06()
        Calcular_QuebraFisica(txt_vlrHist1_06, txt_vlrMeta06, txt_vlrHist2_06, txt_vlrHist_QS_06, txt_vlrHist_QM_06, txt_percHist1_06, txt_vlrVenda_06, txt_percHist_QS_06)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes07()
        Calcular_QuebraFisica(txt_vlrHist1_07, txt_vlrMeta07, txt_vlrHist2_07, txt_vlrHist_QS_07, txt_vlrHist_QM_07, txt_percHist1_07, txt_vlrVenda_07, txt_percHist_QS_07)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes08()
        Calcular_QuebraFisica(txt_vlrHist1_08, txt_vlrMeta08, txt_vlrHist2_08, txt_vlrHist_QS_08, txt_vlrHist_QM_08, txt_percHist1_08, txt_vlrVenda_08, txt_percHist_QS_08)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes09()
        Calcular_QuebraFisica(txt_vlrHist1_09, txt_vlrMeta09, txt_vlrHist2_09, txt_vlrHist_QS_09, txt_vlrHist_QM_09, txt_percHist1_09, txt_vlrVenda_09, txt_percHist_QS_09)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes10()
        Calcular_QuebraFisica(txt_vlrHist1_10, txt_vlrMeta10, txt_vlrHist2_10, txt_vlrHist_QS_10, txt_vlrHist_QM_10, txt_percHist1_10, txt_vlrVenda_10, txt_percHist_QS_10)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes11()
        Calcular_QuebraFisica(txt_vlrHist1_11, txt_vlrMeta11, txt_vlrHist2_11, txt_vlrHist_QS_11, txt_vlrHist_QM_11, txt_percHist1_11, txt_vlrVenda_11, txt_percHist_QS_11)
    End Sub

    Private Sub Calcular_QuebraFisica_Mes12()
        Calcular_QuebraFisica(txt_vlrHist1_12, txt_vlrMeta12, txt_vlrHist2_12, txt_vlrHist_QS_12, txt_vlrHist_QM_12, txt_percHist1_12, txt_vlrVenda_12, txt_percHist_QS_12)
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
        Call Calculacao()
        CDbl(txt_vlrHist2.Text).ToString("n0")
    End Sub
#End Region

#Region " METAS"

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        Digita_Percentual(txt_vlrMeta01, txt_percCresc01, txt_vlrVenda_01, txt_percCresc02,
                                  txt_vlrHist1_01, txt_vlrHist2_01, txt_vlrHist_QS_01, txt_vlrHist_QM_01, txt_percHist1_01, txt_percHist_QS_01)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        Digita_Percentual(txt_vlrMeta02, txt_percCresc02, txt_vlrVenda_02, txt_percCresc03,
                                  txt_vlrHist1_02, txt_vlrHist2_02, txt_vlrHist_QS_02, txt_vlrHist_QM_02, txt_percHist1_02, txt_percHist_QS_02)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        Digita_Percentual(txt_vlrMeta03, txt_percCresc03, txt_vlrVenda_03, txt_percCresc04,
                                  txt_vlrHist1_03, txt_vlrHist2_03, txt_vlrHist_QS_03, txt_vlrHist_QM_03, txt_percHist1_03, txt_percHist_QS_03)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        Digita_Percentual(txt_vlrMeta04, txt_percCresc04, txt_vlrVenda_04, txt_percCresc05,
                                  txt_vlrHist1_04, txt_vlrHist2_04, txt_vlrHist_QS_04, txt_vlrHist_QM_04, txt_percHist1_04, txt_percHist_QS_04)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        Digita_Percentual(txt_vlrMeta05, txt_percCresc05, txt_vlrVenda_05, txt_percCresc06,
                                  txt_vlrHist1_05, txt_vlrHist2_05, txt_vlrHist_QS_05, txt_vlrHist_QM_05, txt_percHist1_05, txt_percHist_QS_05)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        Digita_Percentual(txt_vlrMeta06, txt_percCresc06, txt_vlrVenda_06, txt_percCresc07,
                                  txt_vlrHist1_06, txt_vlrHist2_06, txt_vlrHist_QS_06, txt_vlrHist_QM_06, txt_percHist1_06, txt_percHist_QS_06)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        Digita_Percentual(txt_vlrMeta07, txt_percCresc07, txt_vlrVenda_07, txt_percCresc08,
                                  txt_vlrHist1_07, txt_vlrHist2_07, txt_vlrHist_QS_07, txt_vlrHist_QM_07, txt_percHist1_07, txt_percHist_QS_07)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged
        Digita_Percentual(txt_vlrMeta08, txt_percCresc08, txt_vlrVenda_08, txt_percCresc09,
                                  txt_vlrHist1_08, txt_vlrHist2_08, txt_vlrHist_QS_08, txt_vlrHist_QM_08, txt_percHist1_08, txt_percHist_QS_08)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        Digita_Percentual(txt_vlrMeta09, txt_percCresc09, txt_vlrVenda_09, txt_percCresc10,
                                  txt_vlrHist1_09, txt_vlrHist2_09, txt_vlrHist_QS_09, txt_vlrHist_QM_09, txt_percHist1_09, txt_percHist_QS_09)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        Digita_Percentual(txt_vlrMeta10, txt_percCresc10, txt_vlrVenda_10, txt_percCresc11,
                                  txt_vlrHist1_10, txt_vlrHist2_10, txt_vlrHist_QS_10, txt_vlrHist_QM_10, txt_percHist1_10, txt_percHist_QS_10)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        Digita_Percentual(txt_vlrMeta11, txt_percCresc11, txt_vlrVenda_11, txt_percCresc12,
                                  txt_vlrHist1_11, txt_vlrHist2_11, txt_vlrHist_QS_11, txt_vlrHist_QM_11, txt_percHist1_11, txt_percHist_QS_11)
        Call Totalizar_Meta()
    End Sub

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        Digita_Percentual(txt_vlrMeta12, txt_percCresc12, txt_vlrVenda_12, txt_percCresc01,
                                  txt_vlrHist1_12, txt_vlrHist2_12, txt_vlrHist_QS_12, txt_vlrHist_QM_12, txt_percHist1_12, txt_percHist_QS_12)
        Call Totalizar_Meta()
    End Sub

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

        'META DE Divergência
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_01, Me.txt_percHist2_01)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_02, Me.txt_percHist2_02)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_03, Me.txt_percHist2_03)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_04, Me.txt_percHist2_04)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_05, Me.txt_percHist2_05)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_06, Me.txt_percHist2_06)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_07, Me.txt_percHist2_07)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_08, Me.txt_percHist2_08)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_09, Me.txt_percHist2_09)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_10, Me.txt_percHist2_10)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_11, Me.txt_percHist2_11)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_12, Me.txt_percHist2_12)
        Call MudarCorNegativo_TextBox(Me.txt_vlrHist2_Total, Me.txt_percHist2_Total)

        'Quebra Fisica
        Call MudarCorNegativo(Me.txt_vlrHist1_01, Me.txt_percHist1_01)
        Call MudarCorNegativo(Me.txt_vlrHist1_02, Me.txt_percHist1_02)
        Call MudarCorNegativo(Me.txt_vlrHist1_03, Me.txt_percHist1_03)
        Call MudarCorNegativo(Me.txt_vlrHist1_04, Me.txt_percHist1_04)
        Call MudarCorNegativo(Me.txt_vlrHist1_05, Me.txt_percHist1_05)
        Call MudarCorNegativo(Me.txt_vlrHist1_06, Me.txt_percHist1_06)
        Call MudarCorNegativo(Me.txt_vlrHist1_07, Me.txt_percHist1_07)
        Call MudarCorNegativo(Me.txt_vlrHist1_08, Me.txt_percHist1_08)
        Call MudarCorNegativo(Me.txt_vlrHist1_09, Me.txt_percHist1_09)
        Call MudarCorNegativo(Me.txt_vlrHist1_10, Me.txt_percHist1_10)
        Call MudarCorNegativo(Me.txt_vlrHist1_11, Me.txt_percHist1_11)
        Call MudarCorNegativo(Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        Call MudarCorNegativo(Me.txt_vlrHist1_Total, Me.txt_percHist1_Total)

        'Quebra Margem
        Call MudarCorNegativo(Me.txt_vlrHist_QM_01, Me.txt_percHist_QM_01)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_02, Me.txt_percHist_QM_02)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_03, Me.txt_percHist_QM_03)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_04, Me.txt_percHist_QM_04)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_05, Me.txt_percHist_QM_05)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_06, Me.txt_percHist_QM_06)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_07, Me.txt_percHist_QM_07)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_08, Me.txt_percHist_QM_08)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_09, Me.txt_percHist_QM_09)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_10, Me.txt_percHist_QM_10)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_11, Me.txt_percHist_QM_11)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_12, Me.txt_percHist_QM_12)
        Call MudarCorNegativo(Me.txt_vlrHist_QM_Total, Me.txt_percHist_QM_Total)

        'Quebra Seção
        Call MudarCorNegativo(Me.txt_vlrHist_QS_01, Me.txt_percHist_QS_01)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_02, Me.txt_percHist_QS_02)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_03, Me.txt_percHist_QS_03)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_04, Me.txt_percHist_QS_04)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_05, Me.txt_percHist_QS_05)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_06, Me.txt_percHist_QS_06)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_07, Me.txt_percHist_QS_07)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_08, Me.txt_percHist_QS_08)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_09, Me.txt_percHist_QS_09)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_10, Me.txt_percHist_QS_10)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_11, Me.txt_percHist_QS_11)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_12, Me.txt_percHist_QS_12)
        Call MudarCorNegativo(Me.txt_vlrHist_QS_Total, Me.txt_percHist_QS_Total)

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

        'Historico DIVERGENCIA
        Call MudarCorNegativo(vlrHist_Divergencia_01, percHist_Divergencia_01)
        Call MudarCorNegativo(vlrHist_Divergencia_02, percHist_Divergencia_02)
        Call MudarCorNegativo(vlrHist_Divergencia_03, percHist_Divergencia_03)
        Call MudarCorNegativo(vlrHist_Divergencia_04, percHist_Divergencia_04)
        Call MudarCorNegativo(vlrHist_Divergencia_05, percHist_Divergencia_05)
        Call MudarCorNegativo(vlrHist_Divergencia_06, percHist_Divergencia_06)
        Call MudarCorNegativo(vlrHist_Divergencia_07, percHist_Divergencia_07)
        Call MudarCorNegativo(vlrHist_Divergencia_08, percHist_Divergencia_08)
        Call MudarCorNegativo(vlrHist_Divergencia_09, percHist_Divergencia_09)
        Call MudarCorNegativo(vlrHist_Divergencia_10, percHist_Divergencia_10)
        Call MudarCorNegativo(vlrHist_Divergencia_11, percHist_Divergencia_11)
        Call MudarCorNegativo(vlrHist_Divergencia_12, percHist_Divergencia_12)
        Call MudarCorNegativo(vlrHist_Divergencia_Total, percHist_Divergencia_Total)


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

#Region " DIVERGENCIAS"

    Protected Sub txt_percHist2_01_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_01.TextChanged
        Digita_Percentual(txt_vlrHist2_01, txt_percHist2_01, txt_vlrVenda_01, txt_percHist2_02,
                                  txt_vlrHist1_01, txt_vlrHist2_01, txt_vlrHist_QS_01, txt_vlrHist_QM_01, txt_percHist1_01, txt_percHist_QS_01)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_02_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_02.TextChanged
        Digita_Percentual(txt_vlrHist2_02, txt_percHist2_02, txt_vlrVenda_02, txt_percHist2_03,
                          txt_vlrHist1_02, txt_vlrHist2_02, txt_vlrHist_QS_02, txt_vlrHist_QM_02, txt_percHist1_02, txt_percHist_QS_02)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_03_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_03.TextChanged
        Digita_Percentual(txt_vlrHist2_03, txt_percHist2_03, txt_vlrVenda_03, txt_percHist2_04,
                          txt_vlrHist1_03, txt_vlrHist2_03, txt_vlrHist_QS_03, txt_vlrHist_QM_03, txt_percHist1_03, txt_percHist_QS_03)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_04_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_04.TextChanged
        Digita_Percentual(txt_vlrHist2_04, txt_percHist2_04, txt_vlrVenda_04, txt_percHist2_05,
                          txt_vlrHist1_04, txt_vlrHist2_04, txt_vlrHist_QS_04, txt_vlrHist_QM_04, txt_percHist1_04, txt_percHist_QS_04)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_05_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_05.TextChanged
        Digita_Percentual(txt_vlrHist2_05, txt_percHist2_05, txt_vlrVenda_05, txt_percHist2_06,
                          txt_vlrHist1_05, txt_vlrHist2_05, txt_vlrHist_QS_05, txt_vlrHist_QM_05, txt_percHist1_05, txt_percHist_QS_05)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_06_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_06.TextChanged
        Digita_Percentual(txt_vlrHist2_06, txt_percHist2_06, txt_vlrVenda_06, txt_percHist2_07,
                          txt_vlrHist1_06, txt_vlrHist2_06, txt_vlrHist_QS_06, txt_vlrHist_QM_06, txt_percHist1_06, txt_percHist_QS_06)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_07_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_07.TextChanged
        Digita_Percentual(txt_vlrHist2_07, txt_percHist2_07, txt_vlrVenda_07, txt_percHist2_08,
                          txt_vlrHist1_07, txt_vlrHist2_07, txt_vlrHist_QS_07, txt_vlrHist_QM_07, txt_percHist1_07, txt_percHist_QS_07)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_08_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_08.TextChanged
        Digita_Percentual(txt_vlrHist2_08, txt_percHist2_08, txt_vlrVenda_08, txt_percHist2_09,
                          txt_vlrHist1_08, txt_vlrHist2_08, txt_vlrHist_QS_08, txt_vlrHist_QM_08, txt_percHist1_08, txt_percHist_QS_08)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_09_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_09.TextChanged
        Digita_Percentual(txt_vlrHist2_09, txt_percHist2_09, txt_vlrVenda_09, txt_percHist2_10,
                          txt_vlrHist1_09, txt_vlrHist2_09, txt_vlrHist_QS_09, txt_vlrHist_QM_09, txt_percHist1_09, txt_percHist_QS_09)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_10_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_10.TextChanged
        Digita_Percentual(txt_vlrHist2_10, txt_percHist2_10, txt_vlrVenda_10, txt_percHist2_11,
                          txt_vlrHist1_10, txt_vlrHist2_10, txt_vlrHist_QS_10, txt_vlrHist_QM_10, txt_percHist1_10, txt_percHist_QS_10)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_11_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_11.TextChanged
        Digita_Percentual(txt_vlrHist2_11, txt_percHist2_11, txt_vlrVenda_11, txt_percHist2_12,
                          txt_vlrHist1_11, txt_vlrHist2_11, txt_vlrHist_QS_11, txt_vlrHist_QM_11, txt_percHist1_11, txt_percHist_QS_11)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_percHist2_12_TextChanged(sender As Object, e As EventArgs) Handles txt_percHist2_12.TextChanged
        Digita_Percentual(txt_vlrHist2_12, txt_percHist2_12, txt_vlrVenda_12, txt_percHist2_01,
                          txt_vlrHist1_12, txt_vlrHist2_12, txt_vlrHist_QS_12, txt_vlrHist_QM_12, txt_percHist1_12, txt_percHist_QS_12)
        Totalizar_Hist2()
    End Sub

#End Region

    Protected Sub txt_vlrHist2_01_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_01.TextChanged
        Digita_Valor(txt_percHist2_01, txt_vlrHist2_01, txt_vlrVenda_01, txt_vlrHist2_02,
                     txt_vlrHist1_01, txt_vlrHist2_01, txt_vlrHist_QS_01, txt_vlrHist_QM_01, txt_percHist1_01, txt_percHist_QS_01)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_02_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_02.TextChanged
        Digita_Valor(txt_percHist2_02, txt_vlrHist2_02, txt_vlrVenda_02, txt_vlrHist2_03,
                     txt_vlrHist1_02, txt_vlrHist2_02, txt_vlrHist_QS_02, txt_vlrHist_QM_02, txt_percHist1_02, txt_percHist_QS_02)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_03_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_03.TextChanged
        Digita_Valor(txt_percHist2_03, txt_vlrHist2_03, txt_vlrVenda_03, txt_vlrHist2_04,
                     txt_vlrHist1_03, txt_vlrHist2_03, txt_vlrHist_QS_03, txt_vlrHist_QM_03, txt_percHist1_03, txt_percHist_QS_03)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_04_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_04.TextChanged
        Digita_Valor(txt_percHist2_04, txt_vlrHist2_04, txt_vlrVenda_04, txt_vlrHist2_05,
                     txt_vlrHist1_04, txt_vlrHist2_04, txt_vlrHist_QS_04, txt_vlrHist_QM_04, txt_percHist1_04, txt_percHist_QS_04)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_05_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_05.TextChanged
        Digita_Valor(txt_percHist2_05, txt_vlrHist2_05, txt_vlrVenda_05, txt_vlrHist2_06,
                     txt_vlrHist1_05, txt_vlrHist2_05, txt_vlrHist_QS_05, txt_vlrHist_QM_05, txt_percHist1_05, txt_percHist_QS_05)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_06_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_06.TextChanged
        Digita_Valor(txt_percHist2_06, txt_vlrHist2_06, txt_vlrVenda_06, txt_vlrHist2_07,
                     txt_vlrHist1_06, txt_vlrHist2_06, txt_vlrHist_QS_06, txt_vlrHist_QM_06, txt_percHist1_06, txt_percHist_QS_06)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_07_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_07.TextChanged
        Digita_Valor(txt_percHist2_07, txt_vlrHist2_07, txt_vlrVenda_07, txt_vlrHist2_08,
                     txt_vlrHist1_07, txt_vlrHist2_07, txt_vlrHist_QS_07, txt_vlrHist_QM_07, txt_percHist1_07, txt_percHist_QS_07)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_08_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_08.TextChanged
        Digita_Valor(txt_percHist2_08, txt_vlrHist2_08, txt_vlrVenda_08, txt_vlrHist2_09,
                     txt_vlrHist1_08, txt_vlrHist2_08, txt_vlrHist_QS_08, txt_vlrHist_QM_08, txt_percHist1_08, txt_percHist_QS_08)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_09_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_09.TextChanged
        Digita_Valor(txt_percHist2_09, txt_vlrHist2_09, txt_vlrVenda_09, txt_vlrHist2_10,
                     txt_vlrHist1_09, txt_vlrHist2_09, txt_vlrHist_QS_09, txt_vlrHist_QM_09, txt_percHist1_09, txt_percHist_QS_09)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_10_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_10.TextChanged
        Digita_Valor(txt_percHist2_10, txt_vlrHist2_10, txt_vlrVenda_10, txt_vlrHist2_11,
                     txt_vlrHist1_10, txt_vlrHist2_10, txt_vlrHist_QS_10, txt_vlrHist_QM_10, txt_percHist1_10, txt_percHist_QS_10)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_11_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_11.TextChanged
        Digita_Valor(txt_percHist2_11, txt_vlrHist2_11, txt_vlrVenda_11, txt_vlrHist2_12,
                     txt_vlrHist1_11, txt_vlrHist2_11, txt_vlrHist_QS_11, txt_vlrHist_QM_11, txt_percHist1_11, txt_percHist_QS_11)
        Totalizar_Hist2()
    End Sub

    Protected Sub txt_vlrHist2_12_TextChanged(sender As Object, e As EventArgs) Handles txt_vlrHist2_12.TextChanged
        Digita_Valor(txt_percHist2_12, txt_vlrHist2_12, txt_vlrVenda_12, txt_vlrHist2_01,
                     txt_vlrHist1_12, txt_vlrHist2_12, txt_vlrHist_QS_12, txt_vlrHist_QM_12, txt_percHist1_12, txt_percHist_QS_12)
        Totalizar_Hist2()
    End Sub


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
