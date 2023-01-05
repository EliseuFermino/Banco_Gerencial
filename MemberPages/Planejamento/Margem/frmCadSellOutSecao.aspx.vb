
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web
Imports System.IO

Partial Class MemberPages_Planejamento_Margem_frmCadSellOutSecao
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim no As Double
    Dim varDepto, varSecao As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double
    Dim varFilial As String

    Dim oVem As New VendaEmpresaMes
    Dim oDW As New clData_DW_Condor
    Dim oFun As New Funcoes
    Dim oOrc As New Orcamento

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

    Sub BuscaVendaReal_Ano(ByVal iFilial As String)
        'Ano M3
        oVem.BuscaRea_SecaoAno(Me.cboAno.CallAno - 3, iFilial, Me.cboSecao.CallSecao)
        If CDbl(Me.txt_vlrHist3_Total.Text) = 0 Then
            Me.txt_percHist3_Total.Text = 1
        Else
            Me.txt_percHist3_Total.Text = (CDbl(Me.txt_vlrHist3_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M2
        oVem.BuscaRea_SecaoAno(Me.cboAno.CallAno - 2, iFilial, Me.cboSecao.CallSecao)
        If CDbl(Me.txt_vlrHist2_Total.Text) = 0 Then
            Me.txt_percHist2_Total.Text = 0
        Else
            Me.txt_percHist2_Total.Text = (CDbl(Me.txt_vlrHist2_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M1
        If CDbl(Me.txt_vlrHist1_Total.Text) = 0 Then
            Me.txt_percHist1_Total.Text = 0
        ElseIf CDbl(Session("sVendaAnoAtual")) = 0 Then
            Me.txt_percHist1_Total.Text = 0
        Else
            Me.txt_percHist1_Total.Text = (CDbl(Me.txt_vlrHist1_Total.Text) / CDbl(Session("sVendaAnoAtual")) * 100).ToString("n2")
        End If

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

            'Call Preencher_Hist1_Meta_Mes02(iFilial)
            'Call Preencher_Hist1_Meta_Mes03(iFilial)
            'Call Preencher_Hist1_Meta_Mes04(iFilial)
            'Call Preencher_Hist1_Meta_Mes05(iFilial)
            'Call Preencher_Hist1_Meta_Mes06(iFilial)
            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 3 Then    'Março
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)

            'Call Preencher_Hist1_Meta_Mes03(iFilial)
            'Call Preencher_Hist1_Meta_Mes04(iFilial)
            'Call Preencher_Hist1_Meta_Mes05(iFilial)
            'Call Preencher_Hist1_Meta_Mes06(iFilial)
            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 4 Then    'Abril
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)

            'Call Preencher_Hist1_Meta_Mes04(iFilial)
            'Call Preencher_Hist1_Meta_Mes05(iFilial)
            'Call Preencher_Hist1_Meta_Mes06(iFilial)
            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 5 Then    'Maio
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)

            'Call Preencher_Hist1_Meta_Mes05(iFilial)
            'Call Preencher_Hist1_Meta_Mes06(iFilial)
            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 6 Then    'Junho
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)

            'Call Preencher_Hist1_Meta_Mes06(iFilial)
            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 7 Then    'Julho
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)

            'Call Preencher_Hist1_Meta_Mes07(iFilial)
            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 8 Then    'Agosto
            Call Preencher_Hist1_Mes01(iFilial)
            Call Preencher_Hist1_Mes02(iFilial)
            Call Preencher_Hist1_Mes03(iFilial)
            Call Preencher_Hist1_Mes04(iFilial)
            Call Preencher_Hist1_Mes05(iFilial)
            Call Preencher_Hist1_Mes06(iFilial)
            Call Preencher_Hist1_Mes07(iFilial)

            'Call Preencher_Hist1_Meta_Mes08(iFilial)
            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
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

            'Call Preencher_Hist1_Meta_Mes09(iFilial)
            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
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

            'Call Preencher_Hist1_Meta_Mes10(iFilial)
            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
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
            Call Preencher_Hist1_Mes11(iFilial)

            'Call Preencher_Hist1_Meta_Mes11(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
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
            Call Preencher_Hist1_Mes12(iFilial)
            'Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        'Calcular  Total        
        oFun.Totalizar12Mes_Label(txt_vlrHist1_Total, txt_vlrHist1_01, txt_vlrHist1_02, txt_vlrHist1_03, txt_vlrHist1_04, txt_vlrHist1_05, txt_vlrHist1_06,
                                  txt_vlrHist1_07, txt_vlrHist1_08, txt_vlrHist1_09, txt_vlrHist1_10, txt_vlrHist1_11, txt_vlrHist1_12)

    End Sub

    Private Sub Preencher_Hist1_Mes01(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 1, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_01.Text = oVem.vlrRea
        Me.txt_percHist1_01.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes02(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 2, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_02.Text = oVem.vlrRea
        Me.txt_percHist1_02.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes03(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 3, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_03.Text = oVem.vlrRea
        Me.txt_percHist1_03.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes04(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 4, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_04.Text = oVem.vlrRea
        Me.txt_percHist1_04.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes05(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 5, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_05.Text = oVem.vlrRea
        Me.txt_percHist1_05.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes06(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 6, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_06.Text = oVem.vlrRea
        Me.txt_percHist1_06.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes07(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 7, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_07.Text = oVem.vlrRea
        Me.txt_percHist1_07.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes08(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 8, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_08.Text = oVem.vlrRea
        Me.txt_percHist1_08.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes09(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 9, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_09.Text = oVem.vlrRea
        Me.txt_percHist1_09.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes10(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 10, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_10.Text = oVem.vlrRea
        Me.txt_percHist1_10.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes11(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 11, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_11.Text = oVem.vlrRea
        Me.txt_percHist1_11.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes12(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 12, iFilial, Me.cboSecao.CallSecao, 4)
        Me.txt_vlrHist1_12.Text = oVem.vlrRea
        Me.txt_percHist1_12.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes01(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 1, iFilial)
        Me.txt_vlrHist1_01.Text = oVem.vlrRev
        Me.txt_percHist1_01.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes02(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 2, iFilial)
        Me.txt_vlrHist1_02.Text = oVem.vlrRev
        Me.txt_percHist1_02.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes03(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 3, iFilial)
        Me.txt_vlrHist1_03.Text = oVem.vlrRev
        Me.txt_percHist1_03.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes04(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 4, iFilial)
        Me.txt_vlrHist1_04.Text = oVem.vlrRev
        Me.txt_percHist1_04.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes05(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 5, iFilial)
        Me.txt_vlrHist1_05.Text = oVem.vlrRev
        Me.txt_percHist1_05.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes06(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 6, iFilial)
        Me.txt_vlrHist1_06.Text = oVem.vlrRev
        Me.txt_percHist1_06.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes07(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 7, iFilial)
        Me.txt_vlrHist1_07.Text = oVem.vlrRev
        Me.txt_percHist1_07.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes08(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 8, iFilial)
        Me.txt_vlrHist1_08.Text = oVem.vlrRev
        Me.txt_percHist1_08.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes09(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 9, iFilial)
        Me.txt_vlrHist1_09.Text = oVem.vlrRev
        Me.txt_percHist1_09.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes10(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 10, iFilial)
        Me.txt_vlrHist1_10.Text = oVem.vlrRev
        Me.txt_percHist1_10.Text = oVem.percRev

    End Sub

    Private Sub Preencher_Hist1_Meta_Mes11(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 11, iFilial)
        Me.txt_vlrHist1_11.Text = oVem.vlrRev
        Me.txt_percHist1_11.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes12(ByVal iFilial As String)
        oVem.BuscaRevSecaoMes(2, Me.cboSecao.CallSecao, Me.cboAno.CallAno - 1, 12, iFilial)
        Me.txt_vlrHist1_12.Text = oVem.vlrRev
        Me.txt_percHist1_12.Text = oVem.percRev
    End Sub

    Sub BuscaVendaReal_Hist2(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, 1, iFilial, iSecao, 4)
        Me.txt_vlrHist2_01.Text = oVem.vlrRea
        Me.txt_percHist2_01.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 2, iFilial, iSecao, 4)
        Me.txt_vlrHist2_02.Text = oVem.vlrRea
        Me.txt_percHist2_02.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 3, iFilial, iSecao, 4)
        Me.txt_vlrHist2_03.Text = oVem.vlrRea
        Me.txt_percHist2_03.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 4, iFilial, iSecao, 4)
        Me.txt_vlrHist2_04.Text = oVem.vlrRea
        Me.txt_percHist2_04.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 5, iFilial, iSecao, 4)
        Me.txt_vlrHist2_05.Text = oVem.vlrRea
        Me.txt_percHist2_05.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 6, iFilial, iSecao, 4)
        Me.txt_vlrHist2_06.Text = oVem.vlrRea
        Me.txt_percHist2_06.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 7, iFilial, iSecao, 4)
        Me.txt_vlrHist2_07.Text = oVem.vlrRea
        Me.txt_percHist2_07.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 8, iFilial, iSecao, 4)
        Me.txt_vlrHist2_08.Text = oVem.vlrRea
        Me.txt_percHist2_08.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 9, iFilial, iSecao, 4)
        Me.txt_vlrHist2_09.Text = oVem.vlrRea
        Me.txt_percHist2_09.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 10, iFilial, iSecao, 4)
        Me.txt_vlrHist2_10.Text = oVem.vlrRea
        Me.txt_percHist2_10.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 11, iFilial, iSecao, 4)
        Me.txt_vlrHist2_11.Text = oVem.vlrRea
        Me.txt_percHist2_11.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 12, iFilial, iSecao, 4)
        Me.txt_vlrHist2_12.Text = oVem.vlrRea
        Me.txt_percHist2_12.Text = oVem.percRea

        oFun.Totalizar12Mes_Label(txt_vlrHist2_Total, txt_vlrHist2_01, txt_vlrHist2_02, txt_vlrHist2_03, txt_vlrHist2_04, txt_vlrHist2_05, txt_vlrHist2_06,
                                          txt_vlrHist2_07, txt_vlrHist2_08, txt_vlrHist2_09, txt_vlrHist2_10, txt_vlrHist2_11, txt_vlrHist2_12)

    End Sub

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, 1, iFilial, iSecao, 4)
        Me.txt_vlrHist3_01.Text = oVem.vlrRea
        Me.txt_percHist3_01.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 2, iFilial, iSecao, 4)
        Me.txt_vlrHist3_02.Text = oVem.vlrRea
        Me.txt_percHist3_02.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 3, iFilial, iSecao, 4)
        Me.txt_vlrHist3_03.Text = oVem.vlrRea
        Me.txt_percHist3_03.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 4, iFilial, iSecao, 4)
        Me.txt_vlrHist3_04.Text = oVem.vlrRea
        Me.txt_percHist3_04.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 5, iFilial, iSecao, 4)
        Me.txt_vlrHist3_05.Text = oVem.vlrRea
        Me.txt_percHist3_05.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 6, iFilial, iSecao, 4)
        Me.txt_vlrHist3_06.Text = oVem.vlrRea
        Me.txt_percHist3_06.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 7, iFilial, iSecao, 4)
        Me.txt_vlrHist3_07.Text = oVem.vlrRea
        Me.txt_percHist3_07.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 8, iFilial, iSecao, 4)
        Me.txt_vlrHist3_08.Text = oVem.vlrRea
        Me.txt_percHist3_08.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 9, iFilial, iSecao, 4)
        Me.txt_vlrHist3_09.Text = oVem.vlrRea
        Me.txt_percHist3_09.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 10, iFilial, iSecao, 4)
        Me.txt_vlrHist3_10.Text = oVem.vlrRea
        Me.txt_percHist3_10.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 11, iFilial, iSecao, 4)
        Me.txt_vlrHist3_11.Text = oVem.vlrRea
        Me.txt_percHist3_11.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 12, iFilial, iSecao, 4)
        Me.txt_vlrHist3_12.Text = oVem.vlrRea
        Me.txt_percHist3_12.Text = oVem.percRea

        oFun.Totalizar12Mes_Label(txt_vlrHist3_Total, txt_vlrHist3_01, txt_vlrHist3_02, txt_vlrHist3_03, txt_vlrHist3_04, txt_vlrHist3_05, txt_vlrHist3_06,
                                  txt_vlrHist3_07, txt_vlrHist3_08, txt_vlrHist3_09, txt_vlrHist3_10, txt_vlrHist3_11, txt_vlrHist3_12)
    End Sub

    Sub BuscaMeta(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, _
                  ByVal iPosicao As String, ByVal iTipoSecao As String)

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 1, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta01.Text = oVem.vlrOri
        Me.txt_percCresc01.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 2, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta02.Text = oVem.vlrOri
        Me.txt_percCresc02.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 3, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta03.Text = oVem.vlrOri
        Me.txt_percCresc03.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 4, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta04.Text = oVem.vlrOri
        Me.txt_percCresc04.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 5, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta05.Text = oVem.vlrOri
        Me.txt_percCresc05.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 6, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta06.Text = oVem.vlrOri
        Me.txt_percCresc06.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 7, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta07.Text = oVem.vlrOri
        Me.txt_percCresc07.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 8, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta08.Text = oVem.vlrOri
        Me.txt_percCresc08.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 9, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta09.Text = oVem.vlrOri
        Me.txt_percCresc09.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 10, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta10.Text = oVem.vlrOri
        Me.txt_percCresc10.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 11, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta11.Text = oVem.vlrOri
        Me.txt_percCresc11.Text = oVem.percOri

        oVem.BuscaSecao_VendaMargem_Ori(iAno, 12, iFilial, iSecao, iPosicao, iTipoSecao)
        Me.txt_vlrMeta12.Text = oVem.vlrOri
        Me.txt_percCresc12.Text = oVem.percOri

        Call Totalizar_Meta()
        'Me.lblError.Text = oVem.varDesc
    End Sub

    Sub Atualizar()

        Dim varFilial As String
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = 2   'Venda

        Call ZerarCampos()
        varFilial = oOrc.DefinirFilial(Me.cboFilial.CallFilial)

        Call BuscaVendaReal_Hist1(varFilial)
        Call BuscaVendaReal_Hist2(Me.cboAno.CallAno - 2, varFilial, Me.cboSecao.CallSecao)
        Call BuscaVendaReal_Hist3(Me.cboAno.CallAno - 3, varFilial, Me.cboSecao.CallSecao)
        Call BuscaVendaReal_Ano(varFilial)

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
        Call BuscaMeta(cboAno.CallAno, cboFilial.CallFilial, cboSecao.CallSecao, Me.cboPosicao.CallPosicao, 80)

        'oVem.BuscaMemo_Ori(Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.lblDepto.Text, Me.cboSecao.CallSecao)
        'Me.txtMemo.Text = oVem.varDesc

        'Calcular % de Crescimento
        Call CalcularM3()
        Call CalcularM2()
        Call CalcularM1()
        Call CalcularM1_Ano()

        Me.lblCresc01_M1.Text = Me.txt_percCresc01.Text
        Me.lblCresc02_M1.Text = Me.txt_percCresc02.Text
        Me.lblCresc03_M1.Text = Me.txt_percCresc03.Text
        Me.lblCresc04_M1.Text = Me.txt_percCresc04.Text
        Me.lblCresc05_M1.Text = Me.txt_percCresc05.Text
        Me.lblCresc06_M1.Text = Me.txt_percCresc06.Text
        Me.lblCresc07_M1.Text = Me.txt_percCresc07.Text
        Me.lblCresc08_M1.Text = Me.txt_percCresc08.Text
        Me.lblCresc09_M1.Text = Me.txt_percCresc09.Text
        Me.lblCresc10_M1.Text = Me.txt_percCresc10.Text
        Me.lblCresc11_M1.Text = Me.txt_percCresc11.Text
        Me.lblCresc12_M1.Text = Me.txt_percCresc12.Text

        Call HabilitarSalvar()

    End Sub

    Private Sub CalcularM3()
        lblCresc01_M3.Text = oFun.Calculate(txt_vlrHist2_01.Text, txt_vlrHist3_01.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc02_M3.Text = oFun.Calculate(txt_vlrHist2_02.Text, txt_vlrHist3_02.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc03_M3.Text = oFun.Calculate(txt_vlrHist2_03.Text, txt_vlrHist3_03.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc04_M3.Text = oFun.Calculate(txt_vlrHist2_04.Text, txt_vlrHist3_04.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc05_M3.Text = oFun.Calculate(txt_vlrHist2_05.Text, txt_vlrHist3_05.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc06_M3.Text = oFun.Calculate(txt_vlrHist2_06.Text, txt_vlrHist3_06.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc07_M3.Text = oFun.Calculate(txt_vlrHist2_07.Text, txt_vlrHist3_07.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc08_M3.Text = oFun.Calculate(txt_vlrHist2_08.Text, txt_vlrHist3_08.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc09_M3.Text = oFun.Calculate(txt_vlrHist2_09.Text, txt_vlrHist3_09.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc10_M3.Text = oFun.Calculate(txt_vlrHist2_10.Text, txt_vlrHist3_10.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc11_M3.Text = oFun.Calculate(txt_vlrHist2_11.Text, txt_vlrHist3_11.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc12_M3.Text = oFun.Calculate(txt_vlrHist2_12.Text, txt_vlrHist3_12.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCrescAno_M3.Text = oFun.Calculate(txt_vlrHist2_Total.Text, txt_vlrHist3_Total.Text, Funcoes.CalculateType.Growth).ToString("n1")

        'Formatar Cor se Negativo
        oFun.Label_RedIsNegative(lblCresc01_M3)
        oFun.Label_RedIsNegative(lblCresc02_M3)
        oFun.Label_RedIsNegative(lblCresc03_M3)
        oFun.Label_RedIsNegative(lblCresc04_M3)
        oFun.Label_RedIsNegative(lblCresc05_M3)
        oFun.Label_RedIsNegative(lblCresc06_M3)
        oFun.Label_RedIsNegative(lblCresc07_M3)
        oFun.Label_RedIsNegative(lblCresc08_M3)
        oFun.Label_RedIsNegative(lblCresc09_M3)
        oFun.Label_RedIsNegative(lblCresc10_M3)
        oFun.Label_RedIsNegative(lblCresc11_M3)
        oFun.Label_RedIsNegative(lblCresc12_M3)
        oFun.Label_RedIsNegative(lblCrescAno_M3)

    End Sub

    Private Sub CalcularM2()

        lblCresc01_M2.Text = oFun.Calculate(txt_vlrHist1_01.Text, txt_vlrHist2_01.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc02_M2.Text = oFun.Calculate(txt_vlrHist1_02.Text, txt_vlrHist2_02.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc03_M2.Text = oFun.Calculate(txt_vlrHist1_03.Text, txt_vlrHist2_03.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc04_M2.Text = oFun.Calculate(txt_vlrHist1_04.Text, txt_vlrHist2_04.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc05_M2.Text = oFun.Calculate(txt_vlrHist1_05.Text, txt_vlrHist2_05.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc06_M2.Text = oFun.Calculate(txt_vlrHist1_06.Text, txt_vlrHist2_06.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc07_M2.Text = oFun.Calculate(txt_vlrHist1_07.Text, txt_vlrHist2_07.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc08_M2.Text = oFun.Calculate(txt_vlrHist1_08.Text, txt_vlrHist2_08.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc09_M2.Text = oFun.Calculate(txt_vlrHist1_09.Text, txt_vlrHist2_09.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc10_M2.Text = oFun.Calculate(txt_vlrHist1_10.Text, txt_vlrHist2_10.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc11_M2.Text = oFun.Calculate(txt_vlrHist1_11.Text, txt_vlrHist2_11.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCresc12_M2.Text = oFun.Calculate(txt_vlrHist1_12.Text, txt_vlrHist2_12.Text, Funcoes.CalculateType.Growth).ToString("n1")
        lblCrescAno_M2.Text = oFun.Calculate(txt_vlrHist1_Total.Text, txt_vlrHist2_Total.Text, Funcoes.CalculateType.Growth).ToString("n1")

        'Formatar Cor se Negativo
        oFun.Label_RedIsNegative(lblCresc01_M2)
        oFun.Label_RedIsNegative(lblCresc02_M2)
        oFun.Label_RedIsNegative(lblCresc03_M2)
        oFun.Label_RedIsNegative(lblCresc04_M2)
        oFun.Label_RedIsNegative(lblCresc05_M2)
        oFun.Label_RedIsNegative(lblCresc06_M2)
        oFun.Label_RedIsNegative(lblCresc07_M2)
        oFun.Label_RedIsNegative(lblCresc08_M2)
        oFun.Label_RedIsNegative(lblCresc09_M2)
        oFun.Label_RedIsNegative(lblCresc10_M2)
        oFun.Label_RedIsNegative(lblCresc11_M2)
        oFun.Label_RedIsNegative(lblCresc12_M2)
        oFun.Label_RedIsNegative(lblCrescAno_M2)
    End Sub

#Region " CalcularM1_MudaCor"

    Private Sub CalcularM1_MudaCor(ByVal txt_percCresc As TextBox, lblCresc As Label)
        txt_percCresc.Text = (txt_percCresc.Text * 1).ToString("n2")    'Formata com duas casa decimais
        If CDbl(txt_percCresc.Text) < 0 Then
            txt_percCresc.ForeColor = Drawing.Color.Red
            lblCresc.ForeColor = Drawing.Color.Red
        Else
            txt_percCresc.ForeColor = Drawing.Color.Blue
            lblCresc.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Private Sub CalcularM1_MudaCor_Mes01()
        CalcularM1_MudaCor(txt_percCresc01, lblCresc01_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes02()
        CalcularM1_MudaCor(txt_percCresc02, lblCresc02_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes03()
        CalcularM1_MudaCor(txt_percCresc03, lblCresc03_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes04()
        CalcularM1_MudaCor(txt_percCresc04, lblCresc04_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes05()
        CalcularM1_MudaCor(txt_percCresc05, lblCresc05_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes06()
        CalcularM1_MudaCor(txt_percCresc06, lblCresc06_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes07()
        CalcularM1_MudaCor(txt_percCresc07, lblCresc07_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes08()
        CalcularM1_MudaCor(txt_percCresc08, lblCresc08_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes09()
        CalcularM1_MudaCor(txt_percCresc09, lblCresc09_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes10()
        CalcularM1_MudaCor(txt_percCresc10, lblCresc10_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes11()
        CalcularM1_MudaCor(txt_percCresc11, lblCresc11_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes12()
        CalcularM1_MudaCor(txt_percCresc12, lblCresc12_M1)
    End Sub

    Private Sub CalcularM1_Mes01()
        Call CalcularM1_MudaCor_Mes01()
    End Sub

    Private Sub CalcularM1_Mes02()
        Call CalcularM1_MudaCor_Mes02()
    End Sub

    Private Sub CalcularM1_Mes03()
        Call CalcularM1_MudaCor_Mes03()
    End Sub

    Private Sub CalcularM1_Mes04()
        Call CalcularM1_MudaCor_Mes04()
    End Sub

    Private Sub CalcularM1_Mes05()
        Call CalcularM1_MudaCor_Mes05()
    End Sub

    Private Sub CalcularM1_Mes06()
        Call CalcularM1_MudaCor_Mes06()
    End Sub

    Private Sub CalcularM1_Mes07()
        Call CalcularM1_MudaCor_Mes07()
    End Sub

    Private Sub CalcularM1_Mes08()
        Call CalcularM1_MudaCor_Mes08()
    End Sub

    Private Sub CalcularM1_Mes09()
        Call CalcularM1_MudaCor_Mes09()
    End Sub

    Private Sub CalcularM1_Mes10()
        Call CalcularM1_MudaCor_Mes10()
    End Sub

    Private Sub CalcularM1_Mes11()
        Call CalcularM1_MudaCor_Mes11()
    End Sub

    Private Sub CalcularM1_Mes12()
        Call CalcularM1_MudaCor_Mes12()
    End Sub

#End Region

    Private Sub CalcularM1()
        Call CalcularM1_Mes01()
        Call CalcularM1_Mes02()
        Call CalcularM1_Mes03()
        Call CalcularM1_Mes04()
        Call CalcularM1_Mes05()
        Call CalcularM1_Mes06()
        Call CalcularM1_Mes07()
        Call CalcularM1_Mes08()
        Call CalcularM1_Mes09()
        Call CalcularM1_Mes10()
        Call CalcularM1_Mes11()
        Call CalcularM1_Mes12()
        Call CalcularM1_Ano()
    End Sub

    Private Sub CalcularM1_Ano()
        Me.lblCrescAno.Text = oFun.Calculate(txt_vlrMetaTotal.Text, txt_vlrVenda_Total.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Me.lblCrescAno_M1.Text = oFun.Calculate(txt_vlrMetaTotal.Text, txt_vlrHist1_Total.Text, Funcoes.CalculateType.Growth).ToString("n1")

        'Formatar Cor se Negativo
        oFun.Label_RedIsNegative(lblCrescAno)
        oFun.Label_RedIsNegative(lblCrescAno_M1)
    End Sub

    Sub Totalizar_Hist3()
        oFun.Totalizar12Mes_Label(txt_vlrHist3_Total, txt_vlrHist3_01, txt_vlrHist3_02, txt_vlrHist3_03, txt_vlrHist3_04, txt_vlrHist3_05, txt_vlrHist3_06,
                                   txt_vlrHist3_07, txt_vlrHist3_08, txt_vlrHist3_09, txt_vlrHist3_10, txt_vlrHist3_11, txt_vlrHist3_12)
    End Sub

    Sub Totalizar_Hist2()
        oFun.Totalizar12Mes_Label(txt_vlrHist2_Total, txt_vlrHist2_01, txt_vlrHist2_02, txt_vlrHist2_03, txt_vlrHist2_04, txt_vlrHist2_05, txt_vlrHist2_06,
                                   txt_vlrHist2_07, txt_vlrHist2_08, txt_vlrHist2_09, txt_vlrHist2_10, txt_vlrHist2_11, txt_vlrHist2_12)
    End Sub

    Sub Totalizar_Hist1()
        oFun.Totalizar12Mes_Label(txt_vlrHist1_Total, txt_vlrHist1_01, txt_vlrHist1_02, txt_vlrHist1_03, txt_vlrHist1_04, txt_vlrHist1_05, txt_vlrHist1_06,
                                   txt_vlrHist1_07, txt_vlrHist1_08, txt_vlrHist1_09, txt_vlrHist1_10, txt_vlrHist1_11, txt_vlrHist1_12)
    End Sub

    Sub Totalizar_MetaVenda()
        oFun.Totalizar12Mes_TextBox(txt_vlrVenda_Total, txt_vlrVenda_01, txt_vlrVenda_02, txt_vlrVenda_03, txt_vlrVenda_04, txt_vlrVenda_05, txt_vlrVenda_06,
                           txt_vlrVenda_07, txt_vlrVenda_08, txt_vlrVenda_09, txt_vlrVenda_10, txt_vlrVenda_11, txt_vlrVenda_12)

        'Formata Campo Percentual
        If CInt(Me.txt_vlrVenda_01.Text) = 0 Then
            Me.txt_percPart_01.Text = 0
        Else
            Me.txt_percPart_01.Text = ((CDbl(Me.txt_vlrVenda_01.Text) / CDbl(Me.txt_vlrVenda_Total.Text)) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_02.Text) = 0 Then
            Me.txt_percPart_02.Text = 0
        Else
            Me.txt_percPart_02.Text = ((Me.txt_vlrVenda_02.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_03.Text) = 0 Then
            Me.txt_percPart_03.Text = 0
        Else
            Me.txt_percPart_03.Text = ((Me.txt_vlrVenda_03.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_04.Text) = 0 Then
            Me.txt_percPart_04.Text = 0
        Else
            Me.txt_percPart_04.Text = ((Me.txt_vlrVenda_04.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_05.Text) = 0 Then
            Me.txt_percPart_05.Text = 0
        Else
            Me.txt_percPart_05.Text = ((Me.txt_vlrVenda_05.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_06.Text) = 0 Then
            Me.txt_percPart_06.Text = 0
        Else
            Me.txt_percPart_06.Text = ((Me.txt_vlrVenda_06.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_07.Text) = 0 Then
            Me.txt_percPart_07.Text = 0
        Else
            Me.txt_percPart_07.Text = ((Me.txt_vlrVenda_07.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_08.Text) = 0 Then
            Me.txt_percPart_08.Text = 0
        Else
            Me.txt_percPart_08.Text = ((Me.txt_vlrVenda_08.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_09.Text) = 0 Then
            Me.txt_percPart_09.Text = 0
        Else
            Me.txt_percPart_09.Text = ((Me.txt_vlrVenda_09.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_10.Text) = 0 Then
            Me.txt_percPart_10.Text = 0
        Else
            Me.txt_percPart_10.Text = ((Me.txt_vlrVenda_10.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_11.Text) = 0 Then
            Me.txt_percPart_11.Text = 0
        Else
            Me.txt_percPart_11.Text = ((Me.txt_vlrVenda_11.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If CInt(Me.txt_vlrVenda_12.Text) = 0 Then
            Me.txt_percPart_12.Text = 0
        Else
            Me.txt_percPart_12.Text = ((Me.txt_vlrVenda_12.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        End If

        If Me.txt_vlrVenda_Total.Text <> 0 Then
            Me.txt_percPart_Ano.Text = "100"
        Else
            Me.txt_percPart_Ano.Text = "0"
            Me.lblCrescAno.Text = 0
        End If
    End Sub

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
        Call CalcularM1_Ano()


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
        Me.txt_percPart_Ano.Text = 0
    End Sub

#Region " txt_vlrMeta_TextChanged"

    Private Sub txt_vlrMeta_TextChanged(ByVal txt_vlrMetaFocus As TextBox, ByVal txt_percCresc As TextBox, ByVal lblCresc As Label, ByVal txt_vlrMeta As TextBox, ByVal txt_vlrVenda As TextBox)
        Call Totalizar_MetaVenda()  'Calcula o total da meta de venda de todas as seções
        txt_vlrMetaFocus.Focus()
        Call Totalizar_Meta()
        CalcularM1_MudaCor(txt_percCresc, lblCresc)
        txt_percCresc.Text = oFun.Calculate(txt_vlrMeta.Text, txt_vlrVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta02, txt_percCresc01, lblCresc01_M1, txt_vlrMeta01, txt_vlrVenda_01)
    End Sub

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta03, txt_percCresc02, lblCresc02_M1, txt_vlrMeta02, txt_vlrVenda_02)
    End Sub

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta04, txt_percCresc03, lblCresc03_M1, txt_vlrMeta03, txt_vlrVenda_03)
    End Sub

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta05, txt_percCresc04, lblCresc04_M1, txt_vlrMeta04, txt_vlrVenda_04)
    End Sub

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta06, txt_percCresc05, lblCresc05_M1, txt_vlrMeta05, txt_vlrVenda_05)
    End Sub

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta07, txt_percCresc06, lblCresc06_M1, txt_vlrMeta06, txt_vlrVenda_06)
    End Sub

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta08, txt_percCresc07, lblCresc07_M1, txt_vlrMeta07, txt_vlrVenda_07)
    End Sub

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta09, txt_percCresc08, lblCresc08_M1, txt_vlrMeta08, txt_vlrVenda_08)
    End Sub

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta10, txt_percCresc09, lblCresc09_M1, txt_vlrMeta09, txt_vlrVenda_09)
    End Sub

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta11, txt_percCresc10, lblCresc10_M1, txt_vlrMeta10, txt_vlrVenda_10)
    End Sub

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta12, txt_percCresc11, lblCresc11_M1, txt_vlrMeta11, txt_vlrVenda_11)
    End Sub

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged
        txt_vlrMeta_TextChanged(txt_vlrMeta01, txt_percCresc12, lblCresc12_M1, txt_vlrMeta12, txt_vlrVenda_12)
    End Sub
#End Region

    Private Sub Definir_varFilial()
        'Select Case Me.cboFilial.CallFilial
        '    Case 40 'Sao Jose Pinhais - Nova
        '        varFilial = 32
        '    Case Else
        '        varFilial = Me.cboFilial.CallFilial
        'End Select
    End Sub

    Public Function Salvar(ByVal idTipoSecao As Byte, ByVal Ano As Int16, _
                           ByVal Mes As Byte, ByVal idFilial As Int16, ByVal idSecao As Byte, ByVal vlr As Decimal, _
                           ByVal percCresc As Decimal, ByVal iPosicao As Byte, iUsuario As String) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspSalvarMargemSecao_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = idTipoSecao

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Ano

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Mes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = idFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = idSecao

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@percCresc", SqlDbType.Money))
        comando.Parameters("@percCresc").Value = percCresc

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = iPosicao

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = iUsuario

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

    Sub MudarLegenda()
        Me.txt_Titulo_Hist3.Text = " Hist. " & Me.cboAno.CallAno.ToString - 3 & " "
        Me.txt_Titulo_Hist2.Text = " Hist. " & Me.cboAno.CallAno.ToString - 2 & " "
        Me.txt_Titulo_Hist1.Text = " Hist. " & Me.cboAno.CallAno.ToString - 1 & " "

        Me.lblCrescLegenda_M1.Text = "%"
        Me.lblCrescLegenda_M2.Text = Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)
        Me.lblCrescLegenda_M3.Text = Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)
        Me.lblCrescLegenda_M4.Text = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)

        Me.gridHistorico.Columns.Item("bandAA2").Caption = "Real " & Me.cboAno.CallAno - 3
        Me.gridHistorico.Columns.Item("bandAA1").Caption = "Real " & Me.cboAno.CallAno - 2
        Me.gridHistorico.Columns.Item("bandAT").Caption = "Real " & Me.cboAno.CallAno - 1
        Me.gridHistorico.Columns.Item("bandMeta").Caption = "Meta " & Me.cboAno.CallAno

    End Sub

    Sub Busca_CodDepto()
        Dim oCad As New Cadastro
        oCad.Busca_CodDepto(Me.cboSecao.CallSecao)
        Me.lblDepto.Text = oCad.varDeptoID
    End Sub

#Region " txt_percCresc_TextChanged"

    Private Sub txt_percCresc_TextChanged(ByVal txt_vlrMeta As TextBox, txt_percCresc As TextBox, txt_vlrVenda As TextBox, txt_percCrescFocus As TextBox, lblCresc As Label, txt_vlrHist1 As Label)
        txt_vlrMeta.Text = ((txt_percCresc.Text * txt_vlrVenda.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()  'Totaliza o Total do Ano de Todas as Seções.
        txt_percCrescFocus.Focus()
        Call Totalizar_Meta()       'Totaliza o Total do Ano da Seção selecionada.
        CalcularM1_MudaCor(txt_percCresc, lblCresc)
        lblCresc.Text = oFun.Calculate(txt_vlrMeta.Text, txt_vlrHist1.Text, Funcoes.CalculateType.Growth).ToString("n1")  ' (((txt_vlrMeta.Text / txt_vlrHist1.Text) * 100) - 100).ToString("n1")
        oFun.Label_RedIsNegative(lblCresc)
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta01, txt_percCresc01, txt_vlrVenda_01, txt_percCresc02, lblCresc01_M1, txt_vlrHist1_01)
    End Sub

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta02, txt_percCresc02, txt_vlrVenda_02, txt_percCresc03, lblCresc02_M1, txt_vlrHist1_02)
    End Sub

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta03, txt_percCresc03, txt_vlrVenda_03, txt_percCresc04, lblCresc03_M1, txt_vlrHist1_03)
    End Sub

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta04, txt_percCresc04, txt_vlrVenda_04, txt_percCresc05, lblCresc04_M1, txt_vlrHist1_04)
    End Sub

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta05, txt_percCresc05, txt_vlrVenda_05, txt_percCresc06, lblCresc05_M1, txt_vlrHist1_05)
    End Sub

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta06, txt_percCresc06, txt_vlrVenda_06, txt_percCresc07, lblCresc06_M1, txt_vlrHist1_06)
    End Sub

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta07, txt_percCresc07, txt_vlrVenda_07, txt_percCresc08, lblCresc07_M1, txt_vlrHist1_07)
    End Sub

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta08, txt_percCresc08, txt_vlrVenda_08, txt_percCresc09, lblCresc08_M1, txt_vlrHist1_08)
    End Sub

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta09, txt_percCresc09, txt_vlrVenda_09, txt_percCresc10, lblCresc09_M1, txt_vlrHist1_09)
    End Sub

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta10, txt_percCresc10, txt_vlrVenda_10, txt_percCresc11, lblCresc10_M1, txt_vlrHist1_10)
    End Sub

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta11, txt_percCresc11, txt_vlrVenda_11, txt_percCresc12, lblCresc11_M1, txt_vlrHist1_11)
    End Sub

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        txt_percCresc_TextChanged(txt_vlrMeta12, txt_percCresc12, txt_vlrVenda_12, txt_percCresc01, lblCresc12_M1, txt_vlrHist1_12)
    End Sub

#End Region

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call mySESSION()
        Call Atualizar()
        Call MudarLegenda()
        Me.gridHistorico.DataBind()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call mySESSION()
        Call Busca_CodDepto()
        Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
        Call Atualizar()
        Call CalcularCrescimento()
        Me.gridHistorico.DataBind()
    End Sub

    Private Sub CalcularCrescimento()
        Call CalcularCrescimento_Mes01()
        Call CalcularCrescimento_Mes02()
        Call CalcularCrescimento_Mes03()
        Call CalcularCrescimento_Mes04()
        Call CalcularCrescimento_Mes05()
        Call CalcularCrescimento_Mes06()
        Call CalcularCrescimento_Mes07()
        Call CalcularCrescimento_Mes08()
        Call CalcularCrescimento_Mes09()
        Call CalcularCrescimento_Mes10()
        Call CalcularCrescimento_Mes11()
        Call CalcularCrescimento_Mes12()



    End Sub

    Private Sub CalcularCrescimento_Mes01()
        If CDbl(Me.txt_percCresc01.Text) = 0 Then
            Me.lblCresc01_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_01.Text) = 0 Then
            Me.lblCresc01_M1.Text = 0
        Else
            Me.lblCresc01_M1.Text = (((Me.txt_percCresc01.Text / Me.txt_percHist1_01.Text) * 100) - 100).ToString("n2")
            If CDbl(Me.lblCresc01_M1.Text) < 0 Then
                Me.lblCresc01_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc01_M1.ForeColor = Drawing.Color.Blue
            End If
        End If



    End Sub

    Private Sub CalcularCrescimento_Mes02()
        If CDbl(Me.txt_percCresc02.Text) = 0 Then
            Me.lblCresc02_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_02.Text) = 0 Then
            Me.lblCresc02_M1.Text = 0
        Else
            Me.lblCresc02_M1.Text = (((Me.txt_percCresc02.Text / Me.txt_percHist1_02.Text) * 100) - 100).ToString("n2")
            If CDbl(Me.lblCresc02_M1.Text) < 0 Then
                Me.lblCresc02_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc02_M1.ForeColor = Drawing.Color.Blue
            End If
        End If
    End Sub

    Private Sub CalcularCrescimento_Mes03()
        If CDbl(Me.txt_percCresc03.Text) = 0 Then
            Me.lblCresc03_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_03.Text) = 0 Then
            Me.lblCresc03_M1.Text = 0
        Else
            Me.lblCresc03_M1.Text = (((Me.txt_percCresc03.Text / Me.txt_percHist1_03.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc03_M1.Text) < 0 Then
                Me.lblCresc03_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc03_M1.ForeColor = Drawing.Color.Blue
            End If

        End If
    End Sub

    Private Sub CalcularCrescimento_Mes04()
        If CDbl(Me.txt_percCresc04.Text) = 0 Then
            Me.lblCresc04_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_04.Text) = 0 Then
            Me.lblCresc04_M1.Text = 0
        Else
            Me.lblCresc04_M1.Text = (((Me.txt_percCresc04.Text / Me.txt_percHist1_04.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc04_M1.Text) < 0 Then
                Me.lblCresc04_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc04_M1.ForeColor = Drawing.Color.Blue
            End If

        End If
    End Sub

    Private Sub CalcularCrescimento_Mes05()
        If CDbl(Me.txt_percCresc05.Text) = 0 Then
            Me.lblCresc05_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_05.Text) = 0 Then
            Me.lblCresc05_M1.Text = 0
        Else
            Me.lblCresc05_M1.Text = (((Me.txt_percCresc05.Text / Me.txt_percHist1_05.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc05_M1.Text) < 0 Then
                Me.lblCresc05_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc05_M1.ForeColor = Drawing.Color.Blue
            End If

        End If


    End Sub

    Private Sub CalcularCrescimento_Mes06()
        If CDbl(Me.txt_percCresc06.Text) = 0 Then
            Me.lblCresc06_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_06.Text) = 0 Then
            Me.lblCresc06_M1.Text = 0
        Else
            Me.lblCresc06_M1.Text = (((Me.txt_percCresc06.Text / Me.txt_percHist1_06.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc06_M1.Text) < 0 Then
                Me.lblCresc06_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc06_M1.ForeColor = Drawing.Color.Blue
            End If
        End If


    End Sub

    Private Sub CalcularCrescimento_Mes07()
        If CDbl(Me.txt_percCresc07.Text) = 0 Then
            Me.lblCresc07_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_07.Text) = 0 Then
            Me.lblCresc07_M1.Text = 0
        Else
            Me.lblCresc07_M1.Text = (((Me.txt_percCresc07.Text / Me.txt_percHist1_07.Text) * 100) - 100).ToString("n2")
        End If

        'Formatar
        If CDbl(Me.lblCresc07_M1.Text) < 0 Then
            Me.lblCresc07_M1.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc07_M1.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Private Sub CalcularCrescimento_Mes08()
        If CDbl(Me.txt_percCresc08.Text) = 0 Then
            Me.lblCresc08_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_08.Text) = 0 Then
            Me.lblCresc08_M1.Text = 0
        Else
            Me.lblCresc08_M1.Text = (((Me.txt_percCresc08.Text / Me.txt_percHist1_08.Text) * 100) - 100).ToString("n2")

            'Formatar
            If CDbl(Me.lblCresc08_M1.Text) < 0 Then
                Me.lblCresc08_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc08_M1.ForeColor = Drawing.Color.Blue
            End If
        End If

    End Sub

    Private Sub CalcularCrescimento_Mes09()
        If CDbl(Me.txt_percCresc09.Text) = 0 Then
            Me.lblCresc09_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_09.Text) = 0 Then
            Me.lblCresc09_M1.Text = 0
        Else
            Me.lblCresc09_M1.Text = (((Me.txt_percCresc09.Text / Me.txt_percHist1_09.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc09_M1.Text) < 0 Then
                Me.lblCresc09_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc09_M1.ForeColor = Drawing.Color.Blue
            End If
        End If


    End Sub

    Private Sub CalcularCrescimento_Mes10()
        If CDbl(Me.txt_percCresc10.Text) = 0 Then
            Me.lblCresc10_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_10.Text) = 0 Then
            Me.lblCresc10_M1.Text = 0
        Else
            Me.lblCresc10_M1.Text = (((Me.txt_percCresc10.Text / Me.txt_percHist1_10.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc10_M1.Text) < 0 Then
                Me.lblCresc10_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc10_M1.ForeColor = Drawing.Color.Blue
            End If
        End If


    End Sub

    Private Sub CalcularCrescimento_Mes11()
        If CDbl(Me.txt_percCresc11.Text) = 0 Then
            Me.lblCresc11_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_11.Text) = 0 Then
            Me.lblCresc11_M1.Text = 0
        Else
            Me.lblCresc11_M1.Text = (((Me.txt_percCresc11.Text / Me.txt_percHist1_11.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc11_M1.Text) < 0 Then
                Me.lblCresc11_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc11_M1.ForeColor = Drawing.Color.Blue
            End If
        End If


    End Sub

    Private Sub CalcularCrescimento_Mes12()
        If CDbl(Me.txt_percCresc12.Text) = 0 Then
            Me.lblCresc12_M1.Text = 0
        ElseIf CDbl(Me.txt_percHist1_12.Text) = 0 Then
            Me.lblCresc12_M1.Text = 0
        Else
            Me.lblCresc12_M1.Text = (((Me.txt_percCresc12.Text / Me.txt_percHist1_12.Text) * 100) - 100).ToString("n2")
            'Formatar
            If CDbl(Me.lblCresc12_M1.Text) < 0 Then
                Me.lblCresc12_M1.ForeColor = Drawing.Color.Red
            Else
                Me.lblCresc12_M1.ForeColor = Drawing.Color.Blue
            End If
        End If
    End Sub

    Sub mySESSION()
        Session("sPOSICAO") = Me.cboPosicao.CallPosicao    'Define a posição atual da Posição
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno
        'Session("VALUE1") = 7
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(380, User.Identity.Name)

            If Me.cboFilial.IsLoja = True Then
                Me.cboFilial.Visible_cboCorporacao = False
            Else
                Me.cboFilial.Visible_cboCorporacao = True
                Me.cboFilial.Visible = True
            End If

            'Call ArmazenaMetaInicial()
            varFilial = Me.cboFilial.CallFilial
            Call HabilitarSalvar()
            Call MudarLegenda()
            'Call ArmazenaMetaInicial()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento " & Me.cboAno.CallAno & " - Sell-Out por Seção - PGR380"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = False Then
                Me.cboFilial.CallCorporacao = 3
            End If
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

           

            Me.cboSecao.CallSecaoDesc = "01-Seca Pesada"

            Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)

            ' Fechamento Definitivo
            cboPosicao.CallPosicao = 1

            Call Atualizar()
            Call mySESSION()
            Me.gridHistorico.DataBind()

        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(Now()) + 1

            If Month(Date.Today) > 9 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If
            Me.cboSecao.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            Me.cboSecao.CallSecao = 1

        End If

    End Sub

#End Region



    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
        Call Atualizar()
    End Sub

    Sub HabilitarSalvar()
        On Error Resume Next
        oOrc.HabilitarSalvar(btnSalvar1, cboAno.CallAno, cboPosicao.CallPosicao, 5, User.Identity.Name)

    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call mySESSION()
        Atualizar()
    End Sub

    Protected Sub gridHistorico_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridHistorico.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridHistorico, "percMargemAA2", "vlrMargemAA2", "vlrVendaAA2", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridHistorico, "percMargemAA1", "vlrMargemAA1", "vlrVendaAA1", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridHistorico, "percMargem", "vlrMargem", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridHistorico, "percMeta", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub btnSalvar1_Click(sender As Object, e As EventArgs) Handles btnSalvar1.Click

        If Me.txt_vlrMetaTotal.Text = "" Then
            Beep()
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        Else
            Salvar("80", Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta01.Text, Me.txt_percCresc01.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta02.Text, Me.txt_percCresc02.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta03.Text, Me.txt_percCresc03.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta04.Text, Me.txt_percCresc04.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta05.Text, Me.txt_percCresc05.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta06.Text, Me.txt_percCresc06.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta07.Text, Me.txt_percCresc07.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta08.Text, Me.txt_percCresc08.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta09.Text, Me.txt_percCresc09.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta10.Text, Me.txt_percCresc10.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta11.Text, Me.txt_percCresc11.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta12.Text, Me.txt_percCresc12.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("80", Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMetaTotal.Text, Me.lblCrescAno.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)

            oVem.UserMsgBox(Me, "O Sell-Out dess Seção foi salvo com sucesso!!!")
            'Me.gridHistorico.DataBind()
        End If
    End Sub

   

End Class
