
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_Coml_frmCadVendaSecao
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim no As Double
    Dim varDepto, varSecao As String
    Dim varVlrMeta01, varVlrMeta02, varVlrMeta03, varVlrMeta04, varVlrMeta05, varVlrMeta06 As Double
    Dim varVlrMeta07, varVlrMeta08, varVlrMeta09, varVlrMeta10, varVlrMeta11, varVlrMeta12 As Double

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oOrc As New Orcamento

    Sub BuscaMetaVenda(ByVal iMes As String)
        'oVem.BuscaOri_Comprador_VendaTotal_Mes(Me.cboAno.CallAno, iMes, Me.cboFilial.CallFilial, cboComprador.CallComprador)
        'Select Case iMes
        '    Case 1
        '        Me.txt_vlrVenda_01.Text = oVem.vlrOri
        '    Case 2
        '        Me.txt_vlrVenda_02.Text = oVem.vlrOri
        '    Case 3
        '        Me.txt_vlrVenda_03.Text = oVem.vlrOri
        '    Case 4
        '        Me.txt_vlrVenda_04.Text = oVem.vlrOri
        '    Case 5
        '        Me.txt_vlrVenda_05.Text = oVem.vlrOri
        '    Case 6
        '        Me.txt_vlrVenda_06.Text = oVem.vlrOri
        '    Case 7
        '        Me.txt_vlrVenda_07.Text = oVem.vlrOri
        '    Case 8
        '        Me.txt_vlrVenda_08.Text = oVem.vlrOri
        '    Case 9
        '        Me.txt_vlrVenda_09.Text = oVem.vlrOri
        '    Case 10
        '        Me.txt_vlrVenda_10.Text = oVem.vlrOri
        '    Case 11
        '        Me.txt_vlrVenda_11.Text = oVem.vlrOri
        '    Case 12
        '        Me.txt_vlrVenda_12.Text = oVem.vlrOri
        'End Select
        'Call Totalizar_MetaVenda()
    End Sub

    Sub BuscaVendaReal_Ano(ByVal iFilial As String)
        'Ano M3
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 3, iFilial)
        If CDbl(Me.txt_vlrHist3_Total.Text) = 0 Then
            Me.txt_percHist3_Total.Text = 1
        Else
            Me.txt_percHist3_Total.Text = (CDbl(Me.txt_vlrHist3_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M2
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 2, iFilial)
        If CDbl(Me.txt_vlrHist2_Total.Text) = 0 Then
            Me.txt_percHist2_Total.Text = 0
        Else
            Me.txt_percHist2_Total.Text = (CDbl(Me.txt_vlrHist2_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

        'Ano M1 - Aqui tem que buscar a VENDA ANUAL PROJETADA, ou seja, de Janeiro a Setembro real, Outubro a Dezembro meta.
        oVem.BuscaGrupo_ReaAno(1, Me.cboAno.CallAno - 1, iFilial)
        Me.lblError.Text = oVem.vlrOri
        If CDbl(Me.txt_vlrHist1_Total.Text) = 0 Then
            Me.txt_percHist1_Total.Text = 0
        Else
            Me.txt_percHist1_Total.Text = (CDbl(Me.txt_vlrHist1_Total.Text) / oVem.vlrOri * 100).ToString("n2")
        End If

    End Sub

    Sub BuscaVendaReal_Hist1(ByVal iFilial As String, ByVal iStatus As String)
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = iStatus   'Venda
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
            Call Preencher_Hist1_Mes01(iFilial, varStatus)

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
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)

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
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)

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
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)

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
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes06(iFilial)
            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 7 Then    'Julho
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes07(iFilial)
            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 8 Then    'Agosto
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)
            Call Preencher_Hist1_Mes07(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes08(iFilial)
            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 9 Then    'Setembro
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)
            Call Preencher_Hist1_Mes07(iFilial, varStatus)
            Call Preencher_Hist1_Mes08(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes09(iFilial)
            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 10 Then    'Outubro
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)
            Call Preencher_Hist1_Mes07(iFilial, varStatus)
            Call Preencher_Hist1_Mes08(iFilial, varStatus)
            Call Preencher_Hist1_Mes09(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes10(iFilial)
            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 11 Then    'Novembro
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)
            Call Preencher_Hist1_Mes07(iFilial, varStatus)
            Call Preencher_Hist1_Mes08(iFilial, varStatus)
            Call Preencher_Hist1_Mes09(iFilial, varStatus)
            Call Preencher_Hist1_Mes10(iFilial, varStatus)

            Call Preencher_Hist1_Meta_Mes11(iFilial)
            Call Preencher_Hist1_Meta_Mes12(iFilial)
        End If

        If Month(Now()) = 12 Then    'Dezembro
            Call Preencher_Hist1_Mes01(iFilial, varStatus)
            Call Preencher_Hist1_Mes02(iFilial, varStatus)
            Call Preencher_Hist1_Mes03(iFilial, varStatus)
            Call Preencher_Hist1_Mes04(iFilial, varStatus)
            Call Preencher_Hist1_Mes05(iFilial, varStatus)
            Call Preencher_Hist1_Mes06(iFilial, varStatus)
            Call Preencher_Hist1_Mes07(iFilial, varStatus)
            Call Preencher_Hist1_Mes08(iFilial, varStatus)
            Call Preencher_Hist1_Mes09(iFilial, varStatus)
            Call Preencher_Hist1_Mes10(iFilial, varStatus)
            Call Preencher_Hist1_Mes11(iFilial, varStatus)

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

    Private Sub fnPreencher_Historico(ByVal iAno As Int16, ByVal iFilial As Byte, ByVal iMes As Byte, ByVal iStatus As String, iValor As Label, iPerc As Label)
        oVem.BuscaSecao_VendaMargem_Rea(iAno, iMes, iFilial, Me.cboComprador.CallSecao, iStatus)
        iValor.Text = oVem.vlrRea
        iPerc.Text = oVem.percRea
    End Sub

    Private Sub fnTotalizar(ByVal iTextTotal As Label, ByVal iText_01 As Label, ByVal iText_02 As Label, ByVal iText_03 As Label, ByVal iText_04 As Label, ByVal iText_05 As Label, ByVal iText_06 As Label,
                            ByVal iText_07 As Label, ByVal iText_08 As Label, ByVal iText_09 As Label, ByVal iText_10 As Label, ByVal iText_11 As Label, ByVal iText_12 As Label)
        iTextTotal.Text = CDbl(CDbl(iText_01.Text) + CDbl(iText_02.Text) + CDbl(iText_03.Text) + CDbl(iText_04.Text) + CDbl(iText_05.Text) + CDbl(iText_06.Text) +
                    CDbl(iText_07.Text) + CDbl(iText_08.Text) + CDbl(iText_09.Text) + CDbl(iText_10.Text) + CDbl(iText_11.Text) + CDbl(iText_12.Text)).ToString("n0")
    End Sub

#Region " Preencher Historico 1"

    Private Sub Preencher_Hist1_Mes01(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(Me.cboAno.CallAno - 1, iFilial, 1, iStatus, txt_vlrHist1_01, txt_percHist1_01)
    End Sub

    Private Sub Preencher_Hist1_Mes02(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 2, iStatus, txt_vlrHist1_02, txt_percHist1_02)
    End Sub

    Private Sub Preencher_Hist1_Mes03(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 3, iStatus, txt_vlrHist1_03, txt_percHist1_03)
    End Sub

    Private Sub Preencher_Hist1_Mes04(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 4, iStatus, txt_vlrHist1_04, txt_percHist1_04)
    End Sub

    Private Sub Preencher_Hist1_Mes05(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 5, iStatus, txt_vlrHist1_05, txt_percHist1_05)
    End Sub

    Private Sub Preencher_Hist1_Mes06(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 6, iStatus, txt_vlrHist1_06, txt_percHist1_06)
    End Sub

    Private Sub Preencher_Hist1_Mes07(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 7, iStatus, txt_vlrHist1_07, txt_percHist1_07)
    End Sub

    Private Sub Preencher_Hist1_Mes08(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 8, iStatus, txt_vlrHist1_08, txt_percHist1_08)
    End Sub

    Private Sub Preencher_Hist1_Mes09(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 9, iStatus, txt_vlrHist1_09, txt_percHist1_09)
    End Sub

    Private Sub Preencher_Hist1_Mes10(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 10, iStatus, txt_vlrHist1_10, txt_percHist1_10)
    End Sub

    Private Sub Preencher_Hist1_Mes11(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 11, iStatus, txt_vlrHist1_11, txt_percHist1_11)
    End Sub

    Private Sub Preencher_Hist1_Mes12(ByVal iFilial As String, ByVal iStatus As String)
        fnPreencher_Historico(cboAno.CallAno - 1, iFilial, 12, iStatus, txt_vlrHist1_12, txt_percHist1_12)
    End Sub

#End Region

#Region " Preencher Meta"

    Private Sub fnPreencher_Hist1_Meta(ByVal iFilial As String, iMes As Byte, iValor As Label, iPerc As Label)
        oVem.BuscaRevSecaoMes(1, Me.cboComprador.CallSecao, Me.cboAno.CallAno - 1, iMes, iFilial)
        iValor.Text = oVem.vlrRev
        iPerc.Text = oVem.percRev
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes01(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 1, txt_vlrHist1_01, txt_percHist1_01)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes02(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 2, txt_vlrHist1_02, txt_percHist1_02)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes03(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 3, txt_vlrHist1_03, txt_percHist1_03)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes04(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 4, txt_vlrHist1_04, txt_percHist1_04)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes05(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 5, txt_vlrHist1_05, txt_percHist1_05)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes06(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 6, txt_vlrHist1_06, txt_percHist1_06)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes07(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 7, txt_vlrHist1_07, txt_percHist1_07)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes08(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 8, txt_vlrHist1_08, txt_percHist1_08)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes09(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 9, txt_vlrHist1_09, txt_percHist1_09)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes10(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 10, txt_vlrHist1_10, txt_percHist1_10)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes11(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 11, txt_vlrHist1_11, txt_percHist1_11)
    End Sub

    Private Sub Preencher_Hist1_Meta_Mes12(ByVal iFilial As String)
        fnPreencher_Hist1_Meta(iFilial, 12, txt_vlrHist1_12, txt_percHist1_12)
    End Sub

#End Region

#Region " Preencher Historico 2"

    Sub BuscaVendaReal_Hist2(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iDepto As String, ByVal iComprador As String, ByVal iStatus As String)

        fnPreencher_Historico(iAno, iFilial, 1, iStatus, txt_vlrHist2_01, txt_percHist2_01)
        fnPreencher_Historico(iAno, iFilial, 2, iStatus, txt_vlrHist2_02, txt_percHist2_02)
        fnPreencher_Historico(iAno, iFilial, 3, iStatus, txt_vlrHist2_03, txt_percHist2_03)
        fnPreencher_Historico(iAno, iFilial, 4, iStatus, txt_vlrHist2_04, txt_percHist2_04)
        fnPreencher_Historico(iAno, iFilial, 5, iStatus, txt_vlrHist2_05, txt_percHist2_05)
        fnPreencher_Historico(iAno, iFilial, 6, iStatus, txt_vlrHist2_06, txt_percHist2_06)
        fnPreencher_Historico(iAno, iFilial, 7, iStatus, txt_vlrHist2_07, txt_percHist2_07)
        fnPreencher_Historico(iAno, iFilial, 8, iStatus, txt_vlrHist2_08, txt_percHist2_08)
        fnPreencher_Historico(iAno, iFilial, 9, iStatus, txt_vlrHist2_09, txt_percHist2_09)
        fnPreencher_Historico(iAno, iFilial, 10, iStatus, txt_vlrHist2_10, txt_percHist2_10)
        fnPreencher_Historico(iAno, iFilial, 11, iStatus, txt_vlrHist2_11, txt_percHist2_11)
        fnPreencher_Historico(iAno, iFilial, 12, iStatus, txt_vlrHist2_12, txt_percHist2_12)

        fnTotalizar(txt_vlrHist2_Total, txt_vlrHist2_01, txt_vlrHist2_02, txt_vlrHist2_03, txt_vlrHist2_04, txt_vlrHist2_05, txt_vlrHist2_06,
                    txt_vlrHist2_07, txt_vlrHist2_08, txt_vlrHist2_09, txt_vlrHist2_10, txt_vlrHist2_11, txt_vlrHist2_12)

    End Sub

#End Region

#Region " Preencher Historico 3"

    Sub BuscaVendaReal_Hist3(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iDepto As String, ByVal iComprador As String, ByVal iStatus As String)

        fnPreencher_Historico(iAno, iFilial, 1, iStatus, txt_vlrHist3_01, txt_percHist3_01)
        fnPreencher_Historico(iAno, iFilial, 2, iStatus, txt_vlrHist3_02, txt_percHist3_02)
        fnPreencher_Historico(iAno, iFilial, 3, iStatus, txt_vlrHist3_03, txt_percHist3_03)
        fnPreencher_Historico(iAno, iFilial, 4, iStatus, txt_vlrHist3_04, txt_percHist3_04)
        fnPreencher_Historico(iAno, iFilial, 5, iStatus, txt_vlrHist3_05, txt_percHist3_05)
        fnPreencher_Historico(iAno, iFilial, 6, iStatus, txt_vlrHist3_06, txt_percHist3_06)
        fnPreencher_Historico(iAno, iFilial, 7, iStatus, txt_vlrHist3_07, txt_percHist3_07)
        fnPreencher_Historico(iAno, iFilial, 8, iStatus, txt_vlrHist3_08, txt_percHist3_08)
        fnPreencher_Historico(iAno, iFilial, 9, iStatus, txt_vlrHist3_09, txt_percHist3_09)
        fnPreencher_Historico(iAno, iFilial, 10, iStatus, txt_vlrHist3_10, txt_percHist3_10)
        fnPreencher_Historico(iAno, iFilial, 11, iStatus, txt_vlrHist3_11, txt_percHist3_11)
        fnPreencher_Historico(iAno, iFilial, 12, iStatus, txt_vlrHist3_12, txt_percHist3_12)

        fnTotalizar(txt_vlrHist3_Total, txt_vlrHist3_01, txt_vlrHist3_02, txt_vlrHist3_03, txt_vlrHist3_04, txt_vlrHist3_05, txt_vlrHist3_06,
                    txt_vlrHist3_07, txt_vlrHist3_08, txt_vlrHist3_09, txt_vlrHist3_10, txt_vlrHist3_11, txt_vlrHist3_12)

    End Sub

#End Region

#Region " Buscar Meta"

    Private Sub fnBuscaMeta(ByVal iAno As String, iMes As Byte, ByVal iFilial As String, ByVal iSecao As String, _
                  ByVal iPosicao As String, ByVal iTipoSecao As String, iValor As TextBox, iPerc As Label)
        oVem.BuscaOri_Comprador_VendaSecao_Mes(iAno, iMes, iFilial, iSecao, iPosicao, iTipoSecao, Me.cboComprador.CallComprador)
        iValor.Text = oVem.vlrOri
        iPerc.Text = oVem.percOri
    End Sub

    Sub BuscaMeta(ByVal iAno As String, ByVal iFilial As String, ByVal iSecao As String, ByVal iPosicao As String, ByVal iTipoSecao As String)

        fnBuscaMeta(iAno, 1, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta01, txt_percMeta01)
        fnBuscaMeta(iAno, 2, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta02, txt_percMeta02)
        fnBuscaMeta(iAno, 3, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta03, txt_percMeta03)
        fnBuscaMeta(iAno, 4, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta04, txt_percMeta04)
        fnBuscaMeta(iAno, 5, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta05, txt_percMeta05)
        fnBuscaMeta(iAno, 6, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta06, txt_percMeta06)
        fnBuscaMeta(iAno, 7, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta07, txt_percMeta07)
        fnBuscaMeta(iAno, 8, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta08, txt_percMeta08)
        fnBuscaMeta(iAno, 9, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta09, txt_percMeta09)
        fnBuscaMeta(iAno, 10, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta10, txt_percMeta10)
        fnBuscaMeta(iAno, 11, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta11, txt_percMeta11)
        fnBuscaMeta(iAno, 12, iFilial, iSecao, iPosicao, iTipoSecao, txt_vlrMeta12, txt_percMeta12)
        Call Totalizar_Meta()
    End Sub

#End Region

    Sub Atualizar()
        Dim varFilial As String
        Dim varStatus As String '1-Venda, 2-Margem, 3-Venda e Margem
        varStatus = 1   'Venda

        Call ZerarCampos()

        varFilial = oOrc.DefinirFilial(Me.cboFilial.CallFilial)

        Call BuscaVendaReal_Hist1(varFilial, varStatus)
        Call BuscaVendaReal_Hist2(Me.cboAno.CallAno - 2, varFilial, Me.cboComprador.CallSecao, Me.lblDepto.Text, Me.cboComprador.CallComprador, varStatus)
        Call BuscaVendaReal_Hist3(Me.cboAno.CallAno - 3, varFilial, Me.cboComprador.CallSecao, Me.lblDepto.Text, Me.cboComprador.CallComprador, varStatus)
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
        Call BuscaMeta(cboAno.CallAno, Me.cboFilial.CallFilial, cboComprador.CallSecao, 1, 1)

        'Calcular % de Crescimento
        Call CalcularM3()
        Call CalcularM2()
        Call CalcularM1()
        Call CalcularM1_Ano()

        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.gridAnalise.DataBind()

    End Sub

    Private Sub fnCalcular(ByVal iValor1 As Label, ByVal iValor2 As Label, ByVal iCresc As Label)
        On Error Resume Next
        If CInt(iValor1.Text) = 0 Then
            iCresc.Text = 0
        ElseIf CInt(iValor2.Text) = 0 Then
            iCresc.Text = 0
        Else
            iCresc.Text = oFun.Calculate(iValor1.Text, iValor2.Text, Funcoes.CalculateType.Growth).ToString("n1")
        End If
    End Sub

#Region " Calcular M3"

    Private Sub CalcularM3()

        fnCalcular(txt_vlrHist2_01, txt_vlrHist3_01, lblCresc01_M3)
        fnCalcular(txt_vlrHist2_02, txt_vlrHist3_02, lblCresc02_M3)
        fnCalcular(txt_vlrHist2_03, txt_vlrHist3_03, lblCresc03_M3)
        fnCalcular(txt_vlrHist2_04, txt_vlrHist3_04, lblCresc04_M3)
        fnCalcular(txt_vlrHist2_05, txt_vlrHist3_05, lblCresc05_M3)
        fnCalcular(txt_vlrHist2_06, txt_vlrHist3_06, lblCresc06_M3)
        fnCalcular(txt_vlrHist2_07, txt_vlrHist3_07, lblCresc07_M3)
        fnCalcular(txt_vlrHist2_08, txt_vlrHist3_08, lblCresc08_M3)
        fnCalcular(txt_vlrHist2_09, txt_vlrHist3_09, lblCresc09_M3)
        fnCalcular(txt_vlrHist2_10, txt_vlrHist3_10, lblCresc10_M3)
        fnCalcular(txt_vlrHist2_11, txt_vlrHist3_11, lblCresc11_M3)
        fnCalcular(txt_vlrHist2_12, txt_vlrHist3_12, lblCresc12_M3)
        fnCalcular(txt_vlrHist2_Total, txt_vlrHist3_Total, lblCrescAno_M3)

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

#End Region

#Region " Calcular M2"

    Private Sub CalcularM2()

        fnCalcular(txt_vlrHist1_01, txt_vlrHist2_01, lblCresc01_M2)
        fnCalcular(txt_vlrHist1_02, txt_vlrHist2_02, lblCresc02_M2)
        fnCalcular(txt_vlrHist1_03, txt_vlrHist2_03, lblCresc03_M2)
        fnCalcular(txt_vlrHist1_04, txt_vlrHist2_04, lblCresc04_M2)
        fnCalcular(txt_vlrHist1_05, txt_vlrHist2_05, lblCresc05_M2)
        fnCalcular(txt_vlrHist1_06, txt_vlrHist2_06, lblCresc06_M2)
        fnCalcular(txt_vlrHist1_07, txt_vlrHist2_07, lblCresc07_M2)
        fnCalcular(txt_vlrHist1_08, txt_vlrHist2_08, lblCresc08_M2)
        fnCalcular(txt_vlrHist1_09, txt_vlrHist2_09, lblCresc09_M2)
        fnCalcular(txt_vlrHist1_10, txt_vlrHist2_10, lblCresc10_M2)
        fnCalcular(txt_vlrHist1_11, txt_vlrHist2_11, lblCresc11_M2)
        fnCalcular(txt_vlrHist1_12, txt_vlrHist2_12, lblCresc12_M2)
        fnCalcular(txt_vlrHist1_Total, txt_vlrHist2_Total, lblCrescAno_M2)

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

#End Region

#Region " CalcularM1_MudaCor"

    Private Sub fnCalcularM1_MudaCor(ByVal iPercCresc As TextBox, ByVal iCresc As Label)
        iPercCresc.Text = (iPercCresc.Text * 1).ToString("n2")    'Formata com duas casa decimais
        If CDbl(iPercCresc.Text) < 0 Then
            iPercCresc.ForeColor = Drawing.Color.Red
            iCresc.ForeColor = Drawing.Color.Red
        Else
            iPercCresc.ForeColor = Drawing.Color.Blue
            iCresc.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Private Sub CalcularM1_MudaCor_Mes01()
        fnCalcularM1_MudaCor(txt_percCresc01, lblCresc01_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes02()
        fnCalcularM1_MudaCor(txt_percCresc02, lblCresc02_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes03()
        fnCalcularM1_MudaCor(txt_percCresc03, lblCresc03_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes04()
        fnCalcularM1_MudaCor(txt_percCresc04, lblCresc04_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes05()
        fnCalcularM1_MudaCor(txt_percCresc05, lblCresc05_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes06()
        fnCalcularM1_MudaCor(txt_percCresc06, lblCresc06_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes07()
        fnCalcularM1_MudaCor(txt_percCresc07, lblCresc07_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes08()
        fnCalcularM1_MudaCor(txt_percCresc08, lblCresc08_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes09()
        fnCalcularM1_MudaCor(txt_percCresc09, lblCresc09_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes10()
        fnCalcularM1_MudaCor(txt_percCresc10, lblCresc10_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes11()
        fnCalcularM1_MudaCor(txt_percCresc11, lblCresc11_M1)
    End Sub

    Private Sub CalcularM1_MudaCor_Mes12()
        fnCalcularM1_MudaCor(txt_percCresc12, lblCresc12_M1)
    End Sub

#End Region

#Region " Calcular M1"

    Private Sub fnCalcularM1(ByVal iValorMeta As TextBox, ByVal iValorHistorico As Label, ByVal iCresc As TextBox, ByVal iCrescLabel As Label, ByVal iPercCresc As TextBox, ByVal iCrescMudaCor As Label)
        If CInt(iValorMeta.Text) = 0 Then
            iCresc.Text = 0
        ElseIf CInt(iValorHistorico.Text) = 0 Then
            iCresc.Text = 0
        Else
            iCresc.Text = ((CDbl(iValorMeta.Text) / CDbl(iValorHistorico.Text) * 100) - 100).ToString("n1")
        End If
        iCrescLabel.Text = iCresc.Text
        fnCalcularM1_MudaCor(iPercCresc, iCrescMudaCor)
    End Sub

    Private Sub CalcularM1_Mes01()
        fnCalcularM1(txt_vlrMeta01, txt_vlrHist1_01, txt_percCresc01, lblCresc01_M1, txt_percCresc01, lblCresc01_M1)
    End Sub

    Private Sub CalcularM1_Mes02()
        fnCalcularM1(txt_vlrMeta02, txt_vlrHist1_02, txt_percCresc02, lblCresc02_M1, txt_percCresc02, lblCresc02_M1)
    End Sub

    Private Sub CalcularM1_Mes03()
        fnCalcularM1(txt_vlrMeta03, txt_vlrHist1_03, txt_percCresc03, lblCresc03_M1, txt_percCresc03, lblCresc03_M1)
    End Sub

    Private Sub CalcularM1_Mes04()
        fnCalcularM1(txt_vlrMeta04, txt_vlrHist1_04, txt_percCresc04, lblCresc04_M1, txt_percCresc04, lblCresc04_M1)
    End Sub

    Private Sub CalcularM1_Mes05()
        fnCalcularM1(txt_vlrMeta05, txt_vlrHist1_05, txt_percCresc05, lblCresc05_M1, txt_percCresc05, lblCresc05_M1)
    End Sub

    Private Sub CalcularM1_Mes06()
        fnCalcularM1(txt_vlrMeta06, txt_vlrHist1_06, txt_percCresc06, lblCresc06_M1, txt_percCresc06, lblCresc06_M1)
    End Sub

    Private Sub CalcularM1_Mes07()
        fnCalcularM1(txt_vlrMeta07, txt_vlrHist1_07, txt_percCresc07, lblCresc07_M1, txt_percCresc07, lblCresc07_M1)
    End Sub

    Private Sub CalcularM1_Mes08()
        fnCalcularM1(txt_vlrMeta08, txt_vlrHist1_08, txt_percCresc08, lblCresc08_M1, txt_percCresc08, lblCresc08_M1)
    End Sub

    Private Sub CalcularM1_Mes09()
        fnCalcularM1(txt_vlrMeta09, txt_vlrHist1_09, txt_percCresc09, lblCresc09_M1, txt_percCresc09, lblCresc09_M1)
    End Sub

    Private Sub CalcularM1_Mes10()
        fnCalcularM1(txt_vlrMeta10, txt_vlrHist1_10, txt_percCresc10, lblCresc10_M1, txt_percCresc10, lblCresc10_M1)
    End Sub

    Private Sub CalcularM1_Mes11()
        fnCalcularM1(txt_vlrMeta11, txt_vlrHist1_11, txt_percCresc11, lblCresc11_M1, txt_percCresc11, lblCresc11_M1)
    End Sub

    Private Sub CalcularM1_Mes12()
        fnCalcularM1(txt_vlrMeta12, txt_vlrHist1_12, txt_percCresc12, lblCresc12_M1, txt_percCresc12, lblCresc12_M1)
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

    Private Sub CalcularM1_Ano()

        fnCalcularM1(txt_vlrMeta12, txt_vlrHist1_12, txt_percCresc12, lblCresc12_M1, txt_percCresc12, lblCresc12_M1)

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

    End Sub

#End Region

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
            'Me.txt_percMetaTotal.Text = ((Me.txt_vlrMetaTotal.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
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


        Me.lblCrescAno_M1.Text = 0
        'Me.txt_percPart_Ano.Text = 0
    End Sub

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
    End Sub

#Region " Calcular Partcipação"

    Private Sub fnCalcularParticipacao(ByVal iVlrMeta As TextBox, ByVal iPerc As Label)
        If CInt(iVlrMeta.Text) = 0 Then
            iPerc.Text = 0
        End If
    End Sub

    Private Sub CalcularParticipacao_Mes01()
        fnCalcularParticipacao(txt_vlrMeta01, txt_percMeta01)
    End Sub

    Private Sub CalcularParticipacao_Mes02()
        fnCalcularParticipacao(txt_vlrMeta02, txt_percMeta02)
    End Sub

    Private Sub CalcularParticipacao_Mes03()
        fnCalcularParticipacao(txt_vlrMeta03, txt_percMeta03)
    End Sub

    Private Sub CalcularParticipacao_Mes04()
        fnCalcularParticipacao(txt_vlrMeta04, txt_percMeta04)
    End Sub

    Private Sub CalcularParticipacao_Mes05()
        fnCalcularParticipacao(txt_vlrMeta05, txt_percMeta05)
    End Sub

    Private Sub CalcularParticipacao_Mes06()
        fnCalcularParticipacao(txt_vlrMeta06, txt_percMeta06)
    End Sub

    Private Sub CalcularParticipacao_Mes07()
        fnCalcularParticipacao(txt_vlrMeta07, txt_percMeta07)
    End Sub

    Private Sub CalcularParticipacao_Mes08()
        fnCalcularParticipacao(txt_vlrMeta08, txt_percMeta08)
    End Sub

    Private Sub CalcularParticipacao_Mes09()
        fnCalcularParticipacao(txt_vlrMeta09, txt_percMeta09)
    End Sub

    Private Sub CalcularParticipacao_Mes10()
        fnCalcularParticipacao(txt_vlrMeta10, txt_percMeta10)
    End Sub

    Private Sub CalcularParticipacao_Mes11()
        fnCalcularParticipacao(txt_vlrMeta11, txt_percMeta11)
    End Sub

    Private Sub CalcularParticipacao_Mes12()
        fnCalcularParticipacao(txt_vlrMeta12, txt_percMeta12)
    End Sub

#End Region

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        Me.txt_vlrMeta02.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes01()
        Call CalcularM1_Mes01()
    End Sub

    Protected Sub txt_vlrMeta2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        Me.txt_vlrMeta03.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes02()
        Call CalcularM1_Mes02()
    End Sub

    Protected Sub txt_vlrMeta3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged
        Me.txt_vlrMeta04.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes03()
        Call CalcularM1_Mes03()
    End Sub

    Protected Sub txt_vlrMeta4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged
        Me.txt_vlrMeta05.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes04()
        Call CalcularM1_Mes04()
    End Sub

    Protected Sub txt_vlrMeta5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged
        Me.txt_vlrMeta06.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes05()
        Call CalcularM1_Mes05()
    End Sub

    Protected Sub txt_vlrMeta6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged
        Me.txt_vlrMeta07.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes06()
        Call CalcularM1_Mes06()
    End Sub

    Protected Sub txt_vlrMeta7_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged
        Me.txt_vlrMeta08.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes07()
        Call CalcularM1_Mes07()
    End Sub

    Protected Sub txt_vlrMeta8_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged
        Me.txt_vlrMeta09.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes08()
        Call CalcularM1_Mes08()
    End Sub

    Protected Sub txt_vlrMeta9_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged
        Me.txt_vlrMeta10.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes09()
        Call CalcularM1_Mes09()
    End Sub

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged
        Me.txt_vlrMeta11.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes10()
        Call CalcularM1_Mes10()
    End Sub

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged
        Me.txt_vlrMeta12.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes11()
        Call CalcularM1_Mes11()
    End Sub

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged
        Me.txt_vlrMeta01.Focus()
        Call Totalizar_Meta()
        Call CalcularParticipacao_Mes12()
        Call CalcularM1_Mes12()
    End Sub

    Public Function Salvar(ByVal idTipoSecao As String, ByVal idComprador As String, ByVal Ano As String, _
                           ByVal Mes As String, ByVal idFilial As String, ByVal idSecao As String, ByVal vlr As Double, _
                           ByVal percCresc As Double) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspSalvarVendaSecaoComprador_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.Char))
        comando.Parameters("@idTipoSecao").Value = idTipoSecao

        comando.Parameters.Add(New SqlParameter("@idComprador", SqlDbType.VarChar))
        comando.Parameters("@idComprador").Value = idComprador

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = Ano

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = Mes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = idFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.VarChar))
        comando.Parameters("@idSecao").Value = idSecao

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@percCresc", SqlDbType.Money))
        comando.Parameters("@percCresc").Value = percCresc

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
        oOrc.HabilitarSalvar(btnSalvar1, cboAno.CallAno, cboPosicao.CallPosicao, 1, User.Identity.Name)
    End Sub

    Sub MudarLegenda()
        Me.txt_Titulo_Hist3.Text = " Hist. " & Me.cboAno.CallAno.ToString - 3 & " "
        Me.txt_Titulo_Hist2.Text = " Hist. " & Me.cboAno.CallAno.ToString - 2 & " "
        Me.txt_Titulo_Hist1.Text = " Hist. " & Me.cboAno.CallAno.ToString - 1 & " "

        Me.lblCrescLegenda_M1.Text = Right(Me.cboAno.CallAno, 2) & "/" & Right(Me.cboAno.CallAno - 1, 2)
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

    Sub CalcularNovaParticipacao()
        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim Conn As New SqlConnection(strCon)
        Dim objDr As SqlDataReader
        Dim strSQL As String

        strSQL = "UPDATE a " & _
                       "SET a.perc = CASE WHEN a.vlr = 0 THEN 0 WHEN b.vlr = 0 THEN 0 ELSE ROUND(((CAST(a.vlr AS FLOAT) / CAST(b.vlr AS FLOAT)) * 100), 4) END " & _
                       "FROM Metas.tblOriSecaoComprador AS a JOIN Metas.tblOriComprador AS b " & _
                       "ON a.Ano = b.Ano " & _
                       "AND a.Mes = b.Mes " & _
                       "AND a.idFilial = b.idFilial " & _
                       "WHERE a.idTipoSecao=1 AND a.Ano= " & Me.cboAno.CallAno & " AND a.idFilial = " & Me.cboFilial.CallFilial & " AND b.idCod=1"
        Try
            Conn.Open()
            Dim Cmd As New SqlCommand(strSQL, Conn)
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Classe: CalcularNovaParticipação. Erro " & Err.Number & "-" & Err.Description & ".")
        Finally
            Conn.Close()
        End Try

    End Sub

#Region " txt_percCresc"

    Private Sub fnPercCresc(ByVal iVlrHist As Label, ByVal iVlrMeta As TextBox, ByVal iPercCresc As TextBox, ByVal iPercCrescFocus As TextBox, ByVal lblCresc As Label, ByVal iPercMeta As Label)
        If iVlrHist.Text = 0 Then
            iVlrMeta.Text = 0
            iPercCresc.Text = 0
        Else
            iVlrMeta.Text = (((iPercCresc.Text * iVlrHist.Text) / 100) + iVlrHist.Text).ToString("n0")
        End If
        iPercCrescFocus.Focus()
        Call Totalizar_Meta()       'Totaliza o Total do Ano da Seção selecionada.

        fnCalcularM1_MudaCor(iPercCresc, lblCresc)
        fnCalcularParticipacao(iVlrMeta, iPercMeta)
        Call CalcularParticipacao_Mes01()
        lblCresc.Text = iPercCresc.Text
    End Sub

    Protected Sub txt_percCresc01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc01.TextChanged
        fnPercCresc(txt_vlrHist1_01, txt_vlrMeta01, txt_percCresc01, txt_percCresc02, lblCresc01_M1, txt_percMeta01)
    End Sub

    Protected Sub txt_percCresc02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc02.TextChanged
        fnPercCresc(txt_vlrHist1_02, txt_vlrMeta02, txt_percCresc02, txt_percCresc03, lblCresc02_M1, txt_percMeta02)
    End Sub

    Protected Sub txt_percCresc03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc03.TextChanged
        fnPercCresc(txt_vlrHist1_03, txt_vlrMeta03, txt_percCresc03, txt_percCresc04, lblCresc03_M1, txt_percMeta03)
    End Sub

    Protected Sub txt_percCresc04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc04.TextChanged
        fnPercCresc(txt_vlrHist1_04, txt_vlrMeta04, txt_percCresc04, txt_percCresc05, lblCresc04_M1, txt_percMeta04)
    End Sub

    Protected Sub txt_percCresc05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc05.TextChanged
        fnPercCresc(txt_vlrHist1_05, txt_vlrMeta05, txt_percCresc05, txt_percCresc06, lblCresc05_M1, txt_percMeta05)
    End Sub

    Protected Sub txt_percCresc06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc06.TextChanged
        fnPercCresc(txt_vlrHist1_06, txt_vlrMeta06, txt_percCresc06, txt_percCresc07, lblCresc06_M1, txt_percMeta06)
    End Sub

    Protected Sub txt_percCresc07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc07.TextChanged
        fnPercCresc(txt_vlrHist1_07, txt_vlrMeta07, txt_percCresc07, txt_percCresc08, lblCresc07_M1, txt_percMeta07)
    End Sub

    Protected Sub txt_percCresc08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc08.TextChanged
        fnPercCresc(txt_vlrHist1_08, txt_vlrMeta08, txt_percCresc08, txt_percCresc09, lblCresc08_M1, txt_percMeta08)
    End Sub

    Protected Sub txt_percCresc09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc09.TextChanged
        fnPercCresc(txt_vlrHist1_09, txt_vlrMeta09, txt_percCresc09, txt_percCresc10, lblCresc09_M1, txt_percMeta09)
    End Sub

    Protected Sub txt_percCresc10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc10.TextChanged
        fnPercCresc(txt_vlrHist1_10, txt_vlrMeta10, txt_percCresc10, txt_percCresc11, lblCresc10_M1, txt_percMeta10)
    End Sub

    Protected Sub txt_percCresc11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc11.TextChanged
        fnPercCresc(txt_vlrHist1_11, txt_vlrMeta11, txt_percCresc11, txt_percCresc12, lblCresc11_M1, txt_percMeta11)
    End Sub

    Protected Sub txt_percCresc12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percCresc12.TextChanged
        fnPercCresc(txt_vlrHist1_12, txt_vlrMeta12, txt_percCresc12, txt_percCresc01, lblCresc12_M1, txt_percMeta12)
    End Sub

#End Region

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call HabilitarSalvar()
        Call MudarLegenda()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged

        Call Atualizar()
        Call ArmazenaMetaInicial()
    End Sub

    Protected Sub cboComprador_ListCompradorChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboComprador.ListCompradorChanged
        Dim oCad As New Cadastro

        Call Atualizar()
        Call ArmazenaMetaInicial()
    End Sub

    Protected Sub cboComprador_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboComprador.ListSecaoChanged
        Call Atualizar()
        Call ArmazenaMetaInicial()
    End Sub

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(38, User.Identity.Name)

            Me.cboAno.AutoPostBack = True

            cboFilial.cboFilial_AutoPostBack = True

            Me.cboAno.AnoInicial = Year(Now())
            Me.cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Me.cboMes.CallMes = 1
            Me.cboFilial.CallFilial = 3
            Me.cboPosicao.CallPosicao = 4

            'Me.cboComprador.Enabled = False
            'Select Case LCase(User.Identity.Name)
            '    Case "ana"
            '        Me.cboComprador.CallComprador = 1000525
            '        Me.cboComprador.CallSecao = "11-Leite"
            '    Case "anderson"
            '        Me.cboComprador.CallComprador = 999
            '        Me.cboComprador.CallSecao = "15-Laticinios"
            '    Case "angelo"
            '        Me.cboComprador.CallComprador = 393260
            '        Me.cboComprador.CallSecao = "30-Ferragens & Ferramentas"
            '    Case "ariane"
            '        Me.cboComprador.CallComprador = 991
            '        Me.cboComprador.CallSecao = "40-Calcados"
            '    Case "carlos"
            '        Me.cboComprador.CallComprador = 99
            '        Me.cboComprador.CallSecao = "22-Granjeiros"
            '    Case "claudines"
            '        Me.cboComprador.CallComprador = 654630
            '        Me.cboComprador.CallSecao = "13 - Rotisseria"
            '    Case "josué"
            '        Me.cboComprador.CallComprador = 1112844
            '        Me.cboComprador.CallSecao = "01-Seca Pesada"
            '    Case "marisa"
            '        Me.cboComprador.CallComprador = 469650
            '        Me.cboComprador.CallSecao = "32-Casa & Utilidades"
            '    Case "mauro"
            '        Me.cboComprador.CallComprador = 16015212
            '        Me.cboComprador.CallSecao = "12-Fiambreria"
            '    Case "nelci"
            '        Me.cboComprador.CallComprador = 1128494
            '        Me.cboComprador.CallSecao = "05-Limpeza"
            '    Case "patricia"  'Marco
            '        Me.cboComprador.CallComprador = 331760
            '        Me.cboComprador.CallSecao = "51 - Eletroportateis"
            '    Case "rodrigo"  'Marco
            '        Me.cboComprador.CallComprador = 995
            '        Me.cboComprador.CallSecao = "07-Bebidas Quentes"
            '    Case "sergio"  'Lourival
            '        Me.cboComprador.CallComprador = 351660
            '        Me.cboComprador.CallSecao = "50-Eletrodomesticos"
            '    Case "simone"     'Simone
            '        Me.cboComprador.CallComprador = 60017872
            '        Me.cboComprador.CallSecao = "06-Perfumaria/higiene E Beleza"
            '    Case "tiago"  'Jorge
            '        Me.cboComprador.CallComprador = 994
            '        Me.cboComprador.CallSecao = "02-Seca Salgada(leit,enlat,molho)"
            '    Case "wagner"  'Jorge
            '        Me.cboComprador.CallComprador = 330320
            '        Me.cboComprador.CallSecao = "13-Rotisseria"
            '    Case "walkiria"
            '        Me.cboComprador.CallComprador = 11069835
            '        Me.cboComprador.CallSecao = "04-Seca LevE-Bisc.bom.salg.massa"

            'End Select

            Call Atualizar()
            Call HabilitarSalvar()
            Call MudarLegenda()

        End If

    End Sub

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
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Cadastro de Meta de Venda - Comercial - PGR38"
        End If
    End Sub

#End Region

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Me.grdCalendario.DataBind()
    End Sub

#Region " gridAnalise"

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

#End Region

    Protected Sub btnSalvar1_Click(sender As Object, e As EventArgs) Handles btnSalvar1.Click
        If Me.txt_vlrMetaTotal.Text = "" Then
            Beep()
            oVem.UserMsgBox(Me, "Você não digitou nada ainda!!! Informe o valor ou percentual da margem em qualquer mês!!!")
        Else
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta01.Text, Me.txt_percCresc01.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta02.Text, Me.txt_percCresc02.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta03.Text, Me.txt_percCresc03.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta04.Text, Me.txt_percCresc04.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta05.Text, Me.txt_percCresc05.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta06.Text, Me.txt_percCresc06.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta07.Text, Me.txt_percCresc07.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta08.Text, Me.txt_percCresc08.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta09.Text, Me.txt_percCresc09.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta10.Text, Me.txt_percCresc10.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta11.Text, Me.txt_percCresc11.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMeta12.Text, Me.txt_percCresc12.Text)
            Salvar("1", Me.cboComprador.CallComprador, Me.cboAno.CallAno, 99, Me.cboFilial.CallFilial, Me.cboComprador.CallSecao, Me.txt_vlrMetaTotal.Text, Me.lblCrescAno.Text)
            'Me.lblError.Text = oVem.varDesc
            Call CalcularNovaParticipacao()

            oVem.UserMsgBox(Me, "As Vendas foram salvas com sucesso!!!")
            Me.gridAnalise.DataBind()

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(38, User.Identity.Name)

            Me.cboAno.AutoPostBack = True
            Me.cboFilial.cboFilial_AutoPostBack = True

            Me.cboAno.AnoInicial = Year(Now())
            Me.cboAno.AnoFinal = Year(Now()) + 1

            Me.cboAno.CallAno = Year(Now()) + 1
            Me.cboMes.CallMes = 1
            Me.cboFilial.CallFilial = 3
            Me.cboPosicao.CallPosicao = 4

            'Me.cboComprador.Enabled = False
            'Select Case LCase(User.Identity.Name)
            '    Case "ana"
            '        Me.cboComprador.CallComprador = 1000525
            '        Me.cboComprador.CallSecao = "11-Leite"
            '    Case "anderson"
            '        Me.cboComprador.CallComprador = 999
            '        Me.cboComprador.CallSecao = "15-Laticinios"
            '    Case "angelo"
            '        Me.cboComprador.CallComprador = 393260
            '        Me.cboComprador.CallSecao = "30-Ferragens & Ferramentas"
            '    Case "ariane"
            '        Me.cboComprador.CallComprador = 991
            '        Me.cboComprador.CallSecao = "40-Calcados"
            '    Case "carlos"
            '        Me.cboComprador.CallComprador = 99
            '        Me.cboComprador.CallSecao = "22-Granjeiros"
            '    Case "claudines"
            '        Me.cboComprador.CallComprador = 654630
            '        Me.cboComprador.CallSecao = "13 - Rotisseria"
            '    Case "josué"
            '        Me.cboComprador.CallComprador = 1112844
            '        Me.cboComprador.CallSecao = "01-Seca Pesada"
            '    Case "marisa"
            '        Me.cboComprador.CallComprador = 469650
            '        Me.cboComprador.CallSecao = "32-Casa & Utilidades"
            '    Case "mauro"
            '        Me.cboComprador.CallComprador = 16015212
            '        Me.cboComprador.CallSecao = "12-Fiambreria"
            '    Case "nelci"
            '        Me.cboComprador.CallComprador = 1128494
            '        Me.cboComprador.CallSecao = "05-Limpeza"
            '    Case "patricia"  'Marco
            '        Me.cboComprador.CallComprador = 331760
            '        Me.cboComprador.CallSecao = "51 - Eletroportateis"
            '    Case "rodrigo"  'Marco
            '        Me.cboComprador.CallComprador = 995
            '        Me.cboComprador.CallSecao = "07-Bebidas Quentes"
            '    Case "sergio"  'Lourival
            '        Me.cboComprador.CallComprador = 351660
            '        Me.cboComprador.CallSecao = "50-Eletrodomesticos"
            '    Case "simone"     'Simone
            '        Me.cboComprador.CallComprador = 60017872
            '        Me.cboComprador.CallSecao = "06-Perfumaria/higiene E Beleza"
            '    Case "tiago"  'Jorge
            '        Me.cboComprador.CallComprador = 994
            '        Me.cboComprador.CallSecao = "02-Seca Salgada(leit,enlat,molho)"
            '    Case "wagner"  'Jorge
            '        Me.cboComprador.CallComprador = 330320
            '        Me.cboComprador.CallSecao = "13-Rotisseria"
            '    Case "walkiria"
            '        Me.cboComprador.CallComprador = 11069835
            '        Me.cboComprador.CallSecao = "04-Seca LevE-Bisc.bom.salg.massa"

            'End Select

            'Call Atualizar()
            Call HabilitarSalvar()
            Call MudarLegenda()

        End If
    End Sub
End Class
