
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_frmCadVendaPosto
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim no As Double
    Dim varDepto As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oOrc As New Orcamento

    Sub BuscaVendaReal_Ano()
        'Ano M3
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 3, Me.cboFilial.CallFilial)
        If CDbl(Me.txt_vlrHist3_Total.Text) = 0 Then
            Me.txt_percHist3_Total.Text = 0
        Else
            Me.txt_percHist3_Total.Text = (CDbl(Me.txt_vlrHist3_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M2
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 2, Me.cboFilial.CallFilial)
        If CDbl(Me.txt_vlrHist3_Total.Text) = 0 Then
            Me.txt_percHist2_Total.Text = 0
        Else
            Me.txt_percHist2_Total.Text = (CDbl(Me.txt_vlrHist2_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M1
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 1, Me.cboFilial.CallFilial)
        If CDbl(Me.txt_vlrHist3_Total.Text) = 0 Then
            Me.txt_percHist1_Total.Text = 0
        Else
            Me.txt_percHist1_Total.Text = (CDbl(Me.txt_vlrHist1_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If


    End Sub 'Codigo REVISTO

    Sub BuscaVendaReal_Hist1(ByVal iFilial As Byte, ByVal iStatus As Byte)
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        Dim varSecao, varAno As Int32
        varStatus = iStatus   'Venda
        varSecao = Me.cboSecao.CallSecao
        varAno = Me.cboAno.CallAno - 1

        If Month(Now()) = 1 Then    'Janeiro
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 1, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 2, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 2 Then    'Fevereiro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 2, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 3 Then    'Março
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 4 Then    'Abril
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 5 Then    'Maio
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 6 Then    'Junho
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 7 Then    'Julho
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 8 Then    'Agosto
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 9 Then    'Setembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 10 Then    'Outubro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 11 Then    'Novembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Mes(varAno, 10, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 12 Then    'Dezembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_001, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_002, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_003, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_004, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_005, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_006, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_007, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_008, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_595, Me.txt_percHist1_09)
            Call Preencher_Hist1_Mes(varAno, 10, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_405, Me.txt_percHist1_10)
            Call Preencher_Hist1_Mes(varAno, 11, iFilial, varSecao, varStatus, Me.lbl_vlrHist_AA1_587, Me.txt_percHist1_11)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.lbl_vlrHist_AA1_454, Me.txt_percHist1_12)
        End If

        'Calcular  Total
        Me.txt_vlrHist1_Total.Text = CDbl(CDbl(Me.lbl_vlrHist_AA1_001.Text) + CDbl(Me.lbl_vlrHist_AA1_002.Text) + CDbl(Me.lbl_vlrHist_AA1_003.Text) + _
                                    CDbl(Me.lbl_vlrHist_AA1_004.Text) + CDbl(Me.lbl_vlrHist_AA1_005.Text) + CDbl(Me.lbl_vlrHist_AA1_006.Text) + _
                                    CDbl(Me.lbl_vlrHist_AA1_007.Text) + CDbl(Me.lbl_vlrHist_AA1_008.Text) + CDbl(Me.lbl_vlrHist_AA1_595.Text) + _
                                    CDbl(Me.lbl_vlrHist_AA1_405.Text) + CDbl(Me.lbl_vlrHist_AA1_587.Text) + CDbl(Me.lbl_vlrHist_AA1_454.Text)).ToString("n0")
    End Sub  'Codigo REVISTO

    Private Sub Preencher_Hist1_Meta_Mes(ByVal iFilial As String, ByVal iSecao As String, ByVal iAno As Int32, ByVal iMes As String, iVlr As Label, iPerc As Label)
        oVem.BuscaRevSecaoMes(1, iSecao, iAno, iMes, iFilial)
        iVlr.Text = oVem.vlrRev
        iPerc.Text = oVem.percRev
    End Sub 'Codigo REVISTO

    Private Sub Preencher_Hist1_Mes(ByVal iAno As Int32, ByVal iMes As Byte, ByVal iFilial As Byte, ByVal iSecao As Int32, ByVal iStatus As Byte, ByVal iVlr As Label, ByVal iPerc As Label)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, iMes, iFilial, iSecao, iStatus)
        iVlr.Text = oVem.vlrRea
        iPerc.Text = oVem.percRea
    End Sub 'Codigo REVISTO

    Sub BuscaVendaReal_Hist2(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String, iHistTotal As Label)
        Call BuscaVendaReal_Historico(iAno, 1, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_001, Me.txt_percHist2_01)
        Call BuscaVendaReal_Historico(iAno, 2, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_002, Me.txt_percHist2_02)
        Call BuscaVendaReal_Historico(iAno, 3, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_003, Me.txt_percHist2_03)
        Call BuscaVendaReal_Historico(iAno, 4, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_004, Me.txt_percHist2_04)
        Call BuscaVendaReal_Historico(iAno, 5, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_005, Me.txt_percHist2_05)
        Call BuscaVendaReal_Historico(iAno, 6, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_006, Me.txt_percHist2_06)
        Call BuscaVendaReal_Historico(iAno, 7, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_007, Me.txt_percHist2_07)
        Call BuscaVendaReal_Historico(iAno, 8, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_008, Me.txt_percHist2_08)
        Call BuscaVendaReal_Historico(iAno, 9, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_595, Me.txt_percHist2_09)
        Call BuscaVendaReal_Historico(iAno, 10, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_405, Me.txt_percHist2_10)
        Call BuscaVendaReal_Historico(iAno, 11, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_587, Me.txt_percHist2_11)
        Call BuscaVendaReal_Historico(iAno, 12, iFilial, iSecao, 1, Me.lbl_vlrHist_AA2_454, Me.txt_percHist2_12)
        oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao)
        iHistTotal.Text = oVem.vlrRea
    End Sub ' Código REVISTO

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String, iHistTotal As Label)
        Call BuscaVendaReal_Historico(iAno, 1, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_001, Me.txt_percHist3_01)
        Call BuscaVendaReal_Historico(iAno, 2, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_002, Me.txt_percHist3_02)
        Call BuscaVendaReal_Historico(iAno, 3, iFilial, iSecao, 1, Me.lbl_vlrHist_Secao_003, Me.txt_percHist3_03)
        Call BuscaVendaReal_Historico(iAno, 4, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_004, Me.txt_percHist3_04)
        Call BuscaVendaReal_Historico(iAno, 5, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_005, Me.txt_percHist3_05)
        Call BuscaVendaReal_Historico(iAno, 6, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_006, Me.txt_percHist3_06)
        Call BuscaVendaReal_Historico(iAno, 7, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_007, Me.txt_percHist3_07)
        Call BuscaVendaReal_Historico(iAno, 8, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_008, Me.txt_percHist3_08)
        Call BuscaVendaReal_Historico(iAno, 9, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_595, Me.txt_percHist3_09)
        Call BuscaVendaReal_Historico(iAno, 10, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_405, Me.txt_percHist3_10)
        Call BuscaVendaReal_Historico(iAno, 11, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_587, Me.txt_percHist3_11)
        Call BuscaVendaReal_Historico(iAno, 12, iFilial, iSecao, 1, Me.lbl_vlrHist_AA3_454, Me.txt_percHist3_12)
        oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao)
        iHistTotal.Text = oVem.vlrRea
    End Sub  ' Código REVISTO

    Private Sub BuscaVendaReal_Historico(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String, ByVal iVlr As Label, iPerc As Label)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, iMes, iFilial, iSecao, iStatus)
        iVlr.Text = oVem.vlrRea
        iPerc.Text = oVem.percRea
    End Sub 'Codigo REVISTO

    Private Sub BuscaMetaDet(ByVal iAno As Int32, ByVal iMes As Byte, ByVal iFilial As Byte, ByVal iSecao As Byte, ByVal iPosicao As Byte, ByVal iTipoSecao As Byte, ByVal iVlr As TextBox)
        oVem.BuscaSecao_VendaMargem_Ori(iAno, iMes, iFilial, iSecao, iPosicao, iTipoSecao)
        iVlr.Text = oVem.vlrOri
    End Sub 'Codigo REVISTO

    Private Sub BuscaMeta(ByVal iAno As Int32, ByVal iFilial As Byte, ByVal iSecao As Byte, ByVal iPosicao As Byte, ByVal iTipoSecao As Byte)
        Call BuscaMetaDet(iAno, 1, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_001)
        Call BuscaMetaDet(iAno, 2, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_002)
        Call BuscaMetaDet(iAno, 3, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_003)
        Call BuscaMetaDet(iAno, 4, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_004)
        Call BuscaMetaDet(iAno, 5, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_005)
        Call BuscaMetaDet(iAno, 6, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_006)
        Call BuscaMetaDet(iAno, 7, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_007)
        Call BuscaMetaDet(iAno, 8, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_008)
        Call BuscaMetaDet(iAno, 9, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_595)
        Call BuscaMetaDet(iAno, 10, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_405)
        Call BuscaMetaDet(iAno, 11, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_587)
        Call BuscaMetaDet(iAno, 12, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta_454)
        Call Totalizar_Meta()
    End Sub  'Codigo REVISTO

    Sub Atualizar()

        Call ZerarCampos()

        Dim varFilial As String
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = 1   'Venda

        Call ZerarCampos()

        varFilial = oOrc.DefinirFilial(cboFilial.CallFilial)


        Call BuscaVendaReal_Hist1(varFilial, varStatus)
        Call BuscaVendaReal_Hist2(Me.cboAno.CallAno - 2, varFilial, Me.cboSecao.CallSecao, Me.lblDepto.Text, Me.txt_vlrHist2_Total)
        Call BuscaVendaReal_Hist3(Me.cboAno.CallAno - 3, varFilial, Me.cboSecao.CallSecao, Me.lblDepto.Text, Me.txt_vlrHist3_Total)
        Call BuscaVendaReal_Ano()



        'Busca as Metas que foram digitadas e foram salvas
        Call BuscaMeta(cboAno.CallAno, Me.cboFilial.CallFilial, cboSecao.CallSecao, cboPosicao.CallPosicao, 1)

        oVem.BuscaMemo_Ori(Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.lblDepto.Text, Me.cboSecao.CallSecao)

        'Calcular % de Crescimento
        Call CalcularM3()
        Call CalcularM2()
        Call CalcularM1()
        Call CalcularM1_Ano()

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial

        Call HabilitarSalvar()

        Me.gridAnalise.DataBind()
    End Sub

    Private Sub CalcularM3()
        Call Calcular(Me.lbl_vlrHist_AA3_001, Me.lblCresc01_M3, Me.lbl_vlrHist_AA2_001)
        Call Calcular(Me.lbl_vlrHist_AA3_002, Me.lblCresc02_M3, Me.lbl_vlrHist_AA2_002)
        Call Calcular(Me.lbl_vlrHist_Secao_003, Me.lblCresc03_M3, Me.lbl_vlrHist_AA2_003)
        Call Calcular(Me.lbl_vlrHist_AA3_004, Me.lblCresc04_M3, Me.lbl_vlrHist_AA2_004)
        Call Calcular(Me.lbl_vlrHist_AA3_005, Me.lblCresc05_M3, Me.lbl_vlrHist_AA2_005)
        Call Calcular(Me.lbl_vlrHist_AA3_006, Me.lblCresc06_M3, Me.lbl_vlrHist_AA2_006)
        Call Calcular(Me.lbl_vlrHist_AA3_007, Me.lblCresc07_M3, Me.lbl_vlrHist_AA2_007)
        Call Calcular(Me.lbl_vlrHist_AA3_008, Me.lblCresc08_M3, Me.lbl_vlrHist_AA2_008)
        Call Calcular(Me.lbl_vlrHist_AA3_595, Me.lblCresc09_M3, Me.lbl_vlrHist_AA2_595)
        Call Calcular(Me.lbl_vlrHist_AA3_405, Me.lblCresc10_M3, Me.lbl_vlrHist_AA2_405)
        Call Calcular(Me.lbl_vlrHist_AA3_587, Me.lblCresc11_M3, Me.lbl_vlrHist_AA2_587)
        Call Calcular(Me.lbl_vlrHist_AA3_454, Me.lblCresc12_M3, Me.lbl_vlrHist_AA2_454)
        Call Calcular(Me.txt_vlrHist3_Total, Me.lblCrescAno_M3, Me.txt_vlrHist2_Total)

        'Formatar Cor se Negativo
        Call Formatar(Me.lblCresc01_M3)
        Call Formatar(Me.lblCresc02_M3)
        Call Formatar(Me.lblCresc03_M3)
        Call Formatar(Me.lblCresc04_M3)
        Call Formatar(Me.lblCresc05_M3)
        Call Formatar(Me.lblCresc06_M3)
        Call Formatar(Me.lblCresc07_M3)
        Call Formatar(Me.lblCresc08_M3)
        Call Formatar(Me.lblCresc09_M3)
        Call Formatar(Me.lblCresc10_M3)
        Call Formatar(Me.lblCresc11_M3)
        Call Formatar(Me.lblCresc12_M3)
        Call Formatar(Me.lblCrescAno_M3)
    End Sub 'codigo REVISTO

    Private Sub Calcular(ByVal iHistBMes As Label, ByVal iCrescMes As Label, ByVal iHistAMes As Label)
        On Error Resume Next
        If CInt(iHistBMes.Text) = 0 Then
            iCrescMes.Text = 0
        ElseIf CInt(Me.lbl_vlrHist_AA1_001.Text) = 0 Then
            iCrescMes.Text = 0
        Else
            iCrescMes.Text = ((CDbl(iHistAMes.Text) / CDbl(iHistBMes.Text) * 100) - 100).ToString("n1")
        End If
    End Sub 'codigo REVISTO

    Private Sub Formatar(ByVal iCrescMes As Label)
        On Error Resume Next
        If CInt(iCrescMes.Text) < 0 Then
            iCrescMes.ForeColor = Drawing.Color.Red
        Else
            iCrescMes.ForeColor = Drawing.Color.Black
        End If
    End Sub 'codigo REVISTO

    Private Sub CalcularM2()
        Call Calcular(Me.lbl_vlrHist_AA2_001, Me.lblCresc01_M2, Me.lbl_vlrHist_AA1_001)
        Call Calcular(Me.lbl_vlrHist_AA2_002, Me.lblCresc02_M2, Me.lbl_vlrHist_AA1_002)
        Call Calcular(Me.lbl_vlrHist_AA2_003, Me.lblCresc03_M2, Me.lbl_vlrHist_AA1_003)
        Call Calcular(Me.lbl_vlrHist_AA2_004, Me.lblCresc04_M2, Me.lbl_vlrHist_AA1_004)
        Call Calcular(Me.lbl_vlrHist_AA2_005, Me.lblCresc05_M2, Me.lbl_vlrHist_AA1_005)
        Call Calcular(Me.lbl_vlrHist_AA2_006, Me.lblCresc06_M2, Me.lbl_vlrHist_AA1_006)
        Call Calcular(Me.lbl_vlrHist_AA2_007, Me.lblCresc07_M2, Me.lbl_vlrHist_AA1_007)
        Call Calcular(Me.lbl_vlrHist_AA2_008, Me.lblCresc08_M2, Me.lbl_vlrHist_AA1_008)
        Call Calcular(Me.lbl_vlrHist_AA2_595, Me.lblCresc09_M2, Me.lbl_vlrHist_AA1_595)
        Call Calcular(Me.lbl_vlrHist_AA2_405, Me.lblCresc10_M2, Me.lbl_vlrHist_AA1_405)
        Call Calcular(Me.lbl_vlrHist_AA2_587, Me.lblCresc11_M2, Me.lbl_vlrHist_AA1_587)
        Call Calcular(Me.lbl_vlrHist_AA2_454, Me.lblCresc12_M2, Me.lbl_vlrHist_AA1_454)
        Call Calcular(Me.txt_vlrHist2_Total, Me.lblCrescAno_M2, Me.txt_vlrHist1_Total)

        'Formatar Cor se Negativo
        Call Formatar(Me.lblCresc01_M2)
        Call Formatar(Me.lblCresc02_M2)
        Call Formatar(Me.lblCresc03_M2)
        Call Formatar(Me.lblCresc04_M2)
        Call Formatar(Me.lblCresc05_M2)
        Call Formatar(Me.lblCresc06_M2)
        Call Formatar(Me.lblCresc07_M2)
        Call Formatar(Me.lblCresc08_M2)
        Call Formatar(Me.lblCresc09_M2)
        Call Formatar(Me.lblCresc10_M2)
        Call Formatar(Me.lblCresc11_M2)
        Call Formatar(Me.lblCresc12_M2)
        Call Formatar(Me.lblCrescAno_M2)
    End Sub 'codigo REVISTO

    Private Sub CalcularM1_MudaCor_Mes(ByVal iPercCrescMes As TextBox, ByVal iLabelCresc As Label)
        iPercCrescMes.Text = (iPercCrescMes.Text * 1).ToString("n1")    'Formata com duas casa decimais
        If CDbl(iPercCrescMes.Text) < 0 Then
            iPercCrescMes.ForeColor = Drawing.Color.Red
            iLabelCresc.ForeColor = Drawing.Color.Red
        Else
            iPercCrescMes.ForeColor = Drawing.Color.Blue
            iLabelCresc.ForeColor = Drawing.Color.Blue
        End If
    End Sub 'codigo REVISTO

    Private Sub calcularM1_Mes(ByVal iMetaMes As TextBox, ByVal iPercCrescMes As TextBox, ByVal iHistMes As Label, ByVal iLabelCrescMes As Label)
        If CInt(iMetaMes.Text) = 0 Then
            iPercCrescMes.Text = 0
        ElseIf CInt(iHistMes.Text) = 0 Then
            iPercCrescMes.Text = 0
        Else
            iPercCrescMes.Text = ((CDbl(iMetaMes.Text) / CDbl(iHistMes.Text) * 100) - 100).ToString("n1")
        End If
        iLabelCrescMes.Text = iPercCrescMes.Text
        Call CalcularM1_MudaCor_Mes(iPercCrescMes, iLabelCrescMes)
    End Sub 'codigo REVISTO

    Private Sub CalcularM1()
        Call calcularM1_Mes(Me.txt_vlrMeta_001, Me.txt_percCresc01, Me.lbl_vlrHist_AA1_001, Me.lblCresc01_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_002, Me.txt_percCresc02, Me.lbl_vlrHist_AA1_002, Me.lblCresc02_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_003, Me.txt_percCresc03, Me.lbl_vlrHist_AA1_003, Me.lblCresc03_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_004, Me.txt_percCresc04, Me.lbl_vlrHist_AA1_004, Me.lblCresc04_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_005, Me.txt_percCresc05, Me.lbl_vlrHist_AA1_005, Me.lblCresc05_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_006, Me.txt_percCresc06, Me.lbl_vlrHist_AA1_006, Me.lblCresc06_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_007, Me.txt_percCresc07, Me.lbl_vlrHist_AA1_007, Me.lblCresc07_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_008, Me.txt_percCresc08, Me.lbl_vlrHist_AA1_008, Me.lblCresc08_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_595, Me.txt_percCresc09, Me.lbl_vlrHist_AA1_595, Me.lblCresc09_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_405, Me.txt_percCresc10, Me.lbl_vlrHist_AA1_405, Me.lblCresc10_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_587, Me.txt_percCresc11, Me.lbl_vlrHist_AA1_587, Me.lblCresc11_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta_454, Me.txt_percCresc12, Me.lbl_vlrHist_AA1_454, Me.lblCresc12_M1)

        Call CalcularM1_Ano()
    End Sub 'codigo REVISTO

    Private Sub CalcularM1_Ano()
        If CInt(Me.txt_vlrMetaTotal.Text) = 0 Then
            Me.lblCrescAno.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_Total.Text) = 0 Then
            Me.lblCrescAno.Text = 0
        Else
            Me.lblCrescAno.Text = ((CDbl(Me.txt_vlrMetaTotal.Text) / CDbl(Me.txt_vlrHist1_Total.Text) * 100) - 100).ToString("n1")
            Me.lblCrescAno_M1.Text = Me.lblCrescAno.Text
        End If

        'Formatar Cor se Negativo
        If CInt(Me.lblCrescAno.Text) < 0 Then
            Me.lblCrescAno.ForeColor = Drawing.Color.Red
            Me.lblCrescAno_M1.ForeColor = Drawing.Color.Red
        Else
            Me.lblCrescAno.ForeColor = Drawing.Color.Black
            Me.lblCrescAno_M1.ForeColor = Drawing.Color.Black
        End If

    End Sub 'codigo REVISTO

    Sub Totalizar_Hist3()

        no = 0
        no += CDbl(Me.lbl_vlrHist_AA3_001.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_002.Text)
        no += CDbl(Me.lbl_vlrHist_Secao_003.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_004.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_005.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_006.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_007.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_008.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_595.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_405.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_587.Text)
        no += CDbl(Me.lbl_vlrHist_AA3_454.Text)
        Me.txt_vlrHist3_Total.Text = Format(no, "#,##0")

    End Sub

    Sub Totalizar_Hist2()

        no = 0
        no += CDbl(Me.lbl_vlrHist_AA2_001.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_002.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_003.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_004.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_005.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_006.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_007.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_008.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_595.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_405.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_587.Text)
        no += CDbl(Me.lbl_vlrHist_AA2_454.Text)
        Me.txt_vlrHist2_Total.Text = Format(no, "#,##0")

    End Sub

    Sub Totalizar_Hist1()
        On Error Resume Next
        'Formata Campo Valor
        no = 0
        no += CDbl(Me.lbl_vlrHist_AA1_001.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_002.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_003.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_004.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_005.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_006.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_007.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_008.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_595.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_405.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_587.Text)
        no += CDbl(Me.lbl_vlrHist_AA1_454.Text)
        Me.txt_vlrHist1_Total.Text = Format(no, "#,##0")
    End Sub

    Private Sub FormataCampoPercentual(ByVal iVendaMes As Label, iVendaTotal As Label, ByVal iPercPart As Label)
        On Error Resume Next
        If CInt(iVendaMes.Text) = 0 Then
            iPercPart.Text = 0
        Else
            iPercPart.Text = ((iVendaMes.Text / iVendaTotal.Text) * 100).ToString("n2")
        End If
    End Sub 'codigo REVISTO

    Sub Totalizar_Meta()

        'Formata Campo Valor
        no = 0
        no += CDbl(Me.txt_vlrMeta_001.Text)
        no += CDbl(Me.txt_vlrMeta_002.Text)
        no += CDbl(Me.txt_vlrMeta_003.Text)
        no += CDbl(Me.txt_vlrMeta_004.Text)
        no += CDbl(Me.txt_vlrMeta_005.Text)
        no += CDbl(Me.txt_vlrMeta_006.Text)
        no += CDbl(Me.txt_vlrMeta_007.Text)
        no += CDbl(Me.txt_vlrMeta_008.Text)
        no += CDbl(Me.txt_vlrMeta_595.Text)
        no += CDbl(Me.txt_vlrMeta_405.Text)
        no += CDbl(Me.txt_vlrMeta_587.Text)
        no += CDbl(Me.txt_vlrMeta_454.Text)

        Me.txt_vlrMeta_001.Text = CDbl(Me.txt_vlrMeta_001.Text).ToString("n0")
        Me.txt_vlrMeta_002.Text = CDbl(Me.txt_vlrMeta_002.Text).ToString("n0")
        Me.txt_vlrMeta_003.Text = CDbl(Me.txt_vlrMeta_003.Text).ToString("n0")
        Me.txt_vlrMeta_004.Text = CDbl(Me.txt_vlrMeta_004.Text).ToString("n0")
        Me.txt_vlrMeta_005.Text = CDbl(Me.txt_vlrMeta_005.Text).ToString("n0")
        Me.txt_vlrMeta_006.Text = CDbl(Me.txt_vlrMeta_006.Text).ToString("n0")
        Me.txt_vlrMeta_007.Text = CDbl(Me.txt_vlrMeta_007.Text).ToString("n0")
        Me.txt_vlrMeta_008.Text = CDbl(Me.txt_vlrMeta_008.Text).ToString("n0")
        Me.txt_vlrMeta_595.Text = CDbl(Me.txt_vlrMeta_595.Text).ToString("n0")
        Me.txt_vlrMeta_405.Text = CDbl(Me.txt_vlrMeta_405.Text).ToString("n0")
        Me.txt_vlrMeta_587.Text = CDbl(Me.txt_vlrMeta_587.Text).ToString("n0")
        Me.txt_vlrMeta_454.Text = CDbl(Me.txt_vlrMeta_454.Text).ToString("n0")

        Me.txt_vlrMetaTotal.Text = Format(no, "#,##0")

        If CInt(Me.txt_vlrMetaTotal.Text) = 0 Then
            ' Me.txt_percMetaTotal.Text = 0
        Else
            'Me.txt_percMetaTotal.Text = ((Me.txt_vlrMetaTotal.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
            Call CalcularM1_Ano()
        End If


    End Sub

    Sub ZerarCampos()
        '*********  Histórico - 3  **************************
        Me.lbl_vlrHist_AA3_001.Text = 0
        Me.lbl_vlrHist_AA3_002.Text = 0
        Me.lbl_vlrHist_Secao_003.Text = 0
        Me.lbl_vlrHist_AA3_004.Text = 0
        Me.lbl_vlrHist_AA3_005.Text = 0
        Me.lbl_vlrHist_AA3_006.Text = 0
        Me.lbl_vlrHist_AA3_007.Text = 0
        Me.lbl_vlrHist_AA3_008.Text = 0
        Me.lbl_vlrHist_AA3_595.Text = 0
        Me.lbl_vlrHist_AA3_405.Text = 0
        Me.lbl_vlrHist_AA3_587.Text = 0
        Me.lbl_vlrHist_AA3_454.Text = 0
        Me.txt_vlrHist3_Total.Text = 0

        Me.txt_percHist3_01.Text = 0
        Me.txt_percHist3_02.Text = 0
        Me.txt_percHist3_03.Text = 0
        Me.txt_percHist3_04.Text = 0
        Me.txt_percHist3_05.Text = 0
        Me.txt_percHist3_06.Text = 0
        Me.txt_percHist3_07.Text = 0
        Me.txt_percHist3_08.Text = 0
        Me.txt_percHist3_09.Text = 0
        Me.txt_percHist3_10.Text = 0
        Me.txt_percHist3_11.Text = 0
        Me.txt_percHist3_12.Text = 0

        '*********  Histórico - 2  **************************
        Me.lbl_vlrHist_AA2_001.Text = 0
        Me.lbl_vlrHist_AA2_002.Text = 0
        Me.lbl_vlrHist_AA2_003.Text = 0
        Me.lbl_vlrHist_AA2_004.Text = 0
        Me.lbl_vlrHist_AA2_005.Text = 0
        Me.lbl_vlrHist_AA2_006.Text = 0
        Me.lbl_vlrHist_AA2_007.Text = 0
        Me.lbl_vlrHist_AA2_008.Text = 0
        Me.lbl_vlrHist_AA2_595.Text = 0
        Me.lbl_vlrHist_AA2_405.Text = 0
        Me.lbl_vlrHist_AA2_587.Text = 0
        Me.lbl_vlrHist_AA2_454.Text = 0
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
        Me.txt_percHist2_10.Text = 0
        Me.txt_percHist2_11.Text = 0
        Me.txt_percHist2_12.Text = 0

        '*********  Histórico - 1  **************************
        Me.lbl_vlrHist_AA1_001.Text = 0
        Me.lbl_vlrHist_AA1_002.Text = 0
        Me.lbl_vlrHist_AA1_003.Text = 0
        Me.lbl_vlrHist_AA1_004.Text = 0
        Me.lbl_vlrHist_AA1_005.Text = 0
        Me.lbl_vlrHist_AA1_006.Text = 0
        Me.lbl_vlrHist_AA1_007.Text = 0
        Me.lbl_vlrHist_AA1_008.Text = 0
        Me.lbl_vlrHist_AA1_595.Text = 0
        Me.lbl_vlrHist_AA1_405.Text = 0
        Me.lbl_vlrHist_AA1_587.Text = 0
        Me.lbl_vlrHist_AA1_454.Text = 0
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
        Me.txt_vlrMeta_001.Text = 0
        Me.txt_vlrMeta_002.Text = 0
        Me.txt_vlrMeta_003.Text = 0
        Me.txt_vlrMeta_004.Text = 0
        Me.txt_vlrMeta_005.Text = 0
        Me.txt_vlrMeta_006.Text = 0
        Me.txt_vlrMeta_007.Text = 0
        Me.txt_vlrMeta_008.Text = 0
        Me.txt_vlrMeta_595.Text = 0
        Me.txt_vlrMeta_405.Text = 0
        Me.txt_vlrMeta_587.Text = 0
        Me.txt_vlrMeta_454.Text = 0
        Me.txt_vlrMetaTotal.Text = 0

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


        Me.lblCrescAno_M1.Text = 0
    End Sub 'codigo REVISTO


    Private Sub InsereValor(ByVal iMetaMes As TextBox, ByVal iLabelVenda As Label, _
                            ByVal iPercCrescMes As TextBox, ByVal iHistMes As Label, ByVal iLabelCrescMes As Label, _
                            ByVal iNextField As TextBox)
        On Error Resume Next

        Call Totalizar_Meta()
        Call calcularM1_Mes(iMetaMes, iPercCrescMes, iHistMes, iLabelCrescMes)
        iNextField.Focus()

    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_001.TextChanged
        Call InsereValor(Me.txt_vlrMeta_001, Me.lblVenda01, Me.txt_percCresc01, Me.lbl_vlrHist_AA1_001, Me.lblCresc01_M1, Me.txt_vlrMeta_002)

    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_002.TextChanged
        Call InsereValor(Me.txt_vlrMeta_002, Me.lblVenda02, Me.txt_percCresc02, Me.lbl_vlrHist_AA1_002, Me.lblCresc02_M1, Me.txt_vlrMeta_003)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_003.TextChanged
        Call InsereValor(Me.txt_vlrMeta_003, Me.lblVenda03, Me.txt_percCresc03, Me.lbl_vlrHist_AA1_003, Me.lblCresc03_M1, Me.txt_vlrMeta_004)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_004.TextChanged
        Call InsereValor(Me.txt_vlrMeta_004, Me.lblVenda04, Me.txt_percCresc04, Me.lbl_vlrHist_AA1_004, Me.lblCresc04_M1, Me.txt_vlrMeta_005)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_005.TextChanged
        Call InsereValor(Me.txt_vlrMeta_005, Me.lblVenda05, Me.txt_percCresc05, Me.lbl_vlrHist_AA1_005, Me.lblCresc05_M1, Me.txt_vlrMeta_006)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_006.TextChanged
        Call InsereValor(Me.txt_vlrMeta_006, Me.lblVenda06, Me.txt_percCresc06, Me.lbl_vlrHist_AA1_006, Me.lblCresc06_M1, Me.txt_vlrMeta_007)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_007.TextChanged
        Call InsereValor(Me.txt_vlrMeta_007, Me.lblVenda07, Me.txt_percCresc07, Me.lbl_vlrHist_AA1_007, Me.lblCresc07_M1, Me.txt_vlrMeta_008)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_008.TextChanged
        Call InsereValor(Me.txt_vlrMeta_008, Me.lblVenda08, Me.txt_percCresc08, Me.lbl_vlrHist_AA1_008, Me.lblCresc08_M1, Me.txt_vlrMeta_595)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_595.TextChanged
        Call InsereValor(Me.txt_vlrMeta_595, Me.lblVenda09, Me.txt_percCresc09, Me.lbl_vlrHist_AA1_595, Me.lblCresc09_M1, Me.txt_vlrMeta_405)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_405.TextChanged
        Call InsereValor(Me.txt_vlrMeta_405, Me.lblVenda10, Me.txt_percCresc10, Me.lbl_vlrHist_AA1_405, Me.lblCresc10_M1, Me.txt_vlrMeta_587)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_587.TextChanged
        Call InsereValor(Me.txt_vlrMeta_587, Me.lblVenda11, Me.txt_percCresc11, Me.lbl_vlrHist_AA1_587, Me.lblCresc11_M1, Me.txt_vlrMeta_454)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta_454.TextChanged
        Call InsereValor(Me.txt_vlrMeta_454, Me.lblVenda12, Me.txt_percCresc12, Me.lbl_vlrHist_AA1_454, Me.lblCresc12_M1, Me.txt_vlrMeta_001)
    End Sub 'codigo REVISTO

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            'Dim userName, vFilial As String
            'Dim tipoFilial As Byte

            Me.cboAno.AnoInicial = Year(DateAndTime.Now)
            Me.cboAno.AnoFinal = Year(DateAndTime.Now) + 1

            'userName = User.Identity.Name
            'vFilial = 3
            oVem.AtualizarEstatisticaPrograma(29, User.Identity.Name)

            'If Len(userName) = 5 Then   'Loja9 - até 9
            '    vFilial = Right(userName, 1)
            'ElseIf Len(userName) = 6 Then 'Loja11 - Maior que 9
            '    vFilial = Right(userName, 2)
            'End If

            'If Me.cboFilial.IsLoja = True Then
            '    tipoFilial = 1  'Lojas
            'Else
            '    tipoFilial = 2  'Não é Lojas
            'End If

            'Select Case tipoFilial
            '    Case 2  'Não é loja
            '        vFilial = 3  'Santa Felicidade            
            'End Select

            If Month(Now()) > 8 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Me.cboSecao.CallSecaoDesc = 1

            'Me.cboFilial.CallFilial = Session("sFILIAL")
            Me.cboPosicao.CallPosicao = 1   '  1=Loja, 2=Administração,  3=Definitivo

            If oOrc.DefinirPosicao(cboAno.CallAno, 1) = True Then cboPosicao.CallPosicao = 3


            Session("sPOSICAO") = Me.cboPosicao.CallPosicao

            'Call ArmazenaMetaInicial()
            Call Atualizar()
            Call HabilitarSalvar()
            Call MudarLegenda()

            'Call ArmazenaMetaInicial()
        End If
    End Sub

    Sub HabilitarSalvar()
        oOrc.HabilitarSalvar(btnSalvar1, cboAno.CallAno, cboPosicao.CallPosicao, 1, User.Identity.Name)

    End Sub

    Sub MudarLegenda()
        Me.txt_Titulo_Hist3.Text = " Hist. " & Me.cboAno.CallAno.ToString - 3 & " "
        Me.txt_Titulo_Hist2.Text = " Hist. " & Me.cboAno.CallAno.ToString - 2 & " "
        Me.txt_Titulo_Hist1.Text = " Hist. " & Me.cboAno.CallAno.ToString - 1 & " "
        Me.lblMetaAnoAtual.Text = "Meta " & Me.cboAno.CallAno

        Me.lblCrescLegenda_M1.Text = "Cresc." 'Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
        Me.lblCrescLegenda_M2.Text = Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)
        Me.lblCrescLegenda_M3.Text = Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)
        Me.lblCrescLegenda_M4.Text = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)

        Me.gridAnalise.Columns.Item("vlrVendaAA2").Caption = "Real " & Me.cboAno.CallAno - 3
        Me.gridAnalise.Columns.Item("vlrVendaAA1").Caption = "Real " & Me.cboAno.CallAno - 2
        Me.gridAnalise.Columns.Item("vlrVenda").Caption = "Real " & Me.cboAno.CallAno - 1
        Me.gridAnalise.Columns.Item("percCrescAA2_AA1").ToolTip = "Percentual de Crescimento. Venda de " & Me.cboAno.CallAno - 3 & " sobre " & Me.cboAno.CallAno - 2 & "."
        Me.gridAnalise.Columns.Item("percCrescAA2_AA1").Caption = "% Cresc " & Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)

        Me.gridAnalise.Columns.Item("percCrescAA1_Real").ToolTip = "Percentual de Crescimento. Venda de " & Me.cboAno.CallAno - 2 & " sobre " & Me.cboAno.CallAno - 1 & "."
        Me.gridAnalise.Columns.Item("percCrescAA1_Real").Caption = "% Cresc " & Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)

        Me.gridAnalise.Columns.Item("percCrescMeta").ToolTip = "Percentual de Crescimento. Venda de " & Me.cboAno.CallAno - 1 & " sobre " & Me.cboAno.CallAno & "."
        Me.gridAnalise.Columns.Item("percCrescMeta").Caption = "% Cresc " & Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)

        Me.gridAnalise.Columns.Item("vlrMeta").Caption = "Meta " & Me.cboAno.CallAno

    End Sub

    Private Sub InserePercentual(ByVal iHistMes As Label, ByVal iMetaMes As TextBox, ByVal iPercCresc As TextBox,
                                 ByVal iLabelVendaMes As Label, ByVal iLabelCrescMes As Label, _
                                 ByVal iNextField As TextBox)
        On Error Resume Next
        If iHistMes.Text = 0 Then
            iMetaMes.Text = 0
            iPercCresc.Text = 0
        Else
            iMetaMes.Text = (((iPercCresc.Text * iHistMes.Text) / 100) + iHistMes.Text).ToString("n0")
        End If
        'iVendaMes.Text = (CDbl(iVendaMes.Text) + (CDbl(iMetaMes.Text) - CDbl(iLabelVendaMes.Text))).ToString("n0")

        'Call Totalizar_MetaVenda()  'Totaliza o Total do Ano de Todas as Seções.
        iNextField.Focus()  'Foco no próximo campo
        Call Totalizar_Meta()       'Totaliza o Total do Ano da Seção selecionada.
        Call CalcularM1_MudaCor_Mes(iPercCresc, iLabelCrescMes)
        'Call CalcularParticipacao_Mes(iMetaMes, iVendaMes, iPercMeta)
        iLabelCrescMes.Text = iPercCresc.Text
        'Call CalcularCrescimentoMes(ivlrHistVendaCheia, iVendaMes, iPercCrescMesTotal)
        ' Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_Total, txt_vlrVenda_Total, txt_percCrescMes_Total)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_001, Me.txt_vlrMeta_001, Me.txt_percCresc01, Me.lblVenda01, Me.lblCresc01_M1, Me.txt_percCresc02)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_002, Me.txt_vlrMeta_002, Me.txt_percCresc02, Me.lblVenda02, Me.lblCresc02_M1, Me.txt_percCresc03)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_003, Me.txt_vlrMeta_003, Me.txt_percCresc03, Me.lblVenda03, Me.lblCresc03_M1, Me.txt_percCresc04)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_004, Me.txt_vlrMeta_004, Me.txt_percCresc04, Me.lblVenda04, Me.lblCresc04_M1, Me.txt_percCresc05)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_005, Me.txt_vlrMeta_005, Me.txt_percCresc05, Me.lblVenda05, Me.lblCresc05_M1, Me.txt_percCresc06)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_006, Me.txt_vlrMeta_006, Me.txt_percCresc06, Me.lblVenda06, Me.lblCresc06_M1, Me.txt_percCresc07)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_007, Me.txt_vlrMeta_007, Me.txt_percCresc07, Me.lblVenda07, Me.lblCresc07_M1, Me.txt_percCresc08)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_008, Me.txt_vlrMeta_008, Me.txt_percCresc08, Me.lblVenda08, Me.lblCresc08_M1, Me.txt_percCresc09)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_595, Me.txt_vlrMeta_595, Me.txt_percCresc09, Me.lblVenda09, Me.lblCresc09_M1, Me.txt_percCresc10)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_405, Me.txt_vlrMeta_405, Me.txt_percCresc10, Me.lblVenda10, Me.lblCresc10_M1, Me.txt_percCresc11)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_587, Me.txt_vlrMeta_587, Me.txt_percCresc11, Me.lblVenda11, Me.lblCresc11_M1, Me.txt_percCresc12)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        Call InserePercentual(Me.lbl_vlrHist_AA1_454, Me.txt_vlrMeta_454, Me.txt_percCresc12, Me.lblVenda12, Me.lblCresc12_M1, Me.txt_percCresc01)
    End Sub 'codigo REVISTO

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call Atributos(Me.txt_vlrMeta_001, Me.txt_percCresc01)
            Call Atributos(Me.txt_vlrMeta_002, Me.txt_percCresc02)
            Call Atributos(Me.txt_vlrMeta_003, Me.txt_percCresc03)
            Call Atributos(Me.txt_vlrMeta_004, Me.txt_percCresc04)
            Call Atributos(Me.txt_vlrMeta_005, Me.txt_percCresc05)
            Call Atributos(Me.txt_vlrMeta_006, Me.txt_percCresc06)
            Call Atributos(Me.txt_vlrMeta_007, Me.txt_percCresc07)
            Call Atributos(Me.txt_vlrMeta_008, Me.txt_percCresc08)
            Call Atributos(Me.txt_vlrMeta_595, Me.txt_percCresc09)
            Call Atributos(Me.txt_vlrMeta_405, Me.txt_percCresc10)
            Call Atributos(Me.txt_vlrMeta_587, Me.txt_percCresc11)
            Call Atributos(Me.txt_vlrMeta_454, Me.txt_percCresc12)
            'Call AtualizarVendaAnoAnterior()
            HabilitarSalvar()
        End If
    End Sub 'codigo REVISTO

    Private Sub Atributos(ByVal iVlr As TextBox, ByVal iPerc As TextBox)
        iVlr.Attributes.Add("onfocus", "this.select();")
        iPerc.Attributes.Add("onfocus", "this.select();")
    End Sub 'codigo REVISTO

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Cadastro de Meta de Venda - Posto de Gasolina - PGR29"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Dim iProj As New Projeto
            If LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "comercial" Then
                'cboSecao.cboSecao_Enabled = False
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If

            Atualizar()
        End If
    End Sub 'codigo REVISTO

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Me.lblVenda01.Text = Me.txt_vlrMeta_001.Text
            Me.lblVenda02.Text = Me.txt_vlrMeta_002.Text
            Me.lblVenda03.Text = Me.txt_vlrMeta_003.Text
            Me.lblVenda04.Text = Me.txt_vlrMeta_004.Text
            Me.lblVenda05.Text = Me.txt_vlrMeta_005.Text
            Me.lblVenda06.Text = Me.txt_vlrMeta_006.Text
            Me.lblVenda07.Text = Me.txt_vlrMeta_007.Text
            Me.lblVenda08.Text = Me.txt_vlrMeta_008.Text
            Me.lblVenda09.Text = Me.txt_vlrMeta_595.Text
            Me.lblVenda10.Text = Me.txt_vlrMeta_405.Text
            Me.lblVenda11.Text = Me.txt_vlrMeta_587.Text
            Me.lblVenda12.Text = Me.txt_vlrMeta_454.Text
        End If

    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call MudarLegenda()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSecao.ListSecaoChanged
        Call Atualizar()
    End Sub

    Private Sub CalcularCrescimentoMes(ByVal iHistorico As Label, ByVal iMeta As Label, ByVal iPercCrescimento As Label)
        If CInt(iHistorico.Text) = 0 Then
            iPercCrescimento.Text = 0
        Else
            iPercCrescimento.Text = (((iMeta.Text / iHistorico.Text) * 100) - 100).ToString("n2")
        End If
    End Sub


    Protected Sub gridAnalise_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAnalise.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, gridAnalise, "percCrescAA2_AA1", "vlrVendaAA1", "vlrVendaAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAnalise, "percCrescAA1_Real", "vlrVenda", "vlrVendaAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAnalise, "percCrescMeta", "vlrMeta", "vlrVenda", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub gridAnalise_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAnalise.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescAA2_AA1")
        oFun.Grid_RedIsNegative(e, "percCrescAA1_Real")
        oFun.Grid_RedIsNegative(e, "percCrescMeta")
    End Sub

    Protected Sub gridAnalise_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAnalise.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Session("sPOSICAO") = Me.cboPosicao.CallPosicao
        Atualizar()
    End Sub

    Protected Sub btnSalvar1_Click(sender As Object, e As EventArgs) Handles btnSalvar1.Click
        If Me.txt_vlrMetaTotal.Text = "" Then
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        Else
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_001.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_002.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_003.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_004.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_005.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_006.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_007.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_008.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_595.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_405.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_587.Text, 0)
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta_454.Text, 0)

            oVem.Salvar_Ori_Secao_Ano(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, 1, Me.txt_vlrMetaTotal.Text, 0, "")

            clData_gerManager.usp3("dbo.uspCalcularNovaParticipacao", "@ano", "@idFilial", "@posicao", Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.cboPosicao.CallPosicao)
            oVem.UserMsgBox(Me, "As Vendas foram salvas com sucesso!!!")
            Me.gridAnalise.DataBind()
            Me.lblError.Text = oVem.varDesc
        End If
    End Sub
End Class
