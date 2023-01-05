Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmResumo1
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str
    Dim no As Double
    Dim varDepto As String

    Private Sub p01_ZerarCampos()
        Me.LSI_1.Text = 0
        Me.LSI_2.Text = 0
        Me.LSI_3.Text = 0
        Me.LSI_4.Text = 0
        Me.LSI_5.Text = 0
        Me.LSI_6.Text = 0
        Me.LSI_7.Text = 0
        Me.LSI_8.Text = 0
        Me.LSI_9.Text = 0
        Me.LSI_10.Text = 0
        Me.LSI_11.Text = 0
        Me.LSI_12.Text = 0
        Me.LSI_Total.Text = 0

        Me.LSF_1.Text = 0
        Me.LSF_2.Text = 0
        Me.LSF_3.Text = 0
        Me.LSF_4.Text = 0
        Me.LSF_5.Text = 0
        Me.LSF_6.Text = 0
        Me.LSF_7.Text = 0
        Me.LSF_8.Text = 0
        Me.LSF_9.Text = 0
        Me.LSF_10.Text = 0
        Me.LSF_11.Text = 0
        Me.LSF_12.Text = 0
        Me.LSF_Total.Text = 0

        Me.LRDF_1.Text = 0
        Me.LRDF_2.Text = 0
        Me.LRDF_3.Text = 0
        Me.LRDF_4.Text = 0
        Me.LRDF_5.Text = 0
        Me.LRDF_6.Text = 0
        Me.LRDF_7.Text = 0
        Me.LRDF_8.Text = 0
        Me.LRDF_9.Text = 0
        Me.LRDF_10.Text = 0
        Me.LRDF_11.Text = 0
        Me.LRDF_12.Text = 0
        Me.LRDF_Total.Text = 0

        Me.LTM_1.Text = 0
        Me.LTM_2.Text = 0
        Me.LTM_3.Text = 0
        Me.LTM_4.Text = 0
        Me.LTM_5.Text = 0
        Me.LTM_6.Text = 0
        Me.LTM_7.Text = 0
        Me.LTM_8.Text = 0
        Me.LTM_9.Text = 0
        Me.LTM_10.Text = 0
        Me.LTM_11.Text = 0
        Me.LTM_12.Text = 0
        Me.LTM_Total.Text = 0

        Me.LSD_1.Text = 0
        Me.LSD_2.Text = 0
        Me.LSD_3.Text = 0
        Me.LSD_4.Text = 0
        Me.LSD_5.Text = 0
        Me.LSD_6.Text = 0
        Me.LSD_7.Text = 0
        Me.LSD_8.Text = 0
        Me.LSD_9.Text = 0
        Me.LSD_10.Text = 0
        Me.LSD_11.Text = 0
        Me.LSD_12.Text = 0
        Me.LSD_Total.Text = 0

        Me.L01_1.Text = 0
        Me.L01_2.Text = 0
        Me.L01_3.Text = 0
        Me.L01_4.Text = 0
        Me.L01_5.Text = 0
        Me.L01_6.Text = 0
        Me.L01_7.Text = 0
        Me.L01_8.Text = 0
        Me.L01_9.Text = 0
        Me.L01_10.Text = 0
        Me.L01_11.Text = 0
        Me.L01_12.Text = 0
        Me.L01_Total.Text = 0

        Me.L02_1.Text = 0
        Me.L02_2.Text = 0
        Me.L02_3.Text = 0
        Me.L02_4.Text = 0
        Me.L02_5.Text = 0
        Me.L02_6.Text = 0
        Me.L02_7.Text = 0
        Me.L02_8.Text = 0
        Me.L02_9.Text = 0
        Me.L02_10.Text = 0
        Me.L02_11.Text = 0
        Me.L02_12.Text = 0
        Me.L02_Total.Text = 0

        Me.L03_1.Text = 0
        Me.L03_2.Text = 0
        Me.L03_3.Text = 0
        Me.L03_4.Text = 0
        Me.L03_5.Text = 0
        Me.L03_6.Text = 0
        Me.L03_7.Text = 0
        Me.L03_8.Text = 0
        Me.L03_9.Text = 0
        Me.L03_10.Text = 0
        Me.L03_11.Text = 0
        Me.L03_12.Text = 0
        Me.L03_Total.Text = 0

        Me.L04_1.Text = 0
        Me.L04_2.Text = 0
        Me.L04_3.Text = 0
        Me.L04_4.Text = 0
        Me.L04_5.Text = 0
        Me.L04_6.Text = 0
        Me.L04_7.Text = 0
        Me.L04_8.Text = 0
        Me.L04_9.Text = 0
        Me.L04_10.Text = 0
        Me.L04_11.Text = 0
        Me.L04_12.Text = 0
        Me.L04_Total.Text = 0

        Me.L05_1.Text = 0
        Me.L05_2.Text = 0
        Me.L05_3.Text = 0
        Me.L05_4.Text = 0
        Me.L05_5.Text = 0
        Me.L05_6.Text = 0
        Me.L05_7.Text = 0
        Me.L05_8.Text = 0
        Me.L05_9.Text = 0
        Me.L05_10.Text = 0
        Me.L05_11.Text = 0
        Me.L05_12.Text = 0
        Me.L05_Total.Text = 0

        Me.L06_1.Text = 0
        Me.L06_2.Text = 0
        Me.L06_3.Text = 0
        Me.L06_4.Text = 0
        Me.L06_5.Text = 0
        Me.L06_6.Text = 0
        Me.L06_7.Text = 0
        Me.L06_8.Text = 0
        Me.L06_9.Text = 0
        Me.L06_10.Text = 0
        Me.L06_11.Text = 0
        Me.L06_12.Text = 0
        Me.L06_Total.Text = 0

        Me.L07_1.Text = 0
        Me.L07_2.Text = 0
        Me.L07_3.Text = 0
        Me.L07_4.Text = 0
        Me.L07_5.Text = 0
        Me.L07_6.Text = 0
        Me.L07_7.Text = 0
        Me.L07_8.Text = 0
        Me.L07_9.Text = 0
        Me.L07_10.Text = 0
        Me.L07_11.Text = 0
        Me.L07_12.Text = 0
        Me.L07_Total.Text = 0

        Me.L08_1.Text = 0
        Me.L08_2.Text = 0
        Me.L08_3.Text = 0
        Me.L08_4.Text = 0
        Me.L08_5.Text = 0
        Me.L08_6.Text = 0
        Me.L08_7.Text = 0
        Me.L08_8.Text = 0
        Me.L08_9.Text = 0
        Me.L08_10.Text = 0
        Me.L08_11.Text = 0
        Me.L08_12.Text = 0
        Me.L08_Total.Text = 0

        Me.L09_1.Text = 0
        Me.L09_2.Text = 0
        Me.L09_3.Text = 0
        Me.L09_4.Text = 0
        Me.L09_5.Text = 0
        Me.L09_6.Text = 0
        Me.L09_7.Text = 0
        Me.L09_8.Text = 0
        Me.L09_9.Text = 0
        Me.L09_10.Text = 0
        Me.L09_11.Text = 0
        Me.L09_12.Text = 0
        Me.L09_Total.Text = 0

        Me.L10_1.Text = 0
        Me.L10_2.Text = 0
        Me.L10_3.Text = 0
        Me.L10_4.Text = 0
        Me.L10_5.Text = 0
        Me.L10_6.Text = 0
        Me.L10_7.Text = 0
        Me.L10_8.Text = 0
        Me.L10_9.Text = 0
        Me.L10_10.Text = 0
        Me.L10_11.Text = 0
        Me.L10_12.Text = 0
        Me.L10_Total.Text = 0

        Me.L11_1.Text = 0
        Me.L11_2.Text = 0
        Me.L11_3.Text = 0
        Me.L11_4.Text = 0
        Me.L11_5.Text = 0
        Me.L11_6.Text = 0
        Me.L11_7.Text = 0
        Me.L11_8.Text = 0
        Me.L11_9.Text = 0
        Me.L11_10.Text = 0
        Me.L11_11.Text = 0
        Me.L11_12.Text = 0
        Me.L11_Total.Text = 0

        Me.L12_1.Text = 0
        Me.L12_2.Text = 0
        Me.L12_3.Text = 0
        Me.L12_4.Text = 0
        Me.L12_5.Text = 0
        Me.L12_6.Text = 0
        Me.L12_7.Text = 0
        Me.L12_8.Text = 0
        Me.L12_9.Text = 0
        Me.L12_10.Text = 0
        Me.L12_11.Text = 0
        Me.L12_12.Text = 0
        Me.L12_Total.Text = 0

        Me.L13_1.Text = 0
        Me.L13_2.Text = 0
        Me.L13_3.Text = 0
        Me.L13_4.Text = 0
        Me.L13_5.Text = 0
        Me.L13_6.Text = 0
        Me.L13_7.Text = 0
        Me.L13_8.Text = 0
        Me.L13_9.Text = 0
        Me.L13_10.Text = 0
        Me.L13_11.Text = 0
        Me.L13_12.Text = 0
        Me.L13_Total.Text = 0

        Me.L14_1.Text = 0
        Me.L14_2.Text = 0
        Me.L14_3.Text = 0
        Me.L14_4.Text = 0
        Me.L14_5.Text = 0
        Me.L14_6.Text = 0
        Me.L14_7.Text = 0
        Me.L14_8.Text = 0
        Me.L14_9.Text = 0
        Me.L14_10.Text = 0
        Me.L14_11.Text = 0
        Me.L14_12.Text = 0
        Me.L14_Total.Text = 0

        Me.L15_1.Text = 0
        Me.L15_2.Text = 0
        Me.L15_3.Text = 0
        Me.L15_4.Text = 0
        Me.L15_5.Text = 0
        Me.L15_6.Text = 0
        Me.L15_7.Text = 0
        Me.L15_8.Text = 0
        Me.L15_9.Text = 0
        Me.L15_10.Text = 0
        Me.L15_11.Text = 0
        Me.L15_12.Text = 0
        Me.L15_Total.Text = 0

        Me.L16_1.Text = 0
        Me.L16_2.Text = 0
        Me.L16_3.Text = 0
        Me.L16_4.Text = 0
        Me.L16_5.Text = 0
        Me.L16_6.Text = 0
        Me.L16_7.Text = 0
        Me.L16_8.Text = 0
        Me.L16_9.Text = 0
        Me.L16_10.Text = 0
        Me.L16_11.Text = 0
        Me.L16_12.Text = 0
        Me.L16_Total.Text = 0

        Me.L17_1.Text = 0
        Me.L17_2.Text = 0
        Me.L17_3.Text = 0
        Me.L17_4.Text = 0
        Me.L17_5.Text = 0
        Me.L17_6.Text = 0
        Me.L17_7.Text = 0
        Me.L17_8.Text = 0
        Me.L17_9.Text = 0
        Me.L17_10.Text = 0
        Me.L17_11.Text = 0
        Me.L17_12.Text = 0
        Me.L17_Total.Text = 0

        Me.L18_1.Text = 0
        Me.L18_2.Text = 0
        Me.L18_3.Text = 0
        Me.L18_4.Text = 0
        Me.L18_5.Text = 0
        Me.L18_6.Text = 0
        Me.L18_7.Text = 0
        Me.L18_8.Text = 0
        Me.L18_9.Text = 0
        Me.L18_10.Text = 0
        Me.L18_11.Text = 0
        Me.L18_12.Text = 0
        Me.L18_Total.Text = 0

        Me.L19_1.Text = 0
        Me.L19_2.Text = 0
        Me.L19_3.Text = 0
        Me.L19_4.Text = 0
        Me.L19_5.Text = 0
        Me.L19_6.Text = 0
        Me.L19_7.Text = 0
        Me.L19_8.Text = 0
        Me.L19_9.Text = 0
        Me.L19_10.Text = 0
        Me.L19_11.Text = 0
        Me.L19_12.Text = 0
        Me.L19_Total.Text = 0

        Me.L20_1.Text = 0
        Me.L20_2.Text = 0
        Me.L20_3.Text = 0
        Me.L20_4.Text = 0
        Me.L20_5.Text = 0
        Me.L20_6.Text = 0
        Me.L20_7.Text = 0
        Me.L20_8.Text = 0
        Me.L20_9.Text = 0
        Me.L20_10.Text = 0
        Me.L20_11.Text = 0
        Me.L20_12.Text = 0
        Me.L20_Total.Text = 0

        Me.LTS_1.Text = 0
        Me.LTS_2.Text = 0
        Me.LTS_3.Text = 0
        Me.LTS_4.Text = 0
        Me.LTS_5.Text = 0
        Me.LTS_6.Text = 0
        Me.LTS_7.Text = 0
        Me.LTS_8.Text = 0
        Me.LTS_9.Text = 0
        Me.LTS_10.Text = 0
        Me.LTS_11.Text = 0
        Me.LTS_12.Text = 0
        Me.LTS_Total.Text = 0
    End Sub

    Private Sub p02_BuscarDados_Entradas()
        '*****************************  E N T R A D A S  ****************************************
        'Depósitos
        Call BuscaDados(1, 1)
        Call BuscaDados(2, 1)
        Call BuscaDados(3, 1)
        Call BuscaDados(4, 1)
        Call BuscaDados(5, 1)
        Call BuscaDados(6, 1)
        Call BuscaDados(7, 1)
        Call BuscaDados(8, 1)
        Call BuscaDados(9, 1)
        Call BuscaDados(10, 1)
        Call BuscaDados(11, 1)
        Call BuscaDados(12, 1)

        'Créditos Pré-Datados
        Call BuscaDados(1, 2)
        Call BuscaDados(2, 2)
        Call BuscaDados(3, 2)
        Call BuscaDados(4, 2)
        Call BuscaDados(5, 2)
        Call BuscaDados(6, 2)
        Call BuscaDados(7, 2)
        Call BuscaDados(8, 2)
        Call BuscaDados(9, 2)
        Call BuscaDados(10, 2)
        Call BuscaDados(11, 2)
        Call BuscaDados(12, 2)

        'Créditos Pré-Datados
        Call BuscaDados(1, 3)
        Call BuscaDados(2, 3)
        Call BuscaDados(3, 3)
        Call BuscaDados(4, 3)
        Call BuscaDados(5, 3)
        Call BuscaDados(6, 3)
        Call BuscaDados(7, 3)
        Call BuscaDados(8, 3)
        Call BuscaDados(9, 3)
        Call BuscaDados(10, 3)
        Call BuscaDados(11, 3)
        Call BuscaDados(12, 3)

        'Créditos Pré-Datados
        Call BuscaDados(1, 4)
        Call BuscaDados(2, 4)
        Call BuscaDados(3, 4)
        Call BuscaDados(4, 4)
        Call BuscaDados(5, 4)
        Call BuscaDados(6, 4)
        Call BuscaDados(7, 4)
        Call BuscaDados(8, 4)
        Call BuscaDados(9, 4)
        Call BuscaDados(10, 4)
        Call BuscaDados(11, 4)
        Call BuscaDados(12, 4)

        'Transf. Merc. Saídas
        Call BuscaDados(1, 5)
        Call BuscaDados(2, 5)
        Call BuscaDados(3, 5)
        Call BuscaDados(4, 5)
        Call BuscaDados(5, 5)
        Call BuscaDados(6, 5)
        Call BuscaDados(7, 5)
        Call BuscaDados(8, 5)
        Call BuscaDados(9, 5)
        Call BuscaDados(10, 5)
        Call BuscaDados(11, 5)
        Call BuscaDados(12, 5)

        'Créditos Cont. a Receber
        Call BuscaDados(1, 6)
        Call BuscaDados(2, 6)
        Call BuscaDados(3, 6)
        Call BuscaDados(4, 6)
        Call BuscaDados(5, 6)
        Call BuscaDados(6, 6)
        Call BuscaDados(7, 6)
        Call BuscaDados(8, 6)
        Call BuscaDados(9, 6)
        Call BuscaDados(10, 6)
        Call BuscaDados(11, 6)
        Call BuscaDados(12, 6)

        'Créditos Caixa Matriz
        Call BuscaDados(1, 7)
        Call BuscaDados(2, 7)
        Call BuscaDados(3, 7)
        Call BuscaDados(4, 7)
        Call BuscaDados(5, 7)
        Call BuscaDados(6, 7)
        Call BuscaDados(7, 7)
        Call BuscaDados(8, 7)
        Call BuscaDados(9, 7)
        Call BuscaDados(10, 7)
        Call BuscaDados(11, 7)
        Call BuscaDados(12, 7)

        'Outros Créditos
        Call BuscaDados(1, 8)
        Call BuscaDados(2, 8)
        Call BuscaDados(3, 8)
        Call BuscaDados(4, 8)
        Call BuscaDados(5, 8)
        Call BuscaDados(6, 8)
        Call BuscaDados(7, 8)
        Call BuscaDados(8, 8)
        Call BuscaDados(9, 8)
        Call BuscaDados(10, 8)
        Call BuscaDados(11, 8)
        Call BuscaDados(12, 8)
    End Sub

    Private Sub p03_BuscarDados_Saidas()
        '***************************  S A Í D A S  *****************************************************
        'Débitos Cont. à Pagar
        Call BuscaDados(1, 9)
        Call BuscaDados(2, 9)
        Call BuscaDados(3, 9)
        Call BuscaDados(4, 9)
        Call BuscaDados(5, 9)
        Call BuscaDados(6, 9)
        Call BuscaDados(7, 9)
        Call BuscaDados(8, 9)
        Call BuscaDados(9, 9)
        Call BuscaDados(10, 9)
        Call BuscaDados(11, 9)
        Call BuscaDados(12, 9)

        'Débitos do C/C Caixa
        Call BuscaDados(1, 10)
        Call BuscaDados(2, 10)
        Call BuscaDados(3, 10)
        Call BuscaDados(4, 10)
        Call BuscaDados(5, 10)
        Call BuscaDados(6, 10)
        Call BuscaDados(7, 10)
        Call BuscaDados(8, 10)
        Call BuscaDados(9, 10)
        Call BuscaDados(10, 10)
        Call BuscaDados(11, 10)
        Call BuscaDados(12, 10)

        '11 - Débitos do C/C Matriz 
        Call BuscaDados(1, 11)
        Call BuscaDados(2, 11)
        Call BuscaDados(3, 11)
        Call BuscaDados(4, 11)
        Call BuscaDados(5, 11)
        Call BuscaDados(6, 11)
        Call BuscaDados(7, 11)
        Call BuscaDados(8, 11)
        Call BuscaDados(9, 11)
        Call BuscaDados(10, 11)
        Call BuscaDados(11, 11)
        Call BuscaDados(12, 11)

        '12 - Transf. Merc. Entrada 
        Call BuscaDados(1, 12)
        Call BuscaDados(2, 12)
        Call BuscaDados(3, 12)
        Call BuscaDados(4, 12)
        Call BuscaDados(5, 12)
        Call BuscaDados(6, 12)
        Call BuscaDados(7, 12)
        Call BuscaDados(8, 12)
        Call BuscaDados(9, 12)
        Call BuscaDados(10, 12)
        Call BuscaDados(11, 12)
        Call BuscaDados(12, 12)

        '13 - Transf. Merc. Entrada 
        Call BuscaDados(1, 13)
        Call BuscaDados(2, 13)
        Call BuscaDados(3, 13)
        Call BuscaDados(4, 13)
        Call BuscaDados(5, 13)
        Call BuscaDados(6, 13)
        Call BuscaDados(7, 13)
        Call BuscaDados(8, 13)
        Call BuscaDados(9, 13)
        Call BuscaDados(10, 13)
        Call BuscaDados(11, 13)
        Call BuscaDados(12, 13)

        '14 - Rateio de Corporação
        Call BuscaReal(1, 38)
        Call BuscaReal(2, 38)
        Call BuscaReal(3, 38)
        Call BuscaReal(4, 38)
        Call BuscaReal(5, 38)
        Call BuscaReal(6, 38)
        Call BuscaReal(7, 38)
        Call BuscaReal(8, 38)
        Call BuscaReal(9, 38)
        Call BuscaReal(10, 38)
        Call BuscaReal(11, 38)
        Call BuscaReal(12, 38)

        '15 - Aluguél
        Call BuscaReal(1, 28)
        Call BuscaReal(2, 28)
        Call BuscaReal(3, 28)
        Call BuscaReal(4, 28)
        Call BuscaReal(5, 28)
        Call BuscaReal(6, 28)
        Call BuscaReal(7, 28)
        Call BuscaReal(8, 28)
        Call BuscaReal(9, 28)
        Call BuscaReal(10, 28)
        Call BuscaReal(11, 28)
        Call BuscaReal(12, 28)

        '16 - Impostos
        Call BuscaImpostos(1)
        Call BuscaImpostos(2)
        Call BuscaImpostos(3)
        Call BuscaImpostos(4)
        Call BuscaImpostos(5)
        Call BuscaImpostos(6)
        Call BuscaImpostos(7)
        Call BuscaImpostos(8)
        Call BuscaImpostos(9)
        Call BuscaImpostos(10)
        Call BuscaImpostos(11)
        Call BuscaImpostos(12)

        '17 - Despesas Rateadas
        Call BuscaParaEliseu_ReaSub(1, 17)
        Call BuscaParaEliseu_ReaSub(2, 17)
        Call BuscaParaEliseu_ReaSub(3, 17)
        Call BuscaParaEliseu_ReaSub(4, 17)
        Call BuscaParaEliseu_ReaSub(5, 17)
        Call BuscaParaEliseu_ReaSub(6, 17)
        Call BuscaParaEliseu_ReaSub(7, 17)
        Call BuscaParaEliseu_ReaSub(8, 17)
        Call BuscaParaEliseu_ReaSub(9, 17)
        Call BuscaParaEliseu_ReaSub(10, 17)
        Call BuscaParaEliseu_ReaSub(11, 17)
        Call BuscaParaEliseu_ReaSub(12, 17)

        '18 - Serviços Públicos
        Call BuscaParaEliseu_ReaSub(1, 18)
        Call BuscaParaEliseu_ReaSub(2, 18)
        Call BuscaParaEliseu_ReaSub(3, 18)
        Call BuscaParaEliseu_ReaSub(4, 18)
        Call BuscaParaEliseu_ReaSub(5, 18)
        Call BuscaParaEliseu_ReaSub(6, 18)
        Call BuscaParaEliseu_ReaSub(7, 18)
        Call BuscaParaEliseu_ReaSub(8, 18)
        Call BuscaParaEliseu_ReaSub(9, 18)
        Call BuscaParaEliseu_ReaSub(10, 18)
        Call BuscaParaEliseu_ReaSub(11, 18)
        Call BuscaParaEliseu_ReaSub(12, 18)

        '19 - Outros
        Call BuscaDados(1, 19)
        Call BuscaDados(2, 19)
        Call BuscaDados(3, 19)
        Call BuscaDados(4, 19)
        Call BuscaDados(5, 19)
        Call BuscaDados(6, 19)
        Call BuscaDados(7, 19)
        Call BuscaDados(8, 19)
        Call BuscaDados(9, 19)
        Call BuscaDados(10, 19)
        Call BuscaDados(11, 19)
        Call BuscaDados(12, 19)

        '20 - Importação
        Call BuscaDados(1, 20)
        Call BuscaDados(2, 20)
        Call BuscaDados(3, 20)
        Call BuscaDados(4, 20)
        Call BuscaDados(5, 20)
        Call BuscaDados(6, 20)
        Call BuscaDados(7, 20)
        Call BuscaDados(8, 20)
        Call BuscaDados(9, 20)
        Call BuscaDados(10, 20)
        Call BuscaDados(11, 20)
        Call BuscaDados(12, 20)
    End Sub

    Private Sub p04_BuscarDados_Saldo_Inicial()
        '****************************  S A L D O S  ***************************************
        'Saldo Inicial
        Call BuscaSaldoInicial(1)
        Call BuscaSaldoInicial(2)
        Call BuscaSaldoInicial(3)
        Call BuscaSaldoInicial(4)
        Call BuscaSaldoInicial(5)
        Call BuscaSaldoInicial(6)
        Call BuscaSaldoInicial(7)
        Call BuscaSaldoInicial(8)
        Call BuscaSaldoInicial(9)
        Call BuscaSaldoInicial(10)
        Call BuscaSaldoInicial(11)
        Call BuscaSaldoInicial(12)
    End Sub

    Private Sub p05_BuscarDados_Saldo_Final()
        '****************************  S A L D O S  ***************************************
        'Saldo Final
        Call BuscaSaldoFinal(1)
        Call BuscaSaldoFinal(2)
        Call BuscaSaldoFinal(3)
        Call BuscaSaldoFinal(4)
        Call BuscaSaldoFinal(5)
        Call BuscaSaldoFinal(6)
        Call BuscaSaldoFinal(7)
        Call BuscaSaldoFinal(8)
        Call BuscaSaldoFinal(9)
        Call BuscaSaldoFinal(10)
        Call BuscaSaldoFinal(11)
        Call BuscaSaldoFinal(12)
    End Sub

    Private Sub p06_BuscarTaxaSELIC()
        'Taxa SELIC
        Call BuscaTaxaSELIC(1)
        Call BuscaTaxaSELIC(2)
        Call BuscaTaxaSELIC(3)
        Call BuscaTaxaSELIC(4)
        Call BuscaTaxaSELIC(5)
        Call BuscaTaxaSELIC(6)
        Call BuscaTaxaSELIC(7)
        Call BuscaTaxaSELIC(8)
        Call BuscaTaxaSELIC(9)
        Call BuscaTaxaSELIC(10)
        Call BuscaTaxaSELIC(11)
        Call BuscaTaxaSELIC(12)
    End Sub

    Private Sub p07_BuscarReceitasDespesasFinanceiro()
        'Receita ou Despesa Financeira
        Call BuscaRecDesp(1)
        Call BuscaRecDesp(2)
        Call BuscaRecDesp(3)
        Call BuscaRecDesp(4)
        Call BuscaRecDesp(5)
        Call BuscaRecDesp(6)
        Call BuscaRecDesp(7)
        Call BuscaRecDesp(8)
        Call BuscaRecDesp(9)
        Call BuscaRecDesp(10)
        Call BuscaRecDesp(11)
        Call BuscaRecDesp(12)
    End Sub

    Sub Atualizar()
        Call p01_ZerarCampos()
        Call p02_BuscarDados_Entradas()
        Call p03_BuscarDados_Saidas()
        Call p04_BuscarDados_Saldo_Inicial()
        Call p05_BuscarDados_Saldo_Final()
        Call p06_BuscarTaxaSELIC()
        Call p07_BuscarReceitasDespesasFinanceiro()

        Call CalcularTotalAno()
        Call CalcularTotalMes_Entrada()
        Call CalcularTotalMes_Saida()

        'Atualiza os dados da última coluna - ANO
        Me.LSI_Total.Text = Me.LSI_1.Text
        Me.LSD_Total.Text = Me.LSD_12.Text
        Me.LSF_Total.Text = Me.LSF_12.Text

        Me.lbl_Titulo.Text = "Filial: " & Me.cbo_Filial.Text
        Me.lbl_TituloAno.Text = "Total " & Me.cbo_Ano.Value
        Call FormatarNegativoPositivo()
    End Sub

    Sub FormatarNegativoPositivo()
        'Saldo Anterior
        If CDbl(Me.LSI_1.Text) < 0 Then
            Me.LSI_1.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_1.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_2.Text) < 0 Then
            Me.LSI_2.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_2.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_3.Text) < 0 Then
            Me.LSI_3.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_3.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_4.Text) < 0 Then
            Me.LSI_4.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_4.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_5.Text) < 0 Then
            Me.LSI_5.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_5.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_6.Text) < 0 Then
            Me.LSI_6.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_6.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_7.Text) < 0 Then
            Me.LSI_7.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_7.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_8.Text) < 0 Then
            Me.LSI_8.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_8.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_9.Text) < 0 Then
            Me.LSI_9.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_9.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_10.Text) < 0 Then
            Me.LSI_10.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_10.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_11.Text) < 0 Then
            Me.LSI_11.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_11.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_12.Text) < 0 Then
            Me.LSI_12.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_12.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSI_Total.Text) < 0 Then
            Me.LSI_Total.ForeColor = Drawing.Color.Red
        Else
            Me.LSI_Total.ForeColor = Drawing.Color.Black
        End If

        'ICMS / PIS / COFINSD
        If CDbl(Me.L16_1.Text) < 0 Then
            Me.L16_1.ForeColor = Drawing.Color.Red
        Else
            Me.L16_1.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_2.Text) < 0 Then
            Me.L16_2.ForeColor = Drawing.Color.Red
        Else
            Me.L16_2.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_3.Text) < 0 Then
            Me.L16_3.ForeColor = Drawing.Color.Red
        Else
            Me.L16_3.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_4.Text) < 0 Then
            Me.L16_4.ForeColor = Drawing.Color.Red
        Else
            Me.L16_4.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_5.Text) < 0 Then
            Me.L16_5.ForeColor = Drawing.Color.Red
        Else
            Me.L16_5.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_6.Text) < 0 Then
            Me.L16_6.ForeColor = Drawing.Color.Red
        Else
            Me.L16_6.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_7.Text) < 0 Then
            Me.L16_7.ForeColor = Drawing.Color.Red
        Else
            Me.L16_7.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_8.Text) < 0 Then
            Me.L16_8.ForeColor = Drawing.Color.Red
        Else
            Me.L16_8.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_9.Text) < 0 Then
            Me.L16_9.ForeColor = Drawing.Color.Red
        Else
            Me.L16_9.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_10.Text) < 0 Then
            Me.L16_10.ForeColor = Drawing.Color.Red
        Else
            Me.L16_10.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_11.Text) < 0 Then
            Me.L16_11.ForeColor = Drawing.Color.Red
        Else
            Me.L16_11.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.L16_Total.Text) < 0 Then
            Me.L16_Total.ForeColor = Drawing.Color.Red
        Else
            Me.L16_Total.ForeColor = Drawing.Color.Black
        End If

        'Saldo do Dia
        If CDbl(Me.LSD_1.Text) < 0 Then
            Me.LSD_1.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_1.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_2.Text) < 0 Then
            Me.LSD_2.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_2.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_3.Text) < 0 Then
            Me.LSD_3.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_3.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_4.Text) < 0 Then
            Me.LSD_4.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_4.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_5.Text) < 0 Then
            Me.LSD_5.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_5.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_6.Text) < 0 Then
            Me.LSD_6.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_6.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_7.Text) < 0 Then
            Me.LSD_7.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_7.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_8.Text) < 0 Then
            Me.LSD_8.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_8.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_9.Text) < 0 Then
            Me.LSD_9.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_9.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_10.Text) < 0 Then
            Me.LSD_10.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_10.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_11.Text) < 0 Then
            Me.LSD_11.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_11.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_12.Text) < 0 Then
            Me.LSD_12.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_12.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSD_Total.Text) < 0 Then
            Me.LSD_Total.ForeColor = Drawing.Color.Red
        Else
            Me.LSD_Total.ForeColor = Drawing.Color.Black
        End If

        'Receita ou Despesa Financeira
        If CDbl(Me.LRDF_1.Text) < 0 Then
            Me.LRDF_1.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_1.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_2.Text) < 0 Then
            Me.LRDF_2.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_2.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_3.Text) < 0 Then
            Me.LRDF_3.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_3.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_4.Text) < 0 Then
            Me.LRDF_4.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_4.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_5.Text) < 0 Then
            Me.LRDF_5.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_5.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_6.Text) < 0 Then
            Me.LRDF_6.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_6.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_7.Text) < 0 Then
            Me.LRDF_7.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_7.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_8.Text) < 0 Then
            Me.LRDF_8.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_8.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_9.Text) < 0 Then
            Me.LRDF_9.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_9.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_10.Text) < 0 Then
            Me.LRDF_10.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_10.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_11.Text) < 0 Then
            Me.LRDF_11.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_11.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_12.Text) < 0 Then
            Me.LRDF_12.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_12.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LRDF_Total.Text) < 0 Then
            Me.LRDF_Total.ForeColor = Drawing.Color.Red
        Else
            Me.LRDF_Total.ForeColor = Drawing.Color.Black
        End If

        'Saldo Financeiro
        If CDbl(Me.LSF_1.Text) < 0 Then
            Me.LSF_1.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_1.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_2.Text) < 0 Then
            Me.LSF_2.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_2.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_3.Text) < 0 Then
            Me.LSF_3.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_3.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_4.Text) < 0 Then
            Me.LSF_4.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_4.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_5.Text) < 0 Then
            Me.LSF_5.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_5.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_6.Text) < 0 Then
            Me.LSF_6.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_6.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_7.Text) < 0 Then
            Me.LSF_7.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_7.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_8.Text) < 0 Then
            Me.LSF_8.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_8.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_9.Text) < 0 Then
            Me.LSF_9.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_9.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_10.Text) < 0 Then
            Me.LSF_10.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_10.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_11.Text) < 0 Then
            Me.LSF_11.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_11.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_12.Text) < 0 Then
            Me.LSF_12.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_12.ForeColor = Drawing.Color.Black
        End If

        If CDbl(Me.LSF_Total.Text) < 0 Then
            Me.LSF_Total.ForeColor = Drawing.Color.Red
        Else
            Me.LSF_Total.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Sub CalcularTotalAno()
        Me.L01_Total.Text = (CDbl(Me.L01_1.Text) + CDbl(Me.L01_2.Text) + CDbl(Me.L01_3.Text) + CDbl(Me.L01_4.Text) + CDbl(Me.L01_5.Text) + CDbl(Me.L01_6.Text) + CDbl(Me.L01_7.Text) + CDbl(Me.L01_8.Text) + CDbl(Me.L01_9.Text) + CDbl(Me.L01_10.Text) + CDbl(Me.L01_11.Text) + CDbl(Me.L01_12.Text)).ToString("n0")
        Me.L02_Total.Text = (CDbl(Me.L02_1.Text) + CDbl(Me.L02_2.Text) + CDbl(Me.L02_3.Text) + CDbl(Me.L02_4.Text) + CDbl(Me.L02_5.Text) + CDbl(Me.L02_6.Text) + CDbl(Me.L02_7.Text) + CDbl(Me.L02_8.Text) + CDbl(Me.L02_9.Text) + CDbl(Me.L02_10.Text) + CDbl(Me.L02_11.Text) + CDbl(Me.L02_12.Text)).ToString("n0")
        Me.L03_Total.Text = (CDbl(Me.L03_1.Text) + CDbl(Me.L03_2.Text) + CDbl(Me.L03_3.Text) + CDbl(Me.L03_4.Text) + CDbl(Me.L03_5.Text) + CDbl(Me.L03_6.Text) + CDbl(Me.L03_7.Text) + CDbl(Me.L03_8.Text) + CDbl(Me.L03_9.Text) + CDbl(Me.L03_10.Text) + CDbl(Me.L03_11.Text) + CDbl(Me.L03_12.Text)).ToString("n0")
        Me.L04_Total.Text = (CDbl(Me.L04_1.Text) + CDbl(Me.L04_2.Text) + CDbl(Me.L04_3.Text) + CDbl(Me.L04_4.Text) + CDbl(Me.L04_5.Text) + CDbl(Me.L04_6.Text) + CDbl(Me.L04_7.Text) + CDbl(Me.L04_8.Text) + CDbl(Me.L04_9.Text) + CDbl(Me.L04_10.Text) + CDbl(Me.L04_11.Text) + CDbl(Me.L04_12.Text)).ToString("n0")
        Me.L05_Total.Text = (CDbl(Me.L05_1.Text) + CDbl(Me.L05_2.Text) + CDbl(Me.L05_3.Text) + CDbl(Me.L05_4.Text) + CDbl(Me.L05_5.Text) + CDbl(Me.L05_6.Text) + CDbl(Me.L05_7.Text) + CDbl(Me.L05_8.Text) + CDbl(Me.L05_9.Text) + CDbl(Me.L05_10.Text) + CDbl(Me.L05_11.Text) + CDbl(Me.L05_12.Text)).ToString("n0")
        Me.L06_Total.Text = (CDbl(Me.L06_1.Text) + CDbl(Me.L06_2.Text) + CDbl(Me.L06_3.Text) + CDbl(Me.L06_4.Text) + CDbl(Me.L06_5.Text) + CDbl(Me.L06_6.Text) + CDbl(Me.L06_7.Text) + CDbl(Me.L06_8.Text) + CDbl(Me.L06_9.Text) + CDbl(Me.L06_10.Text) + CDbl(Me.L06_11.Text) + CDbl(Me.L06_12.Text)).ToString("n0")
        Me.L07_Total.Text = (CDbl(Me.L07_1.Text) + CDbl(Me.L07_2.Text) + CDbl(Me.L07_3.Text) + CDbl(Me.L07_4.Text) + CDbl(Me.L07_5.Text) + CDbl(Me.L07_6.Text) + CDbl(Me.L07_7.Text) + CDbl(Me.L07_8.Text) + CDbl(Me.L07_9.Text) + CDbl(Me.L07_10.Text) + CDbl(Me.L07_11.Text) + CDbl(Me.L07_12.Text)).ToString("n0")
        Me.L08_Total.Text = (CDbl(Me.L08_1.Text) + CDbl(Me.L08_2.Text) + CDbl(Me.L08_3.Text) + CDbl(Me.L08_4.Text) + CDbl(Me.L08_5.Text) + CDbl(Me.L08_6.Text) + CDbl(Me.L08_7.Text) + CDbl(Me.L08_8.Text) + CDbl(Me.L08_9.Text) + CDbl(Me.L08_10.Text) + CDbl(Me.L08_11.Text) + CDbl(Me.L08_12.Text)).ToString("n0")

        Me.L09_Total.Text = (CDbl(Me.L09_1.Text) + CDbl(Me.L09_2.Text) + CDbl(Me.L09_3.Text) + CDbl(Me.L09_4.Text) + CDbl(Me.L09_5.Text) + CDbl(Me.L09_6.Text) + CDbl(Me.L09_7.Text) + CDbl(Me.L09_8.Text) + CDbl(Me.L09_9.Text) + CDbl(Me.L09_10.Text) + CDbl(Me.L09_11.Text) + CDbl(Me.L09_12.Text)).ToString("n0")
        Me.L10_Total.Text = (CDbl(Me.L10_1.Text) + CDbl(Me.L10_2.Text) + CDbl(Me.L10_3.Text) + CDbl(Me.L10_4.Text) + CDbl(Me.L10_5.Text) + CDbl(Me.L10_6.Text) + CDbl(Me.L10_7.Text) + CDbl(Me.L10_8.Text) + CDbl(Me.L10_9.Text) + CDbl(Me.L10_10.Text) + CDbl(Me.L10_11.Text) + CDbl(Me.L10_12.Text)).ToString("n0")
        Me.L11_Total.Text = (CDbl(Me.L11_1.Text) + CDbl(Me.L11_2.Text) + CDbl(Me.L11_3.Text) + CDbl(Me.L11_4.Text) + CDbl(Me.L11_5.Text) + CDbl(Me.L11_6.Text) + CDbl(Me.L11_7.Text) + CDbl(Me.L11_8.Text) + CDbl(Me.L11_9.Text) + CDbl(Me.L11_10.Text) + CDbl(Me.L11_11.Text) + CDbl(Me.L11_12.Text)).ToString("n0")
        Me.L12_Total.Text = (CDbl(Me.L12_1.Text) + CDbl(Me.L12_2.Text) + CDbl(Me.L12_3.Text) + CDbl(Me.L12_4.Text) + CDbl(Me.L12_5.Text) + CDbl(Me.L12_6.Text) + CDbl(Me.L12_7.Text) + CDbl(Me.L12_8.Text) + CDbl(Me.L12_9.Text) + CDbl(Me.L12_10.Text) + CDbl(Me.L12_11.Text) + CDbl(Me.L12_12.Text)).ToString("n0")
        Me.L13_Total.Text = (CDbl(Me.L13_1.Text) + CDbl(Me.L13_2.Text) + CDbl(Me.L13_3.Text) + CDbl(Me.L13_4.Text) + CDbl(Me.L13_5.Text) + CDbl(Me.L13_6.Text) + CDbl(Me.L13_7.Text) + CDbl(Me.L13_8.Text) + CDbl(Me.L13_9.Text) + CDbl(Me.L13_10.Text) + CDbl(Me.L13_11.Text) + CDbl(Me.L13_12.Text)).ToString("n0")
        Me.L14_Total.Text = (CDbl(Me.L14_1.Text) + CDbl(Me.L14_2.Text) + CDbl(Me.L14_3.Text) + CDbl(Me.L14_4.Text) + CDbl(Me.L14_5.Text) + CDbl(Me.L14_6.Text) + CDbl(Me.L14_7.Text) + CDbl(Me.L14_8.Text) + CDbl(Me.L14_9.Text) + CDbl(Me.L14_10.Text) + CDbl(Me.L14_11.Text) + CDbl(Me.L14_12.Text)).ToString("n0")
        Me.L15_Total.Text = (CDbl(Me.L15_1.Text) + CDbl(Me.L15_2.Text) + CDbl(Me.L15_3.Text) + CDbl(Me.L15_4.Text) + CDbl(Me.L15_5.Text) + CDbl(Me.L15_6.Text) + CDbl(Me.L15_7.Text) + CDbl(Me.L15_8.Text) + CDbl(Me.L15_9.Text) + CDbl(Me.L15_10.Text) + CDbl(Me.L15_11.Text) + CDbl(Me.L15_12.Text)).ToString("n0")
        Me.L16_Total.Text = (CDbl(Me.L16_1.Text) + CDbl(Me.L16_2.Text) + CDbl(Me.L16_3.Text) + CDbl(Me.L16_4.Text) + CDbl(Me.L16_5.Text) + CDbl(Me.L16_6.Text) + CDbl(Me.L16_7.Text) + CDbl(Me.L16_8.Text) + CDbl(Me.L16_9.Text) + CDbl(Me.L16_10.Text) + CDbl(Me.L16_11.Text) + CDbl(Me.L16_12.Text)).ToString("n0")
        Me.L17_Total.Text = (CDbl(Me.L17_1.Text) + CDbl(Me.L17_2.Text) + CDbl(Me.L17_3.Text) + CDbl(Me.L17_4.Text) + CDbl(Me.L17_5.Text) + CDbl(Me.L17_6.Text) + CDbl(Me.L17_7.Text) + CDbl(Me.L17_8.Text) + CDbl(Me.L17_9.Text) + CDbl(Me.L17_10.Text) + CDbl(Me.L17_11.Text) + CDbl(Me.L17_12.Text)).ToString("n0")
        Me.L18_Total.Text = (CDbl(Me.L18_1.Text) + CDbl(Me.L18_2.Text) + CDbl(Me.L18_3.Text) + CDbl(Me.L18_4.Text) + CDbl(Me.L18_5.Text) + CDbl(Me.L18_6.Text) + CDbl(Me.L18_7.Text) + CDbl(Me.L18_8.Text) + CDbl(Me.L18_9.Text) + CDbl(Me.L18_10.Text) + CDbl(Me.L18_11.Text) + CDbl(Me.L18_12.Text)).ToString("n0")
        Me.L19_Total.Text = (CDbl(Me.L19_1.Text) + CDbl(Me.L19_2.Text) + CDbl(Me.L19_3.Text) + CDbl(Me.L19_4.Text) + CDbl(Me.L19_5.Text) + CDbl(Me.L19_6.Text) + CDbl(Me.L19_7.Text) + CDbl(Me.L19_8.Text) + CDbl(Me.L19_9.Text) + CDbl(Me.L19_10.Text) + CDbl(Me.L19_11.Text) + CDbl(Me.L19_12.Text)).ToString("n0")
        Me.L20_Total.Text = (CDbl(Me.L20_1.Text) + CDbl(Me.L20_2.Text) + CDbl(Me.L20_3.Text) + CDbl(Me.L20_4.Text) + CDbl(Me.L20_5.Text) + CDbl(Me.L20_6.Text) + CDbl(Me.L20_7.Text) + CDbl(Me.L20_8.Text) + CDbl(Me.L20_9.Text) + CDbl(Me.L20_10.Text) + CDbl(Me.L20_11.Text) + CDbl(Me.L20_12.Text)).ToString("n0")

        Me.LRDF_Total.Text = (CDbl(Me.LRDF_1.Text) + CDbl(Me.LRDF_2.Text) + CDbl(Me.LRDF_3.Text) + CDbl(Me.LRDF_4.Text) + CDbl(Me.LRDF_5.Text) + CDbl(Me.LRDF_6.Text) + CDbl(Me.LRDF_7.Text) + CDbl(Me.LRDF_8.Text) + CDbl(Me.LRDF_9.Text) + CDbl(Me.LRDF_10.Text) + CDbl(Me.LRDF_11.Text) + CDbl(Me.LRDF_12.Text)).ToString("n0")

    End Sub

    Sub CalcularTotalMes_Entrada()
        Me.LTE_1.Text = (CDbl(Me.L01_1.Text) + CDbl(Me.L02_1.Text) + CDbl(Me.L03_1.Text) + CDbl(Me.L04_1.Text) + CDbl(Me.L05_1.Text) + CDbl(Me.L06_1.Text) + CDbl(Me.L07_1.Text) + CDbl(Me.L08_1.Text)).ToString("n0")
        Me.LTE_2.Text = (CDbl(Me.L01_2.Text) + CDbl(Me.L02_2.Text) + CDbl(Me.L03_2.Text) + CDbl(Me.L04_2.Text) + CDbl(Me.L05_2.Text) + CDbl(Me.L06_2.Text) + CDbl(Me.L07_2.Text) + CDbl(Me.L08_2.Text)).ToString("n0")
        Me.LTE_3.Text = (CDbl(Me.L01_3.Text) + CDbl(Me.L02_3.Text) + CDbl(Me.L03_3.Text) + CDbl(Me.L04_3.Text) + CDbl(Me.L05_3.Text) + CDbl(Me.L06_3.Text) + CDbl(Me.L07_3.Text) + CDbl(Me.L08_3.Text)).ToString("n0")
        Me.LTE_4.Text = (CDbl(Me.L01_4.Text) + CDbl(Me.L02_4.Text) + CDbl(Me.L03_4.Text) + CDbl(Me.L04_4.Text) + CDbl(Me.L05_4.Text) + CDbl(Me.L06_4.Text) + CDbl(Me.L07_4.Text) + CDbl(Me.L08_4.Text)).ToString("n0")
        Me.LTE_5.Text = (CDbl(Me.L01_5.Text) + CDbl(Me.L02_5.Text) + CDbl(Me.L03_5.Text) + CDbl(Me.L04_5.Text) + CDbl(Me.L05_5.Text) + CDbl(Me.L06_5.Text) + CDbl(Me.L07_5.Text) + CDbl(Me.L08_5.Text)).ToString("n0")
        Me.LTE_6.Text = (CDbl(Me.L01_6.Text) + CDbl(Me.L02_6.Text) + CDbl(Me.L03_6.Text) + CDbl(Me.L04_6.Text) + CDbl(Me.L05_6.Text) + CDbl(Me.L06_6.Text) + CDbl(Me.L07_6.Text) + CDbl(Me.L08_6.Text)).ToString("n0")
        Me.LTE_7.Text = (CDbl(Me.L01_7.Text) + CDbl(Me.L02_7.Text) + CDbl(Me.L03_7.Text) + CDbl(Me.L04_7.Text) + CDbl(Me.L05_7.Text) + CDbl(Me.L06_7.Text) + CDbl(Me.L07_7.Text) + CDbl(Me.L08_7.Text)).ToString("n0")
        Me.LTE_8.Text = (CDbl(Me.L01_8.Text) + CDbl(Me.L02_8.Text) + CDbl(Me.L03_8.Text) + CDbl(Me.L04_8.Text) + CDbl(Me.L05_8.Text) + CDbl(Me.L06_8.Text) + CDbl(Me.L07_8.Text) + CDbl(Me.L08_8.Text)).ToString("n0")
        Me.LTE_9.Text = (CDbl(Me.L01_9.Text) + CDbl(Me.L02_9.Text) + CDbl(Me.L03_9.Text) + CDbl(Me.L04_9.Text) + CDbl(Me.L05_9.Text) + CDbl(Me.L06_9.Text) + CDbl(Me.L07_9.Text) + CDbl(Me.L08_9.Text)).ToString("n0")
        Me.LTE_10.Text = (CDbl(Me.L01_10.Text) + CDbl(Me.L02_10.Text) + CDbl(Me.L03_10.Text) + CDbl(Me.L04_10.Text) + CDbl(Me.L05_10.Text) + CDbl(Me.L06_10.Text) + CDbl(Me.L07_10.Text) + CDbl(Me.L08_10.Text)).ToString("n0")
        Me.LTE_11.Text = (CDbl(Me.L01_11.Text) + CDbl(Me.L02_11.Text) + CDbl(Me.L03_11.Text) + CDbl(Me.L04_11.Text) + CDbl(Me.L05_11.Text) + CDbl(Me.L06_11.Text) + CDbl(Me.L07_11.Text) + CDbl(Me.L08_11.Text)).ToString("n0")
        Me.LTE_12.Text = (CDbl(Me.L01_12.Text) + CDbl(Me.L02_12.Text) + CDbl(Me.L03_12.Text) + CDbl(Me.L04_12.Text) + CDbl(Me.L05_12.Text) + CDbl(Me.L06_12.Text) + CDbl(Me.L07_12.Text) + CDbl(Me.L08_12.Text)).ToString("n0")
        Me.LTE_Total.Text = (CDbl(Me.L01_Total.Text) + CDbl(Me.L02_Total.Text) + CDbl(Me.L03_Total.Text) + CDbl(Me.L04_Total.Text) + CDbl(Me.L05_Total.Text) + CDbl(Me.L06_Total.Text) + CDbl(Me.L07_Total.Text) + CDbl(Me.L08_Total.Text)).ToString("n0")
    End Sub

    Sub CalcularTotalMes_Saida()
        Me.LTS_1.Text = (CDbl(Me.L09_1.Text) + CDbl(Me.L10_1.Text) + CDbl(Me.L11_1.Text) + CDbl(Me.L12_1.Text) + CDbl(Me.L13_1.Text) + CDbl(Me.L14_1.Text) + CDbl(Me.L15_1.Text) + CDbl(Me.L16_1.Text) + CDbl(Me.L17_1.Text) + CDbl(Me.L18_1.Text) + CDbl(Me.L19_1.Text) + CDbl(Me.L20_1.Text)).ToString("n0")
        Me.LTS_2.Text = (CDbl(Me.L09_2.Text) + CDbl(Me.L10_2.Text) + CDbl(Me.L11_2.Text) + CDbl(Me.L12_2.Text) + CDbl(Me.L13_2.Text) + CDbl(Me.L14_2.Text) + CDbl(Me.L15_2.Text) + CDbl(Me.L16_2.Text) + CDbl(Me.L17_2.Text) + CDbl(Me.L18_2.Text) + CDbl(Me.L19_2.Text) + CDbl(Me.L20_2.Text)).ToString("n0")
        Me.LTS_3.Text = (CDbl(Me.L09_3.Text) + CDbl(Me.L10_3.Text) + CDbl(Me.L11_3.Text) + CDbl(Me.L12_3.Text) + CDbl(Me.L13_3.Text) + CDbl(Me.L14_3.Text) + CDbl(Me.L15_3.Text) + CDbl(Me.L16_3.Text) + CDbl(Me.L17_3.Text) + CDbl(Me.L18_3.Text) + CDbl(Me.L19_3.Text) + CDbl(Me.L20_3.Text)).ToString("n0")
        Me.LTS_4.Text = (CDbl(Me.L09_4.Text) + CDbl(Me.L10_4.Text) + CDbl(Me.L11_4.Text) + CDbl(Me.L12_4.Text) + CDbl(Me.L13_4.Text) + CDbl(Me.L14_4.Text) + CDbl(Me.L15_4.Text) + CDbl(Me.L16_4.Text) + CDbl(Me.L17_4.Text) + CDbl(Me.L18_4.Text) + CDbl(Me.L19_4.Text) + CDbl(Me.L20_4.Text)).ToString("n0")
        Me.LTS_5.Text = (CDbl(Me.L09_5.Text) + CDbl(Me.L10_5.Text) + CDbl(Me.L11_5.Text) + CDbl(Me.L12_5.Text) + CDbl(Me.L13_5.Text) + CDbl(Me.L14_5.Text) + CDbl(Me.L15_5.Text) + CDbl(Me.L16_5.Text) + CDbl(Me.L17_5.Text) + CDbl(Me.L18_5.Text) + CDbl(Me.L19_5.Text) + CDbl(Me.L20_5.Text)).ToString("n0")
        Me.LTS_6.Text = (CDbl(Me.L09_6.Text) + CDbl(Me.L10_6.Text) + CDbl(Me.L11_6.Text) + CDbl(Me.L12_6.Text) + CDbl(Me.L13_6.Text) + CDbl(Me.L14_6.Text) + CDbl(Me.L15_6.Text) + CDbl(Me.L16_6.Text) + CDbl(Me.L17_6.Text) + CDbl(Me.L18_6.Text) + CDbl(Me.L19_6.Text) + CDbl(Me.L20_6.Text)).ToString("n0")
        Me.LTS_7.Text = (CDbl(Me.L09_7.Text) + CDbl(Me.L10_7.Text) + CDbl(Me.L11_7.Text) + CDbl(Me.L12_7.Text) + CDbl(Me.L13_7.Text) + CDbl(Me.L14_7.Text) + CDbl(Me.L15_7.Text) + CDbl(Me.L16_7.Text) + CDbl(Me.L17_7.Text) + CDbl(Me.L18_7.Text) + CDbl(Me.L19_7.Text) + CDbl(Me.L20_7.Text)).ToString("n0")
        Me.LTS_8.Text = (CDbl(Me.L09_8.Text) + CDbl(Me.L10_8.Text) + CDbl(Me.L11_8.Text) + CDbl(Me.L12_8.Text) + CDbl(Me.L13_8.Text) + CDbl(Me.L14_8.Text) + CDbl(Me.L15_8.Text) + CDbl(Me.L16_8.Text) + CDbl(Me.L17_8.Text) + CDbl(Me.L18_8.Text) + CDbl(Me.L19_8.Text) + CDbl(Me.L20_8.Text)).ToString("n0")
        Me.LTS_9.Text = (CDbl(Me.L09_9.Text) + CDbl(Me.L10_9.Text) + CDbl(Me.L11_9.Text) + CDbl(Me.L12_9.Text) + CDbl(Me.L13_9.Text) + CDbl(Me.L14_9.Text) + CDbl(Me.L15_9.Text) + CDbl(Me.L16_9.Text) + CDbl(Me.L17_9.Text) + CDbl(Me.L18_9.Text) + CDbl(Me.L19_9.Text) + CDbl(Me.L20_9.Text)).ToString("n0")
        Me.LTS_10.Text = (CDbl(Me.L09_10.Text) + CDbl(Me.L10_10.Text) + CDbl(Me.L11_10.Text) + CDbl(Me.L12_10.Text) + CDbl(Me.L13_10.Text) + CDbl(Me.L14_10.Text) + CDbl(Me.L15_10.Text) + CDbl(Me.L16_10.Text) + CDbl(Me.L17_10.Text) + CDbl(Me.L18_10.Text) + CDbl(Me.L19_10.Text) + CDbl(Me.L20_10.Text)).ToString("n0")
        Me.LTS_11.Text = (CDbl(Me.L09_11.Text) + CDbl(Me.L10_11.Text) + CDbl(Me.L11_11.Text) + CDbl(Me.L12_11.Text) + CDbl(Me.L13_11.Text) + CDbl(Me.L14_11.Text) + CDbl(Me.L15_11.Text) + CDbl(Me.L16_11.Text) + CDbl(Me.L17_11.Text) + CDbl(Me.L18_11.Text) + CDbl(Me.L19_11.Text) + CDbl(Me.L20_11.Text)).ToString("n0")
        Me.LTS_12.Text = (CDbl(Me.L09_12.Text) + CDbl(Me.L10_12.Text) + CDbl(Me.L11_12.Text) + CDbl(Me.L12_12.Text) + CDbl(Me.L13_12.Text) + CDbl(Me.L14_12.Text) + CDbl(Me.L15_12.Text) + CDbl(Me.L16_12.Text) + CDbl(Me.L17_12.Text) + CDbl(Me.L18_12.Text) + CDbl(Me.L19_12.Text) + CDbl(Me.L20_12.Text)).ToString("n0")
        Me.LTS_Total.Text = (CDbl(Me.L09_Total.Text) + CDbl(Me.L10_Total.Text) + CDbl(Me.L11_Total.Text) + CDbl(Me.L12_Total.Text) + CDbl(Me.L13_Total.Text) + CDbl(Me.L14_Total.Text) + CDbl(Me.L15_Total.Text) + CDbl(Me.L16_Total.Text) + CDbl(Me.L17_Total.Text) + CDbl(Me.L18_Total.Text) + CDbl(Me.L19_Total.Text) + CDbl(Me.L20_Total.Text)).ToString("n0")
    End Sub

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_Filial.SelectedIndexChanged
        Call Atualizar()
    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbo_Ano.SelectedIndexChanged
        Call Atualizar()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Call PreencherFilial()
        If Month(Now()) > 1 Then
            Me.cbo_Ano.Text = Year(Now())
        Else
            Me.cbo_Ano.Text = Year(Now()) - 1
        End If
        Me.cbo_Filial.Value = 1
        Call Atualizar()
    End Sub

    Sub PreencherFilial()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT [Filial], [Desc] FROM [listLojasAdm] ORDER BY [Filial]"

        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.cbo_Filial.DataSource = objDr
        Me.cbo_Filial.DataBind()
        Conn.Close()
    End Sub

    Sub BuscaDados(ByVal iMes As String, ByVal iConta As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarResumoExcel", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        comando.Parameters.Add(New SqlParameter("@idConta", Data.SqlDbType.TinyInt))
        comando.Parameters("@idConta").Value = iConta

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iConta
                    Case 1  'Depósito
                        Select Case iMes
                            Case 1
                                Me.L01_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L01_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L01_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L01_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L01_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L01_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L01_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L01_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L01_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L01_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L01_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L01_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 2  'Créditos Pré-Datados
                        Select Case iMes
                            Case 1
                                Me.L02_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L02_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L02_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L02_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L02_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L02_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L02_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L02_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L02_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L02_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L02_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L02_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 3  'Créditos Ticket's/Cartões
                        Select Case iMes
                            Case 1
                                Me.L03_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L03_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L03_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L03_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L03_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L03_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L03_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L03_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L03_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L03_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L03_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L03_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 4  'ATN's Remetidos
                        Select Case iMes
                            Case 1
                                Me.L04_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L04_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L04_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L04_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L04_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L04_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L04_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L04_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L04_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L04_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L04_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L04_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 5  'Transf. Merc. Saídas
                        Select Case iMes
                            Case 1
                                Me.L05_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L05_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L05_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L05_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L05_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L05_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L05_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L05_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L05_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L05_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L05_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L05_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 6  'Créditos Cont. a Receber
                        Select Case iMes
                            Case 1
                                Me.L06_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L06_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L06_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L06_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L06_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L06_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L06_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L06_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L06_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L06_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L06_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L06_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 7  'Créditos Caixa Matriz
                        Select Case iMes
                            Case 1
                                Me.L07_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L07_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L07_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L07_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L07_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L07_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L07_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L07_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L07_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L07_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L07_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L07_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 8  'Outros Créditos
                        Select Case iMes
                            Case 1
                                Me.L08_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L08_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L08_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L08_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L08_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L08_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L08_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L08_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L08_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L08_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L08_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L08_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 9  'Débitos Cont. à Pagar
                        Select Case iMes
                            Case 1
                                Me.L09_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L09_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L09_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L09_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L09_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L09_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L09_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L09_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L09_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L09_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L09_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L09_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 10  'Débitos do C/C Caixa
                        Select Case iMes
                            Case 1
                                Me.L10_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L10_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L10_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L10_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L10_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L10_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L10_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L10_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L10_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L10_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L10_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L10_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 11  ' Débitos do C/C Matriz 
                        Select Case iMes
                            Case 1
                                Me.L11_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L11_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L11_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L11_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L11_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L11_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L11_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L11_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L11_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L11_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L11_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L11_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 12  ' Transf. Merc. Entrada  
                        Select Case iMes
                            Case 1
                                Me.L12_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L12_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L12_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L12_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L12_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L12_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L12_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L12_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L12_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L12_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L12_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L12_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 13  ' ATNS recebidos   
                        Select Case iMes
                            Case 1
                                Me.L13_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L13_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L13_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L13_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L13_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L13_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L13_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L13_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L13_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L13_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L13_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L13_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 14  '  Rateio Corporação    
                        Select Case iMes
                            Case 1
                                Me.L14_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L14_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L14_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L14_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L14_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L14_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L14_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L14_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L14_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L14_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L14_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L14_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 19 'Outros - Folha de Pagamento
                        Select Case iMes
                            Case 1
                                Me.L19_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L19_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L19_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L19_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L19_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L19_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L19_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L19_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L19_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L19_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L19_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L19_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 20 'Importação
                        Select Case iMes
                            Case 1
                                Me.L20_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L20_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L20_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L20_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L20_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L20_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L20_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L20_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L20_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L20_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L20_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L20_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                End Select
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Public Sub UserMsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
        Catch ex As Exception

        End Try
    End Sub

    Sub BuscaSaldoInicial(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarSaldoInicial", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.LSI_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 2
                        Me.LSI_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 3
                        Me.LSI_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 4
                        Me.LSI_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 5
                        Me.LSI_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 6
                        Me.LSI_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 7
                        Me.LSI_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 8
                        Me.LSI_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 9
                        Me.LSI_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 10
                        Me.LSI_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 11
                        Me.LSI_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 12
                        Me.LSI_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaSaldoFinal(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarSaldoFinal", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.LSD_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_1.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 2
                        Me.LSD_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_2.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 3
                        Me.LSD_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_3.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 4
                        Me.LSD_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_4.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 5
                        Me.LSD_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_5.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 6
                        Me.LSD_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_6.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 7
                        Me.LSD_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_7.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 8
                        Me.LSD_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_8.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 9
                        Me.LSD_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_9.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 10
                        Me.LSD_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_10.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 11
                        Me.LSD_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_11.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                    Case 12
                        Me.LSD_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSF_12.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaReal(ByVal iMes As String, ByVal iCod As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspReaMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iCod
                    Case 38 'Rateio de Coorporação
                        Select Case iMes
                            Case 1
                                Me.L14_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L14_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L14_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L14_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L14_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L14_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L14_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L14_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L14_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L14_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L14_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L14_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 28 'Aluguél
                        Select Case iMes
                            Case 1
                                Me.L15_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L15_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L15_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L15_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L15_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L15_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L15_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L15_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L15_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L15_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L15_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L15_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaParaEliseu_ReaSub(ByVal iMes As String, ByVal iCod As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarParaEliseu_ReaSub", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iCod
                    Case 17 'Despesas Rateadas
                        Select Case iMes
                            Case 1
                                Me.L17_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L17_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L17_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L17_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L17_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L17_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L17_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L17_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L17_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L17_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L17_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L17_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 18 'Serviços Públicos
                        Select Case iMes
                            Case 1
                                Me.L18_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 2
                                Me.L18_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 3
                                Me.L18_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 4
                                Me.L18_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 5
                                Me.L18_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 6
                                Me.L18_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 7
                                Me.L18_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 8
                                Me.L18_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 9
                                Me.L18_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 10
                                Me.L18_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 11
                                Me.L18_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case 12
                                Me.L18_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaImpostos(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarParaEliseu_Impostos", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.L16_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 2
                        Me.L16_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 3
                        Me.L16_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 4
                        Me.L16_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 5
                        Me.L16_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 6
                        Me.L16_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 7
                        Me.L16_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 8
                        Me.L16_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 9
                        Me.L16_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 10
                        Me.L16_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 11
                        Me.L16_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 12
                        Me.L16_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaTaxaSELIC(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarSELIC", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.LTM_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 2
                        Me.LTM_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 3
                        Me.LTM_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 4
                        Me.LTM_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 5
                        Me.LTM_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 6
                        Me.LTM_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 7
                        Me.LTM_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 8
                        Me.LTM_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 9
                        Me.LTM_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 10
                        Me.LTM_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 11
                        Me.LTM_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                    Case 12
                        Me.LTM_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n4") * 100
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaRecDesp(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarRecDesp", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.LRDF_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 2
                        Me.LRDF_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 3
                        Me.LRDF_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 4
                        Me.LRDF_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 5
                        Me.LRDF_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 6
                        Me.LRDF_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 7
                        Me.LRDF_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 8
                        Me.LRDF_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 9
                        Me.LRDF_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 10
                        Me.LRDF_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 11
                        Me.LRDF_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 12
                        Me.LRDF_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaTransfMercadoriaEntrada(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_Buscar_TransfMercadoriaEntrada_Mes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cbo_Ano.Value

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cbo_Filial.Value

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iMes
                    Case 1
                        Me.L12_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 2
                        Me.L12_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 3
                        Me.L12_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 4
                        Me.L12_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 5
                        Me.L12_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 6
                        Me.L12_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 7
                        Me.L12_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 8
                        Me.L12_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 9
                        Me.L12_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 10
                        Me.L12_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 11
                        Me.L12_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    Case 12
                        Me.L12_12.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

End Class
