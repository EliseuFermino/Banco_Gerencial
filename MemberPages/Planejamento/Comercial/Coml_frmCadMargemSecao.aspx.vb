
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Planejamento_Margem_Coml_frmCadMargemSecao
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim no As Double
    Dim varDepto, varSecao As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double

    Dim oVem As New VendaEmpresaMes
    Dim oDW As New clData_DW_Condor
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

#Region " Preencher Historico 1 "

    Private Sub Preencher_Hist1_Mes01(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 1, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_01.Text = oVem.vlrRea
        Me.txt_percHist1_01.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes02(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 2, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_02.Text = oVem.vlrRea
        Me.txt_percHist1_02.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes03(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 3, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_03.Text = oVem.vlrRea
        Me.txt_percHist1_03.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes04(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 4, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_04.Text = oVem.vlrRea
        Me.txt_percHist1_04.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes05(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 5, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_05.Text = oVem.vlrRea
        Me.txt_percHist1_05.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes06(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 6, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_06.Text = oVem.vlrRea
        Me.txt_percHist1_06.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes07(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 7, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_07.Text = oVem.vlrRea
        Me.txt_percHist1_07.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes08(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 8, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_08.Text = oVem.vlrRea
        Me.txt_percHist1_08.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes09(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 9, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_09.Text = oVem.vlrRea
        Me.txt_percHist1_09.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes10(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 10, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_10.Text = oVem.vlrRea
        Me.txt_percHist1_10.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes11(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 11, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_11.Text = oVem.vlrRea
        Me.txt_percHist1_11.Text = oVem.percRea
    End Sub

    Private Sub Preencher_Hist1_Mes12(ByVal iFilial As String)
        oVem.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, 12, iFilial, Me.cboSecao.CallSecao, 2)
        Me.txt_vlrHist1_12.Text = oVem.vlrRea
        Me.txt_percHist1_12.Text = oVem.percRea
    End Sub

#End Region

#Region " Preencher Historico Meta 1 "

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
        Me.lblInfo.Text = oVem.varDesc
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

#End Region

    Sub BuscaVendaReal_Hist2(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, 1, iFilial, iSecao, 2)
        Me.txt_vlrHist2_01.Text = oVem.vlrRea
        Me.txt_percHist2_01.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 2, iFilial, iSecao, 2)
        Me.txt_vlrHist2_02.Text = oVem.vlrRea
        Me.txt_percHist2_02.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 3, iFilial, iSecao, 2)
        Me.txt_vlrHist2_03.Text = oVem.vlrRea
        Me.txt_percHist2_03.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 4, iFilial, iSecao, 2)
        Me.txt_vlrHist2_04.Text = oVem.vlrRea
        Me.txt_percHist2_04.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 5, iFilial, iSecao, 2)
        Me.txt_vlrHist2_05.Text = oVem.vlrRea
        Me.txt_percHist2_05.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 6, iFilial, iSecao, 2)
        Me.txt_vlrHist2_06.Text = oVem.vlrRea
        Me.txt_percHist2_06.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 7, iFilial, iSecao, 2)
        Me.txt_vlrHist2_07.Text = oVem.vlrRea
        Me.txt_percHist2_07.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 8, iFilial, iSecao, 2)
        Me.txt_vlrHist2_08.Text = oVem.vlrRea
        Me.txt_percHist2_08.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 9, iFilial, iSecao, 2)
        Me.txt_vlrHist2_09.Text = oVem.vlrRea
        Me.txt_percHist2_09.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 10, iFilial, iSecao, 2)
        Me.txt_vlrHist2_10.Text = oVem.vlrRea
        Me.txt_percHist2_10.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 11, iFilial, iSecao, 2)
        Me.txt_vlrHist2_11.Text = oVem.vlrRea
        Me.txt_percHist2_11.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 12, iFilial, iSecao, 2)
        Me.txt_vlrHist2_12.Text = oVem.vlrRea
        Me.txt_percHist2_12.Text = oVem.percRea

        Me.txt_vlrHist2_Total.Text = CDbl(CDbl(Me.txt_vlrHist2_01.Text) + CDbl(Me.txt_vlrHist2_02.Text) + CDbl(Me.txt_vlrHist2_03.Text) + _
                            CDbl(Me.txt_vlrHist2_04.Text) + CDbl(Me.txt_vlrHist2_05.Text) + CDbl(Me.txt_vlrHist2_06.Text) + _
                            CDbl(Me.txt_vlrHist2_07.Text) + CDbl(Me.txt_vlrHist2_08.Text) + CDbl(Me.txt_vlrHist2_09.Text) + _
                            CDbl(Me.txt_vlrHist2_10.Text) + CDbl(Me.txt_vlrHist2_11.Text) + CDbl(Me.txt_vlrHist2_12.Text)).ToString("n0")


        'oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao, iDepto)
        'Me.txt_vlrHist2_Total.Text = oVem.vlrRea

    End Sub

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, 1, iFilial, iSecao, 2)
        Me.txt_vlrHist3_01.Text = oVem.vlrRea
        Me.txt_percHist3_01.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 2, iFilial, iSecao, 2)
        Me.txt_vlrHist3_02.Text = oVem.vlrRea
        Me.txt_percHist3_02.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 3, iFilial, iSecao, 2)
        Me.txt_vlrHist3_03.Text = oVem.vlrRea
        Me.txt_percHist3_03.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 4, iFilial, iSecao, 2)
        Me.txt_vlrHist3_04.Text = oVem.vlrRea
        Me.txt_percHist3_04.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 5, iFilial, iSecao, 2)
        Me.txt_vlrHist3_05.Text = oVem.vlrRea
        Me.txt_percHist3_05.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 6, iFilial, iSecao, 2)
        Me.txt_vlrHist3_06.Text = oVem.vlrRea
        Me.txt_percHist3_06.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 7, iFilial, iSecao, 2)
        Me.txt_vlrHist3_07.Text = oVem.vlrRea
        Me.txt_percHist3_07.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 8, iFilial, iSecao, 2)
        Me.txt_vlrHist3_08.Text = oVem.vlrRea
        Me.txt_percHist3_08.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 9, iFilial, iSecao, 2)
        Me.txt_vlrHist3_09.Text = oVem.vlrRea
        Me.txt_percHist3_09.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 10, iFilial, iSecao, 2)
        Me.txt_vlrHist3_10.Text = oVem.vlrRea
        Me.txt_percHist3_10.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 11, iFilial, iSecao, 2)
        Me.txt_vlrHist3_11.Text = oVem.vlrRea
        Me.txt_percHist3_11.Text = oVem.percRea

        oVem.BuscaSecao_VendaMargem_Rea(iAno, 12, iFilial, iSecao, 2)
        Me.txt_vlrHist3_12.Text = oVem.vlrRea
        Me.txt_percHist3_12.Text = oVem.percRea

        Me.txt_vlrHist3_Total.Text = CDbl(CDbl(Me.txt_vlrHist3_01.Text) + CDbl(Me.txt_vlrHist3_02.Text) + CDbl(Me.txt_vlrHist3_03.Text) + _
                            CDbl(Me.txt_vlrHist3_04.Text) + CDbl(Me.txt_vlrHist3_05.Text) + CDbl(Me.txt_vlrHist3_06.Text) + _
                            CDbl(Me.txt_vlrHist3_07.Text) + CDbl(Me.txt_vlrHist3_08.Text) + CDbl(Me.txt_vlrHist3_09.Text) + _
                            CDbl(Me.txt_vlrHist3_10.Text) + CDbl(Me.txt_vlrHist3_11.Text) + CDbl(Me.txt_vlrHist3_12.Text)).ToString("n0")


        'oVem.BuscaSecao_VendaMargem_Rea_Ano(iAno, iFilial, iSecao, iDepto, iComprador)
        'Me.txt_vlrHist3_Total.Text = oVem.vlrRea
        'Me.lblError.Text = oVem.varDesc
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
        Me.lblError.Text = oVem.varDesc
    End Sub

    Sub Atualizar()

        Dim varFilial As String
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = 1   'Venda

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
        Call BuscaMeta(cboAno.CallAno, cboFilial.CallFilial, cboSecao.CallSecao, Me.cboPosicao.CallPosicao, 2)

        'oVem.BuscaMemo_Ori(Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.lblDepto.Text, Me.cboSecao.CallSecao)
        'Me.txtMemo.Text = oVem.varDesc

        'Calcular % de Crescimento
        Call CalcularM3()
        Call CalcularM2()
        Call CalcularM1()
        Call CalcularM1_Ano()

        Call CalcularCrescimento()

    End Sub

    Private Sub CalcularM3()
        On Error Resume Next
        If CInt(Me.txt_vlrHist2_01.Text) = 0 Then
            Me.lblCresc01_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_01.Text) = 0 Then
            Me.lblCresc01_M3.Text = 0
        Else
            Me.lblCresc01_M3.Text = ((CDbl(Me.txt_vlrHist2_01.Text) / CDbl(Me.txt_vlrHist3_01.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_02.Text) = 0 Then
            Me.lblCresc02_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_02.Text) = 0 Then
            Me.lblCresc02_M3.Text = 0
        Else
            Me.lblCresc02_M3.Text = ((CDbl(Me.txt_vlrHist2_02.Text) / CDbl(Me.txt_vlrHist3_02.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_03.Text) = 0 Then
            Me.lblCresc03_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_03.Text) = 0 Then
            Me.lblCresc03_M3.Text = 0
        Else
            Me.lblCresc03_M3.Text = ((CDbl(Me.txt_vlrHist2_03.Text) / CDbl(Me.txt_vlrHist3_03.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_04.Text) = 0 Then
            Me.lblCresc04_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_04.Text) = 0 Then
            Me.lblCresc04_M3.Text = 0
        Else
            Me.lblCresc04_M3.Text = ((CDbl(Me.txt_vlrHist2_04.Text) / CDbl(Me.txt_vlrHist3_04.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_05.Text) = 0 Then
            Me.lblCresc05_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_05.Text) = 0 Then
            Me.lblCresc05_M3.Text = 0
        Else
            Me.lblCresc05_M3.Text = ((CDbl(Me.txt_vlrHist2_05.Text) / CDbl(Me.txt_vlrHist3_05.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_06.Text) = 0 Then
            Me.lblCresc06_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_06.Text) = 0 Then
            Me.lblCresc06_M3.Text = 0
        Else
            Me.lblCresc06_M3.Text = ((CDbl(Me.txt_vlrHist2_06.Text) / CDbl(Me.txt_vlrHist3_06.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_07.Text) = 0 Then
            Me.lblCresc07_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_07.Text) = 0 Then
            Me.lblCresc07_M3.Text = 0
        Else
            Me.lblCresc07_M3.Text = ((CDbl(Me.txt_vlrHist2_07.Text) / CDbl(Me.txt_vlrHist3_07.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_08.Text) = 0 Then
            Me.lblCresc08_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_08.Text) = 0 Then
            Me.lblCresc08_M3.Text = 0
        Else
            Me.lblCresc08_M3.Text = ((CDbl(Me.txt_vlrHist2_08.Text) / CDbl(Me.txt_vlrHist3_08.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_09.Text) = 0 Then
            Me.lblCresc09_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_09.Text) = 0 Then
            Me.lblCresc09_M3.Text = 0
        Else
            Me.lblCresc09_M3.Text = ((CDbl(Me.txt_vlrHist2_09.Text) / CDbl(Me.txt_vlrHist3_09.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_10.Text) = 0 Then
            Me.lblCresc10_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_10.Text) = 0 Then
            Me.lblCresc10_M3.Text = 0
        Else
            Me.lblCresc10_M3.Text = ((CDbl(Me.txt_vlrHist2_10.Text) / CDbl(Me.txt_vlrHist3_10.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_11.Text) = 0 Then
            Me.lblCresc11_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_11.Text) = 0 Then
            Me.lblCresc11_M3.Text = 0
        Else
            Me.lblCresc11_M3.Text = ((CDbl(Me.txt_vlrHist2_11.Text) / CDbl(Me.txt_vlrHist3_11.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_12.Text) = 0 Then
            Me.lblCresc12_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_12.Text) = 0 Then
            Me.lblCresc12_M3.Text = 0
        Else
            Me.lblCresc12_M3.Text = ((CDbl(Me.txt_vlrHist2_12.Text) / CDbl(Me.txt_vlrHist3_12.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_10.Text) = 0 Then
            Me.lblCrescAno_M3.Text = 0
        ElseIf CInt(Me.txt_vlrHist3_10.Text) = 0 Then
            Me.lblCrescAno_M3.Text = 0
        Else
            Me.lblCrescAno_M3.Text = ((CDbl(Me.txt_vlrHist2_Total.Text) / CDbl(Me.txt_vlrHist3_Total.Text) * 100) - 100).ToString("n1")
        End If

        'Formatar Cor se Negativo
        If CInt(Me.lblCresc01_M3.Text) < 0 Then
            Me.lblCresc01_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc01_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc02_M3.Text) < 0 Then
            Me.lblCresc02_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc02_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc03_M3.Text) < 0 Then
            Me.lblCresc03_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc03_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc04_M3.Text) < 0 Then
            Me.lblCresc04_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc04_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc05_M3.Text) < 0 Then
            Me.lblCresc05_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc05_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc06_M3.Text) < 0 Then
            Me.lblCresc06_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc06_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc07_M3.Text) < 0 Then
            Me.lblCresc07_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc07_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc08_M3.Text) < 0 Then
            Me.lblCresc08_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc08_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc09_M3.Text) < 0 Then
            Me.lblCresc09_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc09_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc10_M3.Text) < 0 Then
            Me.lblCresc10_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc10_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc11_M3.Text) < 0 Then
            Me.lblCresc11_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc11_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc12_M3.Text) < 0 Then
            Me.lblCresc12_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc12_M3.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCrescAno_M3.Text) < 0 Then
            Me.lblCrescAno_M3.ForeColor = Drawing.Color.Red
        Else
            Me.lblCrescAno_M3.ForeColor = Drawing.Color.Black
        End If


    End Sub

    Private Sub CalcularM2()
        On Error Resume Next
        If CInt(Me.txt_vlrHist2_01.Text) = 0 Then
            Me.lblCresc01_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_01.Text) = 0 Then
            Me.lblCresc01_M2.Text = 0
        Else
            Me.lblCresc01_M2.Text = ((CDbl(Me.txt_vlrHist1_01.Text) / CDbl(Me.txt_vlrHist2_01.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_02.Text) = 0 Then
            Me.lblCresc02_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_02.Text) = 0 Then
            Me.lblCresc02_M2.Text = 0
        Else
            Me.lblCresc02_M2.Text = ((CDbl(Me.txt_vlrHist1_02.Text) / CDbl(Me.txt_vlrHist2_02.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_03.Text) = 0 Then
            Me.lblCresc03_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_03.Text) = 0 Then
            Me.lblCresc03_M2.Text = 0
        Else
            Me.lblCresc03_M2.Text = ((CDbl(Me.txt_vlrHist1_03.Text) / CDbl(Me.txt_vlrHist2_03.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_04.Text) = 0 Then
            Me.lblCresc04_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_04.Text) = 0 Then
            Me.lblCresc04_M2.Text = 0
        Else
            Me.lblCresc04_M2.Text = ((CDbl(Me.txt_vlrHist1_04.Text) / CDbl(Me.txt_vlrHist2_04.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_05.Text) = 0 Then
            Me.lblCresc05_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_05.Text) = 0 Then
            Me.lblCresc05_M2.Text = 0
        Else
            Me.lblCresc05_M2.Text = ((CDbl(Me.txt_vlrHist1_05.Text) / CDbl(Me.txt_vlrHist2_05.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_06.Text) = 0 Then
            Me.lblCresc06_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_06.Text) = 0 Then
            Me.lblCresc06_M2.Text = 0
        Else
            Me.lblCresc06_M2.Text = ((CDbl(Me.txt_vlrHist1_06.Text) / CDbl(Me.txt_vlrHist2_06.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_07.Text) = 0 Then
            Me.lblCresc07_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_07.Text) = 0 Then
            Me.lblCresc07_M2.Text = 0
        Else
            Me.lblCresc07_M2.Text = ((CDbl(Me.txt_vlrHist1_07.Text) / CDbl(Me.txt_vlrHist2_07.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_08.Text) = 0 Then
            Me.lblCresc08_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_08.Text) = 0 Then
            Me.lblCresc08_M2.Text = 0
        Else
            Me.lblCresc08_M2.Text = ((CDbl(Me.txt_vlrHist1_08.Text) / CDbl(Me.txt_vlrHist2_08.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_09.Text) = 0 Then
            Me.lblCresc09_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_09.Text) = 0 Then
            Me.lblCresc09_M2.Text = 0
        Else
            Me.lblCresc09_M2.Text = ((CDbl(Me.txt_vlrHist1_09.Text) / CDbl(Me.txt_vlrHist2_09.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_10.Text) = 0 Then
            Me.lblCresc10_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_10.Text) = 0 Then
            Me.lblCresc10_M2.Text = 0
        Else
            Me.lblCresc10_M2.Text = ((CDbl(Me.txt_vlrHist1_10.Text) / CDbl(Me.txt_vlrHist2_10.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_11.Text) = 0 Then
            Me.lblCresc11_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_11.Text) = 0 Then
            Me.lblCresc11_M2.Text = 0
        Else
            Me.lblCresc11_M2.Text = ((CDbl(Me.txt_vlrHist1_11.Text) / CDbl(Me.txt_vlrHist2_11.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_12.Text) = 0 Then
            Me.lblCresc12_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_12.Text) = 0 Then
            Me.lblCresc12_M2.Text = 0
        Else
            Me.lblCresc12_M2.Text = ((CDbl(Me.txt_vlrHist1_12.Text) / CDbl(Me.txt_vlrHist2_12.Text) * 100) - 100).ToString("n1")
        End If

        If CInt(Me.txt_vlrHist2_10.Text) = 0 Then
            Me.lblCrescAno_M2.Text = 0
        ElseIf CInt(Me.txt_vlrHist1_10.Text) = 0 Then
            Me.lblCrescAno_M2.Text = 0
        Else
            Me.lblCrescAno_M2.Text = ((CDbl(Me.txt_vlrHist1_Total.Text) / CDbl(Me.txt_vlrHist2_Total.Text) * 100) - 100).ToString("n1")
        End If

        'Formatar Cor se Negativo
        If CInt(Me.lblCresc01_M2.Text) < 0 Then
            Me.lblCresc01_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc01_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc02_M2.Text) < 0 Then
            Me.lblCresc02_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc02_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc03_M2.Text) < 0 Then
            Me.lblCresc03_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc03_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc04_M2.Text) < 0 Then
            Me.lblCresc04_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc04_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc05_M2.Text) < 0 Then
            Me.lblCresc05_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc05_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc06_M2.Text) < 0 Then
            Me.lblCresc06_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc06_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc07_M2.Text) < 0 Then
            Me.lblCresc07_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc07_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc08_M2.Text) < 0 Then
            Me.lblCresc08_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc08_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc09_M2.Text) < 0 Then
            Me.lblCresc09_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc09_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc10_M2.Text) < 0 Then
            Me.lblCresc10_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc10_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc11_M2.Text) < 0 Then
            Me.lblCresc11_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc11_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCresc12_M2.Text) < 0 Then
            Me.lblCresc12_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCresc12_M2.ForeColor = Drawing.Color.Black
        End If

        If CInt(Me.lblCrescAno_M2.Text) < 0 Then
            Me.lblCrescAno_M2.ForeColor = Drawing.Color.Red
        Else
            Me.lblCrescAno_M2.ForeColor = Drawing.Color.Black
        End If

    End Sub


    Private Sub CalcularCrescimentoDaMetaSobreHistorico(iLabelCresc As Label, iTextMeta As TextBox, iLabelHistorico As Label)
        If iTextMeta.Text = 0 Then
            iLabelCresc.Text = 0
        Else
            iLabelCresc.Text = ((CDbl(iTextMeta.Text) / CDbl(iLabelHistorico.Text) * 100) - 100).ToString("n2")
        End If
        'Calcula Total
        Me.lblCrescAno_M1.Text = ((CDbl(Me.txt_vlrMetaTotal.Text) / CDbl(Me.txt_vlrHist1_Total.Text) * 100) - 100).ToString("n2")

    End Sub

#Region " Muda Cor"

    Private Sub MudaCor(iTextBoxCresc As TextBox, iLabelCresc As Label)
        iTextBoxCresc.Text = (iTextBoxCresc.Text * 1).ToString("n2")    'Formata com duas casa decimais
        If CDbl(iTextBoxCresc.Text) < 0 Then
            iTextBoxCresc.ForeColor = Drawing.Color.Red
            iLabelCresc.ForeColor = Drawing.Color.Red
        Else
            iTextBoxCresc.ForeColor = Drawing.Color.Blue
            iLabelCresc.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Private Sub CalcularM1_MudaCor_Mes01()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc01_M1, Me.txt_vlrMeta01, Me.txt_vlrHist1_01)
        Call MudaCor(Me.txt_percCresc01, Me.lblCresc01_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes02()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc02_M1, Me.txt_vlrMeta02, Me.txt_vlrHist1_02)
        Call MudaCor(Me.txt_percCresc02, Me.lblCresc02_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes03()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc03_M1, Me.txt_vlrMeta03, Me.txt_vlrHist1_03)
        Call MudaCor(Me.txt_percCresc03, Me.lblCresc03_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes04()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc04_M1, Me.txt_vlrMeta04, Me.txt_vlrHist1_04)
        Call MudaCor(Me.txt_percCresc04, Me.lblCresc04_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes05()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc05_M1, Me.txt_vlrMeta05, Me.txt_vlrHist1_05)
        Call MudaCor(Me.txt_percCresc05, Me.lblCresc05_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes06()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc06_M1, Me.txt_vlrMeta06, Me.txt_vlrHist1_06)
        Call MudaCor(Me.txt_percCresc06, Me.lblCresc06_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes07()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc07_M1, Me.txt_vlrMeta07, Me.txt_vlrHist1_07)
        Call MudaCor(Me.txt_percCresc07, Me.lblCresc07_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes08()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc08_M1, Me.txt_vlrMeta08, Me.txt_vlrHist1_08)
        Call MudaCor(Me.txt_percCresc08, Me.lblCresc08_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes09()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc09_M1, Me.txt_vlrMeta09, Me.txt_vlrHist1_09)
        Call MudaCor(Me.txt_percCresc09, Me.lblCresc09_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes10()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc10_M1, Me.txt_vlrMeta10, Me.txt_vlrHist1_10)
        Call MudaCor(Me.txt_percCresc10, Me.lblCresc10_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes11()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc11_M1, Me.txt_vlrMeta11, Me.txt_vlrHist1_11)
        Call MudaCor(Me.txt_percCresc11, Me.lblCresc11_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes12()
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc12_M1, Me.txt_vlrMeta12, Me.txt_vlrHist1_12)
        Call MudaCor(Me.txt_percCresc12, Me.lblCresc12_M1)
    End Sub

#End Region

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
    'lblCrescAno_M1
    Private Sub CalcularM1_Ano()
        If CInt(Me.txt_vlrMetaTotal.Text) = 0 Then
            Me.lblCrescAno.Text = 0
        ElseIf CInt(Me.txt_vlrVenda_Total.Text) = 0 Then
            Me.lblCrescAno.Text = 0
        Else
            Me.lblCrescAno.Text = (CDbl(Me.txt_vlrMetaTotal.Text) / CDbl(Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")

        End If

        'Formatar Cor se Negativo
        If CInt(Me.lblCrescAno.Text) < 0 Then
            Me.lblCrescAno.ForeColor = Drawing.Color.Red
            Me.lblCrescAno_M1.ForeColor = Drawing.Color.Red
        Else
            Me.lblCrescAno.ForeColor = Drawing.Color.Black
            Me.lblCrescAno_M1.ForeColor = Drawing.Color.Black
        End If

    End Sub

#Region " Totalizações"


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


#End Region

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

        Me.txtMemo.Text = ""
        Me.lblCrescAno_M1.Text = 0
        Me.txt_percPart_Ano.Text = 0
    End Sub

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        Call Totalizar_MetaVenda()  'Calcula o total da meta de venda de todas as seções
        Me.txt_vlrMeta02.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_Mes01()
        Me.txt_percCresc01.Text = (CDbl(Me.txt_vlrMeta01.Text) / CDbl(Me.txt_vlrVenda_01.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta03.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_Mes02()
        Me.txt_percCresc02.Text = (CDbl(Me.txt_vlrMeta02.Text) / CDbl(Me.txt_vlrVenda_02.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta04.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes03()
        Me.txt_percCresc03.Text = (CDbl(Me.txt_vlrMeta03.Text) / CDbl(Me.txt_vlrVenda_03.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta05.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes04()
        Me.txt_percCresc04.Text = (CDbl(Me.txt_vlrMeta04.Text) / CDbl(Me.txt_vlrVenda_04.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta06.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes05()
        Me.txt_percCresc05.Text = (CDbl(Me.txt_vlrMeta05.Text) / CDbl(Me.txt_vlrVenda_05.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta07.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes06()
        Me.txt_percCresc06.Text = (CDbl(Me.txt_vlrMeta06.Text) / CDbl(Me.txt_vlrVenda_06.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta08.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes07()
        Me.txt_percCresc07.Text = (CDbl(Me.txt_vlrMeta07.Text) / CDbl(Me.txt_vlrVenda_07.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta09.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes08()
        Me.txt_percCresc08.Text = (CDbl(Me.txt_vlrMeta08.Text) / CDbl(Me.txt_vlrVenda_08.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta10.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes09()
        Me.txt_percCresc09.Text = (CDbl(Me.txt_vlrMeta09.Text) / CDbl(Me.txt_vlrVenda_09.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta11.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes10()
        Me.txt_percCresc10.Text = (CDbl(Me.txt_vlrMeta10.Text) / CDbl(Me.txt_vlrVenda_10.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta12.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes11()
        Me.txt_percCresc11.Text = (CDbl(Me.txt_vlrMeta11.Text) / CDbl(Me.txt_vlrVenda_11.Text) * 100).ToString("n2")
    End Sub

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged

        Call Totalizar_MetaVenda()
        Me.txt_vlrMeta01.Focus()
        Call Totalizar_Meta()

        Call CalcularM1_Mes12()
        Me.txt_percCresc12.Text = (CDbl(Me.txt_vlrMeta12.Text) / CDbl(Me.txt_vlrVenda_12.Text) * 100).ToString("n2")

    End Sub

    Public Function Salvar(ByVal idTipoSecao As String, ByVal Ano As String, _
                           ByVal Mes As String, ByVal idFilial As String, ByVal idSecao As String, ByVal vlr As Double, _
                           ByVal percCresc As Double, ByVal iPosicao As Byte, iUsuario As String) As Boolean

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

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
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

    Sub HabilitarSalvar()
        oOrc.HabilitarSalvar(btnSalvar1, cboAno.CallAno, cboPosicao.CallPosicao, 5, User.Identity.Name)

    End Sub

    Sub MudarLegenda()
        Me.txt_Titulo_Hist3.Text = " Hist. " & Me.cboAno.CallAno.ToString - 3 & " "
        Me.txt_Titulo_Hist2.Text = " Hist. " & Me.cboAno.CallAno.ToString - 2 & " "
        Me.txt_Titulo_Hist1.Text = " Hist. " & Me.cboAno.CallAno.ToString - 1 & " "

        Me.lblCrescLegenda_M1.Text = "%"
        Me.lblCrescLegenda_M2.Text = Right(Me.cboAno.CallAno - 1, 2) & "/" & Right(Me.cboAno.CallAno - 2, 2)
        Me.lblCrescLegenda_M3.Text = Right(Me.cboAno.CallAno - 2, 2) & "/" & Right(Me.cboAno.CallAno - 3, 2)
        Me.lblCrescLegenda_M4.Text = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
    End Sub

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        Me.txt_vlrMeta01.Text = ((Me.txt_percCresc01.Text * Me.txt_vlrVenda_01.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()  'Totaliza o Total do Ano de Todas as Seções.
        Me.txt_percCresc02.Focus()
        Call Totalizar_Meta()       'Totaliza o Total do Ano da Seção selecionada.
        Call CalcularM1_MudaCor_Mes01()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        Me.txt_vlrMeta02.Text = ((Me.txt_percCresc02.Text * Me.txt_vlrVenda_02.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc03.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes02()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        Me.txt_vlrMeta03.Text = ((Me.txt_percCresc03.Text * Me.txt_vlrVenda_03.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc04.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes03()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        Me.txt_vlrMeta04.Text = ((Me.txt_percCresc04.Text * Me.txt_vlrVenda_04.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc05.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes04()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        Me.txt_vlrMeta05.Text = ((Me.txt_percCresc05.Text * Me.txt_vlrVenda_05.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc06.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes05()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        Me.txt_vlrMeta06.Text = ((Me.txt_percCresc06.Text * Me.txt_vlrVenda_06.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc07.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes06()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        Me.txt_vlrMeta07.Text = ((Me.txt_percCresc07.Text * Me.txt_vlrVenda_07.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc08.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes07()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged

        Me.txt_vlrMeta08.Text = ((Me.txt_percCresc08.Text * Me.txt_vlrVenda_08.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc09.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes08()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        Me.txt_vlrMeta09.Text = ((Me.txt_percCresc09.Text * Me.txt_vlrVenda_09.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc10.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes09()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        Me.txt_vlrMeta10.Text = ((Me.txt_percCresc10.Text * Me.txt_vlrVenda_10.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc11.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes10()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        Me.txt_vlrMeta11.Text = ((Me.txt_percCresc11.Text * Me.txt_vlrVenda_11.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc12.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes11()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        Me.txt_vlrMeta12.Text = ((Me.txt_percCresc12.Text * Me.txt_vlrVenda_12.Text) / 100).ToString("n0")
        Call Totalizar_MetaVenda()
        Me.txt_percCresc01.Focus()
        Call Totalizar_Meta()
        Call CalcularM1_MudaCor_Mes12()
        Call CalcularM1_Ano()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call HabilitarSalvar()
        Call MudarLegenda()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
        Call Atualizar()
        Call CalcularCrescimento()
    End Sub

    Private Sub CalcularCrescimento()
        On Error Resume Next

        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc01_M1, Me.txt_vlrMeta01, Me.txt_vlrHist1_01)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc02_M1, Me.txt_vlrMeta02, Me.txt_vlrHist1_02)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc03_M1, Me.txt_vlrMeta03, Me.txt_vlrHist1_03)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc04_M1, Me.txt_vlrMeta04, Me.txt_vlrHist1_04)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc05_M1, Me.txt_vlrMeta05, Me.txt_vlrHist1_05)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc06_M1, Me.txt_vlrMeta06, Me.txt_vlrHist1_06)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc07_M1, Me.txt_vlrMeta07, Me.txt_vlrHist1_07)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc08_M1, Me.txt_vlrMeta08, Me.txt_vlrHist1_08)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc09_M1, Me.txt_vlrMeta09, Me.txt_vlrHist1_09)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc10_M1, Me.txt_vlrMeta10, Me.txt_vlrHist1_10)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc11_M1, Me.txt_vlrMeta11, Me.txt_vlrHist1_11)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCresc12_M1, Me.txt_vlrMeta12, Me.txt_vlrHist1_12)
        Call CalcularCrescimentoDaMetaSobreHistorico(Me.lblCrescAno_M1, txt_vlrMetaTotal, Me.txt_vlrHist1_Total)

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(49, User.Identity.Name)

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True

            Me.cboAno.AnoInicial = Year(Now())
            Me.cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Me.cboMes.CallMes = 1
            Me.cboFilial.CallFilial = 3
            Me.cboPosicao.CallPosicao = 4


            Call Atualizar()
            Call CalcularCrescimento()
            Call HabilitarSalvar()
            Call MudarLegenda()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
            Call Atualizar()
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento " & Me.cboAno.CallAno & " - Margem por Seção Comercial"

        End If

    End Sub

    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Session("sVendaAnoAtual") = oDW.BuscarVendaSecao_AnoAtual(Me.cboFilial.CallFilial, Me.cboSecao.CallSecao)
        Session("sComprador") = Me.cboSecao.CallComprador
      

        Call Atualizar()
    End Sub

    Protected Sub btnSalvar1_Click(sender As Object, e As EventArgs) Handles btnSalvar1.Click
        If Me.txt_vlrMetaTotal.Text = "" Then
            Beep()
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        Else
            Salvar("2", Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta01.Text, Me.txt_percCresc01.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta02.Text, Me.txt_percCresc02.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta03.Text, Me.txt_percCresc03.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta04.Text, Me.txt_percCresc04.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta05.Text, Me.txt_percCresc05.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta06.Text, Me.txt_percCresc06.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta07.Text, Me.txt_percCresc07.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta08.Text, Me.txt_percCresc08.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta09.Text, Me.txt_percCresc09.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta10.Text, Me.txt_percCresc10.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta11.Text, Me.txt_percCresc11.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMeta12.Text, Me.txt_percCresc12.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)
            Salvar("2", Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboSecao.CallSecao, Me.txt_vlrMetaTotal.Text, Me.lblCrescAno.Text, Me.cboPosicao.CallPosicao, User.Identity.Name)

            oVem.UserMsgBox(Me, "As Margens foram salvas com sucesso!!!")
        End If
    End Sub
End Class
