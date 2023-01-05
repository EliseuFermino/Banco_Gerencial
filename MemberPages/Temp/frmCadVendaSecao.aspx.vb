
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Planejamento_Vendas_frmCadVendaSecao
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim no As Double
    Dim varDepto As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double

    Dim oVem As New VendaEmpresaMes

    'Código Revisado
    Sub BuscaMetaVenda(ByVal iMes As String)
        oVem.BuscaGrupoMes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, iMes, Me.cboFilial.CallFilial)
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
    End Sub 'VERIFICAR

    Sub BuscaVendaReal_Ano()
        'Ano M3
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 3, Me.cboFilial.CallFilial)
        Me.txt_percHist3_Total.Text = (CDbl(Me.txt_vlrHist3_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        'Ano M2
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 2, Me.cboFilial.CallFilial)
        Me.txt_percHist2_Total.Text = (CDbl(Me.txt_vlrHist2_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        'Ano M1
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 1, Me.cboFilial.CallFilial)
        Me.txt_percHist1_Total.Text = (CDbl(Me.txt_vlrHist1_Total.Text) / oVem.vlrOri * 100).ToString("n2")
    End Sub 'Codigo REVISTO

    Sub BuscaVendaReal_Hist1(ByVal iFilial As Byte, ByVal iStatus As Byte)
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        Dim varSecao, varAno As Int32
        varStatus = iStatus   'Venda
        varSecao = Me.cboSecao.CallSecao
        varAno = Me.cboAno.CallAno - 1

        If Month(Now()) = 1 Then    'Janeiro
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 1, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 2, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 2 Then    'Fevereiro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 2, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 3 Then    'Março
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 3, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 4 Then    'Abril
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 4, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 5 Then    'Maio
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 5, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 6 Then    'Junho
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 6, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 7 Then    'Julho
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 7, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 8 Then    'Agosto
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.txt_vlrHist1_07, Me.txt_percHist1_07)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 8, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 9 Then    'Setembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.txt_vlrHist1_08, Me.txt_percHist1_08)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 9, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 10 Then    'Outubro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.txt_vlrHist1_09, Me.txt_percHist1_09)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 10, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 11 Then    'Novembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Mes(varAno, 10, iFilial, varSecao, varStatus, Me.txt_vlrHist1_10, Me.txt_percHist1_10)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 11, Me.txt_vlrHist1_11, Me.txt_percHist1_11)
            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        If Month(Now()) = 12 Then    'Dezembro
            Call Preencher_Hist1_Mes(varAno, 1, iFilial, varSecao, varStatus, Me.txt_vlrHist1_01, Me.txt_percHist1_01)
            Call Preencher_Hist1_Mes(varAno, 2, iFilial, varSecao, varStatus, Me.txt_vlrHist1_02, Me.txt_percHist1_02)
            Call Preencher_Hist1_Mes(varAno, 3, iFilial, varSecao, varStatus, Me.txt_vlrHist1_03, Me.txt_percHist1_03)
            Call Preencher_Hist1_Mes(varAno, 4, iFilial, varSecao, varStatus, Me.txt_vlrHist1_04, Me.txt_percHist1_04)
            Call Preencher_Hist1_Mes(varAno, 5, iFilial, varSecao, varStatus, Me.txt_vlrHist1_05, Me.txt_percHist1_05)
            Call Preencher_Hist1_Mes(varAno, 6, iFilial, varSecao, varStatus, Me.txt_vlrHist1_06, Me.txt_percHist1_06)
            Call Preencher_Hist1_Mes(varAno, 7, iFilial, varSecao, varStatus, Me.txt_vlrHist1_07, Me.txt_percHist1_07)
            Call Preencher_Hist1_Mes(varAno, 8, iFilial, varSecao, varStatus, Me.txt_vlrHist1_08, Me.txt_percHist1_08)
            Call Preencher_Hist1_Mes(varAno, 9, iFilial, varSecao, varStatus, Me.txt_vlrHist1_09, Me.txt_percHist1_09)
            Call Preencher_Hist1_Mes(varAno, 10, iFilial, varSecao, varStatus, Me.txt_vlrHist1_10, Me.txt_percHist1_10)
            Call Preencher_Hist1_Mes(varAno, 11, iFilial, varSecao, varStatus, Me.txt_vlrHist1_11, Me.txt_percHist1_11)

            Call Preencher_Hist1_Meta_Mes(iFilial, varSecao, varAno, 12, Me.txt_vlrHist1_12, Me.txt_percHist1_12)
        End If

        'Calcular  Total
        Me.txt_vlrHist1_Total.Text = CDbl(CDbl(Me.txt_vlrHist1_01.Text) + CDbl(Me.txt_vlrHist1_02.Text) + CDbl(Me.txt_vlrHist1_03.Text) + _
                                    CDbl(Me.txt_vlrHist1_04.Text) + CDbl(Me.txt_vlrHist1_05.Text) + CDbl(Me.txt_vlrHist1_06.Text) + _
                                    CDbl(Me.txt_vlrHist1_07.Text) + CDbl(Me.txt_vlrHist1_08.Text) + CDbl(Me.txt_vlrHist1_09.Text) + _
                                    CDbl(Me.txt_vlrHist1_10.Text) + CDbl(Me.txt_vlrHist1_11.Text) + CDbl(Me.txt_vlrHist1_12.Text)).ToString("n0")
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
        Call BuscaVendaReal_Historico(iAno, 1, iFilial, iSecao, 1, Me.txt_vlrHist2_01, Me.txt_percHist2_01)
        Call BuscaVendaReal_Historico(iAno, 2, iFilial, iSecao, 1, Me.txt_vlrHist2_02, Me.txt_percHist2_02)
        Call BuscaVendaReal_Historico(iAno, 3, iFilial, iSecao, 1, Me.txt_vlrHist2_03, Me.txt_percHist2_03)
        Call BuscaVendaReal_Historico(iAno, 4, iFilial, iSecao, 1, Me.txt_vlrHist2_04, Me.txt_percHist2_04)
        Call BuscaVendaReal_Historico(iAno, 5, iFilial, iSecao, 1, Me.txt_vlrHist2_05, Me.txt_percHist2_05)
        Call BuscaVendaReal_Historico(iAno, 6, iFilial, iSecao, 1, Me.txt_vlrHist2_06, Me.txt_percHist2_06)
        Call BuscaVendaReal_Historico(iAno, 7, iFilial, iSecao, 1, Me.txt_vlrHist2_07, Me.txt_percHist2_07)
        Call BuscaVendaReal_Historico(iAno, 8, iFilial, iSecao, 1, Me.txt_vlrHist2_08, Me.txt_percHist2_08)
        Call BuscaVendaReal_Historico(iAno, 9, iFilial, iSecao, 1, Me.txt_vlrHist2_09, Me.txt_percHist2_09)
        Call BuscaVendaReal_Historico(iAno, 10, iFilial, iSecao, 1, Me.txt_vlrHist2_10, Me.txt_percHist2_10)
        Call BuscaVendaReal_Historico(iAno, 11, iFilial, iSecao, 1, Me.txt_vlrHist2_11, Me.txt_percHist2_11)
        Call BuscaVendaReal_Historico(iAno, 12, iFilial, iSecao, 1, Me.txt_vlrHist2_12, Me.txt_percHist2_12)
        oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao)
        iHistTotal.Text = oVem.vlrRea
    End Sub ' Código REVISTO

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String, iHistTotal As Label)
        Call BuscaVendaReal_Historico(iAno, 1, iFilial, iSecao, 1, Me.txt_vlrHist3_01, Me.txt_percHist3_01)
        Call BuscaVendaReal_Historico(iAno, 2, iFilial, iSecao, 1, Me.txt_vlrHist3_02, Me.txt_percHist3_02)
        Call BuscaVendaReal_Historico(iAno, 3, iFilial, iSecao, 1, Me.txt_vlrHist3_03, Me.txt_percHist3_03)
        Call BuscaVendaReal_Historico(iAno, 4, iFilial, iSecao, 1, Me.txt_vlrHist3_04, Me.txt_percHist3_04)
        Call BuscaVendaReal_Historico(iAno, 5, iFilial, iSecao, 1, Me.txt_vlrHist3_05, Me.txt_percHist3_05)
        Call BuscaVendaReal_Historico(iAno, 6, iFilial, iSecao, 1, Me.txt_vlrHist3_06, Me.txt_percHist3_06)
        Call BuscaVendaReal_Historico(iAno, 7, iFilial, iSecao, 1, Me.txt_vlrHist3_07, Me.txt_percHist3_07)
        Call BuscaVendaReal_Historico(iAno, 8, iFilial, iSecao, 1, Me.txt_vlrHist3_08, Me.txt_percHist3_08)
        Call BuscaVendaReal_Historico(iAno, 9, iFilial, iSecao, 1, Me.txt_vlrHist3_09, Me.txt_percHist3_09)
        Call BuscaVendaReal_Historico(iAno, 10, iFilial, iSecao, 1, Me.txt_vlrHist3_10, Me.txt_percHist3_10)
        Call BuscaVendaReal_Historico(iAno, 11, iFilial, iSecao, 1, Me.txt_vlrHist3_11, Me.txt_percHist3_11)
        Call BuscaVendaReal_Historico(iAno, 12, iFilial, iSecao, 1, Me.txt_vlrHist3_12, Me.txt_percHist3_12)
        oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao)
        iHistTotal.Text = oVem.vlrRea
    End Sub  ' Código REVISTO

    Private Sub BuscaVendaReal_Historico(ByVal iAno As String, ByVal iMes As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iStatus As String, ByVal iVlr As Label, iPerc As Label)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, iMes, iFilial, iSecao, iStatus)
        iVlr.Text = oVem.vlrRea
        iPerc.Text = oVem.percRea
    End Sub 'Codigo REVISTO

    Private Sub BuscaMetaDet(ByVal iAno As Int32, ByVal iMes As Byte, ByVal iFilial As Byte, ByVal iSecao As Byte, ByVal iPosicao As Byte, ByVal iTipoSecao As Byte, ByVal iVlr As TextBox, ByVal iPerc As Label)
        oVem.BuscaSecao_VendaMargem_Ori(iAno, iMes, iFilial, iSecao, iPosicao, iTipoSecao)
        iVlr.Text = oVem.vlrOri
        iPerc.Text = oVem.percOri
    End Sub 'Codigo REVISTO

    Private Sub BuscaMeta(ByVal iAno As Int32, ByVal iFilial As Byte, ByVal iSecao As Byte, ByVal iPosicao As Byte, ByVal iTipoSecao As Byte)
        Call BuscaMetaDet(iAno, 1, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta01, Me.txt_percMeta01)
        Call BuscaMetaDet(iAno, 2, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta02, Me.txt_percMeta02)
        Call BuscaMetaDet(iAno, 3, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta03, Me.txt_percMeta03)
        Call BuscaMetaDet(iAno, 4, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta04, Me.txt_percMeta04)
        Call BuscaMetaDet(iAno, 5, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta05, Me.txt_percMeta05)
        Call BuscaMetaDet(iAno, 6, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta06, Me.txt_percMeta06)
        Call BuscaMetaDet(iAno, 7, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta07, Me.txt_percMeta07)
        Call BuscaMetaDet(iAno, 8, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta08, Me.txt_percMeta08)
        Call BuscaMetaDet(iAno, 9, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta09, Me.txt_percMeta09)
        Call BuscaMetaDet(iAno, 10, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta10, Me.txt_percMeta10)
        Call BuscaMetaDet(iAno, 11, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta11, Me.txt_percMeta11)
        Call BuscaMetaDet(iAno, 12, iFilial, iSecao, iPosicao, iTipoSecao, Me.txt_vlrMeta12, Me.txt_percMeta12)
        Call Totalizar_Meta()
    End Sub  'Codigo REVISTO

    Sub Atualizar()

        Call ZerarCampos()

        Dim varFilial As String
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = 1   'Venda

        Call ZerarCampos()

        varFilial = Me.cboFilial.CallFilial
        Select Case varFilial
            Case 10
                varFilial = 38
            Case 39
                varFilial = 37
        End Select

        Call BuscaVendaReal_Hist1(varFilial, varStatus)
        Call BuscaVendaReal_Hist2(Me.cboAno.CallAno - 2, varFilial, Me.cboSecao.CallSecao, Me.lblDepto.Text, Me.txt_vlrHist2_Total)
        Call BuscaVendaReal_Hist3(Me.cboAno.CallAno - 3, varFilial, Me.cboSecao.CallSecao, Me.lblDepto.Text, Me.txt_vlrHist3_Total)
        Call BuscaVendaReal_Ano()

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
        Call BuscaMeta(cboAno.CallAno, Me.cboFilial.CallFilial, cboSecao.CallSecao, cboPosicao.CallPosicao, 1)

        oVem.BuscaMemo_Ori(Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.lblDepto.Text, Me.cboSecao.CallSecao)
        Me.txtMemo.Text = oVem.varDesc

        'Calcular % de Crescimento
        Call CalcularM3()
        Call CalcularM2()
        Call CalcularM1()
        Call CalcularM1_Ano()

    End Sub

    Private Sub CalcularM3()
        Call Calcular(Me.txt_vlrHist3_01, Me.lblCresc01_M3, Me.txt_vlrHist2_01)
        Call Calcular(Me.txt_vlrHist3_02, Me.lblCresc02_M3, Me.txt_vlrHist2_02)
        Call Calcular(Me.txt_vlrHist3_03, Me.lblCresc03_M3, Me.txt_vlrHist2_03)
        Call Calcular(Me.txt_vlrHist3_04, Me.lblCresc04_M3, Me.txt_vlrHist2_04)
        Call Calcular(Me.txt_vlrHist3_05, Me.lblCresc05_M3, Me.txt_vlrHist2_05)
        Call Calcular(Me.txt_vlrHist3_06, Me.lblCresc06_M3, Me.txt_vlrHist2_06)
        Call Calcular(Me.txt_vlrHist3_07, Me.lblCresc07_M3, Me.txt_vlrHist2_07)
        Call Calcular(Me.txt_vlrHist3_08, Me.lblCresc08_M3, Me.txt_vlrHist2_08)
        Call Calcular(Me.txt_vlrHist3_09, Me.lblCresc09_M3, Me.txt_vlrHist2_09)
        Call Calcular(Me.txt_vlrHist3_10, Me.lblCresc10_M3, Me.txt_vlrHist2_10)
        Call Calcular(Me.txt_vlrHist3_11, Me.lblCresc11_M3, Me.txt_vlrHist2_11)
        Call Calcular(Me.txt_vlrHist3_12, Me.lblCresc12_M3, Me.txt_vlrHist2_12)
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
        ElseIf CInt(Me.txt_vlrHist1_01.Text) = 0 Then
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
        Call Calcular(Me.txt_vlrHist2_01, Me.lblCresc01_M2, Me.txt_vlrHist1_01)
        Call Calcular(Me.txt_vlrHist2_02, Me.lblCresc02_M2, Me.txt_vlrHist1_02)
        Call Calcular(Me.txt_vlrHist2_03, Me.lblCresc03_M2, Me.txt_vlrHist1_03)
        Call Calcular(Me.txt_vlrHist2_04, Me.lblCresc04_M2, Me.txt_vlrHist1_04)
        Call Calcular(Me.txt_vlrHist2_05, Me.lblCresc05_M2, Me.txt_vlrHist1_05)
        Call Calcular(Me.txt_vlrHist2_06, Me.lblCresc06_M2, Me.txt_vlrHist1_06)
        Call Calcular(Me.txt_vlrHist2_07, Me.lblCresc07_M2, Me.txt_vlrHist1_07)
        Call Calcular(Me.txt_vlrHist2_08, Me.lblCresc08_M2, Me.txt_vlrHist1_08)
        Call Calcular(Me.txt_vlrHist2_09, Me.lblCresc09_M2, Me.txt_vlrHist1_09)
        Call Calcular(Me.txt_vlrHist2_10, Me.lblCresc10_M2, Me.txt_vlrHist1_10)
        Call Calcular(Me.txt_vlrHist2_11, Me.lblCresc11_M2, Me.txt_vlrHist1_11)
        Call Calcular(Me.txt_vlrHist2_12, Me.lblCresc12_M2, Me.txt_vlrHist1_12)
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
        Call calcularM1_Mes(Me.txt_vlrMeta01, Me.txt_percCresc01, Me.txt_vlrHist1_01, Me.lblCresc01_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta02, Me.txt_percCresc02, Me.txt_vlrHist1_02, Me.lblCresc02_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta03, Me.txt_percCresc03, Me.txt_vlrHist1_03, Me.lblCresc03_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta04, Me.txt_percCresc04, Me.txt_vlrHist1_04, Me.lblCresc04_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta05, Me.txt_percCresc05, Me.txt_vlrHist1_05, Me.lblCresc05_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta06, Me.txt_percCresc06, Me.txt_vlrHist1_06, Me.lblCresc06_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta07, Me.txt_percCresc07, Me.txt_vlrHist1_07, Me.lblCresc07_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta08, Me.txt_percCresc08, Me.txt_vlrHist1_08, Me.lblCresc08_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta09, Me.txt_percCresc09, Me.txt_vlrHist1_09, Me.lblCresc09_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta10, Me.txt_percCresc10, Me.txt_vlrHist1_10, Me.lblCresc10_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta11, Me.txt_percCresc11, Me.txt_vlrHist1_11, Me.lblCresc11_M1)
        Call calcularM1_Mes(Me.txt_vlrMeta12, Me.txt_percCresc12, Me.txt_vlrHist1_12, Me.lblCresc12_M1)

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
        no += CDbl(Me.txt_vlrHist3_01.Text)
        no += CDbl(Me.txt_vlrHist3_02.Text)
        no += CDbl(Me.txt_vlrHist3_03.Text)
        no += CDbl(Me.txt_vlrHist3_04.Text)
        no += CDbl(Me.txt_vlrHist3_05.Text)
        no += CDbl(Me.txt_vlrHist3_06.Text)
        no += CDbl(Me.txt_vlrHist3_07.Text)
        no += CDbl(Me.txt_vlrHist3_08.Text)
        no += CDbl(Me.txt_vlrHist3_09.Text)
        no += CDbl(Me.txt_vlrHist3_10.Text)
        no += CDbl(Me.txt_vlrHist3_11.Text)
        no += CDbl(Me.txt_vlrHist3_12.Text)
        Me.txt_vlrHist3_Total.Text = Format(no, "#,##0")

    End Sub

    Sub Totalizar_Hist2()

        no = 0
        no += CDbl(Me.txt_vlrHist2_01.Text)
        no += CDbl(Me.txt_vlrHist2_02.Text)
        no += CDbl(Me.txt_vlrHist2_03.Text)
        no += CDbl(Me.txt_vlrHist2_04.Text)
        no += CDbl(Me.txt_vlrHist2_05.Text)
        no += CDbl(Me.txt_vlrHist2_06.Text)
        no += CDbl(Me.txt_vlrHist2_07.Text)
        no += CDbl(Me.txt_vlrHist2_08.Text)
        no += CDbl(Me.txt_vlrHist2_09.Text)
        no += CDbl(Me.txt_vlrHist2_10.Text)
        no += CDbl(Me.txt_vlrHist2_11.Text)
        no += CDbl(Me.txt_vlrHist2_12.Text)
        Me.txt_vlrHist2_Total.Text = Format(no, "#,##0")

    End Sub

    Sub Totalizar_Hist1()
        On Error Resume Next
        'Formata Campo Valor
        no = 0
        no += CDbl(Me.txt_vlrHist1_01.Text)
        no += CDbl(Me.txt_vlrHist1_02.Text)
        no += CDbl(Me.txt_vlrHist1_03.Text)
        no += CDbl(Me.txt_vlrHist1_04.Text)
        no += CDbl(Me.txt_vlrHist1_05.Text)
        no += CDbl(Me.txt_vlrHist1_06.Text)
        no += CDbl(Me.txt_vlrHist1_07.Text)
        no += CDbl(Me.txt_vlrHist1_08.Text)
        no += CDbl(Me.txt_vlrHist1_09.Text)
        no += CDbl(Me.txt_vlrHist1_10.Text)
        no += CDbl(Me.txt_vlrHist1_11.Text)
        no += CDbl(Me.txt_vlrHist1_12.Text)
        Me.txt_vlrHist1_Total.Text = Format(no, "#,##0")
    End Sub

    Sub Totalizar_MetaVenda()

        'Formata Campo Valor
        no = 0
        no += CDbl(Me.txt_vlrVenda_01.Text)
        no += CDbl(Me.txt_vlrVenda_02.Text)
        no += CDbl(Me.txt_vlrVenda_03.Text)
        no += CDbl(Me.txt_vlrVenda_04.Text)
        no += CDbl(Me.txt_vlrVenda_05.Text)
        no += CDbl(Me.txt_vlrVenda_06.Text)
        no += CDbl(Me.txt_vlrVenda_07.Text)
        no += CDbl(Me.txt_vlrVenda_08.Text)
        no += CDbl(Me.txt_vlrVenda_09.Text)
        no += CDbl(Me.txt_vlrVenda_10.Text)
        no += CDbl(Me.txt_vlrVenda_11.Text)
        no += CDbl(Me.txt_vlrVenda_12.Text)

        Me.txt_vlrVenda_Total.Text = Format(no, "#,##0")

        'Formata Campo Percentual
        Call FormataCampoPercentual(Me.txt_vlrVenda_01, Me.txt_vlrVenda_Total, Me.txt_percPart_01)
        Call FormataCampoPercentual(Me.txt_vlrVenda_02, Me.txt_vlrVenda_Total, Me.txt_percPart_02)
        Call FormataCampoPercentual(Me.txt_vlrVenda_03, Me.txt_vlrVenda_Total, Me.txt_percPart_03)
        Call FormataCampoPercentual(Me.txt_vlrVenda_04, Me.txt_vlrVenda_Total, Me.txt_percPart_04)
        Call FormataCampoPercentual(Me.txt_vlrVenda_05, Me.txt_vlrVenda_Total, Me.txt_percPart_05)
        Call FormataCampoPercentual(Me.txt_vlrVenda_06, Me.txt_vlrVenda_Total, Me.txt_percPart_06)
        Call FormataCampoPercentual(Me.txt_vlrVenda_07, Me.txt_vlrVenda_Total, Me.txt_percPart_07)
        Call FormataCampoPercentual(Me.txt_vlrVenda_08, Me.txt_vlrVenda_Total, Me.txt_percPart_08)
        Call FormataCampoPercentual(Me.txt_vlrVenda_09, Me.txt_vlrVenda_Total, Me.txt_percPart_09)
        Call FormataCampoPercentual(Me.txt_vlrVenda_10, Me.txt_vlrVenda_Total, Me.txt_percPart_10)
        Call FormataCampoPercentual(Me.txt_vlrVenda_11, Me.txt_vlrVenda_Total, Me.txt_percPart_11)
        Call FormataCampoPercentual(Me.txt_vlrVenda_12, Me.txt_vlrVenda_Total, Me.txt_percPart_12)

        If Me.txt_vlrVenda_Total.Text <> 0 Then
            Me.txt_percPart_Ano.Text = "100"
        Else
            Me.txt_percPart_Ano.Text = "0"
            Me.lblCrescAno.Text = 0
        End If
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
        no += CDbl(Me.txt_vlrMeta01.Text)
        no += CDbl(Me.txt_vlrMeta02.Text)
        no += CDbl(Me.txt_vlrMeta03.Text)
        no += CDbl(Me.txt_vlrMeta04.Text)
        no += CDbl(Me.txt_vlrMeta05.Text)
        no += CDbl(Me.txt_vlrMeta06.Text)
        no += CDbl(Me.txt_vlrMeta07.Text)
        no += CDbl(Me.txt_vlrMeta08.Text)
        no += CDbl(Me.txt_vlrMeta09.Text)
        no += CDbl(Me.txt_vlrMeta10.Text)
        no += CDbl(Me.txt_vlrMeta11.Text)
        no += CDbl(Me.txt_vlrMeta12.Text)

        Me.txt_vlrMeta01.Text = CDbl(Me.txt_vlrMeta01.Text).ToString("n0")
        Me.txt_vlrMeta02.Text = CDbl(Me.txt_vlrMeta02.Text).ToString("n0")
        Me.txt_vlrMeta03.Text = CDbl(Me.txt_vlrMeta03.Text).ToString("n0")
        Me.txt_vlrMeta04.Text = CDbl(Me.txt_vlrMeta04.Text).ToString("n0")
        Me.txt_vlrMeta05.Text = CDbl(Me.txt_vlrMeta05.Text).ToString("n0")
        Me.txt_vlrMeta06.Text = CDbl(Me.txt_vlrMeta06.Text).ToString("n0")
        Me.txt_vlrMeta07.Text = CDbl(Me.txt_vlrMeta07.Text).ToString("n0")
        Me.txt_vlrMeta08.Text = CDbl(Me.txt_vlrMeta08.Text).ToString("n0")
        Me.txt_vlrMeta09.Text = CDbl(Me.txt_vlrMeta09.Text).ToString("n0")
        Me.txt_vlrMeta10.Text = CDbl(Me.txt_vlrMeta10.Text).ToString("n0")
        Me.txt_vlrMeta11.Text = CDbl(Me.txt_vlrMeta11.Text).ToString("n0")
        Me.txt_vlrMeta12.Text = CDbl(Me.txt_vlrMeta12.Text).ToString("n0")

        Me.txt_vlrMetaTotal.Text = Format(no, "#,##0")

        If CInt(Me.txt_vlrMetaTotal.Text) = 0 Then
            Me.txt_percMetaTotal.Text = 0
        Else
            Me.txt_percMetaTotal.Text = ((Me.txt_vlrMetaTotal.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
            Call CalcularM1_Ano()
        End If

        'Formata Campo Percentual
        no = 0
        no += CDbl(Me.txt_percMeta01.Text)
        no += CDbl(Me.txt_percMeta02.Text)
        no += CDbl(Me.txt_percMeta03.Text)
        no += CDbl(Me.txt_percMeta04.Text)
        no += CDbl(Me.txt_percMeta05.Text)
        no += CDbl(Me.txt_percMeta06.Text)
        no += CDbl(Me.txt_percMeta07.Text)
        no += CDbl(Me.txt_percMeta08.Text)
        no += CDbl(Me.txt_percMeta09.Text)
        no += CDbl(Me.txt_percMeta10.Text)
        no += CDbl(Me.txt_percMeta11.Text)
        no += CDbl(Me.txt_percMeta12.Text)

        Me.txt_percMeta01.Text = CDbl(Me.txt_percMeta01.Text).ToString("n2")
        Me.txt_percMeta02.Text = CDbl(Me.txt_percMeta02.Text).ToString("n2")
        Me.txt_percMeta03.Text = CDbl(Me.txt_percMeta03.Text).ToString("n2")
        Me.txt_percMeta04.Text = CDbl(Me.txt_percMeta04.Text).ToString("n2")
        Me.txt_percMeta05.Text = CDbl(Me.txt_percMeta05.Text).ToString("n2")
        Me.txt_percMeta06.Text = CDbl(Me.txt_percMeta06.Text).ToString("n2")
        Me.txt_percMeta07.Text = CDbl(Me.txt_percMeta07.Text).ToString("n2")
        Me.txt_percMeta08.Text = CDbl(Me.txt_percMeta08.Text).ToString("n2")
        Me.txt_percMeta09.Text = CDbl(Me.txt_percMeta09.Text).ToString("n2")
        Me.txt_percMeta10.Text = CDbl(Me.txt_percMeta10.Text).ToString("n2")
        Me.txt_percMeta11.Text = CDbl(Me.txt_percMeta11.Text).ToString("n2")
        Me.txt_percMeta12.Text = CDbl(Me.txt_percMeta12.Text).ToString("n2")

    End Sub

    Sub ZerarCampos()
        '*********  Histórico - 3  **************************
        Me.txt_vlrHist3_01.Text = 0
        Me.txt_vlrHist3_02.Text = 0
        Me.txt_vlrHist3_03.Text = 0
        Me.txt_vlrHist3_04.Text = 0
        Me.txt_vlrHist3_05.Text = 0
        Me.txt_vlrHist3_06.Text = 0
        Me.txt_vlrHist3_07.Text = 0
        Me.txt_vlrHist3_08.Text = 0
        Me.txt_vlrHist3_09.Text = 0
        Me.txt_vlrHist3_10.Text = 0
        Me.txt_vlrHist3_11.Text = 0
        Me.txt_vlrHist3_12.Text = 0
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

        Me.txt_percPart_01.Text = 0
        Me.txt_percPart_02.Text = 0
        Me.txt_percPart_03.Text = 0
        Me.txt_percPart_04.Text = 0
        Me.txt_percPart_05.Text = 0
        Me.txt_percPart_06.Text = 0
        Me.txt_percPart_07.Text = 0
        Me.txt_percPart_08.Text = 0
        Me.txt_percPart_09.Text = 0
        Me.txt_percPart_10.Text = 0
        Me.txt_percPart_11.Text = 0
        Me.txt_percPart_12.Text = 0

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
        Me.txt_vlrMetaTotal.Text = 0

        Me.txt_percMeta01.Text = 0
        Me.txt_percMeta02.Text = 0
        Me.txt_percMeta03.Text = 0
        Me.txt_percMeta04.Text = 0
        Me.txt_percMeta05.Text = 0
        Me.txt_percMeta06.Text = 0
        Me.txt_percMeta07.Text = 0
        Me.txt_percMeta08.Text = 0
        Me.txt_percMeta09.Text = 0
        Me.txt_percMeta10.Text = 0
        Me.txt_percMeta11.Text = 0
        Me.txt_percMeta12.Text = 0
        Me.txt_percMetaTotal.Text = 0

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

        Me.txtMemo.Text = ""
        Me.lblCrescAno_M1.Text = 0
        Me.txt_percPart_Ano.Text = 0
    End Sub 'codigo REVISTO

    Sub ArmazenaMetaInicial()
        Me.lblVenda01.Text = Me.txt_vlrMeta01.Text
        Me.lblVenda02.Text = Me.txt_vlrMeta02.Text
        Me.lblVenda03.Text = Me.txt_vlrMeta03.Text
        Me.lblVenda04.Text = Me.txt_vlrMeta04.Text
        Me.lblVenda05.Text = Me.txt_vlrMeta05.Text
        Me.lblVenda06.Text = Me.txt_vlrMeta06.Text
        Me.lblVenda07.Text = Me.txt_vlrMeta07.Text
        Me.lblVenda08.Text = Me.txt_vlrMeta08.Text
        Me.lblVenda09.Text = Me.txt_vlrMeta09.Text
        Me.lblVenda10.Text = Me.txt_vlrMeta10.Text
        Me.lblVenda11.Text = Me.txt_vlrMeta11.Text
        Me.lblVenda12.Text = Me.txt_vlrMeta12.Text
    End Sub 'codigo REVISTO

    Private Sub CalcularParticipacao_Mes(ByVal iMetaMes As TextBox, ByVal iVendaMes As Label, ByVal iPercMeta As Label)
        If CInt(iMetaMes.Text) = 0 Then
            iPercMeta.Text = 0
        Else
            iPercMeta.Text = ((iMetaMes.Text / iVendaMes.Text) * 100).ToString("n2")
        End If
    End Sub 'codigo REVISTO

    Private Sub InsereValor(ByVal iVendaMes As Label, ByVal iMetaMes As TextBox, ByVal iLabelVenda As Label, _
                            ByVal iPercCrescMes As TextBox, ByVal iHistMes As Label, ByVal iLabelCrescMes As Label, _
                            ByVal iPercMeta As Label, ByVal iNextField As TextBox, ByVal iPercCrescMesTotal As Label, ByVal ivlrHistVendaCheia As Label)
        On Error Resume Next
        iVendaMes.Text = (CDbl(iVendaMes.Text) + (CDbl(iMetaMes.Text) - CDbl(iLabelVenda.Text))).ToString("n0")
        Call Totalizar_MetaVenda()  'Calcula o total da meta de venda de todas as seções
        iNextField.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes(iMetaMes, iVendaMes, iPercMeta)
        Call calcularM1_Mes(iMetaMes, iPercCrescMes, iHistMes, iLabelCrescMes)
        Call CalcularCrescimentoMes(ivlrHistVendaCheia, iVendaMes, iPercCrescMesTotal)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_Total, txt_vlrVenda_Total, txt_percCrescMes_Total)    'Calcular Crescimento Ano
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        Call InsereValor(Me.txt_vlrVenda_01, Me.txt_vlrMeta01, Me.lblVenda01, Me.txt_percCresc01, Me.txt_vlrHist1_01, Me.lblCresc01_M1, Me.txt_percMeta01, Me.txt_vlrMeta02, txt_percCrescMes_01, txt_vlrHistVendaCheia_01)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        Call InsereValor(Me.txt_vlrVenda_02, Me.txt_vlrMeta02, Me.lblVenda02, Me.txt_percCresc02, Me.txt_vlrHist1_02, Me.lblCresc02_M1, Me.txt_percMeta02, Me.txt_vlrMeta03, txt_percCrescMes_02, txt_vlrHistVendaCheia_02)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged
        Call InsereValor(Me.txt_vlrVenda_03, Me.txt_vlrMeta03, Me.lblVenda03, Me.txt_percCresc03, Me.txt_vlrHist1_03, Me.lblCresc03_M1, Me.txt_percMeta03, Me.txt_vlrMeta04, txt_percCrescMes_03, txt_vlrHistVendaCheia_03)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged
        Call InsereValor(Me.txt_vlrVenda_04, Me.txt_vlrMeta04, Me.lblVenda04, Me.txt_percCresc04, Me.txt_vlrHist1_04, Me.lblCresc04_M1, Me.txt_percMeta04, Me.txt_vlrMeta05, txt_percCrescMes_04, txt_vlrHistVendaCheia_04)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged
        Call InsereValor(Me.txt_vlrVenda_05, Me.txt_vlrMeta05, Me.lblVenda05, Me.txt_percCresc05, Me.txt_vlrHist1_05, Me.lblCresc05_M1, Me.txt_percMeta05, Me.txt_vlrMeta06, txt_percCrescMes_05, txt_vlrHistVendaCheia_05)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged
        Call InsereValor(Me.txt_vlrVenda_06, Me.txt_vlrMeta06, Me.lblVenda06, Me.txt_percCresc06, Me.txt_vlrHist1_06, Me.lblCresc06_M1, Me.txt_percMeta06, Me.txt_vlrMeta07, txt_percCrescMes_06, txt_vlrHistVendaCheia_06)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged
        Call InsereValor(Me.txt_vlrVenda_07, Me.txt_vlrMeta07, Me.lblVenda07, Me.txt_percCresc07, Me.txt_vlrHist1_07, Me.lblCresc07_M1, Me.txt_percMeta07, Me.txt_vlrMeta08, txt_percCrescMes_07, txt_vlrHistVendaCheia_07)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged
        Call InsereValor(Me.txt_vlrVenda_08, Me.txt_vlrMeta08, Me.lblVenda08, Me.txt_percCresc08, Me.txt_vlrHist1_08, Me.lblCresc08_M1, Me.txt_percMeta08, Me.txt_vlrMeta09, txt_percCrescMes_08, txt_vlrHistVendaCheia_08)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged
        Call InsereValor(Me.txt_vlrVenda_09, Me.txt_vlrMeta09, Me.lblVenda09, Me.txt_percCresc09, Me.txt_vlrHist1_09, Me.lblCresc09_M1, Me.txt_percMeta09, Me.txt_vlrMeta10, txt_percCrescMes_09, txt_vlrHistVendaCheia_09)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged
        Call InsereValor(Me.txt_vlrVenda_10, Me.txt_vlrMeta10, Me.lblVenda10, Me.txt_percCresc10, Me.txt_vlrHist1_10, Me.lblCresc10_M1, Me.txt_percMeta10, Me.txt_vlrMeta11, txt_percCrescMes_10, txt_vlrHistVendaCheia_10)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged
        Call InsereValor(Me.txt_vlrVenda_11, Me.txt_vlrMeta11, Me.lblVenda11, Me.txt_percCresc11, Me.txt_vlrHist1_11, Me.lblCresc11_M1, Me.txt_percMeta11, Me.txt_vlrMeta12, txt_percCrescMes_11, txt_vlrHistVendaCheia_11)
    End Sub 'codigo REVISTO

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged
        Call InsereValor(Me.txt_vlrVenda_12, Me.txt_vlrMeta12, Me.lblVenda12, Me.txt_percCresc12, Me.txt_vlrHist1_12, Me.lblCresc12_M1, Me.txt_percMeta12, Me.txt_vlrMeta01, txt_percCrescMes_12, txt_vlrHistVendaCheia_12)
    End Sub 'codigo REVISTO

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim userName, vFilial As String
            Dim tipoFilial As Byte

            Me.cboAno.AnoInicial = Year(DateAndTime.Now)
            Me.cboAno.AnoFinal = Year(DateAndTime.Now) + 1
            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True
            Me.cboSecao.AutoPostBack = True

            userName = User.Identity.Name
            vFilial = 3
            oVem.AtualizarEstatisticaPrograma(29, User.Identity.Name)

            If Len(userName) = 5 Then   'Loja9 - até 9
                vFilial = Right(userName, 1)
            ElseIf Len(userName) = 6 Then 'Loja11 - Maior que 9
                vFilial = Right(userName, 2)
            End If

            If Me.cboFilial.IsLoja = True Then
                tipoFilial = 1  'Lojas
            Else
                tipoFilial = 2  'Não é Lojas
            End If

            Select Case tipoFilial
                Case 2  'Não é loja
                    vFilial = 3  'Santa Felicidade            
            End Select

            If Month(Now()) > 8 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Me.cboSecao.CallSecao = 1

            Me.cboFilial.CallFilial = vFilial
            Me.cboPosicao.CallPosicao = 1

            Call ArmazenaMetaInicial()
            Call Atualizar()
            Call HabilitarSalvar()
            Call MudarLegenda()
            Call ArmazenaMetaInicial()
        End If
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If Me.txt_vlrMetaTotal.Text = "" Then
            Beep()
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        Else
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta01.Text, Round(CDbl(Me.txt_percMeta01.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta02.Text, Round(CDbl(Me.txt_percMeta02.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta03.Text, Round(CDbl(Me.txt_percMeta03.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta04.Text, Round(CDbl(Me.txt_percMeta04.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta05.Text, Round(CDbl(Me.txt_percMeta05.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta06.Text, Round(CDbl(Me.txt_percMeta06.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta07.Text, Round(CDbl(Me.txt_percMeta07.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta08.Text, Round(CDbl(Me.txt_percMeta08.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta09.Text, Round(CDbl(Me.txt_percMeta09.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta10.Text, Round(CDbl(Me.txt_percMeta10.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta11.Text, Round(CDbl(Me.txt_percMeta11.Text), 2))
            oVem.Salvar_Ori_Secao_Mes(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, Me.txt_vlrMeta12.Text, Round(CDbl(Me.txt_percMeta12.Text), 2))

            oVem.Salvar_Ori_Secao_Ano(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, User.Identity.Name, 1, Me.txt_vlrMetaTotal.Text, Round(CDbl(Me.txt_percMetaTotal.Text), 2), Me.txtMemo.Text)

            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.txt_vlrVenda_01.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.txt_vlrVenda_02.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.txt_vlrVenda_03.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.txt_vlrVenda_04.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.txt_vlrVenda_05.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.txt_vlrVenda_06.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.txt_vlrVenda_07.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.txt_vlrVenda_08.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.txt_vlrVenda_09.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.txt_vlrVenda_10.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.txt_vlrVenda_11.Text, 100, User.Identity.Name, 1)
            oVem.Salvar_Ori_Grupo_Mes(Me.cboPosicao.CallPosicao, 1, cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.txt_vlrVenda_12.Text, 100, User.Identity.Name, 1)

            oVem.Salvar_Ori_Grupo_Ano(Me.cboPosicao.CallPosicao, 1, Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.txt_vlrVenda_Total.Text, 100, User.Identity.Name, 1)
            clData_gerManager.usp3("dbo.uspCalcularNovaParticipacao", "@ano", "@idFilial", "@posicao", Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.cboPosicao.CallPosicao)
            oVem.UserMsgBox(Me, "As Vendas foram salvas com sucesso!!!")
            Me.lblError.Text = oVem.varDesc
        End If

    End Sub

    Sub HabilitarSalvar()
        If Me.cboAno.CallAno > Year(Now()) Then
            Me.btnSalvar.Enabled = True
        Else
            Me.btnSalvar.Enabled = False
        End If
    End Sub

    Sub MudarLegenda()
        Me.txt_Titulo_Hist3.Text = " Hist. " & Me.cboAno.CallAno.ToString - 3 & " "
        Me.txt_Titulo_Hist2.Text = " Hist. " & Me.cboAno.CallAno.ToString - 2 & " "
        Me.txt_Titulo_Hist1.Text = " Hist. " & Me.cboAno.CallAno.ToString - 1 & " "

        Me.lblCrescLegenda_M1.Text = "Cresc." 'Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
        Me.lblCrescLegenda_M2.Text = Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)
        Me.lblCrescLegenda_M3.Text = Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)
        Me.lblCrescLegenda_M4.Text = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
    End Sub

    Private Sub InserePercentual(ByVal iHistMes As Label, ByVal iMetaMes As TextBox, ByVal iPercCresc As TextBox,
                                 ByVal iVendaMes As Label, ByVal iLabelVendaMes As Label, ByVal iLabelCrescMes As Label, _
                                 ByVal iPercMeta As Label, ByVal iNextField As TextBox, ByVal iPercCrescMesTotal As Label, ByVal ivlrHistVendaCheia As Label)
        On Error Resume Next
        If iHistMes.Text = 0 Then
            iMetaMes.Text = 0
            iPercCresc.Text = 0
        Else
            iMetaMes.Text = (((iPercCresc.Text * iHistMes.Text) / 100) + iHistMes.Text).ToString("n0")
        End If
        iVendaMes.Text = (CDbl(iVendaMes.Text) + (CDbl(iMetaMes.Text) - CDbl(iLabelVendaMes.Text))).ToString("n0")

        Call Totalizar_MetaVenda()  'Totaliza o Total do Ano de Todas as Seções.
        iNextField.Focus()  'Foco no próximo campo
        Call Totalizar_Meta()       'Totaliza o Total do Ano da Seção selecionada.
        Call CalcularM1_MudaCor_Mes(iPercCresc, iLabelCrescMes)
        Call CalcularParticipacao_Mes(iMetaMes, iVendaMes, iPercMeta)
        iLabelCrescMes.Text = iPercCresc.Text
        Call CalcularCrescimentoMes(ivlrHistVendaCheia, iVendaMes, iPercCrescMesTotal)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_Total, txt_vlrVenda_Total, txt_percCrescMes_Total)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_01, Me.txt_vlrMeta01, Me.txt_percCresc01, Me.txt_vlrVenda_01, Me.lblVenda01, Me.lblCresc01_M1, Me.txt_percMeta01, Me.txt_percCresc02, txt_percCrescMes_01, txt_vlrHistVendaCheia_01)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_02, Me.txt_vlrMeta02, Me.txt_percCresc02, Me.txt_vlrVenda_02, Me.lblVenda02, Me.lblCresc02_M1, Me.txt_percMeta02, Me.txt_percCresc03, txt_percCrescMes_02, txt_vlrHistVendaCheia_02)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_03, Me.txt_vlrMeta03, Me.txt_percCresc03, Me.txt_vlrVenda_03, Me.lblVenda03, Me.lblCresc03_M1, Me.txt_percMeta03, Me.txt_percCresc04, txt_percCrescMes_03, txt_vlrHistVendaCheia_03)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_04, Me.txt_vlrMeta04, Me.txt_percCresc04, Me.txt_vlrVenda_04, Me.lblVenda04, Me.lblCresc04_M1, Me.txt_percMeta04, Me.txt_percCresc05, txt_percCrescMes_04, txt_vlrHistVendaCheia_04)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_05, Me.txt_vlrMeta05, Me.txt_percCresc05, Me.txt_vlrVenda_05, Me.lblVenda05, Me.lblCresc05_M1, Me.txt_percMeta05, Me.txt_percCresc06, txt_percCrescMes_05, txt_vlrHistVendaCheia_05)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_06, Me.txt_vlrMeta06, Me.txt_percCresc06, Me.txt_vlrVenda_06, Me.lblVenda06, Me.lblCresc06_M1, Me.txt_percMeta06, Me.txt_percCresc07, txt_percCrescMes_06, txt_vlrHistVendaCheia_06)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_07, Me.txt_vlrMeta07, Me.txt_percCresc07, Me.txt_vlrVenda_07, Me.lblVenda07, Me.lblCresc07_M1, Me.txt_percMeta07, Me.txt_percCresc08, txt_percCrescMes_07, txt_vlrHistVendaCheia_07)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_08, Me.txt_vlrMeta08, Me.txt_percCresc08, Me.txt_vlrVenda_08, Me.lblVenda08, Me.lblCresc08_M1, Me.txt_percMeta08, Me.txt_percCresc09, txt_percCrescMes_08, txt_vlrHistVendaCheia_08)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_09, Me.txt_vlrMeta09, Me.txt_percCresc09, Me.txt_vlrVenda_09, Me.lblVenda09, Me.lblCresc09_M1, Me.txt_percMeta09, Me.txt_percCresc10, txt_percCrescMes_09, txt_vlrHistVendaCheia_09)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_10, Me.txt_vlrMeta10, Me.txt_percCresc10, Me.txt_vlrVenda_10, Me.lblVenda10, Me.lblCresc10_M1, Me.txt_percMeta10, Me.txt_percCresc11, txt_percCrescMes_10, txt_vlrHistVendaCheia_10)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_11, Me.txt_vlrMeta11, Me.txt_percCresc11, Me.txt_vlrVenda_11, Me.lblVenda11, Me.lblCresc11_M1, Me.txt_percMeta11, Me.txt_percCresc12, txt_percCrescMes_11, txt_vlrHistVendaCheia_11)
    End Sub 'codigo REVISTO

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        Call InserePercentual(Me.txt_vlrHist1_12, Me.txt_vlrMeta12, Me.txt_percCresc12, Me.txt_vlrVenda_12, Me.lblVenda12, Me.lblCresc12_M1, Me.txt_percMeta12, Me.txt_percCresc01, txt_percCrescMes_12, txt_vlrHistVendaCheia_12)
    End Sub 'codigo REVISTO

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call Atributos(Me.txt_vlrMeta01, Me.txt_percCresc01)
            Call Atributos(Me.txt_vlrMeta02, Me.txt_percCresc02)
            Call Atributos(Me.txt_vlrMeta03, Me.txt_percCresc03)
            Call Atributos(Me.txt_vlrMeta04, Me.txt_percCresc04)
            Call Atributos(Me.txt_vlrMeta05, Me.txt_percCresc05)
            Call Atributos(Me.txt_vlrMeta06, Me.txt_percCresc06)
            Call Atributos(Me.txt_vlrMeta07, Me.txt_percCresc07)
            Call Atributos(Me.txt_vlrMeta08, Me.txt_percCresc08)
            Call Atributos(Me.txt_vlrMeta09, Me.txt_percCresc09)
            Call Atributos(Me.txt_vlrMeta10, Me.txt_percCresc10)
            Call Atributos(Me.txt_vlrMeta11, Me.txt_percCresc11)
            Call Atributos(Me.txt_vlrMeta12, Me.txt_percCresc12)
            Call AtualizarVendaAnoAnterior()
        End If
    End Sub 'codigo REVISTO

    Private Sub Atributos(ByVal iVlr As TextBox, ByVal iPerc As TextBox)
        iVlr.Attributes.Add("onfocus", "this.select();")
        iPerc.Attributes.Add("onfocus", "this.select();")
    End Sub 'codigo REVISTO

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Orçamento - Cadastro de Meta de Venda - Loja"
    End Sub 'codigo REVISTO

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        Me.lblVenda01.Text = Me.txt_vlrMeta01.Text
        Me.lblVenda02.Text = Me.txt_vlrMeta02.Text
        Me.lblVenda03.Text = Me.txt_vlrMeta03.Text
        Me.lblVenda04.Text = Me.txt_vlrMeta04.Text
        Me.lblVenda05.Text = Me.txt_vlrMeta05.Text
        Me.lblVenda06.Text = Me.txt_vlrMeta06.Text
        Me.lblVenda07.Text = Me.txt_vlrMeta07.Text
        Me.lblVenda08.Text = Me.txt_vlrMeta08.Text
        Me.lblVenda09.Text = Me.txt_vlrMeta09.Text
        Me.lblVenda10.Text = Me.txt_vlrMeta10.Text
        Me.lblVenda11.Text = Me.txt_vlrMeta11.Text
        Me.lblVenda12.Text = Me.txt_vlrMeta12.Text
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call HabilitarSalvar()
        Call MudarLegenda()
        Call AtualizarVendaAnoAnterior()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
        Call ArmazenaMetaInicial()
        Call AtualizarVendaAnoAnterior()
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSecao.ListSecaoChanged
        Call Atualizar()
        Call ArmazenaMetaInicial()
    End Sub

    Sub BuscaVendaRealAnoAnterior(ByVal iMes As Byte)
        oVem.BuscaGrupo_ReaMes(1, Me.cboAno.CallAno - 1, iMes, Me.cboFilial.CallFilial)
        Select Case iMes
            Case 1
                Me.txt_vlrHistVendaCheia_01.Text = oVem.vlrOri
            Case 2
                Me.txt_vlrHistVendaCheia_02.Text = oVem.vlrOri
            Case 3
                Me.txt_vlrHistVendaCheia_03.Text = oVem.vlrOri
            Case 4
                Me.txt_vlrHistVendaCheia_04.Text = oVem.vlrOri
            Case 5
                Me.txt_vlrHistVendaCheia_05.Text = oVem.vlrOri
            Case 6
                Me.txt_vlrHistVendaCheia_06.Text = oVem.vlrOri
            Case 7
                Me.txt_vlrHistVendaCheia_07.Text = oVem.vlrOri
            Case 8
                Me.txt_vlrHistVendaCheia_08.Text = oVem.vlrOri
            Case 9
                Me.txt_vlrHistVendaCheia_09.Text = oVem.vlrOri
            Case 10
                Me.txt_vlrHistVendaCheia_10.Text = oVem.vlrOri
            Case 11
                Me.txt_vlrHistVendaCheia_11.Text = oVem.vlrOri
            Case 12
                Me.txt_vlrHistVendaCheia_12.Text = oVem.vlrOri
        End Select

        If iMes = 12 Then Call Totalizar_VendaRealAnoAnterior()
    End Sub

    Sub BuscaVendaRevistaAnoAnterior(ByVal iMes As Byte)
        oVem.BuscaRevGrupoMes(1, Me.cboAno.CallAno - 1, iMes, Me.cboFilial.CallFilial)
        Select Case iMes
            Case 1
                Me.txt_vlrHistVendaCheia_01.Text = oVem.vlrRev
            Case 2
                Me.txt_vlrHistVendaCheia_02.Text = oVem.vlrRev
            Case 3
                Me.txt_vlrHistVendaCheia_03.Text = oVem.vlrRev
            Case 4
                Me.txt_vlrHistVendaCheia_04.Text = oVem.vlrRev
            Case 5
                Me.txt_vlrHistVendaCheia_05.Text = oVem.vlrRev
            Case 6
                Me.txt_vlrHistVendaCheia_06.Text = oVem.vlrRev
            Case 7
                Me.txt_vlrHistVendaCheia_07.Text = oVem.vlrRev
            Case 8
                Me.txt_vlrHistVendaCheia_08.Text = oVem.vlrRev
            Case 9
                Me.txt_vlrHistVendaCheia_09.Text = oVem.vlrRev
            Case 10
                Me.txt_vlrHistVendaCheia_10.Text = oVem.vlrRev
            Case 11
                Me.txt_vlrHistVendaCheia_11.Text = oVem.vlrRev
            Case 12
                Me.txt_vlrHistVendaCheia_12.Text = oVem.vlrRev
        End Select

        If iMes = 12 Then Call Totalizar_VendaRealAnoAnterior()
    End Sub

    Sub Totalizar_VendaRealAnoAnterior()

        'Formata Campo Valor
        no = 0
        no += CDbl(Me.txt_vlrHistVendaCheia_01.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_02.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_03.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_04.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_05.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_06.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_07.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_08.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_09.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_10.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_11.Text)
        no += CDbl(Me.txt_vlrHistVendaCheia_12.Text)

        Me.txt_vlrHistVendaCheia_Total.Text = Format(no, "#,##0")

        'Formata Campo Percentual

        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_01, txt_vlrVenda_01, txt_percCrescMes_01)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_02, txt_vlrVenda_02, txt_percCrescMes_02)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_03, txt_vlrVenda_03, txt_percCrescMes_03)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_04, txt_vlrVenda_04, txt_percCrescMes_04)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_05, txt_vlrVenda_05, txt_percCrescMes_05)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_06, txt_vlrVenda_06, txt_percCrescMes_06)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_07, txt_vlrVenda_07, txt_percCrescMes_07)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_08, txt_vlrVenda_08, txt_percCrescMes_08)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_09, txt_vlrVenda_09, txt_percCrescMes_09)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_10, txt_vlrVenda_10, txt_percCrescMes_10)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_11, txt_vlrVenda_11, txt_percCrescMes_11)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_12, txt_vlrVenda_12, txt_percCrescMes_12)
        Call CalcularCrescimentoMes(txt_vlrHistVendaCheia_Total, txt_vlrVenda_Total, txt_percCrescMes_Total)
    End Sub

    Private Sub CalcularCrescimentoMes(ByVal iHistorico As Label, ByVal iMeta As Label, ByVal iPercCrescimento As Label)
        If CInt(iHistorico.Text) = 0 Then
            iPercCrescimento.Text = 0
        Else
            iPercCrescimento.Text = (((iMeta.Text / iHistorico.Text) * 100) - 100).ToString("n2")
        End If
    End Sub

    Private Sub AtualizarVendaAnoAnterior()
        Select Case Month(Now())
            Case 1  'Janeiro
                Call BuscaVendaRevistaAnoAnterior(1)
                Call BuscaVendaRevistaAnoAnterior(2)
                Call BuscaVendaRevistaAnoAnterior(3)
                Call BuscaVendaRevistaAnoAnterior(4)
                Call BuscaVendaRevistaAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 2  'Fevereiro
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRevistaAnoAnterior(2)
                Call BuscaVendaRevistaAnoAnterior(3)
                Call BuscaVendaRevistaAnoAnterior(4)
                Call BuscaVendaRevistaAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 3  'Março
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRevistaAnoAnterior(3)
                Call BuscaVendaRevistaAnoAnterior(4)
                Call BuscaVendaRevistaAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 4  'Abril
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRevistaAnoAnterior(4)
                Call BuscaVendaRevistaAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 5  'Maio
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRevistaAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 6  'Junho
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRevistaAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 7  'Julho
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRevistaAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 8  'Agosto
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRealAnoAnterior(7)
                Call BuscaVendaRevistaAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 9  'Setembro
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRealAnoAnterior(7)
                Call BuscaVendaRealAnoAnterior(8)
                Call BuscaVendaRevistaAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 10  'Outubro
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRealAnoAnterior(7)
                Call BuscaVendaRealAnoAnterior(8)
                Call BuscaVendaRealAnoAnterior(9)
                Call BuscaVendaRevistaAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 11  'Novembro
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRealAnoAnterior(7)
                Call BuscaVendaRealAnoAnterior(8)
                Call BuscaVendaRealAnoAnterior(9)
                Call BuscaVendaRealAnoAnterior(10)
                Call BuscaVendaRevistaAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
            Case 12  'Dezembro
                Call BuscaVendaRealAnoAnterior(1)
                Call BuscaVendaRealAnoAnterior(2)
                Call BuscaVendaRealAnoAnterior(3)
                Call BuscaVendaRealAnoAnterior(4)
                Call BuscaVendaRealAnoAnterior(5)
                Call BuscaVendaRealAnoAnterior(6)
                Call BuscaVendaRealAnoAnterior(7)
                Call BuscaVendaRealAnoAnterior(8)
                Call BuscaVendaRealAnoAnterior(9)
                Call BuscaVendaRealAnoAnterior(10)
                Call BuscaVendaRealAnoAnterior(11)
                Call BuscaVendaRevistaAnoAnterior(12)
        End Select

    End Sub

  
End Class
