Imports System.Math
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmResumo1
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str
    Dim no As Double
    Dim varDepto As String

    Sub Atualizar()

        Call BuscaInformaoesIniciais()

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

        '*****************************  E N T R A D A S  ****************************************
        'Depósitos
        Call BuscaDados(Me.LDia_1.Text, 1)
        Call BuscaDados(Me.LDia_2.Text, 1)
        Call BuscaDados(Me.LDia_3.Text, 1)
        Call BuscaDados(Me.LDia_4.Text, 1)
        Call BuscaDados(Me.LDia_5.Text, 1)
        Call BuscaDados(Me.LDia_6.Text, 1)
        Call BuscaDados(Me.LDia_7.Text, 1)
        Call BuscaDados(Me.LDia_8.Text, 1)
        Call BuscaDados(Me.LDia_9.Text, 1)
        Call BuscaDados(Me.LDia_10.Text, 1)
        Call BuscaDados(Me.LDia_11.Text, 1)

        'Créditos Pré-Datados
        Call BuscaDados(Me.LDia_1.Text, 2)
        Call BuscaDados(Me.LDia_2.Text, 2)
        Call BuscaDados(Me.LDia_3.Text, 2)
        Call BuscaDados(Me.LDia_4.Text, 2)
        Call BuscaDados(Me.LDia_5.Text, 2)
        Call BuscaDados(Me.LDia_6.Text, 2)
        Call BuscaDados(Me.LDia_7.Text, 2)
        Call BuscaDados(Me.LDia_8.Text, 2)
        Call BuscaDados(Me.LDia_9.Text, 2)
        Call BuscaDados(Me.LDia_10.Text, 2)
        Call BuscaDados(Me.LDia_11.Text, 2)

        'Créditos Pré-Datados
        Call BuscaDados(Me.LDia_1.Text, 3)
        Call BuscaDados(Me.LDia_2.Text, 3)
        Call BuscaDados(Me.LDia_3.Text, 3)
        Call BuscaDados(Me.LDia_4.Text, 3)
        Call BuscaDados(Me.LDia_5.Text, 3)
        Call BuscaDados(Me.LDia_6.Text, 3)
        Call BuscaDados(Me.LDia_7.Text, 3)
        Call BuscaDados(Me.LDia_8.Text, 3)
        Call BuscaDados(Me.LDia_9.Text, 3)
        Call BuscaDados(Me.LDia_10.Text, 3)
        Call BuscaDados(Me.LDia_11.Text, 3)

        'Créditos Pré-Datados
        Call BuscaDados(Me.LDia_1.Text, 4)
        Call BuscaDados(Me.LDia_2.Text, 4)
        Call BuscaDados(Me.LDia_3.Text, 4)
        Call BuscaDados(Me.LDia_4.Text, 4)
        Call BuscaDados(Me.LDia_5.Text, 4)
        Call BuscaDados(Me.LDia_6.Text, 4)
        Call BuscaDados(Me.LDia_7.Text, 4)
        Call BuscaDados(Me.LDia_8.Text, 4)
        Call BuscaDados(Me.LDia_9.Text, 4)
        Call BuscaDados(Me.LDia_10.Text, 4)
        Call BuscaDados(Me.LDia_11.Text, 4)

        'Transf. Merc. Saídas
        Call BuscaDados(Me.LDia_1.Text, 5)
        Call BuscaDados(Me.LDia_2.Text, 5)
        Call BuscaDados(Me.LDia_3.Text, 5)
        Call BuscaDados(Me.LDia_4.Text, 5)
        Call BuscaDados(Me.LDia_5.Text, 5)
        Call BuscaDados(Me.LDia_6.Text, 5)
        Call BuscaDados(Me.LDia_7.Text, 5)
        Call BuscaDados(Me.LDia_8.Text, 5)
        Call BuscaDados(Me.LDia_9.Text, 5)
        Call BuscaDados(Me.LDia_10.Text, 5)
        Call BuscaDados(Me.LDia_11.Text, 5)

        'Créditos Cont. a Receber
        Call BuscaDados(Me.LDia_1.Text, 6)
        Call BuscaDados(Me.LDia_2.Text, 6)
        Call BuscaDados(Me.LDia_3.Text, 6)
        Call BuscaDados(Me.LDia_4.Text, 6)
        Call BuscaDados(Me.LDia_5.Text, 6)
        Call BuscaDados(Me.LDia_6.Text, 6)
        Call BuscaDados(Me.LDia_7.Text, 6)
        Call BuscaDados(Me.LDia_8.Text, 6)
        Call BuscaDados(Me.LDia_9.Text, 6)
        Call BuscaDados(Me.LDia_10.Text, 6)
        Call BuscaDados(Me.LDia_11.Text, 6)

        'Créditos Caixa Matriz
        Call BuscaDados(Me.LDia_1.Text, 7)
        Call BuscaDados(Me.LDia_2.Text, 7)
        Call BuscaDados(Me.LDia_3.Text, 7)
        Call BuscaDados(Me.LDia_4.Text, 7)
        Call BuscaDados(Me.LDia_5.Text, 7)
        Call BuscaDados(Me.LDia_6.Text, 7)
        Call BuscaDados(Me.LDia_7.Text, 7)
        Call BuscaDados(Me.LDia_8.Text, 7)
        Call BuscaDados(Me.LDia_9.Text, 7)
        Call BuscaDados(Me.LDia_10.Text, 7)
        Call BuscaDados(Me.LDia_11.Text, 7)

        'Outros Créditos
        Call BuscaDados(Me.LDia_1.Text, 8)
        Call BuscaDados(Me.LDia_2.Text, 8)
        Call BuscaDados(Me.LDia_3.Text, 8)
        Call BuscaDados(Me.LDia_4.Text, 8)
        Call BuscaDados(Me.LDia_5.Text, 8)
        Call BuscaDados(Me.LDia_6.Text, 8)
        Call BuscaDados(Me.LDia_7.Text, 8)
        Call BuscaDados(Me.LDia_8.Text, 8)
        Call BuscaDados(Me.LDia_9.Text, 8)
        Call BuscaDados(Me.LDia_10.Text, 8)
        Call BuscaDados(Me.LDia_11.Text, 8)

        ''***************************  S A Í D A S  *****************************************************
        'Débitos Cont. à Pagar
        Call BuscaDados(Me.LDia_1.Text, 9)
        Call BuscaDados(Me.LDia_2.Text, 9)
        Call BuscaDados(Me.LDia_3.Text, 9)
        Call BuscaDados(Me.LDia_4.Text, 9)
        Call BuscaDados(Me.LDia_5.Text, 9)
        Call BuscaDados(Me.LDia_6.Text, 9)
        Call BuscaDados(Me.LDia_7.Text, 9)
        Call BuscaDados(Me.LDia_8.Text, 9)
        Call BuscaDados(Me.LDia_9.Text, 9)
        Call BuscaDados(Me.LDia_10.Text, 9)
        Call BuscaDados(Me.LDia_11.Text, 9)

        'Débitos do C/C Caixa
        Call BuscaDados(Me.LDia_1.Text, 10)
        Call BuscaDados(Me.LDia_2.Text, 10)
        Call BuscaDados(Me.LDia_3.Text, 10)
        Call BuscaDados(Me.LDia_4.Text, 10)
        Call BuscaDados(Me.LDia_5.Text, 10)
        Call BuscaDados(Me.LDia_6.Text, 10)
        Call BuscaDados(Me.LDia_7.Text, 10)
        Call BuscaDados(Me.LDia_8.Text, 10)
        Call BuscaDados(Me.LDia_9.Text, 10)
        Call BuscaDados(Me.LDia_10.Text, 10)
        Call BuscaDados(Me.LDia_11.Text, 10)

        '11 - Débitos do C/C Matriz 
        Call BuscaDados(Me.LDia_1.Text, 11)
        Call BuscaDados(Me.LDia_2.Text, 11)
        Call BuscaDados(Me.LDia_3.Text, 11)
        Call BuscaDados(Me.LDia_4.Text, 11)
        Call BuscaDados(Me.LDia_5.Text, 11)
        Call BuscaDados(Me.LDia_6.Text, 11)
        Call BuscaDados(Me.LDia_7.Text, 11)
        Call BuscaDados(Me.LDia_8.Text, 11)
        Call BuscaDados(Me.LDia_9.Text, 11)
        Call BuscaDados(Me.LDia_10.Text, 11)
        Call BuscaDados(Me.LDia_11.Text, 11)

        '12 - Transf. Merc. Entrada 
        Call BuscaDados(Me.LDia_1.Text, 12)
        Call BuscaDados(Me.LDia_2.Text, 12)
        Call BuscaDados(Me.LDia_3.Text, 12)
        Call BuscaDados(Me.LDia_4.Text, 12)
        Call BuscaDados(Me.LDia_5.Text, 12)
        Call BuscaDados(Me.LDia_6.Text, 12)
        Call BuscaDados(Me.LDia_7.Text, 12)
        Call BuscaDados(Me.LDia_8.Text, 12)
        Call BuscaDados(Me.LDia_9.Text, 12)
        Call BuscaDados(Me.LDia_10.Text, 12)
        Call BuscaDados(Me.LDia_11.Text, 12)

        '13 - Transf. Merc. Entrada 
        Call BuscaDados(Me.LDia_1.Text, 13)
        Call BuscaDados(Me.LDia_2.Text, 13)
        Call BuscaDados(Me.LDia_3.Text, 13)
        Call BuscaDados(Me.LDia_4.Text, 13)
        Call BuscaDados(Me.LDia_5.Text, 13)
        Call BuscaDados(Me.LDia_6.Text, 13)
        Call BuscaDados(Me.LDia_7.Text, 13)
        Call BuscaDados(Me.LDia_8.Text, 13)
        Call BuscaDados(Me.LDia_9.Text, 13)
        Call BuscaDados(Me.LDia_10.Text, 13)
        Call BuscaDados(Me.LDia_11.Text, 13)

        '16 - Impostos
        Call BuscaImpostos()

        '14 - Rateio da Corporação
        Call BuscaReal(38)

        '15 - Aluguél
        Call BuscaReal(28)

        '17 - Despesas Rateadas
        Call BuscaParaEliseu_ReaSub(17)

        '18 - Serviços Públicos
        Call BuscaParaEliseu_ReaSub(18)

        '19 - Outros
        Call BuscaDados(Me.LDia_1.Text, 19)
        Call BuscaDados(Me.LDia_2.Text, 19)
        Call BuscaDados(Me.LDia_3.Text, 19)
        Call BuscaDados(Me.LDia_4.Text, 19)
        Call BuscaDados(Me.LDia_5.Text, 19)
        Call BuscaDados(Me.LDia_6.Text, 19)
        Call BuscaDados(Me.LDia_7.Text, 19)
        Call BuscaDados(Me.LDia_8.Text, 19)
        Call BuscaDados(Me.LDia_9.Text, 19)
        Call BuscaDados(Me.LDia_10.Text, 19)
        Call BuscaDados(Me.LDia_11.Text, 19)

        '20 - Importação
        Call BuscaManual(Me.LDia_1.Text, 20)
        Call BuscaManual(Me.LDia_2.Text, 20)
        Call BuscaManual(Me.LDia_3.Text, 20)
        Call BuscaManual(Me.LDia_4.Text, 20)
        Call BuscaManual(Me.LDia_5.Text, 20)
        Call BuscaManual(Me.LDia_6.Text, 20)
        Call BuscaManual(Me.LDia_7.Text, 20)
        Call BuscaManual(Me.LDia_8.Text, 20)
        Call BuscaManual(Me.LDia_9.Text, 20)
        Call BuscaManual(Me.LDia_10.Text, 20)
        Call BuscaManual(Me.LDia_11.Text, 20)


        '****************************  S A L D O S  ***************************************
        'Saldo Inicial
        Call BuscaSaldoInicial(Me.LDia_1.Text)
        Call BuscaSaldoInicial(Me.LDia_2.Text)
        Call BuscaSaldoInicial(Me.LDia_3.Text)
        Call BuscaSaldoInicial(Me.LDia_4.Text)
        Call BuscaSaldoInicial(Me.LDia_5.Text)
        Call BuscaSaldoInicial(Me.LDia_6.Text)
        Call BuscaSaldoInicial(Me.LDia_7.Text)
        Call BuscaSaldoInicial(Me.LDia_8.Text)
        Call BuscaSaldoInicial(Me.LDia_9.Text)
        Call BuscaSaldoInicial(Me.LDia_10.Text)
        Call BuscaSaldoInicial(Me.LDia_11.Text)

        Call CalcularTotalMes_Entrada()
        Call CalcularTotalMes_Saida()

        Me.lbl_Titulo.Text = "Filial: " & cboFilial.CallFilialNome
        Call FormatarNegativoPositivo()
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

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dt As Date
            dt = CDate(Now())

            cboFilial.CallFilial = 1
            Session("sFILIAL") = 1
            Me.Calendar1.Date = DateAndTime.Now()
            Call Atualizar()
        End If

    End Sub

    Sub BuscaDados(ByVal iDia As String, ByVal iConta As String)
        Dim dt As Date
        Dim con As New SqlConnection(strConn)
        dt = Me.txtData.Text
        Dim comando As New SqlCommand("uspResFin_Buscar_Grupo_Dia", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
        comando.Parameters("@Dia").Value = iDia

        comando.Parameters.Add(New SqlParameter("@idConta", SqlDbType.TinyInt))
        comando.Parameters("@idConta").Value = iConta

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iConta
                    Case 1  'Depósito
                        Select Case iDia
                            Case dt
                                Me.L01_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L01_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L01_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L01_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L01_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L01_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L01_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L01_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L01_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L01_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L01_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 2  'Créditos Pré-Datados
                        Select Case iDia
                            Case dt
                                Me.L02_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L02_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L02_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L02_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L02_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L02_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L02_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L02_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L02_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L02_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L02_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 3  'Créditos Ticket's/Cartões
                        Select Case iDia
                            Case dt
                                Me.L03_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L03_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L03_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L03_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L03_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L03_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L03_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L03_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L03_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L03_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L03_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 4  'ATN's Remetidos
                        Select Case iDia
                            Case dt
                                Me.L04_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L04_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L04_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L04_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L04_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L04_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L04_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L04_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L04_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L04_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L04_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 5  'Transf. Merc. Saídas
                        Select Case iDia
                            Case dt
                                Me.L05_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L05_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L05_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L05_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L05_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L05_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L05_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L05_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L05_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L05_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L05_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 6  'Créditos Cont. a Receber
                        Select Case iDia
                            Case dt
                                Me.L06_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L06_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L06_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L06_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L06_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L06_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L06_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L06_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L06_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L06_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L06_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 7  'Créditos Caixa Matriz
                        Select Case iDia
                            Case dt
                                Me.L07_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L07_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L07_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L07_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L07_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L07_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L07_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L07_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L07_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L07_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L07_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 8  'Outros Créditos
                        Select Case iDia
                            Case dt
                                Me.L08_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L08_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L08_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L08_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L08_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L08_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L08_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L08_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L08_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L08_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L08_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 9  'Débitos Cont. à Pagar
                        Select Case iDia
                            Case dt
                                Me.L09_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L09_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L09_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L09_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L09_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L09_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L09_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L09_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L09_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L09_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L09_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 10  'Débitos do C/C Caixa
                        Select Case iDia
                            Case dt
                                Me.L10_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L10_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L10_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L10_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L10_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L10_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L10_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L10_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L10_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L10_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L10_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 11  ' Débitos do C/C Matriz 
                        Select Case iDia
                            Case dt
                                Me.L11_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L11_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L11_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L11_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L11_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L11_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L11_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L11_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L11_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L11_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L11_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 12  ' Transf. Merc. Entrada  
                        Select Case iDia
                            Case dt
                                Me.L12_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L12_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L12_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L12_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L12_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L12_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L12_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L12_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L12_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L12_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L12_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select

                    Case 13  ' ATNS recebidos   
                        Select Case iDia
                            Case dt
                                Me.L13_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L13_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L13_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L13_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L13_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L13_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L13_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L13_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L13_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L13_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L13_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        End Select
                    Case 19  'Outros
                        Select Case iDia
                            Case dt
                                Me.L19_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L19_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L19_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L19_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L19_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L19_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L19_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L19_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L19_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L19_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L19_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
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

    Sub BuscaSaldoInicial(ByVal iDia As String)
        Dim dt As Date
        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscarSaldoInicial_Dia", con)
        comando.CommandType = CommandType.StoredProcedure

        dt = Me.txtData.Text

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
        comando.Parameters("@Dia").Value = iDia

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Select Case iDia
                    Case dt
                        Me.LSI_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_1.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_1.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_1.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_1.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(1)
                        Me.LSI_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_2.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_2.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_2.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_2.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(2)
                        Me.LSI_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_3.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_3.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_3.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_3.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(3)
                        Me.LSI_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_4.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_4.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_4.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_4.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(4)
                        Me.LSI_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_5.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_5.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_5.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_5.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(5)
                        Me.LSI_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_6.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_6.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_6.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_6.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(6)
                        Me.LSI_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_7.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_7.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_7.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_7.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(7)
                        Me.LSI_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_8.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_8.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_8.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_8.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(8)
                        Me.LSI_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_9.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_9.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_9.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_9.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(9)
                        Me.LSI_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_10.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_10.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_10.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_10.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                    Case dt.AddDays(10)
                        Me.LSI_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Me.LSD_11.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
                        Me.LTM_11.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n6")
                        Me.LRDF_11.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
                        Me.LSF_11.Text = reader5.GetSqlMoney(4).ToDouble.ToString("n0")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Private Function GetLastDayOfMonth(ByVal dtDate As DateTime) As DateTime
        Dim dtTo As DateTime = dtDate
        dtTo = dtTo.AddMonths(1)
        dtTo = dtTo.AddDays(-(dtTo.Day))
        Return dtTo
    End Function

    Sub BuscaImpostos()

        Dim dt As Date, dDate As Date
        Dim con As New SqlConnection(strConn)

        dt = GetLastDayOfMonth(Me.txtData.Text).ToShortDateString()

        Dim comando As New SqlCommand("uspResFin_BuscarParaEliseu_Impostos", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Month(dt)

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Year(dt)

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        dDate = Me.txtData.Text

        If dDate.Day = 23 Then 'Se o dia for maior que o dia 27, então executa
            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Select Case dt.Day
                        Case 28  'Dia 28                        
                            Me.L16_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Case 29  'Dia 29 
                            Me.L16_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Case 30  'Dia 30
                            Me.L16_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                        Case 31  'Dia 31
                            Me.L16_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                    End Select
                End While

            Catch ex As Exception
                Beep()
                UserMsgBox(Me, ex.Message)

            Finally
                con.Close()
            End Try
        End If
    End Sub

    Sub BuscaManual(ByVal iDia As Date, ByVal iConta As String)

        Dim dt As Date
        Dim con As New SqlConnection(strConn)

        dt = Me.txtData.Text

        Dim comando As New SqlCommand("uspResFin_Buscar_Manual_Dia", con)
        comando.CommandType = CommandType.StoredProcedure

        If iConta = 16 Then
            comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
            comando.Parameters("@Dia").Value = iDia.AddDays(-31)
        Else
            comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
            comando.Parameters("@Dia").Value = iDia
        End If

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = iConta

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iConta
                    Case 20  'Importação
                        Select Case iDia
                            Case dt
                                Me.L20_1.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(1)
                                Me.L20_2.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(2)
                                Me.L20_3.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(3)
                                Me.L20_4.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(4)
                                Me.L20_5.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(5)
                                Me.L20_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(6)
                                Me.L20_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(7)
                                Me.L20_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(8)
                                Me.L20_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(9)
                                Me.L20_10.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            Case dt.AddDays(10)
                                Me.L20_11.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
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

    Sub BuscaInformaoesIniciais()

        Dim dt As Date
        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand("uspResFin_BuscaDatas", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.SmallDateTime))
        comando.Parameters("@Dia").Value = CDate(Me.Calendar1.Text)

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Me.lblDia.Text = reader5.GetSqlByte(2).ToString
                Me.txtData.Text = reader5.GetSqlDateTime(3)

            End While

            dt = Me.txtData.Text
            Me.LDia_1.Text = dt
            Me.LDia_2.Text = dt.AddDays(1)
            Me.LDia_3.Text = dt.AddDays(2)
            Me.LDia_4.Text = dt.AddDays(3)
            Me.LDia_5.Text = dt.AddDays(4)
            Me.LDia_6.Text = dt.AddDays(5)
            Me.LDia_7.Text = dt.AddDays(6)
            Me.LDia_8.Text = dt.AddDays(7)
            Me.LDia_9.Text = dt.AddDays(8)
            Me.LDia_10.Text = dt.AddDays(9)
            Me.LDia_11.Text = dt.AddDays(10)

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscaReal(ByVal iCod As String)

        Dim dt As Date, dDate As Date
        Dim con As New SqlConnection(strConn)
        dt = GetLastDayOfMonth(Me.txtData.Text).ToShortDateString()

        Dim comando As New SqlCommand("uspReaMesBusca", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Year(dt)

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Month(dt)

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        dDate = Me.txtData.Text

        If dDate.Day = 23 Then 'Se o dia for maior que o dia 27, então executa
            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Select Case iCod
                        Case 38 'Rateio de Coorporação
                            Select Case dt.Day
                                Case 28  'Dia 28                        
                                    Me.L14_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 29  'Dia 29 
                                    Me.L14_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 30  'Dia 30
                                    Me.L14_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 31  'Dia 31
                                    Me.L14_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            End Select
                        Case 28 'Aluguél
                            Select Case dt.Day
                                Case 28  'Dia 28                        
                                    Me.L15_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 29  'Dia 29 
                                    Me.L15_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 30  'Dia 30
                                    Me.L15_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 31  'Dia 31
                                    Me.L15_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            End Select
                    End Select
                End While

            Catch ex As Exception
                Beep()
                UserMsgBox(Me, ex.Message)

            Finally
                con.Close()
            End Try
        End If

    End Sub

    Sub BuscaParaEliseu_ReaSub(ByVal iCod As String)

        Dim dt As Date, dDate As Date
        Dim con As New SqlConnection(strConn)
        dt = GetLastDayOfMonth(Me.txtData.Text).ToShortDateString()

        Dim comando As New SqlCommand("uspResFin_BuscarParaEliseu_ReaSub", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Year(dt)

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Month(dt)

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Session("sFILIAL")

        dDate = Me.txtData.Text

        If dDate.Day = 23 Then 'Se o dia for maior que o dia 27, então executa
            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Select Case iCod
                        Case 17 'Despesas Rateadas
                            Select Case dt.Day
                                Case 28  'Dia 28                        
                                    Me.L17_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 29  'Dia 29 
                                    Me.L17_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 30  'Dia 30
                                    Me.L17_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 31  'Dia 31
                                    Me.L17_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            End Select
                        Case 18 'Servuços Públicos
                            Select Case dt.Day
                                Case 28  'Dia 28                        
                                    Me.L18_6.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 29  'Dia 29 
                                    Me.L18_7.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 30  'Dia 30
                                    Me.L18_8.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                                Case 31  'Dia 31
                                    Me.L18_9.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
                            End Select
                    End Select
                End While

            Catch ex As Exception
                Beep()
                UserMsgBox(Me, ex.Message)

            Finally
                con.Close()
            End Try
        End If

    End Sub

    Protected Sub Calendar1_DateChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.DateChanged
        Call Atualizar()
    End Sub


    Sub RedNegative(ByVal myLabel As Label)
        If CDbl(myLabel.Text) < 0 Then
            myLabel.ForeColor = Drawing.Color.Red
        Else
            myLabel.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Sub FormatarNegativoPositivo()
        'Saldo Anterior

        RedNegative(LSI_1)
        RedNegative(LSI_2)
        RedNegative(LSI_3)
        RedNegative(LSI_4)
        RedNegative(LSI_5)
        RedNegative(LSI_6)
        RedNegative(LSI_7)
        RedNegative(LSI_8)
        RedNegative(LSI_9)
        RedNegative(LSI_10)
        RedNegative(LSI_11)

        'ICMS / PIS / COFINSD
        RedNegative(L16_1)
        RedNegative(L16_2)
        RedNegative(L16_3)
        RedNegative(L16_4)
        RedNegative(L16_5)
        RedNegative(L16_6)
        RedNegative(L16_7)
        RedNegative(L16_8)
        RedNegative(L16_9)
        RedNegative(L16_10)
        RedNegative(L16_11)

        'Saldo do Dia
        RedNegative(LSD_1)
        RedNegative(LSD_2)
        RedNegative(LSD_3)
        RedNegative(LSD_4)
        RedNegative(LSD_5)
        RedNegative(LSD_6)
        RedNegative(LSD_7)
        RedNegative(LSD_8)
        RedNegative(LSD_9)
        RedNegative(LSD_10)
        RedNegative(LSD_11)

        'Receita ou Despesa Financeira
        RedNegative(LRDF_1)
        RedNegative(LRDF_2)
        RedNegative(LRDF_3)
        RedNegative(LRDF_4)
        RedNegative(LRDF_5)
        RedNegative(LRDF_6)
        RedNegative(LRDF_7)
        RedNegative(LRDF_8)
        RedNegative(LRDF_9)
        RedNegative(LRDF_10)
        RedNegative(LRDF_11)

        'Saldo Financeiro
        RedNegative(LSF_1)
        RedNegative(LSF_2)
        RedNegative(LSF_3)
        RedNegative(LSF_4)
        RedNegative(LSF_5)
        RedNegative(LSF_6)
        RedNegative(LSF_7)
        RedNegative(LSF_8)
        RedNegative(LSF_9)
        RedNegative(LSF_10)
        RedNegative(LSF_11)

    End Sub


End Class
