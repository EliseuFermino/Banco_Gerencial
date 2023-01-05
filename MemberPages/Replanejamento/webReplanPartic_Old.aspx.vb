Imports System.Data
Imports System.Data.SqlClient


Partial Class MemberPages_Replanejamento_webReplanPartic_Old
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect
    Dim oVEM As New VendaEmpresaMes
    Dim varVendaRevista As Double

    Private Sub Atualizar()
        Call LimparCampos()
        Call BuscarVendaSecao()
        Call BuscarVendaSecaoReal_AA()
        Call BuscarVendaSecaoReal_M1()
        Call BuscarVendaSecaoReal_M2()
        Call BuscarVendaSecaoReal_M3()
        Call CalcularDeptosInicio()
        Call CalcularDepartamentoHistorico_AA()
        Call CalcularDepartamentoHistorico_M1()
        Call CalcularDepartamentoHistorico_M2()
        Call CalcularDepartamentoHistorico_M3()

        Call Meta_Fixa()

        Calcular_Sugestao()
        CalcularDepartamentoSugestao_Percentual()
        CalcularDepartamentoSugestao_Valor()
        Calcular_Participacao_Sugestao()

        CalcularDiferencaInicial()
        CalcularDeptoDiferenca()

        oVEM.BuscaRevGrupoMes(1, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.VendaRevista.Text = oVEM.vlrRev

        ''RECALCULAR PARTICIPACOES

        'Recalcular_Percentual(Secao_30, txtSecao_30)
        'Recalcular_Percentual(Secao_31, txtSecao_31)
        'Recalcular_Percentual(Secao_32, txtSecao_32)
        'Recalcular_Percentual(Secao_33, txtSecao_33)
        'Recalcular_Percentual(Secao_34, txtSecao_34)
        'Recalcular_Percentual(Secao_35, txtSecao_35)
        'Recalcular_Percentual(Secao_36, txtSecao_36)

        'Recalcular_Percentual(Secao_40, txtSecao_40)
        'Recalcular_Percentual(Secao_41, txtSecao_41)
        'Recalcular_Percentual(Secao_42, txtSecao_42)
        'Recalcular_Percentual(Secao_49, txtSecao_49)

        'Recalcular_Percentual(Secao_50, txtSecao_50)
        'Recalcular_Percentual(Secao_51, txtSecao_51)
        'Recalcular_Percentual(Secao_52, txtSecao_52)
        'Recalcular_Percentual(Secao_53, txtSecao_53)
        'Recalcular_Percentual(Secao_54, txtSecao_54)
        'Recalcular_Percentual(Secao_55, txtSecao_55)

        'CalcularDeptos_Valor()

    End Sub

    Private Sub Meta_Fixa()
        'Secao_30.Text = lblReal_AA_30.Text
        'Secao_31.Text = lblReal_AA_31.Text
        'Secao_32.Text = lblReal_AA_32.Text
        'Secao_33.Text = lblReal_AA_33.Text
        'Secao_34.Text = lblReal_AA_34.Text
        'Secao_35.Text = lblReal_AA_35.Text
        'Secao_36.Text = lblReal_AA_36.Text

        'Secao_40.Text = lblReal_AA_40.Text
        'Secao_41.Text = lblReal_AA_41.Text
        'Secao_42.Text = lblReal_AA_42.Text
        'Secao_49.Text = lblReal_AA_49.Text

        'Secao_50.Text = lblReal_AA_50.Text
        'Secao_51.Text = lblReal_AA_51.Text
        'Secao_52.Text = lblReal_AA_52.Text
        'Secao_53.Text = lblReal_AA_53.Text
        'Secao_54.Text = lblReal_AA_54.Text
        'Secao_55.Text = lblReal_AA_55.Text






    End Sub


    Private Sub LimparCampos_Vendas(myAgenda As Label, myPercAgenda As TextBox)
        myAgenda.Text = 0
        myPercAgenda.Text = 0
    End Sub

    Sub LimparCampos()
        'Depto 1 - Mercearia
        Call LimparCampos_Vendas(Me.Secao_01, Me.txtSecao_01)
        Call LimparCampos_Vendas(Me.Secao_02, Me.txtSecao_02)
        Call LimparCampos_Vendas(Me.Secao_03, Me.txtSecao_03)
        Call LimparCampos_Vendas(Me.Secao_04, Me.txtSecao_04)
        Call LimparCampos_Vendas(Me.Secao_05, Me.txtSecao_05)
        Call LimparCampos_Vendas(Me.Secao_06, Me.txtSecao_06)
        Call LimparCampos_Vendas(Me.Secao_07, Me.txtSecao_07)
        Call LimparCampos_Vendas(Me.Secao_08, Me.txtSecao_08)
        Call LimparCampos_Vendas(Me.Secao_09, Me.txtSecao_09)

        'Depto 2 - Pereciveis
        Call LimparCampos_Vendas(Me.Secao_11, Me.txtSecao_11)
        Call LimparCampos_Vendas(Me.Secao_12, Me.txtSecao_12)
        Call LimparCampos_Vendas(Me.Secao_13, Me.txtSecao_13)
        Call LimparCampos_Vendas(Me.Secao_14, Me.txtSecao_14)
        Call LimparCampos_Vendas(Me.Secao_15, Me.txtSecao_15)
        Call LimparCampos_Vendas(Me.Secao_16, Me.txtSecao_16)
        Call LimparCampos_Vendas(Me.Secao_17, Me.txtSecao_17)
        Call LimparCampos_Vendas(Me.Secao_18, Me.txtSecao_18)
        Call LimparCampos_Vendas(Me.Secao_19, Me.txtSecao_19)
        Call LimparCampos_Vendas(Me.Secao_21, Me.txtSecao_21)
        Call LimparCampos_Vendas(Me.Secao_22, Me.txtSecao_22)
        Call LimparCampos_Vendas(Me.Secao_23, Me.txtSecao_23)
        Call LimparCampos_Vendas(Me.Secao_25, Me.txtSecao_25)

        'Depto 3 - Bazar
        Call LimparCampos_Vendas(Me.Secao_30, Me.txtSecao_30)
        Call LimparCampos_Vendas(Me.Secao_31, Me.txtSecao_31)
        Call LimparCampos_Vendas(Me.Secao_32, Me.txtSecao_32)
        Call LimparCampos_Vendas(Me.Secao_33, Me.txtSecao_33)
        Call LimparCampos_Vendas(Me.Secao_34, Me.txtSecao_34)
        Call LimparCampos_Vendas(Me.Secao_35, Me.txtSecao_35)
        Call LimparCampos_Vendas(Me.Secao_36, Me.txtSecao_36)

        'Depto 4 - Textil
        Call LimparCampos_Vendas(Me.Secao_40, Me.txtSecao_40)
        Call LimparCampos_Vendas(Me.Secao_41, Me.txtSecao_41)
        Call LimparCampos_Vendas(Me.Secao_42, Me.txtSecao_42)
        Call LimparCampos_Vendas(Me.Secao_49, Me.txtSecao_49)

        'Depto 5 - Eletrodomésticos
        Call LimparCampos_Vendas(Me.Secao_50, Me.txtSecao_50)
        Call LimparCampos_Vendas(Me.Secao_51, Me.txtSecao_51)
        Call LimparCampos_Vendas(Me.Secao_52, Me.txtSecao_52)
        Call LimparCampos_Vendas(Me.Secao_53, Me.txtSecao_53)
        Call LimparCampos_Vendas(Me.Secao_54, Me.txtSecao_54)
        Call LimparCampos_Vendas(Me.Secao_55, Me.txtSecao_55)

        Call LimparCampos_Vendas(Me.Secao_99, Me.txtSecao_99)

    End Sub

    Sub BuscarVendaSecao_Call(idTipoSecao As Byte, idSecao As Byte, vlrSecao As Label, percSecao As TextBox)
        oVEM.BuscaRevSecaoMes(idTipoSecao, idSecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        vlrSecao.Text = CDbl(oVEM.vlrRev).ToString("n2")
        percSecao.Text = CDbl(oVEM.percRev).ToString("n2")

    End Sub

    Sub BuscarVendaSecao()

        'Depto 1 - Mercearia
        BuscarVendaSecao_Call(1, 1, Me.Secao_01, Me.txtSecao_01)
        BuscarVendaSecao_Call(1, 2, Me.Secao_02, Me.txtSecao_02)
        BuscarVendaSecao_Call(1, 3, Me.Secao_03, Me.txtSecao_03)
        BuscarVendaSecao_Call(1, 4, Me.Secao_04, Me.txtSecao_04)
        BuscarVendaSecao_Call(1, 5, Me.Secao_05, Me.txtSecao_05)
        BuscarVendaSecao_Call(1, 6, Me.Secao_06, Me.txtSecao_06)
        BuscarVendaSecao_Call(1, 7, Me.Secao_07, Me.txtSecao_07)
        BuscarVendaSecao_Call(1, 8, Me.Secao_08, Me.txtSecao_08)
        BuscarVendaSecao_Call(1, 9, Me.Secao_09, Me.txtSecao_09)

        'Depto 2 - Pereciveis
        BuscarVendaSecao_Call(1, 11, Me.Secao_11, Me.txtSecao_11)
        BuscarVendaSecao_Call(1, 12, Me.Secao_12, Me.txtSecao_12)
        BuscarVendaSecao_Call(1, 13, Me.Secao_13, Me.txtSecao_13)
        BuscarVendaSecao_Call(1, 14, Me.Secao_14, Me.txtSecao_14)
        BuscarVendaSecao_Call(1, 15, Me.Secao_15, Me.txtSecao_15)
        BuscarVendaSecao_Call(1, 16, Me.Secao_16, Me.txtSecao_16)
        BuscarVendaSecao_Call(1, 17, Me.Secao_17, Me.txtSecao_17)
        BuscarVendaSecao_Call(1, 18, Me.Secao_18, Me.txtSecao_18)
        BuscarVendaSecao_Call(1, 19, Me.Secao_19, Me.txtSecao_19)
        BuscarVendaSecao_Call(1, 21, Me.Secao_21, Me.txtSecao_21)
        BuscarVendaSecao_Call(1, 22, Me.Secao_22, Me.txtSecao_22)
        BuscarVendaSecao_Call(1, 23, Me.Secao_23, Me.txtSecao_23)
        BuscarVendaSecao_Call(1, 25, Me.Secao_25, Me.txtSecao_25)

        'Depto 3 - Bazar
        BuscarVendaSecao_Call(1, 30, Me.Secao_30, Me.txtSecao_30)
        BuscarVendaSecao_Call(1, 31, Me.Secao_31, Me.txtSecao_31)
        BuscarVendaSecao_Call(1, 32, Me.Secao_32, Me.txtSecao_32)
        BuscarVendaSecao_Call(1, 33, Me.Secao_33, Me.txtSecao_33)
        BuscarVendaSecao_Call(1, 34, Me.Secao_34, Me.txtSecao_34)
        BuscarVendaSecao_Call(1, 35, Me.Secao_35, Me.txtSecao_35)
        BuscarVendaSecao_Call(1, 36, Me.Secao_36, Me.txtSecao_36)


        'Depto 4 - Textil
        BuscarVendaSecao_Call(1, 40, Me.Secao_40, Me.txtSecao_40)
        BuscarVendaSecao_Call(1, 41, Me.Secao_41, Me.txtSecao_41)
        BuscarVendaSecao_Call(1, 42, Me.Secao_42, Me.txtSecao_42)
        BuscarVendaSecao_Call(1, 49, Me.Secao_49, Me.txtSecao_49)

        'Depto 5 - Eletrodomésticos
        BuscarVendaSecao_Call(1, 50, Me.Secao_50, Me.txtSecao_50)
        BuscarVendaSecao_Call(1, 51, Me.Secao_51, Me.txtSecao_51)
        BuscarVendaSecao_Call(1, 52, Me.Secao_52, Me.txtSecao_52)
        BuscarVendaSecao_Call(1, 53, Me.Secao_53, Me.txtSecao_53)
        BuscarVendaSecao_Call(1, 54, Me.Secao_54, Me.txtSecao_54)
        BuscarVendaSecao_Call(1, 55, Me.Secao_55, Me.txtSecao_55)

        BuscarVendaSecao_Call(1, 99, Me.Secao_99, Me.txtSecao_99)

    End Sub


    Public Function BuscarPercentual(idTipoSecao As Byte, idSecao As Byte) As Double
        oVEM.BuscaRevSecaoMes(idTipoSecao, idSecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Return oVEM.percRev
    End Function

    Private Sub CalcularDeptos_Percentual_Inicio()

        Dim percSecao(13) As Double
        Dim percDepto1(8) As Double
        Dim percDepto3(6) As Double
        Dim percDepto4(3) As Double
        Dim percDepto5(5) As Double
        Dim percDepto9(0) As Double
        Dim percTotalDepto(5) As Double

        percDepto1(0) = BuscarPercentual(1, 1)
        percDepto1(1) = BuscarPercentual(1, 2)
        percDepto1(2) = BuscarPercentual(1, 3)
        percDepto1(3) = BuscarPercentual(1, 4)
        percDepto1(4) = BuscarPercentual(1, 5)
        percDepto1(5) = BuscarPercentual(1, 6)
        percDepto1(6) = BuscarPercentual(1, 7)
        percDepto1(7) = BuscarPercentual(1, 8)
        percDepto1(8) = BuscarPercentual(1, 9)

        percDepto3(0) = BuscarPercentual(1, 30)
        percDepto3(1) = BuscarPercentual(1, 31)
        percDepto3(2) = BuscarPercentual(1, 32)
        percDepto3(3) = BuscarPercentual(1, 33)
        percDepto3(4) = BuscarPercentual(1, 34)
        percDepto3(5) = BuscarPercentual(1, 35)
        percDepto3(6) = BuscarPercentual(1, 36)

        percDepto4(0) = BuscarPercentual(1, 40)
        percDepto4(1) = BuscarPercentual(1, 41)
        percDepto4(2) = BuscarPercentual(1, 42)
        percDepto4(3) = BuscarPercentual(1, 49)

        percDepto5(0) = BuscarPercentual(1, 50)
        percDepto5(1) = BuscarPercentual(1, 51)
        percDepto5(2) = BuscarPercentual(1, 52)
        percDepto5(3) = BuscarPercentual(1, 53)
        percDepto5(4) = BuscarPercentual(1, 54)
        percDepto5(5) = BuscarPercentual(1, 55)



        percSecao(0) = BuscarPercentual(1, 11)
        percSecao(1) = BuscarPercentual(1, 12)
        percSecao(2) = BuscarPercentual(1, 13)
        percSecao(3) = BuscarPercentual(1, 14)
        percSecao(4) = BuscarPercentual(1, 15)
        percSecao(5) = BuscarPercentual(1, 16)
        percSecao(6) = BuscarPercentual(1, 17)
        percSecao(7) = BuscarPercentual(1, 18)
        percSecao(8) = BuscarPercentual(1, 19)
        percSecao(9) = BuscarPercentual(1, 21)
        percSecao(10) = BuscarPercentual(1, 22)
        percSecao(11) = BuscarPercentual(1, 23)
        percSecao(12) = BuscarPercentual(1, 25)

        percTotalDepto(0) = percDepto1(0) + percDepto1(1) + percDepto1(2) + percDepto1(3) + percDepto1(4) + percDepto1(5) + percDepto1(6) + percDepto1(7) + percDepto1(8)
        percTotalDepto(1) = percSecao(0) + percSecao(1) + percSecao(2) + percSecao(3) + percSecao(4) + percSecao(5) + percSecao(6) + percSecao(7) + percSecao(8) + percSecao(9) + percSecao(10) + percSecao(11) + percSecao(12)
        percTotalDepto(2) = percDepto3(0) + percDepto3(1) + percDepto3(2) + percDepto3(3) + percDepto3(4) + percDepto3(5) + percDepto3(6)
        percTotalDepto(3) = percDepto4(0) + percDepto4(1) + percDepto4(2) + percDepto4(3)
        percTotalDepto(4) = percDepto5(0) + percDepto5(1) + percDepto5(2) + percDepto5(3) + percDepto5(4) + percDepto5(5)

        Me.txtDepto_1.Text = CDbl(percTotalDepto(0)).ToString("n2")
        Me.txtDepto_2.Text = CDbl(percTotalDepto(1)).ToString("n2")
        Me.txtDepto_3.Text = CDbl(percTotalDepto(2)).ToString("n2")
        Me.txtDepto_4.Text = CDbl(percTotalDepto(3)).ToString("n2")
        Me.txtDepto_5.Text = CDbl(percTotalDepto(4)).ToString("n2")

        'Total da Loja
        Me.txtTotalVenda.Text = (percTotalDepto(0) + percTotalDepto(1) + percTotalDepto(2) + percTotalDepto(3) + percTotalDepto(4) + CDbl(txtSecao_99.Text)).ToString("n2")

    End Sub

    Private Sub CalcularDeptos_Percentual()

        Me.txtDepto_1.Text = (CDbl(Me.txtSecao_01.Text) + CDbl(Me.txtSecao_02.Text) + CDbl(Me.txtSecao_03.Text) + CDbl(Me.txtSecao_04.Text) + CDbl(Me.txtSecao_05.Text) + CDbl(Me.txtSecao_06.Text) + CDbl(Me.txtSecao_07.Text) + CDbl(Me.txtSecao_08.Text) + CDbl(Me.txtSecao_09.Text)).ToString("n2")
        Me.txtDepto_2.Text = (CDbl(Me.txtSecao_11.Text) + CDbl(Me.txtSecao_12.Text) + CDbl(Me.txtSecao_13.Text) + CDbl(Me.txtSecao_14.Text) + CDbl(Me.txtSecao_15.Text) + CDbl(Me.txtSecao_16.Text) + CDbl(Me.txtSecao_17.Text) + CDbl(Me.txtSecao_18.Text) + CDbl(Me.txtSecao_19.Text) + CDbl(Me.txtSecao_21.Text) + CDbl(Me.txtSecao_22.Text) + CDbl(Me.txtSecao_23.Text) + CDbl(Me.txtSecao_25.Text)).ToString("n2")
        Me.txtDepto_3.Text = (CDbl(Me.txtSecao_30.Text) + CDbl(Me.txtSecao_31.Text) + CDbl(Me.txtSecao_32.Text) + CDbl(Me.txtSecao_33.Text) + CDbl(Me.txtSecao_34.Text) + CDbl(Me.txtSecao_35.Text) + CDbl(Me.txtSecao_36.Text)).ToString("n2")
        Me.txtDepto_4.Text = (CDbl(Me.txtSecao_40.Text) + CDbl(Me.txtSecao_41.Text) + CDbl(Me.txtSecao_42.Text) + CDbl(Me.txtSecao_49.Text)).ToString("n2")
        Me.txtDepto_5.Text = (CDbl(Me.txtSecao_50.Text) + CDbl(Me.txtSecao_51.Text) + CDbl(Me.txtSecao_52.Text) + CDbl(Me.txtSecao_53.Text) + CDbl(Me.txtSecao_54.Text) + CDbl(Me.txtSecao_55.Text)).ToString("n2")
        'Total da Loja
        Me.txtTotalVenda.Text = (CDbl(Me.txtDepto_1.Text) + CDbl(Me.txtDepto_2.Text) + CDbl(Me.txtDepto_3.Text) + CDbl(Me.txtDepto_4.Text) + CDbl(Me.txtDepto_5.Text) + CDbl(txtSecao_99.Text)).ToString("n4")

    End Sub

    Private Sub CalcularVenda(myVenda As Label, myPercPart As TextBox, myPercPartFocus As TextBox, percDiferenca As Label, percSugestao As Label)
        Dim varDiferenca As Decimal
        myVenda.Text = ((CDbl(Me.VendaRevista.Text) * CDbl(myPercPart.Text)) / 100).ToString("n0")
        varDiferenca = CDec(myPercPart.Text) - CDec(percSugestao.Text)
        percDiferenca.Text = varDiferenca
        FormatarVermelhoSeNegativo(varDiferenca, percDiferenca)
        CalcularDeptos()
        CalcularDeptoDiferenca()
        myPercPartFocus.Focus()
    End Sub

#Region " Campos de Digitação"

    Protected Sub txtSecao_01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_01.TextChanged
        Call CalcularVenda(Me.Secao_01, Me.txtSecao_01, Me.txtSecao_02, Me.lblDif_1, Me.lblSugestao_1)
    End Sub

    Protected Sub txtSecao_02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_02.TextChanged
        Call CalcularVenda(Me.Secao_02, Me.txtSecao_02, Me.txtSecao_03, Me.lblDif_2, Me.lblSugestao_2)
    End Sub

    Protected Sub txtSecao_03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_03.TextChanged
        Call CalcularVenda(Me.Secao_03, Me.txtSecao_03, Me.txtSecao_04, Me.lblDif_3, Me.lblSugestao_3)
    End Sub

    Protected Sub txtSecao_04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_04.TextChanged
        Call CalcularVenda(Me.Secao_04, Me.txtSecao_04, Me.txtSecao_05, Me.lblDif_4, Me.lblSugestao_4)
    End Sub

    Protected Sub txtSecao_05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_05.TextChanged
        Call CalcularVenda(Me.Secao_05, Me.txtSecao_05, Me.txtSecao_06, Me.lblDif_5, Me.lblSugestao_5)
    End Sub

    Protected Sub txtSecao_06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_06.TextChanged
        Call CalcularVenda(Me.Secao_06, Me.txtSecao_06, Me.txtSecao_07, Me.lblDif_6, Me.lblSugestao_6)
    End Sub

    Protected Sub txtSecao_07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_07.TextChanged
        Call CalcularVenda(Me.Secao_07, Me.txtSecao_07, Me.txtSecao_08, Me.lblDif_7, Me.lblSugestao_7)
    End Sub

    Protected Sub txtSecao_08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_08.TextChanged
        Call CalcularVenda(Me.Secao_08, Me.txtSecao_08, Me.txtSecao_09, Me.lblDif_8, Me.lblSugestao_8)
    End Sub

    Protected Sub txtSecao_09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_09.TextChanged
        Call CalcularVenda(Me.Secao_09, Me.txtSecao_09, Me.txtSecao_11, Me.lblDif_9, Me.lblSugestao_9)
    End Sub

    Protected Sub txtSecao_11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_11.TextChanged
        Call CalcularVenda(Me.Secao_11, Me.txtSecao_11, Me.txtSecao_12, Me.lblDif_11, Me.lblSugestao_11)
    End Sub

    Protected Sub txtSecao_12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_12.TextChanged
        Call CalcularVenda(Me.Secao_12, Me.txtSecao_12, Me.txtSecao_13, Me.lblDif_12, Me.lblSugestao_12)
    End Sub

    Protected Sub txtSecao_13_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_13.TextChanged
        Call CalcularVenda(Me.Secao_13, Me.txtSecao_13, Me.txtSecao_14, Me.lblDif_13, Me.lblSugestao_13)
    End Sub

    Protected Sub txtSecao_14_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_14.TextChanged
        Call CalcularVenda(Me.Secao_14, Me.txtSecao_14, Me.txtSecao_15, Me.lblDif_14, Me.lblSugestao_14)
    End Sub

    Protected Sub txtSecao_15_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_15.TextChanged
        Call CalcularVenda(Me.Secao_15, Me.txtSecao_15, Me.txtSecao_16, Me.lblDif_15, Me.lblSugestao_15)
    End Sub

    Protected Sub txtSecao_16_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_16.TextChanged
        Call CalcularVenda(Me.Secao_16, Me.txtSecao_16, Me.txtSecao_17, Me.lblDif_16, Me.lblSugestao_16)
    End Sub

    Protected Sub txtSecao_17_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_17.TextChanged
        Call CalcularVenda(Me.Secao_17, Me.txtSecao_17, Me.txtSecao_18, Me.lblDif_17, Me.lblSugestao_17)
    End Sub

    Protected Sub txtSecao_18_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_18.TextChanged
        Call CalcularVenda(Me.Secao_18, Me.txtSecao_18, Me.txtSecao_19, Me.lblDif_18, Me.lblSugestao_18)
    End Sub

    Protected Sub txtSecao_19_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_19.TextChanged
        Call CalcularVenda(Me.Secao_19, Me.txtSecao_19, Me.txtSecao_21, Me.lblDif_19, Me.lblSugestao_19)
    End Sub

    Protected Sub txtSecao_21_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_21.TextChanged
        Call CalcularVenda(Me.Secao_21, Me.txtSecao_21, Me.txtSecao_22, Me.lblDif_21, Me.lblSugestao_21)
    End Sub

    Protected Sub txtSecao_22_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_22.TextChanged
        Call CalcularVenda(Me.Secao_22, Me.txtSecao_22, Me.txtSecao_23, Me.lblDif_22, Me.lblSugestao_22)
    End Sub

    Protected Sub txtSecao_23_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_23.TextChanged
        Call CalcularVenda(Me.Secao_23, Me.txtSecao_23, Me.txtSecao_25, Me.lblDif_23, Me.lblSugestao_23)
    End Sub

    Protected Sub txtSecao_25_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_25.TextChanged
        Call CalcularVenda(Me.Secao_25, Me.txtSecao_25, Me.txtSecao_30, Me.lblDif_25, Me.lblSugestao_25)
    End Sub

    Protected Sub txtSecao_30_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_30.TextChanged
        Call CalcularVenda(Me.Secao_30, Me.txtSecao_30, Me.txtSecao_31, Me.lblDif_30, Me.lblSugestao_30)
    End Sub

    Protected Sub txtSecao_31_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_31.TextChanged
        Call CalcularVenda(Me.Secao_31, Me.txtSecao_31, Me.txtSecao_32, Me.lblDif_31, Me.lblSugestao_31)
    End Sub

    Protected Sub txtSecao_32_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_32.TextChanged
        Call CalcularVenda(Me.Secao_32, Me.txtSecao_32, Me.txtSecao_33, Me.lblDif_32, Me.lblSugestao_32)
    End Sub

    Protected Sub txtSecao_33_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_33.TextChanged
        Call CalcularVenda(Me.Secao_33, Me.txtSecao_33, Me.txtSecao_34, Me.lblDif_33, Me.lblSugestao_33)
    End Sub

    Protected Sub txtSecao_34_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_34.TextChanged
        Call CalcularVenda(Me.Secao_34, Me.txtSecao_34, Me.txtSecao_35, Me.lblDif_34, Me.lblSugestao_34)
    End Sub

    Protected Sub txtSecao_35_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_35.TextChanged
        Call CalcularVenda(Me.Secao_35, Me.txtSecao_35, Me.txtSecao_36, Me.lblDif_35, Me.lblSugestao_35)
    End Sub

    Protected Sub txtSecao_36_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_36.TextChanged
        Call CalcularVenda(Me.Secao_36, Me.txtSecao_36, Me.txtSecao_40, Me.lblDif_36, Me.lblSugestao_36)
    End Sub

    Protected Sub txtSecao_40_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_40.TextChanged
        Call CalcularVenda(Me.Secao_40, Me.txtSecao_40, Me.txtSecao_41, Me.lblDif_40, Me.lblSugestao_40)
    End Sub

    Protected Sub txtSecao_41_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_41.TextChanged
        Call CalcularVenda(Me.Secao_41, Me.txtSecao_41, Me.txtSecao_42, Me.lblDif_41, Me.lblSugestao_41)
    End Sub

    Protected Sub txtSecao_42_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_42.TextChanged
        Call CalcularVenda(Me.Secao_42, Me.txtSecao_42, Me.txtSecao_49, Me.lblDif_42, Me.lblSugestao_42)
    End Sub

    Protected Sub txtSecao_49_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_49.TextChanged
        Call CalcularVenda(Me.Secao_49, Me.txtSecao_49, Me.txtSecao_50, Me.lblDif_49, Me.lblSugestao_49)
    End Sub

    Protected Sub txtSecao_50_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_50.TextChanged
        Call CalcularVenda(Me.Secao_50, Me.txtSecao_50, Me.txtSecao_51, Me.lblDif_50, Me.lblSugestao_50)
    End Sub

    Protected Sub txtSecao_51_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_51.TextChanged
        Call CalcularVenda(Me.Secao_51, Me.txtSecao_51, Me.txtSecao_52, Me.lblDif_51, Me.lblSugestao_51)
    End Sub

    Protected Sub txtSecao_52_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_52.TextChanged
        Call CalcularVenda(Me.Secao_52, Me.txtSecao_52, Me.txtSecao_53, Me.lblDif_52, Me.lblSugestao_52)
    End Sub

    Protected Sub txtSecao_53_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_53.TextChanged
        Call CalcularVenda(Me.Secao_53, Me.txtSecao_53, Me.txtSecao_54, Me.lblDif_53, Me.lblSugestao_53)
    End Sub

    Protected Sub txtSecao_54_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_54.TextChanged
        Call CalcularVenda(Me.Secao_54, Me.txtSecao_54, Me.txtSecao_55, Me.lblDif_54, Me.lblSugestao_54)
    End Sub

    Protected Sub txtSecao_55_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_55.TextChanged
        Call CalcularVenda(Me.Secao_55, Me.txtSecao_55, Me.txtSecao_54, Me.lblDif_55, Me.lblSugestao_55)
    End Sub

    Protected Sub txtSecao_99_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_99.TextChanged
        Call CalcularVenda(Me.Secao_99, Me.txtSecao_99, Me.txtSecao_55, Me.lblDif_99, Me.lblSugestao_99)
    End Sub

#End Region

    Private Function Salvar(ByVal idSecao As Int16, ByVal vlr As Decimal, ByVal perc As Decimal) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspInsertRevSecaoMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = 1    'Participação de Vendas

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Me.cboMes.CallMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.SmallInt))
        comando.Parameters("@idSecao").Value = idSecao

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@perc", SqlDbType.Money))
        comando.Parameters("@perc").Value = perc

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = User.Identity.Name

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
        Catch ex As Exception
            oVEM.UserMsgBox(Me, ex.Message)

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click

        Dim oPro As New Projeto


        '' DEPARTAMENTO 1
        'If CDec(lblReal_AA_1.Text) > CDec(Secao_01.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 1 - Seca Pesada ' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_2.Text) > CDec(Secao_02.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 2 - Seca Salgada' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_3.Text) > CDec(Secao_03.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 3 - Seca Doce ' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        ''If CDec(lblReal_AA_4.Text) > CDec(Secao_04.Text) Then
        ''    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 4 - Seca Leve' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        ''    Exit Sub
        ''End If

        'If CDec(lblReal_AA_5.Text) > CDec(Secao_05.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 5 - Limpeza' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_6.Text) > CDec(Secao_06.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 6 - Perfumaria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_7.Text) > CDec(Secao_07.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 7 - Bebidas Quentes' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_8.Text) > CDec(Secao_08.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 8 - Bebidas Frias' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If


        '' DEPARTAMENTO 2
        'If CDec(lblReal_AA_11.Text) > CDec(Secao_11.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 11 - Leite' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_12.Text) > CDec(Secao_12.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 12 - Fiambreria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_13.Text) > CDec(Secao_13.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 13 - Rotisseria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_14.Text) > CDec(Secao_14.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 14 - Frios & Massas' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_15.Text) > CDec(Secao_15.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 15 - Latícinios' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_16.Text) > CDec(Secao_16.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 16 - Congelados' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_17.Text) > CDec(Secao_17.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 17 - Padaria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_18.Text) > CDec(Secao_18.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 18 - Confeitaria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_19.Text) > CDec(Secao_19.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 19 - Pães Industrializados' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_21.Text) > CDec(Secao_21.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 21 - Açougue' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_22.Text) > CDec(Secao_22.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 22 - Granjeiros' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_23.Text) > CDec(Secao_23.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 23 - Hortifruti' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If


        '' DEPARTAMENTO 3
        'If CDec(lblReal_AA_30.Text) > CDec(Secao_30.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 30 - Ferragens' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_31.Text) > CDec(Secao_31.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 31 - Papelaria' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_32.Text) > CDec(Secao_32.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 32 - Casa e Utilidades' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_33.Text) > CDec(Secao_33.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 33 - Brinquedos' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_34.Text) > CDec(Secao_34.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 34 - Jardins' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_35.Text) > CDec(Secao_35.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 35 - Animais' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        ''If CDec(lblReal_AA_36.Text) > CDec(Secao_36.Text) Then
        ''    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 36 - Musica' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        ''    Exit Sub
        ''End If


        '' DEPARTAMENTO 4
        'If CDec(lblReal_AA_40.Text) > CDec(Secao_40.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 40 - Calçados' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If cboFilial.CallFilial <> 18 Then
        '    If CDec(lblReal_AA_41.Text) > CDec(Secao_41.Text) Then
        '        oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 41 - Confecções' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '        Exit Sub
        '    End If
        'End If


        'If CDec(lblReal_AA_42.Text) > CDec(Secao_42.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 42 - Cama, Mesa' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If CDec(lblReal_AA_49.Text) > CDec(Secao_49.Text) Then
        '    oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 49 - Puericultura' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '    Exit Sub
        'End If

        'If oPro.CodigoSuperHiper <> 207 Then
        '    ' DEPARTAMENTO 5
        '    If CDec(lblReal_AA_50.Text) > CDec(Secao_50.Text) Then
        '        oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 50 - Eletrodomésticos' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '        Exit Sub
        '    End If

        '    If CDec(lblReal_AA_51.Text) > CDec(Secao_51.Text) Then
        '        oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 51 - Eletroportáteis' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '        Exit Sub
        '    End If

        '    If cboFilial.CallFilial <> 7 Or cboFilial.CallFilial <> 8 Then
        '        If CDec(lblReal_AA_52.Text) > CDec(Secao_52.Text) Then
        '            oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 52 - Telefonia' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '            Exit Sub
        '        End If

        '        If CDec(lblReal_AA_53.Text) > CDec(Secao_53.Text) Then
        '            oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 53 - Informática' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '            Exit Sub
        '        End If
        '    End If


        '    If CDec(lblReal_AA_54.Text) > CDec(Secao_54.Text) Then
        '        oVEM.UserMsgBox(Me, "O valor da Meta da 'Seção 54 - Cine/Foto/Som' esta menor que o Ano Passado. Deixe pelo menos igual!!!")
        '        Exit Sub
        '    End If

        'End If

        If CDbl(Me.txtTotalVenda.Text) <> 100.0 Then
            oVEM.UserMsgBox(Me, "A soma das participações da loja não fecha 100,00%!!!")
            If LCase(Trim(User.Identity.Name)) = "eliseufermino" Then Call Salvar() 'Só salva se o usuário for Eliseu
            Me.txtSecao_01.Focus()
        Else
            Call Salvar()
        End If
    End Sub

    Private Sub Salvar()
        'Depto 1 - Mercearia - 201
        Call Salvar(1, Me.Secao_01.Text, Me.txtSecao_01.Text)
        Call Salvar(2, Me.Secao_02.Text, Me.txtSecao_02.Text)
        Call Salvar(3, Me.Secao_03.Text, Me.txtSecao_03.Text)
        Call Salvar(4, Me.Secao_04.Text, Me.txtSecao_04.Text)
        Call Salvar(5, Me.Secao_05.Text, Me.txtSecao_05.Text)
        Call Salvar(6, Me.Secao_06.Text, Me.txtSecao_06.Text)
        Call Salvar(7, Me.Secao_07.Text, Me.txtSecao_07.Text)
        Call Salvar(8, Me.Secao_08.Text, Me.txtSecao_08.Text)
        Call Salvar(9, Me.Secao_09.Text, Me.txtSecao_09.Text)

        ''Depto 2 - Pereciveis - 202
        Call Salvar(11, Me.Secao_11.Text, Me.txtSecao_11.Text)
        Call Salvar(12, Me.Secao_12.Text, Me.txtSecao_12.Text)
        Call Salvar(13, Me.Secao_13.Text, Me.txtSecao_13.Text)
        Call Salvar(14, Me.Secao_14.Text, Me.txtSecao_14.Text)
        Call Salvar(15, Me.Secao_15.Text, Me.txtSecao_15.Text)
        Call Salvar(16, Me.Secao_16.Text, Me.txtSecao_16.Text)
        Call Salvar(17, Me.Secao_17.Text, Me.txtSecao_17.Text)
        Call Salvar(18, Me.Secao_18.Text, Me.txtSecao_18.Text)
        Call Salvar(19, Me.Secao_19.Text, Me.txtSecao_19.Text)
        Call Salvar(21, Me.Secao_21.Text, Me.txtSecao_21.Text)
        Call Salvar(22, Me.Secao_22.Text, Me.txtSecao_22.Text)
        Call Salvar(23, Me.Secao_23.Text, Me.txtSecao_23.Text)
        Call Salvar(25, Me.Secao_25.Text, Me.txtSecao_25.Text)

        ''Depto 3 - Bazar - 203
        Call Salvar(30, Me.Secao_30.Text, Me.txtSecao_30.Text)
        Call Salvar(31, Me.Secao_31.Text, Me.txtSecao_31.Text)
        Call Salvar(32, Me.Secao_32.Text, Me.txtSecao_32.Text)
        Call Salvar(33, Me.Secao_33.Text, Me.txtSecao_33.Text)
        Call Salvar(34, Me.Secao_34.Text, Me.txtSecao_34.Text)
        Call Salvar(35, Me.Secao_35.Text, Me.txtSecao_35.Text)
        Call Salvar(36, Me.Secao_36.Text, Me.txtSecao_36.Text)

        ''Depto 4 - Textil - 204
        Call Salvar(40, Me.Secao_40.Text, Me.txtSecao_40.Text)
        Call Salvar(41, Me.Secao_41.Text, Me.txtSecao_41.Text)
        Call Salvar(42, Me.Secao_42.Text, Me.txtSecao_42.Text)
        Call Salvar(49, Me.Secao_49.Text, Me.txtSecao_49.Text)

        ''Depto 5 - Eletro - 205
        Call Salvar(50, Me.Secao_50.Text, Me.txtSecao_50.Text)
        Call Salvar(51, Me.Secao_51.Text, Me.txtSecao_51.Text)
        Call Salvar(52, Me.Secao_52.Text, Me.txtSecao_52.Text)
        Call Salvar(53, Me.Secao_53.Text, Me.txtSecao_53.Text)
        Call Salvar(54, Me.Secao_54.Text, Me.txtSecao_54.Text)
        Call Salvar(55, Me.Secao_55.Text, Me.txtSecao_55.Text)
        Call Salvar(99, Me.Secao_99.Text, Me.txtSecao_99.Text)

        ''Total - 255
        Call Salvar(255, Total_Venda.Text, Me.txtTotalVenda.Text)
        oVEM.CalcularMetaRevistaSecao(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, Me.User.Identity.Name)

        oVEM.UserMsgBox(Me, "As participações de vendas foram salvas com sucesso!!!")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oMF As New MyFunction
            cboAno.AutoPostBack = True
            cboMes.AutoPostBack = True
            cboFilial.AutoPostBack = True


            oVEM.AtualizarEstatisticaPrograma(20, User.Identity.Name)   '20 - CMV Replanejamento Vendas
            cboMes.CallMes = Month(Now())
            cboAno.CallAno = Year(Now())

            cboAno.CallAno = Year(Now())

            If cboMes.CallMes = 12 Then
                cboMes.CallMes = 1
            Else
                cboMes.CallMes = Month(Now()) + 1
            End If

            cboAno.AnoInicial = 2012
            cboAno.AnoFinal = Year(Now()) + 1

            If cboFilial.IsLoja = True Then
                btnRecalcular.Visible = False
            Else
                cboFilial.Visible = True
            End If

        End If
    End Sub

    Private Sub LiberarSalvar()
        Select Case User.Identity.Name
            Case "Eliseu", "Jesuli"
                Me.btnSalvar.Enabled = True
            Case Else
                oVEM.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
                If oVEM.LiberaParticipacao = True Then
                    Me.btnSalvar.Enabled = True
                Else
                    Me.btnSalvar.Enabled = False
                End If
        End Select

    End Sub

    Private Sub Recalcular(myVenda As Label, myPercPart As TextBox)
        myVenda.Text = ((CDbl(Me.VendaRevista.Text) * CDbl(myPercPart.Text)) / 100).ToString("n0")
    End Sub

    Private Sub Recalcular_Percentual(myVenda As Label, myPercPart As TextBox)

        myPercPart.Text = ((CDec(myVenda.Text) / CDec(Me.VendaRevista.Text)) * 100).ToString("n2")
    End Sub

    Private Sub RecalcularValores()



        Call Recalcular(Me.Secao_01, Me.txtSecao_01)
        Call Recalcular(Me.Secao_02, Me.txtSecao_02)
        Call Recalcular(Me.Secao_03, Me.txtSecao_03)
        Call Recalcular(Me.Secao_04, Me.txtSecao_04)
        Call Recalcular(Me.Secao_05, Me.txtSecao_05)
        Call Recalcular(Me.Secao_06, Me.txtSecao_06)
        Call Recalcular(Me.Secao_07, Me.txtSecao_07)
        Call Recalcular(Me.Secao_08, Me.txtSecao_08)
        Call Recalcular(Me.Secao_09, Me.txtSecao_09)

        Call Recalcular(Me.Secao_11, Me.txtSecao_11)
        Call Recalcular(Me.Secao_12, Me.txtSecao_12)
        Call Recalcular(Me.Secao_13, Me.txtSecao_13)
        Call Recalcular(Me.Secao_14, Me.txtSecao_14)
        Call Recalcular(Me.Secao_15, Me.txtSecao_15)
        Call Recalcular(Me.Secao_16, Me.txtSecao_16)
        Call Recalcular(Me.Secao_17, Me.txtSecao_17)
        Call Recalcular(Me.Secao_18, Me.txtSecao_18)
        Call Recalcular(Me.Secao_19, Me.txtSecao_19)
        Call Recalcular(Me.Secao_21, Me.txtSecao_21)
        Call Recalcular(Me.Secao_22, Me.txtSecao_22)
        Call Recalcular(Me.Secao_23, Me.txtSecao_23)
        Call Recalcular(Me.Secao_25, Me.txtSecao_25)

        Call Recalcular(Me.Secao_30, Me.txtSecao_30)
        Call Recalcular(Me.Secao_31, Me.txtSecao_31)
        Call Recalcular(Me.Secao_32, Me.txtSecao_32)
        Call Recalcular(Me.Secao_33, Me.txtSecao_33)
        Call Recalcular(Me.Secao_34, Me.txtSecao_34)
        Call Recalcular(Me.Secao_35, Me.txtSecao_35)
        Call Recalcular(Me.Secao_36, Me.txtSecao_36)

        Call Recalcular(Me.Secao_40, Me.txtSecao_40)
        Call Recalcular(Me.Secao_41, Me.txtSecao_41)
        Call Recalcular(Me.Secao_42, Me.txtSecao_42)
        Call Recalcular(Me.Secao_49, Me.txtSecao_49)

        Call Recalcular(Me.Secao_50, Me.txtSecao_50)
        Call Recalcular(Me.Secao_51, Me.txtSecao_51)
        Call Recalcular(Me.Secao_52, Me.txtSecao_52)
        Call Recalcular(Me.Secao_53, Me.txtSecao_53)
        Call Recalcular(Me.Secao_54, Me.txtSecao_54)
        Call Recalcular(Me.Secao_55, Me.txtSecao_55)

        Call Recalcular(Me.Secao_99, Me.txtSecao_99)

        Call CalcularDeptos()
        'oVEM.UserMsgBox(Me, "Vendas recalculadas com sucesso!!!")
    End Sub

    Protected Sub btnRecalcular_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecalcular.Click
        Call RecalcularValores()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 2 - Participação - PGR20"
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        AlterarCabecalhos()
        Call LiberarSalvar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
        ' Call RecalcularValores()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
        AlterarCabecalhos()
        Call LiberarSalvar()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If cboFilial.IsLoja = True Then
                btnRecalcular.Visible = False
            End If
            AlterarCabecalhos()
            Call LiberarSalvar()
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            If cboFilial.IsLoja = True Then

                btnRecalcular.Visible = False

            End If
            Call Atualizar()
            'Call RecalcularValores()
            AlterarCabecalhos()
            Call LiberarSalvar()
        End If
    End Sub

#Region " Departamentos"

    Private Sub CalcularDeptos()
        Call CalcularDeptos_Valor()
        Call CalcularDeptos_Percentual()
    End Sub

    Private Sub CalcularDeptosInicio()
        Call CalcularDeptos_Valor()
        Call CalcularDeptos_Percentual_Inicio()
    End Sub

    Private Sub CalcularDeptos_Valor()

        Call CalcularDepto1(Me.Secao_01, Me.Secao_02, Me.Secao_03, Me.Secao_04, Me.Secao_05, _
                            Me.Secao_06, Me.Secao_07, Me.Secao_08, Me.Secao_09, Me.Depto_1, "n0")

        Call CalcularDepto2(Me.Secao_11, Me.Secao_12, Me.Secao_13, Me.Secao_14, Me.Secao_15, _
                            Me.Secao_16, Me.Secao_17, Me.Secao_18, Me.Secao_19, _
                            Me.Secao_21, Me.Secao_22, Me.Secao_23, Me.Secao_25, Me.Depto_2, "n0")

        Call CalcularDepto3(Me.Secao_30, Me.Secao_31, Me.Secao_32, Me.Secao_33, Me.Secao_34, _
                            Me.Secao_35, Me.Secao_36, Me.Depto_3, "n0")

        Call CalcularDepto4(Me.Secao_40, Me.Secao_41, Me.Secao_42, Me.Secao_49, Me.Depto_4, "n0")

        Call CalcularDepto5(Me.Secao_50, Me.Secao_51, Me.Secao_52, Me.Secao_53, _
                            Me.Secao_54, Me.Secao_55, Me.Depto_5, "n0")

        Call CalcularTotal(Me.Depto_1, Me.Depto_2, Me.Depto_3, Me.Depto_4, Me.Depto_5, Me.Total_Venda, "n0")

    End Sub

    Private Sub FormatarVermelhoSeNegativo(ByVal vlrDeAnalise As Decimal, CampoParaFormatar As Label)
        If vlrDeAnalise < 0 Then
            CampoParaFormatar.ForeColor = Drawing.Color.Red
        Else
            CampoParaFormatar.ForeColor = Drawing.Color.Black
        End If
    End Sub

#Region " CalcularHistorircoDepartamento"

    Private Sub CalcularDepartamentoHistorico_AA()
        'Calcular Valor
        Call CalcularDepto1(Me.lblReal_AA_1, Me.lblReal_AA_2, Me.lblReal_AA_3, Me.lblReal_AA_4, Me.lblReal_AA_5, _
                            Me.lblReal_AA_6, Me.lblReal_AA_7, Me.lblReal_AA_8, Me.lblReal_AA_9, Me.lblReal_AA_Depto1, "n0")

        Call CalcularDepto2(Me.lblReal_AA_11, Me.lblReal_AA_12, Me.lblReal_AA_13, Me.lblReal_AA_14, Me.lblReal_AA_15, _
                            Me.lblReal_AA_16, Me.lblReal_AA_17, Me.lblReal_AA_18, Me.lblReal_AA_19, _
                            Me.lblReal_AA_21, Me.lblReal_AA_22, Me.lblReal_AA_23, Me.lblReal_AA_25, Me.lblReal_AA_Depto2, "n0")

        Call CalcularDepto3(Me.lblReal_AA_30, Me.lblReal_AA_31, Me.lblReal_AA_32, Me.lblReal_AA_33, Me.lblReal_AA_34, _
                            Me.lblReal_AA_35, Me.lblReal_AA_36, Me.lblReal_AA_Depto3, "n0")

        Call CalcularDepto4(Me.lblReal_AA_40, Me.lblReal_AA_41, Me.lblReal_AA_42, Me.lblReal_AA_49, Me.lblReal_AA_Depto4, "n0")

        Call CalcularDepto5(Me.lblReal_AA_50, Me.lblReal_AA_51, Me.lblReal_AA_52, Me.lblReal_AA_53, _
                            Me.lblReal_AA_54, Me.lblReal_AA_55, Me.lblReal_AA_Depto5, "n0")

        Call CalcularTotal(Me.lblReal_AA_Depto1, Me.lblReal_AA_Depto2, Me.lblReal_AA_Depto3, Me.lblReal_AA_Depto4, Me.lblReal_AA_Depto5, Me.lblReal_AA_Total, "n0")


        'Calcular Percentual
        Call CalcularDepto1(Me.lblRealPart_AA_1, Me.lblRealPart_AA_2, Me.lblRealPart_AA_3, Me.lblRealPart_AA_4, Me.lblRealPart_AA_5, _
                            Me.lblRealPart_AA_6, Me.lblRealPart_AA_7, Me.lblRealPart_AA_8, Me.lblRealPart_AA_9, Me.lblRealPart_AA_Depto1, "n2")

        Call CalcularDepto2(Me.lblRealPart_AA_11, Me.lblRealPart_AA_12, Me.lblRealPart_AA_13, Me.lblRealPart_AA_14, Me.lblRealPart_AA_15, _
                            Me.lblRealPart_AA_16, Me.lblRealPart_AA_17, Me.lblRealPart_AA_18, Me.lblRealPart_AA_19, _
                            Me.lblRealPart_AA_21, Me.lblRealPart_AA_22, Me.lblRealPart_AA_23, Me.lblRealPart_AA_25, Me.lblRealPart_AA_Depto2, "n2")

        Call CalcularDepto3(Me.lblRealPart_AA_30, Me.lblRealPart_AA_31, Me.lblRealPart_AA_32, Me.lblRealPart_AA_33, Me.lblRealPart_AA_34, _
                            Me.lblRealPart_AA_35, Me.lblRealPart_AA_36, Me.lblRealPart_AA_Depto3, "n2")

        Call CalcularDepto4(Me.lblRealPart_AA_40, Me.lblRealPart_AA_41, Me.lblRealPart_AA_42, Me.lblRealPart_AA_49, Me.lblRealPart_AA_Depto4, "n2")

        Call CalcularDepto5(Me.lblRealPart_AA_50, Me.lblRealPart_AA_51, Me.lblRealPart_AA_52, Me.lblRealPart_AA_53, _
                            Me.lblRealPart_AA_54, Me.lblRealPart_AA_55, Me.lblRealPart_AA_Depto5, "n2")

        Call CalcularTotal(Me.lblRealPart_AA_Depto1, Me.lblRealPart_AA_Depto2, Me.lblRealPart_AA_Depto3, Me.lblRealPart_AA_Depto4, Me.lblRealPart_AA_Depto5, Me.lblRealPart_AA_Total, "n2")

    End Sub


    Private Sub CalcularDepartamentoHistorico_M1()
        'Calcular Valor
        Call CalcularDepto1(Me.lblReal_M0_1, Me.lblReal_M0_2, Me.lblReal_M0_3, Me.lblReal_M0_4, Me.lblReal_M0_5, _
                            Me.lblReal_M0_6, Me.lblReal_M0_7, Me.lblReal_M0_8, Me.lblReal_M0_9, Me.lblReal_M0_Depto1, "n0")

        Call CalcularDepto2(Me.lblReal_M0_11, Me.lblReal_M0_12, Me.lblReal_M0_13, Me.lblReal_M0_14, Me.lblReal_M0_15, _
                            Me.lblReal_M0_16, Me.lblReal_M0_17, Me.lblReal_M0_18, Me.lblReal_M0_19, _
                            Me.lblReal_M0_21, Me.lblReal_M0_22, Me.lblReal_M0_23, Me.lblReal_M0_25, Me.lblReal_M0_Depto2, "n0")

        Call CalcularDepto3(Me.lblReal_M0_30, Me.lblReal_M0_31, Me.lblReal_M0_32, Me.lblReal_M0_33, Me.lblReal_M0_34, _
                            Me.lblReal_M0_35, Me.lblReal_M0_36, Me.lblReal_M0_Depto3, "n0")

        Call CalcularDepto4(Me.lblReal_M0_40, Me.lblReal_M0_41, Me.lblReal_M0_42, Me.lblReal_M0_49, Me.lblReal_M0_Depto4, "n0")

        Call CalcularDepto5(Me.lblReal_M0_50, Me.lblReal_M0_51, Me.lblReal_M0_52, Me.lblReal_M0_53, _
                            Me.lblReal_M0_54, Me.lblReal_M0_55, Me.lblReal_M0_Depto5, "n0")

        Call CalcularTotal(Me.lblReal_M0_Depto1, Me.lblReal_M0_Depto2, Me.lblReal_M0_Depto3, Me.lblReal_M0_Depto4, Me.lblReal_M0_Depto5, Me.lblReal_M0_Total, "n0")


        'Calcular Percentual
        Call CalcularDepto1(Me.lblRealPart_M0_1, Me.lblRealPart_M0_2, Me.lblRealPart_M0_3, Me.lblRealPart_M0_4, Me.lblRealPart_M0_5, _
                            Me.lblRealPart_M0_6, Me.lblRealPart_M0_7, Me.lblRealPart_M0_8, Me.lblRealPart_M0_9, Me.lblRealPart_M0_Depto1, "n2")

        Call CalcularDepto2(Me.lblRealPart_M0_11, Me.lblRealPart_M0_12, Me.lblRealPart_M0_13, Me.lblRealPart_M0_14, Me.lblRealPart_M0_15, _
                            Me.lblRealPart_M0_16, Me.lblRealPart_M0_17, Me.lblRealPart_M0_18, Me.lblRealPart_M0_19, _
                            Me.lblRealPart_M0_21, Me.lblRealPart_M0_22, Me.lblRealPart_M0_23, Me.lblRealPart_M0_25, Me.lblRealPart_M0_Depto2, "n2")

        Call CalcularDepto3(Me.lblRealPart_M0_30, Me.lblRealPart_M0_31, Me.lblRealPart_M0_32, Me.lblRealPart_M0_33, Me.lblRealPart_M0_34, _
                            Me.lblRealPart_M0_35, Me.lblRealPart_M0_36, Me.lblRealPart_M0_Depto3, "n2")

        Call CalcularDepto4(Me.lblRealPart_M0_40, Me.lblRealPart_M0_41, Me.lblRealPart_M0_42, Me.lblRealPart_M0_49, Me.lblRealPart_M0_Depto4, "n2")

        Call CalcularDepto5(Me.lblRealPart_M0_50, Me.lblRealPart_M0_51, Me.lblRealPart_M0_52, Me.lblRealPart_M0_53, _
                            Me.lblRealPart_M0_54, Me.lblRealPart_M0_55, Me.lblRealPart_M0_Depto5, "n2")

        Call CalcularTotal(Me.lblRealPart_M0_Depto1, Me.lblRealPart_M0_Depto2, Me.lblRealPart_M0_Depto3, Me.lblRealPart_M0_Depto4, Me.lblRealPart_M0_Depto5, Me.lblRealPart_M0_Total, "n2")
    End Sub

    Private Sub CalcularDepartamentoHistorico_M2()
        'Calcular M1
        Call CalcularDepto1(Me.lblReal_M1_01, Me.lblReal_M1_02, Me.lblReal_M1_03, Me.lblReal_M1_04, Me.lblReal_M1_05, _
                            Me.lblReal_M1_06, Me.lblReal_M1_07, Me.lblReal_M1_08, Me.lblReal_M1_09, Me.lblReal_M1_Depto1, "n0")

        Call CalcularDepto2(Me.lblReal_M1_11, Me.lblReal_M1_12, Me.lblReal_M1_13, Me.lblReal_M1_14, Me.lblReal_M1_15, _
                            Me.lblReal_M1_16, Me.lblReal_M1_17, Me.lblReal_M1_18, Me.lblReal_M1_19, _
                            Me.lblReal_M1_21, Me.lblReal_M1_22, Me.lblReal_M1_23, Me.lblReal_M1_25, Me.lblReal_M1_Depto2, "n0")

        Call CalcularDepto3(Me.lblReal_M1_30, Me.lblReal_M1_31, Me.lblReal_M1_32, Me.lblReal_M1_33, Me.lblReal_M1_34, _
                            Me.lblReal_M1_35, Me.lblReal_M1_36, Me.lblReal_M1_Depto3, "n0")

        Call CalcularDepto4(Me.lblReal_M1_40, Me.lblReal_M1_41, Me.lblReal_M1_42, Me.lblReal_M1_49, Me.lblReal_M1_Depto4, "n0")

        Call CalcularDepto5(Me.lblReal_M1_50, Me.lblReal_M1_51, Me.lblReal_M1_52, Me.lblReal_M1_53, _
                            Me.lblReal_M1_54, Me.lblReal_M1_55, Me.lblReal_M1_Depto5, "n0")

        Call CalcularTotal(Me.lblReal_M1_Depto1, Me.lblReal_M1_Depto2, Me.lblReal_M1_Depto3, Me.lblReal_M1_Depto4, Me.lblReal_M1_Depto5, Me.lblReal_M1_Total, "n0")


        'Calcular Percentual
        Call CalcularDepto1(Me.lblRealPart_M1_1, Me.lblRealPart_M1_2, Me.lblRealPart_M1_3, Me.lblRealPart_M1_4, Me.lblRealPart_M1_5, _
                            Me.lblRealPart_M1_6, Me.lblRealPart_M1_7, Me.lblRealPart_M1_8, Me.lblRealPart_M1_9, Me.lblRealPart_M1_Depto1, "n2")

        Call CalcularDepto2(Me.lblRealPart_M1_11, Me.lblRealPart_M1_12, Me.lblRealPart_M1_13, Me.lblRealPart_M1_14, Me.lblRealPart_M1_15, _
                            Me.lblRealPart_M1_16, Me.lblRealPart_M1_17, Me.lblRealPart_M1_18, Me.lblRealPart_M1_19, _
                            Me.lblRealPart_M1_21, Me.lblRealPart_M1_22, Me.lblRealPart_M1_23, Me.lblRealPart_M1_25, Me.lblRealPart_M1_Depto2, "n2")

        Call CalcularDepto3(Me.lblRealPart_M1_30, Me.lblRealPart_M1_31, Me.lblRealPart_M1_32, Me.lblRealPart_M1_33, Me.lblRealPart_M1_34, _
                            Me.lblRealPart_M1_35, Me.lblRealPart_M1_36, Me.lblRealPart_M1_Depto3, "n2")

        Call CalcularDepto4(Me.lblRealPart_M1_40, Me.lblRealPart_M1_41, Me.lblRealPart_M1_42, Me.lblRealPart_M1_49, Me.lblRealPart_M1_Depto4, "n2")

        Call CalcularDepto5(Me.lblRealPart_M1_50, Me.lblRealPart_M1_51, Me.lblRealPart_M1_52, Me.lblRealPart_M1_53, _
                            Me.lblRealPart_M1_54, Me.lblRealPart_M1_55, Me.lblRealPart_M1_Depto5, "n2")

        Call CalcularTotal(Me.lblRealPart_M1_Depto1, Me.lblRealPart_M1_Depto2, Me.lblRealPart_M1_Depto3, Me.lblRealPart_M1_Depto4, Me.lblRealPart_M1_Depto5, Me.lblRealPart_M1_Total, "n2")
    End Sub

    Private Sub CalcularDepartamentoHistorico_M3()
        'Calcular M1
        Call CalcularDepto1(Me.lblReal_M2_1, Me.lblReal_M2_2, Me.lblReal_M2_3, Me.lblReal_M2_4, Me.lblReal_M2_5, _
                            Me.lblReal_M2_6, Me.lblReal_M2_7, Me.lblReal_M2_8, Me.lblReal_M2_9, Me.lblReal_M2_Depto1, "n0")

        Call CalcularDepto2(Me.lblReal_M2_11, Me.lblReal_M2_12, Me.lblReal_M2_13, Me.lblReal_M2_14, Me.lblReal_M2_15, _
                            Me.lblReal_M2_16, Me.lblReal_M2_17, Me.lblReal_M2_18, Me.lblReal_M2_19, _
                            Me.lblReal_M2_21, Me.lblReal_M2_22, Me.lblReal_M2_23, Me.lblReal_M2_25, Me.lblReal_M2_Depto2, "n0")

        Call CalcularDepto3(Me.lblReal_M2_30, Me.lblReal_M2_31, Me.lblReal_M2_32, Me.lblReal_M2_33, Me.lblReal_M2_34, _
                            Me.lblReal_M2_35, Me.lblReal_M2_36, Me.lblReal_M2_Depto3, "n0")

        Call CalcularDepto4(Me.lblReal_M2_40, Me.lblReal_M2_41, Me.lblReal_M2_42, Me.lblReal_M2_49, Me.lblReal_M2_Depto4, "n0")

        Call CalcularDepto5(Me.lblReal_M2_50, Me.lblReal_M2_51, Me.lblReal_M2_52, Me.lblReal_M2_53, _
                            Me.lblReal_M2_54, Me.lblReal_M2_55, Me.lblReal_M2_Depto5, "n0")

        Call CalcularTotal(Me.lblReal_M2_Depto1, Me.lblReal_M2_Depto2, Me.lblReal_M2_Depto3, Me.lblReal_M2_Depto4, Me.lblReal_M2_Depto5, Me.lblReal_M2_Total, "n0")



        'Calcular Percentual
        Call CalcularDepto1(Me.lblRealPart_M2_1, Me.lblRealPart_M2_2, Me.lblRealPart_M2_3, Me.lblRealPart_M2_4, Me.lblRealPart_M2_5, _
                            Me.lblRealPart_M2_6, Me.lblRealPart_M2_7, Me.lblRealPart_M2_8, Me.lblRealPart_M2_9, Me.lblRealPart_M2_Depto1, "n2")

        Call CalcularDepto2(Me.lblRealPart_M2_11, Me.lblRealPart_M2_12, Me.lblRealPart_M2_13, Me.lblRealPart_M2_14, Me.lblRealPart_M2_15, _
                            Me.lblRealPart_M2_16, Me.lblRealPart_M2_17, Me.lblRealPart_M2_18, Me.lblRealPart_M2_19, _
                            Me.lblRealPart_M2_21, Me.lblRealPart_M2_22, Me.lblRealPart_M2_23, Me.lblRealPart_M2_25, Me.lblRealPart_M2_Depto2, "n2")

        Call CalcularDepto3(Me.lblRealPart_M2_30, Me.lblRealPart_M2_31, Me.lblRealPart_M2_32, Me.lblRealPart_M2_33, Me.lblRealPart_M2_34, _
                            Me.lblRealPart_M2_35, Me.lblRealPart_M2_36, Me.lblRealPart_M2_Depto3, "n2")

        Call CalcularDepto4(Me.lblRealPart_M2_40, Me.lblRealPart_M2_41, Me.lblRealPart_M2_42, Me.lblRealPart_M2_49, Me.lblRealPart_M2_Depto4, "n2")

        Call CalcularDepto5(Me.lblRealPart_M2_50, Me.lblRealPart_M2_51, Me.lblRealPart_M2_52, Me.lblRealPart_M2_53, _
                            Me.lblRealPart_M2_54, Me.lblRealPart_M2_55, Me.lblRealPart_M2_Depto5, "n2")

        Call CalcularTotal(Me.lblRealPart_M2_Depto1, Me.lblRealPart_M2_Depto2, Me.lblRealPart_M2_Depto3, Me.lblRealPart_M2_Depto4, Me.lblRealPart_M2_Depto5, Me.lblRealPart_M2_Total, "n2")

    End Sub





#End Region

#Region " Formula de Calculo dos Departamentos"

    Private Sub CalcularDepto1(ByVal Secao1 As Label,
                               ByVal Secao2 As Label,
                               ByVal Secao3 As Label,
                               ByVal Secao4 As Label,
                               ByVal Secao5 As Label,
                               ByVal Secao6 As Label,
                               ByVal Secao7 As Label,
                               ByVal Secao8 As Label,
                               ByVal Secao9 As Label,
                               ByVal Departamento1 As Label,
                               ByVal StringFormat As String)

        Dim vlrDepto As Decimal = (CDbl(Secao1.Text) + CDbl(Secao2.Text) + CDbl(Secao3.Text) + CDbl(Secao4.Text) + CDbl(Secao5.Text) + _
                              CDbl(Secao6.Text) + CDbl(Secao7.Text) + CDbl(Secao8.Text) + CDbl(Secao9.Text))

        Departamento1.Text = vlrDepto.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrDepto, Departamento1)
    End Sub

    Private Sub CalcularDepto2(ByVal Secao11 As Label,
                                ByVal Secao12 As Label,
                                ByVal Secao13 As Label,
                                ByVal Secao14 As Label,
                                ByVal Secao15 As Label,
                                ByVal Secao16 As Label,
                                ByVal Secao17 As Label,
                                ByVal Secao18 As Label,
                                ByVal Secao19 As Label,
                                ByVal Secao21 As Label,
                                ByVal Secao22 As Label,
                                ByVal Secao23 As Label,
                                ByVal Secao25 As Label,
                                ByVal Departamento2 As Label,
                               ByVal StringFormat As String)

        Dim vlrDepto As Decimal = (CDbl(Secao11.Text) + CDbl(Secao12.Text) + CDbl(Secao13.Text) + CDbl(Secao14.Text) + CDbl(Secao15.Text) + _
                              CDbl(Secao16.Text) + CDbl(Secao17.Text) + CDbl(Secao18.Text) + CDbl(Secao19.Text) + CDbl(Secao21.Text) + _
                              CDbl(Secao22.Text) + CDbl(Secao23.Text) + CDbl(Secao25.Text))

        Departamento2.Text = vlrDepto.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrDepto, Departamento2)

    End Sub

    Private Sub CalcularDepto3(ByVal Secao30 As Label,
                             ByVal Secao31 As Label,
                             ByVal Secao32 As Label,
                             ByVal Secao33 As Label,
                             ByVal Secao34 As Label,
                             ByVal Secao35 As Label,
                             ByVal Secao36 As Label,
                             ByVal Departamento3 As Label,
                               ByVal StringFormat As String)

        Dim vlrDepto As Decimal = (CDbl(Secao30.Text) + CDbl(Secao31.Text) + CDbl(Secao32.Text) + CDbl(Secao33.Text) + _
                              CDbl(Secao34.Text) + CDbl(Secao35.Text) + CDbl(Secao36.Text))
        Departamento3.Text = vlrDepto.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrDepto, Departamento3)

    End Sub

    Private Sub CalcularDepto4(ByVal Secao40 As Label,
                              ByVal Secao41 As Label,
                              ByVal Secao42 As Label,
                              ByVal Secao49 As Label,
                              ByVal Departamento4 As Label,
                               ByVal StringFormat As String)

        Dim vlrDepto As Decimal = (CDbl(Secao40.Text) + CDbl(Secao41.Text) + CDbl(Secao42.Text) + CDbl(Secao49.Text))

        Departamento4.Text = vlrDepto.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrDepto, Departamento4)
    End Sub

    Private Sub CalcularDepto5(ByVal Secao50 As Label,
                               ByVal Secao51 As Label,
                               ByVal Secao52 As Label,
                               ByVal Secao53 As Label,
                               ByVal Secao54 As Label,
                               ByVal Secao55 As Label,
                               ByVal Departamento5 As Label,
                               ByVal StringFormat As String)

        Dim vlrDepto As Decimal = (CDbl(Secao50.Text) + CDbl(Secao51.Text) + CDbl(Secao52.Text) + _
                              CDbl(Secao53.Text) + CDbl(Secao54.Text) + CDbl(Secao55.Text))

        Departamento5.Text = vlrDepto.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrDepto, Departamento5)
    End Sub

    Private Sub CalcularTotal(ByVal Departamento1 As Label,
                               ByVal Departamento2 As Label,
                               ByVal Departamento3 As Label,
                               ByVal Departamento4 As Label,
                               ByVal Departamento5 As Label,
                               ByVal Total As Label,
                               ByVal StringFormat As String)

        Dim vlrTotal As Decimal = (CDbl(Departamento1.Text) + CDbl(Departamento2.Text) + CDbl(Departamento3.Text) + _
                      CDbl(Departamento4.Text) + CDbl(Departamento5.Text) + CDbl(Secao_99.Text))

        Total.Text = vlrTotal.ToString(StringFormat)
        FormatarVermelhoSeNegativo(vlrTotal, Total)
    End Sub

#End Region

#Region " Calcular Sugestão"

    'Calcular Percentual Departamento da Sugestão
    Private Sub CalcularDepartamentoSugestao_Percentual()

        Dim strFormato As String = "n2"

        Call CalcularDepto1(Me.lblSugestao_1, Me.lblSugestao_2, Me.lblSugestao_3, Me.lblSugestao_4, Me.lblSugestao_5, _
                            Me.lblSugestao_6, Me.lblSugestao_7, Me.lblSugestao_8, Me.lblSugestao_9, Me.lblSugestao_Depto1, strFormato)

        Call CalcularDepto2(Me.lblSugestao_11, Me.lblSugestao_12, Me.lblSugestao_13, Me.lblSugestao_14, Me.lblSugestao_15, _
                            Me.lblSugestao_16, Me.lblSugestao_17, Me.lblSugestao_18, Me.lblSugestao_19, _
                            Me.lblSugestao_21, Me.lblSugestao_22, Me.lblSugestao_23, Me.lblSugestao_25, Me.lblSugestao_Depto2, strFormato)

        Call CalcularDepto3(Me.lblSugestao_30, Me.lblSugestao_31, Me.lblSugestao_32, Me.lblSugestao_33, Me.lblSugestao_34, _
                            Me.lblSugestao_35, Me.lblSugestao_36, Me.lblSugestao_Depto3, strFormato)

        Call CalcularDepto4(Me.lblSugestao_40, Me.lblSugestao_41, Me.lblSugestao_42, Me.lblSugestao_49, Me.lblSugestao_Depto4, strFormato)

        Call CalcularDepto5(Me.lblSugestao_50, Me.lblSugestao_51, Me.lblSugestao_52, Me.lblSugestao_53, _
                            Me.lblSugestao_54, Me.lblSugestao_55, Me.lblSugestao_Depto5, strFormato)

        Call CalcularTotal(Me.lblSugestao_Depto1, Me.lblSugestao_Depto2, Me.lblSugestao_Depto3, Me.lblSugestao_Depto4, Me.lblSugestao_Depto5, Me.lblSugestao_Total, strFormato)

    End Sub

    'Calcular Valor Departamento da Sugestão
    Private Sub CalcularDepartamentoSugestao_Valor()

        Dim strFormato As String = "n0"

        Call CalcularDepto1(Me.lblSugestaoVlr_1, Me.lblSugestaoVlr_2, Me.lblSugestaoVlr_3, Me.lblSugestaoVlr_4, Me.lblSugestaoVlr_5, _
                            Me.lblSugestaoVlr_6, Me.lblSugestaoVlr_7, Me.lblSugestaoVlr_8, Me.lblSugestaoVlr_9, Me.lblSugestaoVlr_Depto1, strFormato)

        Call CalcularDepto2(Me.lblSugestaoVlr_11, Me.lblSugestaoVlr_12, Me.lblSugestaoVlr_13, Me.lblSugestaoVlr_14, Me.lblSugestaoVlr_15, _
                            Me.lblSugestaoVlr_16, Me.lblSugestaoVlr_17, Me.lblSugestaoVlr_18, Me.lblSugestaoVlr_19, _
                            Me.lblSugestaoVlr_21, Me.lblSugestaoVlr_22, Me.lblSugestaoVlr_23, Me.lblSugestaoVlr_25, Me.lblSugestaoVlr_Depto2, strFormato)

        Call CalcularDepto3(Me.lblSugestaoVlr_30, Me.lblSugestaoVlr_31, Me.lblSugestaoVlr_32, Me.lblSugestaoVlr_33, Me.lblSugestaoVlr_34, _
                            Me.lblSugestaoVlr_35, Me.lblSugestaoVlr_36, Me.lblSugestaoVlr_Depto3, strFormato)

        Call CalcularDepto4(Me.lblSugestaoVlr_40, Me.lblSugestaoVlr_41, Me.lblSugestaoVlr_42, Me.lblSugestaoVlr_49, Me.lblSugestaoVlr_Depto4, strFormato)

        Call CalcularDepto5(Me.lblSugestaoVlr_50, Me.lblSugestaoVlr_51, Me.lblSugestaoVlr_52, Me.lblSugestaoVlr_53, _
                            Me.lblSugestaoVlr_54, Me.lblSugestaoVlr_55, Me.lblSugestaoVlr_Depto5, strFormato)

        Call CalcularTotal(Me.lblSugestaoVlr_Depto1, Me.lblSugestaoVlr_Depto2, Me.lblSugestaoVlr_Depto3, Me.lblSugestaoVlr_Depto4, Me.lblSugestaoVlr_Depto5, Me.lblSugestaoVlr_Total, strFormato)

    End Sub



#End Region

    Private Sub CalcularDeptoDiferenca()

        'Calcular Percentual
        Call CalcularDepto1(Me.lblDif_1, Me.lblDif_2, Me.lblDif_3, Me.lblDif_4, Me.lblDif_5, _
                            Me.lblDif_6, Me.lblDif_7, Me.lblDif_8, Me.lblDif_9, Me.lblDif_Depto1, "n0")

        Call CalcularDepto2(Me.lblDif_11, Me.lblDif_12, Me.lblDif_13, Me.lblDif_14, Me.lblDif_15, _
                            Me.lblDif_16, Me.lblDif_17, Me.lblDif_18, Me.lblDif_19, _
                            Me.lblDif_21, Me.lblDif_22, Me.lblDif_23, Me.lblDif_25, Me.lblDif_Depto2, "n0")

        Call CalcularDepto3(Me.lblDif_30, Me.lblDif_31, Me.lblDif_32, Me.lblDif_33, Me.lblDif_34, _
                            Me.lblDif_35, Me.lblDif_36, Me.lblDif_Depto3, "n0")

        Call CalcularDepto4(Me.lblDif_40, Me.lblDif_41, Me.lblDif_42, Me.lblDif_49, Me.lblDif_Depto4, "n0")

        Call CalcularDepto5(Me.lblDif_50, Me.lblDif_51, Me.lblDif_52, Me.lblDif_53, _
                            Me.lblDif_54, Me.lblDif_55, Me.lblDif_Depto5, "n0")

        Call CalcularTotal(Me.lblDif_Depto1, Me.lblDif_Depto2, Me.lblDif_Depto3, Me.lblDif_Depto4, Me.lblDif_Depto5, Me.lblDif_Total, "n0")


    End Sub

#End Region

#Region " Históricos"

#Region " Mes 1"

    Sub _buscarVendaSecao_Call_Real_M1(idTipoSecao As Byte, idSecao As Byte, vlrSecao As Label, percSecao As Label)
        Dim varMes As Byte
        Dim varAno As Int16

        If cboMes.CallMes = 1 Then  ' Mès de Janeiro
            varMes = 12
            varAno = cboAno.CallAno - 1
        End If

        If cboMes.CallMes = 2 Then  ' Mès de Fevereiro
            varMes = 1
            varAno = cboAno.CallAno
        End If

        If cboMes.CallMes = 3 Then  ' Mès de Março
            varMes = 2
            varAno = cboAno.CallAno
        End If

        'Select Case cboMes.CallMes
        '    Case Is < 4
        '        oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)
        '    Case Else
        '        oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 1, Me.cboFilial.CallFilial, idSecao, 1)
        'End Select

        If cboMes.CallMes < 4 Then
            oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)

        Else
            oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 1, Me.cboFilial.CallFilial, idSecao, 1)

        End If

        vlrSecao.Text = oVEM.vlrRea
        percSecao.Text = oVEM.percRea
    End Sub

    Sub BuscarVendaSecaoReal_M1()

        'Depto 1 - Mercearia
        _buscarVendaSecao_Call_Real_M1(1, 1, Me.lblReal_M0_1, Me.lblRealPart_M0_1)
        _buscarVendaSecao_Call_Real_M1(1, 2, Me.lblReal_M0_2, Me.lblRealPart_M0_2)
        _buscarVendaSecao_Call_Real_M1(1, 3, Me.lblReal_M0_3, Me.lblRealPart_M0_3)
        _buscarVendaSecao_Call_Real_M1(1, 4, Me.lblReal_M0_4, Me.lblRealPart_M0_4)
        _buscarVendaSecao_Call_Real_M1(1, 5, Me.lblReal_M0_5, Me.lblRealPart_M0_5)
        _buscarVendaSecao_Call_Real_M1(1, 6, Me.lblReal_M0_6, Me.lblRealPart_M0_6)
        _buscarVendaSecao_Call_Real_M1(1, 7, Me.lblReal_M0_7, Me.lblRealPart_M0_7)
        _buscarVendaSecao_Call_Real_M1(1, 8, Me.lblReal_M0_8, Me.lblRealPart_M0_8)
        _buscarVendaSecao_Call_Real_M1(1, 9, Me.lblReal_M0_9, Me.lblRealPart_M0_9)

        ''Depto 2 - Pereciveis
        _buscarVendaSecao_Call_Real_M1(1, 11, Me.lblReal_M0_11, Me.lblRealPart_M0_11)
        _buscarVendaSecao_Call_Real_M1(1, 12, Me.lblReal_M0_12, Me.lblRealPart_M0_12)
        _buscarVendaSecao_Call_Real_M1(1, 13, Me.lblReal_M0_13, Me.lblRealPart_M0_13)
        _buscarVendaSecao_Call_Real_M1(1, 14, Me.lblReal_M0_14, Me.lblRealPart_M0_14)
        _buscarVendaSecao_Call_Real_M1(1, 15, Me.lblReal_M0_15, Me.lblRealPart_M0_15)
        _buscarVendaSecao_Call_Real_M1(1, 16, Me.lblReal_M0_16, Me.lblRealPart_M0_16)
        _buscarVendaSecao_Call_Real_M1(1, 17, Me.lblReal_M0_17, Me.lblRealPart_M0_17)
        _buscarVendaSecao_Call_Real_M1(1, 18, Me.lblReal_M0_18, Me.lblRealPart_M0_18)
        _buscarVendaSecao_Call_Real_M1(1, 19, Me.lblReal_M0_19, Me.lblRealPart_M0_19)
        _buscarVendaSecao_Call_Real_M1(1, 21, Me.lblReal_M0_21, Me.lblRealPart_M0_21)
        _buscarVendaSecao_Call_Real_M1(1, 22, Me.lblReal_M0_22, Me.lblRealPart_M0_22)
        _buscarVendaSecao_Call_Real_M1(1, 23, Me.lblReal_M0_23, Me.lblRealPart_M0_23)
        _buscarVendaSecao_Call_Real_M1(1, 25, Me.lblReal_M0_25, Me.lblRealPart_M0_25)

        'Depto 3 - Bazar
        _buscarVendaSecao_Call_Real_M1(1, 30, Me.lblReal_M0_30, Me.lblRealPart_M0_30)
        _buscarVendaSecao_Call_Real_M1(1, 31, Me.lblReal_M0_31, Me.lblRealPart_M0_31)
        _buscarVendaSecao_Call_Real_M1(1, 32, Me.lblReal_M0_32, Me.lblRealPart_M0_32)
        _buscarVendaSecao_Call_Real_M1(1, 33, Me.lblReal_M0_33, Me.lblRealPart_M0_33)
        _buscarVendaSecao_Call_Real_M1(1, 34, Me.lblReal_M0_34, Me.lblRealPart_M0_34)
        _buscarVendaSecao_Call_Real_M1(1, 35, Me.lblReal_M0_35, Me.lblRealPart_M0_35)
        _buscarVendaSecao_Call_Real_M1(1, 36, Me.lblReal_M0_36, Me.lblRealPart_M0_36)

        'Depto 4 - Textil
        _buscarVendaSecao_Call_Real_M1(1, 40, Me.lblReal_M0_40, Me.lblRealPart_M0_40)
        _buscarVendaSecao_Call_Real_M1(1, 41, Me.lblReal_M0_41, Me.lblRealPart_M0_41)
        _buscarVendaSecao_Call_Real_M1(1, 42, Me.lblReal_M0_42, Me.lblRealPart_M0_42)
        _buscarVendaSecao_Call_Real_M1(1, 49, Me.lblReal_M0_49, Me.lblRealPart_M0_49)

        'Depto 5 - Eletrodomésticos
        _buscarVendaSecao_Call_Real_M1(1, 50, Me.lblReal_M0_50, Me.lblRealPart_M0_50)
        _buscarVendaSecao_Call_Real_M1(1, 51, Me.lblReal_M0_51, Me.lblRealPart_M0_51)
        _buscarVendaSecao_Call_Real_M1(1, 52, Me.lblReal_M0_52, Me.lblRealPart_M0_52)
        _buscarVendaSecao_Call_Real_M1(1, 53, Me.lblReal_M0_53, Me.lblRealPart_M0_53)
        _buscarVendaSecao_Call_Real_M1(1, 54, Me.lblReal_M0_54, Me.lblRealPart_M0_54)
        _buscarVendaSecao_Call_Real_M1(1, 55, Me.lblReal_M0_55, Me.lblRealPart_M0_55)

        _buscarVendaSecao_Call_Real_M1(1, 99, Me.lblReal_M0_99, Me.lblRealPart_M0_99)

    End Sub

#End Region

#Region " Mes 2"

    Sub _buscarVendaSecao_Call_Real_M2(idTipoSecao As Byte, idSecao As Byte, vlrSecao As Label, percSecao As Label)

        Dim varMes As Byte
        Dim varAno As Int16

        If cboMes.CallMes = 1 Then  ' Mès de Janeiro
            varMes = 11
            varAno = cboAno.CallAno - 1
        End If

        If cboMes.CallMes = 2 Then  ' Mès de Fevereiro
            varMes = 12
            varAno = cboAno.CallAno - 1
        End If

        If cboMes.CallMes = 3 Then  ' Mès de Março
            varMes = 1
            varAno = cboAno.CallAno
        End If

        'Select Case cboMes.CallMes
        '    Case Is < 4
        '        oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)
        '    Case Else
        '        oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 2, Me.cboFilial.CallFilial, idSecao, 1)
        'End Select

        If cboMes.CallMes < 4 Then
            oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)
        Else
            oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 2, Me.cboFilial.CallFilial, idSecao, 1)
        End If

        vlrSecao.Text = oVEM.vlrRea
        percSecao.Text = oVEM.percRea
    End Sub

    Sub BuscarVendaSecaoReal_M2()

        'Depto 1 - Mercearia
        _buscarVendaSecao_Call_Real_M2(1, 1, Me.lblReal_M1_01, Me.lblRealPart_M1_1)
        _buscarVendaSecao_Call_Real_M2(1, 2, Me.lblReal_M1_02, Me.lblRealPart_M1_2)
        _buscarVendaSecao_Call_Real_M2(1, 3, Me.lblReal_M1_03, Me.lblRealPart_M1_3)
        _buscarVendaSecao_Call_Real_M2(1, 4, Me.lblReal_M1_04, Me.lblRealPart_M1_4)
        _buscarVendaSecao_Call_Real_M2(1, 5, Me.lblReal_M1_05, Me.lblRealPart_M1_5)
        _buscarVendaSecao_Call_Real_M2(1, 6, Me.lblReal_M1_06, Me.lblRealPart_M1_6)
        _buscarVendaSecao_Call_Real_M2(1, 7, Me.lblReal_M1_07, Me.lblRealPart_M1_7)
        _buscarVendaSecao_Call_Real_M2(1, 8, Me.lblReal_M1_08, Me.lblRealPart_M1_8)
        _buscarVendaSecao_Call_Real_M2(1, 9, Me.lblReal_M1_09, Me.lblRealPart_M1_9)

        ''Depto 2 - Pereciveis
        _buscarVendaSecao_Call_Real_M2(1, 11, Me.lblReal_M1_11, Me.lblRealPart_M1_11)
        _buscarVendaSecao_Call_Real_M2(1, 12, Me.lblReal_M1_12, Me.lblRealPart_M1_12)
        _buscarVendaSecao_Call_Real_M2(1, 13, Me.lblReal_M1_13, Me.lblRealPart_M1_13)
        _buscarVendaSecao_Call_Real_M2(1, 14, Me.lblReal_M1_14, Me.lblRealPart_M1_14)
        _buscarVendaSecao_Call_Real_M2(1, 15, Me.lblReal_M1_15, Me.lblRealPart_M1_15)
        _buscarVendaSecao_Call_Real_M2(1, 16, Me.lblReal_M1_16, Me.lblRealPart_M1_16)
        _buscarVendaSecao_Call_Real_M2(1, 17, Me.lblReal_M1_17, Me.lblRealPart_M1_17)
        _buscarVendaSecao_Call_Real_M2(1, 18, Me.lblReal_M1_18, Me.lblRealPart_M1_18)
        _buscarVendaSecao_Call_Real_M2(1, 19, Me.lblReal_M1_19, Me.lblRealPart_M1_19)
        _buscarVendaSecao_Call_Real_M2(1, 21, Me.lblReal_M1_21, Me.lblRealPart_M1_21)
        _buscarVendaSecao_Call_Real_M2(1, 22, Me.lblReal_M1_22, Me.lblRealPart_M1_22)
        _buscarVendaSecao_Call_Real_M2(1, 23, Me.lblReal_M1_23, Me.lblRealPart_M1_23)
        _buscarVendaSecao_Call_Real_M2(1, 25, Me.lblReal_M1_25, Me.lblRealPart_M1_25)

        'Depto 3 - Bazar
        _buscarVendaSecao_Call_Real_M2(1, 30, Me.lblReal_M1_30, Me.lblRealPart_M1_30)
        _buscarVendaSecao_Call_Real_M2(1, 31, Me.lblReal_M1_31, Me.lblRealPart_M1_31)
        _buscarVendaSecao_Call_Real_M2(1, 32, Me.lblReal_M1_32, Me.lblRealPart_M1_32)
        _buscarVendaSecao_Call_Real_M2(1, 33, Me.lblReal_M1_33, Me.lblRealPart_M1_33)
        _buscarVendaSecao_Call_Real_M2(1, 34, Me.lblReal_M1_34, Me.lblRealPart_M1_34)
        _buscarVendaSecao_Call_Real_M2(1, 35, Me.lblReal_M1_35, Me.lblRealPart_M1_35)
        _buscarVendaSecao_Call_Real_M2(1, 36, Me.lblReal_M1_36, Me.lblRealPart_M1_36)


        'Depto 4 - Textil
        _buscarVendaSecao_Call_Real_M2(1, 40, Me.lblReal_M1_40, Me.lblRealPart_M1_40)
        _buscarVendaSecao_Call_Real_M2(1, 41, Me.lblReal_M1_41, Me.lblRealPart_M1_41)
        _buscarVendaSecao_Call_Real_M2(1, 42, Me.lblReal_M1_42, Me.lblRealPart_M1_42)
        _buscarVendaSecao_Call_Real_M2(1, 49, Me.lblReal_M1_49, Me.lblRealPart_M1_49)

        'Depto 5 - Eletrodomésticos
        _buscarVendaSecao_Call_Real_M2(1, 50, Me.lblReal_M1_50, Me.lblRealPart_M1_50)
        _buscarVendaSecao_Call_Real_M2(1, 51, Me.lblReal_M1_51, Me.lblRealPart_M1_51)
        _buscarVendaSecao_Call_Real_M2(1, 52, Me.lblReal_M1_52, Me.lblRealPart_M1_52)
        _buscarVendaSecao_Call_Real_M2(1, 53, Me.lblReal_M1_53, Me.lblRealPart_M1_53)
        _buscarVendaSecao_Call_Real_M2(1, 54, Me.lblReal_M1_54, Me.lblRealPart_M1_54)
        _buscarVendaSecao_Call_Real_M2(1, 55, Me.lblReal_M1_55, Me.lblRealPart_M1_55)

        _buscarVendaSecao_Call_Real_M2(1, 99, Me.lblReal_M1_99, Me.lblRealPart_M1_99)

    End Sub

#End Region

#Region " Mes 3"

    Sub _buscarVendaSecao_Call_Real_M3(idTipoSecao As Byte, idSecao As Byte, vlrSecao As Label, percSecao As Label)

        Dim varMes As Byte
        Dim varAno As Int16

        If cboMes.CallMes = 1 Then  ' Mès de Janeiro
            varMes = 10
            varAno = cboAno.CallAno - 1
        End If

        If cboMes.CallMes = 2 Then  ' Mès de Fevereiro
            varMes = 11
            varAno = cboAno.CallAno - 1
        End If

        If cboMes.CallMes = 3 Then  ' Mès de Março
            varMes = 12
            varAno = cboAno.CallAno - 1
        End If

        'Select Case cboMes.CallMes
        '    Case Is < 4
        '        oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)
        '    Case Else
        '        oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 3, Me.cboFilial.CallFilial, idSecao, 1)
        'End Select

        If cboMes.CallMes < 4 Then
            oVEM.BuscaSecao_VendaMargem_Rea(varAno, varMes, Me.cboFilial.CallFilial, idSecao, 1)
        Else
            oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno, Me.cboMes.CallMes - 3, Me.cboFilial.CallFilial, idSecao, 1)
        End If

        vlrSecao.Text = oVEM.vlrRea
        percSecao.Text = oVEM.percRea
    End Sub

    Sub BuscarVendaSecaoReal_M3()

        'Depto 1 - Mercearia
        _buscarVendaSecao_Call_Real_M3(1, 1, Me.lblReal_M2_1, Me.lblRealPart_M2_1)
        _buscarVendaSecao_Call_Real_M3(1, 2, Me.lblReal_M2_2, Me.lblRealPart_M2_2)
        _buscarVendaSecao_Call_Real_M3(1, 3, Me.lblReal_M2_3, Me.lblRealPart_M2_3)
        _buscarVendaSecao_Call_Real_M3(1, 4, Me.lblReal_M2_4, Me.lblRealPart_M2_4)
        _buscarVendaSecao_Call_Real_M3(1, 5, Me.lblReal_M2_5, Me.lblRealPart_M2_5)
        _buscarVendaSecao_Call_Real_M3(1, 6, Me.lblReal_M2_6, Me.lblRealPart_M2_6)
        _buscarVendaSecao_Call_Real_M3(1, 7, Me.lblReal_M2_7, Me.lblRealPart_M2_7)
        _buscarVendaSecao_Call_Real_M3(1, 8, Me.lblReal_M2_8, Me.lblRealPart_M2_8)
        _buscarVendaSecao_Call_Real_M3(1, 9, Me.lblReal_M2_9, Me.lblRealPart_M2_9)

        ''Depto 2 - Pereciveis
        _buscarVendaSecao_Call_Real_M3(1, 11, Me.lblReal_M2_11, Me.lblRealPart_M2_11)
        _buscarVendaSecao_Call_Real_M3(1, 12, Me.lblReal_M2_12, Me.lblRealPart_M2_12)
        _buscarVendaSecao_Call_Real_M3(1, 13, Me.lblReal_M2_13, Me.lblRealPart_M2_13)
        _buscarVendaSecao_Call_Real_M3(1, 14, Me.lblReal_M2_14, Me.lblRealPart_M2_14)
        _buscarVendaSecao_Call_Real_M3(1, 15, Me.lblReal_M2_15, Me.lblRealPart_M2_15)
        _buscarVendaSecao_Call_Real_M3(1, 16, Me.lblReal_M2_16, Me.lblRealPart_M2_16)
        _buscarVendaSecao_Call_Real_M3(1, 17, Me.lblReal_M2_17, Me.lblRealPart_M2_17)
        _buscarVendaSecao_Call_Real_M3(1, 18, Me.lblReal_M2_18, Me.lblRealPart_M2_18)
        _buscarVendaSecao_Call_Real_M3(1, 19, Me.lblReal_M2_19, Me.lblRealPart_M2_19)
        _buscarVendaSecao_Call_Real_M3(1, 21, Me.lblReal_M2_21, Me.lblRealPart_M2_21)
        _buscarVendaSecao_Call_Real_M3(1, 22, Me.lblReal_M2_22, Me.lblRealPart_M2_22)
        _buscarVendaSecao_Call_Real_M3(1, 23, Me.lblReal_M2_23, Me.lblRealPart_M2_23)
        _buscarVendaSecao_Call_Real_M3(1, 25, Me.lblReal_M2_25, Me.lblRealPart_M2_25)

        'Depto 3 - Bazar
        _buscarVendaSecao_Call_Real_M3(1, 30, Me.lblReal_M2_30, Me.lblRealPart_M2_30)
        _buscarVendaSecao_Call_Real_M3(1, 31, Me.lblReal_M2_31, Me.lblRealPart_M2_31)
        _buscarVendaSecao_Call_Real_M3(1, 32, Me.lblReal_M2_32, Me.lblRealPart_M2_32)
        _buscarVendaSecao_Call_Real_M3(1, 33, Me.lblReal_M2_33, Me.lblRealPart_M2_33)
        _buscarVendaSecao_Call_Real_M3(1, 34, Me.lblReal_M2_34, Me.lblRealPart_M2_34)
        _buscarVendaSecao_Call_Real_M3(1, 35, Me.lblReal_M2_35, Me.lblRealPart_M2_35)
        _buscarVendaSecao_Call_Real_M3(1, 36, Me.lblReal_M2_36, Me.lblRealPart_M2_36)


        'Depto 4 - Textil
        _buscarVendaSecao_Call_Real_M3(1, 40, Me.lblReal_M2_40, Me.lblRealPart_M2_40)
        _buscarVendaSecao_Call_Real_M3(1, 41, Me.lblReal_M2_41, Me.lblRealPart_M2_41)
        _buscarVendaSecao_Call_Real_M3(1, 42, Me.lblReal_M2_42, Me.lblRealPart_M2_42)
        _buscarVendaSecao_Call_Real_M3(1, 49, Me.lblReal_M2_49, Me.lblRealPart_M2_49)

        'Depto 5 - Eletrodomésticos
        _buscarVendaSecao_Call_Real_M3(1, 50, Me.lblReal_M2_50, Me.lblRealPart_M2_50)
        _buscarVendaSecao_Call_Real_M3(1, 51, Me.lblReal_M2_51, Me.lblRealPart_M2_51)
        _buscarVendaSecao_Call_Real_M3(1, 52, Me.lblReal_M2_52, Me.lblRealPart_M2_52)
        _buscarVendaSecao_Call_Real_M3(1, 53, Me.lblReal_M2_53, Me.lblRealPart_M2_53)
        _buscarVendaSecao_Call_Real_M3(1, 54, Me.lblReal_M2_54, Me.lblRealPart_M2_54)
        _buscarVendaSecao_Call_Real_M3(1, 55, Me.lblReal_M2_55, Me.lblRealPart_M2_55)

        _buscarVendaSecao_Call_Real_M3(1, 99, Me.lblReal_M2_99, Me.lblRealPart_M2_99)

    End Sub

#End Region

#Region " AA"

    Sub _buscarVendaSecao_Call_Real_AA(idTipoSecao As Byte, idSecao As Byte, vlrSecao As Label, percSecao As Label)

        oVEM.BuscaSecao_VendaMargem_Rea(Me.cboAno.CallAno - 1, Me.cboMes.CallMes, Me.cboFilial.CallFilial, idSecao, 1)

        vlrSecao.Text = oVEM.vlrRea
        percSecao.Text = oVEM.percRea
    End Sub

    Sub BuscarVendaSecaoReal_AA()

        'Depto 1 - Mercearia
        _buscarVendaSecao_Call_Real_AA(1, 1, Me.lblReal_AA_1, Me.lblRealPart_AA_1)
        _buscarVendaSecao_Call_Real_AA(1, 2, Me.lblReal_AA_2, Me.lblRealPart_AA_2)
        _buscarVendaSecao_Call_Real_AA(1, 3, Me.lblReal_AA_3, Me.lblRealPart_AA_3)
        _buscarVendaSecao_Call_Real_AA(1, 4, Me.lblReal_AA_4, Me.lblRealPart_AA_4)
        _buscarVendaSecao_Call_Real_AA(1, 5, Me.lblReal_AA_5, Me.lblRealPart_AA_5)
        _buscarVendaSecao_Call_Real_AA(1, 6, Me.lblReal_AA_6, Me.lblRealPart_AA_6)
        _buscarVendaSecao_Call_Real_AA(1, 7, Me.lblReal_AA_7, Me.lblRealPart_AA_7)
        _buscarVendaSecao_Call_Real_AA(1, 8, Me.lblReal_AA_8, Me.lblRealPart_AA_8)
        _buscarVendaSecao_Call_Real_AA(1, 9, Me.lblReal_AA_9, Me.lblRealPart_AA_9)

        ''Depto 2 - Pereciveis
        _buscarVendaSecao_Call_Real_AA(1, 11, Me.lblReal_AA_11, Me.lblRealPart_AA_11)
        _buscarVendaSecao_Call_Real_AA(1, 12, Me.lblReal_AA_12, Me.lblRealPart_AA_12)
        _buscarVendaSecao_Call_Real_AA(1, 13, Me.lblReal_AA_13, Me.lblRealPart_AA_13)
        _buscarVendaSecao_Call_Real_AA(1, 14, Me.lblReal_AA_14, Me.lblRealPart_AA_14)
        _buscarVendaSecao_Call_Real_AA(1, 15, Me.lblReal_AA_15, Me.lblRealPart_AA_15)
        _buscarVendaSecao_Call_Real_AA(1, 16, Me.lblReal_AA_16, Me.lblRealPart_AA_16)
        _buscarVendaSecao_Call_Real_AA(1, 17, Me.lblReal_AA_17, Me.lblRealPart_AA_17)
        _buscarVendaSecao_Call_Real_AA(1, 18, Me.lblReal_AA_18, Me.lblRealPart_AA_18)
        _buscarVendaSecao_Call_Real_AA(1, 19, Me.lblReal_AA_19, Me.lblRealPart_AA_19)
        _buscarVendaSecao_Call_Real_AA(1, 21, Me.lblReal_AA_21, Me.lblRealPart_AA_21)
        _buscarVendaSecao_Call_Real_AA(1, 22, Me.lblReal_AA_22, Me.lblRealPart_AA_22)
        _buscarVendaSecao_Call_Real_AA(1, 23, Me.lblReal_AA_23, Me.lblRealPart_AA_23)
        _buscarVendaSecao_Call_Real_AA(1, 25, Me.lblReal_AA_25, Me.lblRealPart_AA_25)

        'Depto 3 - Bazar
        _buscarVendaSecao_Call_Real_AA(1, 30, Me.lblReal_AA_30, Me.lblRealPart_AA_30)
        _buscarVendaSecao_Call_Real_AA(1, 31, Me.lblReal_AA_31, Me.lblRealPart_AA_31)
        _buscarVendaSecao_Call_Real_AA(1, 32, Me.lblReal_AA_32, Me.lblRealPart_AA_32)
        _buscarVendaSecao_Call_Real_AA(1, 33, Me.lblReal_AA_33, Me.lblRealPart_AA_33)
        _buscarVendaSecao_Call_Real_AA(1, 34, Me.lblReal_AA_34, Me.lblRealPart_AA_34)
        _buscarVendaSecao_Call_Real_AA(1, 35, Me.lblReal_AA_35, Me.lblRealPart_AA_35)
        _buscarVendaSecao_Call_Real_AA(1, 36, Me.lblReal_AA_36, Me.lblRealPart_AA_36)

        'Depto 4 - Textil
        _buscarVendaSecao_Call_Real_AA(1, 40, Me.lblReal_AA_40, Me.lblRealPart_AA_40)
        _buscarVendaSecao_Call_Real_AA(1, 41, Me.lblReal_AA_41, Me.lblRealPart_AA_41)
        _buscarVendaSecao_Call_Real_AA(1, 42, Me.lblReal_AA_42, Me.lblRealPart_AA_42)
        _buscarVendaSecao_Call_Real_AA(1, 49, Me.lblReal_AA_49, Me.lblRealPart_AA_49)

        'Depto 5 - Eletrodomésticos
        _buscarVendaSecao_Call_Real_AA(1, 50, Me.lblReal_AA_50, Me.lblRealPart_AA_50)
        _buscarVendaSecao_Call_Real_AA(1, 51, Me.lblReal_AA_51, Me.lblRealPart_AA_51)
        _buscarVendaSecao_Call_Real_AA(1, 52, Me.lblReal_AA_52, Me.lblRealPart_AA_52)
        _buscarVendaSecao_Call_Real_AA(1, 53, Me.lblReal_AA_53, Me.lblRealPart_AA_53)
        _buscarVendaSecao_Call_Real_AA(1, 54, Me.lblReal_AA_54, Me.lblRealPart_AA_54)
        _buscarVendaSecao_Call_Real_AA(1, 55, Me.lblReal_AA_55, Me.lblRealPart_AA_55)

        _buscarVendaSecao_Call_Real_AA(1, 99, Me.lblReal_AA_99, Me.lblRealPart_AA_99)

    End Sub

#End Region



#End Region

#Region " Sugestão"

    Private Sub Calcular_Sugestao()

        'Departamento 1
        _calcular_Sugestao(lblSugestao_1, lblReal_M0_1, lblReal_M1_01, lblReal_M2_1, lblSugestaoVlr_1, lblReal_AA_1, Secao_01)
        _calcular_Sugestao(lblSugestao_2, lblReal_M0_2, lblReal_M1_02, lblReal_M2_2, lblSugestaoVlr_2, lblReal_AA_2, Secao_02)
        _calcular_Sugestao(lblSugestao_3, lblReal_M0_3, lblReal_M1_03, lblReal_M2_3, lblSugestaoVlr_3, lblReal_AA_3, Secao_03)
        _calcular_Sugestao(lblSugestao_4, lblReal_M0_4, lblReal_M1_04, lblReal_M2_4, lblSugestaoVlr_4, lblReal_AA_4, Secao_04)
        _calcular_Sugestao(lblSugestao_5, lblReal_M0_5, lblReal_M1_05, lblReal_M2_5, lblSugestaoVlr_5, lblReal_AA_5, Secao_05)
        _calcular_Sugestao(lblSugestao_6, lblReal_M0_6, lblReal_M1_06, lblReal_M2_6, lblSugestaoVlr_6, lblReal_AA_6, Secao_06)
        _calcular_Sugestao(lblSugestao_7, lblReal_M0_7, lblReal_M1_07, lblReal_M2_7, lblSugestaoVlr_7, lblReal_AA_7, Secao_07)
        _calcular_Sugestao(lblSugestao_8, lblReal_M0_8, lblReal_M1_08, lblReal_M2_8, lblSugestaoVlr_8, lblReal_AA_8, Secao_08)
        _calcular_Sugestao(lblSugestao_9, lblReal_M0_9, lblReal_M1_09, lblReal_M2_9, lblSugestaoVlr_9, lblReal_AA_9, Secao_09)

        'Departamento 2
        _calcular_Sugestao(lblSugestao_11, lblReal_M0_11, lblReal_M1_11, lblReal_M2_11, lblSugestaoVlr_11, lblReal_AA_11, Secao_11)
        _calcular_Sugestao(lblSugestao_12, lblReal_M0_12, lblReal_M1_12, lblReal_M2_12, lblSugestaoVlr_12, lblReal_AA_12, Secao_12)
        _calcular_Sugestao(lblSugestao_13, lblReal_M0_13, lblReal_M1_13, lblReal_M2_13, lblSugestaoVlr_13, lblReal_AA_13, Secao_13)
        _calcular_Sugestao(lblSugestao_14, lblReal_M0_14, lblReal_M1_14, lblReal_M2_14, lblSugestaoVlr_14, lblReal_AA_14, Secao_14)
        _calcular_Sugestao(lblSugestao_15, lblReal_M0_15, lblReal_M1_15, lblReal_M2_15, lblSugestaoVlr_15, lblReal_AA_15, Secao_15)
        _calcular_Sugestao(lblSugestao_16, lblReal_M0_16, lblReal_M1_16, lblReal_M2_16, lblSugestaoVlr_16, lblReal_AA_16, Secao_16)
        _calcular_Sugestao(lblSugestao_17, lblReal_M0_17, lblReal_M1_17, lblReal_M2_17, lblSugestaoVlr_17, lblReal_AA_17, Secao_17)
        _calcular_Sugestao(lblSugestao_18, lblReal_M0_18, lblReal_M1_18, lblReal_M2_18, lblSugestaoVlr_18, lblReal_AA_18, Secao_18)
        _calcular_Sugestao(lblSugestao_19, lblReal_M0_19, lblReal_M1_19, lblReal_M2_19, lblSugestaoVlr_19, lblReal_AA_19, Secao_19)
        _calcular_Sugestao(lblSugestao_21, lblReal_M0_21, lblReal_M1_21, lblReal_M2_21, lblSugestaoVlr_21, lblReal_AA_21, Secao_21)
        _calcular_Sugestao(lblSugestao_22, lblReal_M0_22, lblReal_M1_22, lblReal_M2_22, lblSugestaoVlr_22, lblReal_AA_22, Secao_22)
        _calcular_Sugestao(lblSugestao_23, lblReal_M0_23, lblReal_M1_23, lblReal_M2_23, lblSugestaoVlr_23, lblReal_AA_23, Secao_23)
        _calcular_Sugestao(lblSugestao_25, lblReal_M0_25, lblReal_M1_25, lblReal_M2_25, lblSugestaoVlr_25, lblReal_AA_25, Secao_25)

        'Departamento 3
        _calcular_Sugestao(lblSugestao_30, lblReal_M0_30, lblReal_M1_30, lblReal_M2_30, lblSugestaoVlr_30, lblReal_AA_30, Secao_30)
        _calcular_Sugestao(lblSugestao_31, lblReal_M0_31, lblReal_M1_31, lblReal_M2_31, lblSugestaoVlr_31, lblReal_AA_31, Secao_31)
        _calcular_Sugestao(lblSugestao_32, lblReal_M0_32, lblReal_M1_32, lblReal_M2_32, lblSugestaoVlr_32, lblReal_AA_32, Secao_32)
        _calcular_Sugestao(lblSugestao_33, lblReal_M0_33, lblReal_M1_33, lblReal_M2_33, lblSugestaoVlr_33, lblReal_AA_33, Secao_33)
        _calcular_Sugestao(lblSugestao_34, lblReal_M0_34, lblReal_M1_34, lblReal_M2_34, lblSugestaoVlr_34, lblReal_AA_34, Secao_34)
        _calcular_Sugestao(lblSugestao_35, lblReal_M0_35, lblReal_M1_35, lblReal_M2_35, lblSugestaoVlr_35, lblReal_AA_35, Secao_35)
        _calcular_Sugestao(lblSugestao_36, lblReal_M0_36, lblReal_M1_36, lblReal_M2_36, lblSugestaoVlr_36, lblReal_AA_36, Secao_36)

        'Departamento 4
        _calcular_Sugestao(lblSugestao_40, lblReal_M0_40, lblReal_M1_40, lblReal_M2_40, lblSugestaoVlr_40, lblReal_AA_40, Secao_40)
        _calcular_Sugestao(lblSugestao_41, lblReal_M0_41, lblReal_M1_41, lblReal_M2_41, lblSugestaoVlr_41, lblReal_AA_41, Secao_41)
        _calcular_Sugestao(lblSugestao_42, lblReal_M0_42, lblReal_M1_42, lblReal_M2_42, lblSugestaoVlr_42, lblReal_AA_42, Secao_42)
        _calcular_Sugestao(lblSugestao_49, lblReal_M0_49, lblReal_M1_49, lblReal_M2_49, lblSugestaoVlr_49, lblReal_AA_49, Secao_49)

        'Departamento 5
        _calcular_Sugestao(lblSugestao_50, lblReal_M0_50, lblReal_M1_50, lblReal_M2_50, lblSugestaoVlr_50, lblReal_AA_50, Secao_50)
        _calcular_Sugestao(lblSugestao_51, lblReal_M0_51, lblReal_M1_51, lblReal_M2_51, lblSugestaoVlr_51, lblReal_AA_51, Secao_51)
        _calcular_Sugestao(lblSugestao_52, lblReal_M0_52, lblReal_M1_52, lblReal_M2_52, lblSugestaoVlr_52, lblReal_AA_52, Secao_52)
        _calcular_Sugestao(lblSugestao_53, lblReal_M0_53, lblReal_M1_53, lblReal_M2_53, lblSugestaoVlr_53, lblReal_AA_53, Secao_53)
        _calcular_Sugestao(lblSugestao_54, lblReal_M0_54, lblReal_M1_54, lblReal_M2_54, lblSugestaoVlr_54, lblReal_AA_54, Secao_54)
        _calcular_Sugestao(lblSugestao_55, lblReal_M0_55, lblReal_M1_55, lblReal_M2_55, lblSugestaoVlr_55, lblReal_AA_55, Secao_55)

        _calcular_Sugestao(lblSugestao_99, lblReal_M0_99, lblReal_M1_99, lblReal_M2_99, lblSugestaoVlr_99, lblReal_AA_99, Secao_99)


    End Sub

    Private Sub _calcular_Sugestao(ByVal SugestaoPerc As Label, ByVal RealPart_M0 As Label, ByVal RealPart_M1 As Label,
                                   ByVal RealPart_M2 As Label, ByVal SugestaoValor As Label, ByVal AnoAnterior As Label, ByVal Meta As Label)


        'If AnoAnterior.Text > SugestaoValor.Text Then
        '    SugestaoValor.Text = CDec(AnoAnterior.Text).ToString("n0")
        'Else

        Dim vlrSugestao As Decimal
        vlrSugestao = ((CDec(RealPart_M0.Text) + CDec(RealPart_M1.Text) + CDec(RealPart_M2.Text)) / 3).ToString("n2")

        SugestaoPerc.Text = vlrSugestao

        If CDec(AnoAnterior.Text) > CDec(vlrSugestao) Then
            SugestaoValor.Text = CDec(AnoAnterior.Text).ToString("n0")
        Else
            SugestaoValor.Text = CDec(vlrSugestao).ToString("n0")
        End If




    End Sub

    Private Sub Calcular_Participacao_Sugestao()

        F_Calcular_Participacao_Sugestao(lblSugestao_1, lblSugestaoVlr_1)
        F_Calcular_Participacao_Sugestao(lblSugestao_2, lblSugestaoVlr_2)
        F_Calcular_Participacao_Sugestao(lblSugestao_3, lblSugestaoVlr_3)
        F_Calcular_Participacao_Sugestao(lblSugestao_4, lblSugestaoVlr_4)
        F_Calcular_Participacao_Sugestao(lblSugestao_5, lblSugestaoVlr_5)
        F_Calcular_Participacao_Sugestao(lblSugestao_6, lblSugestaoVlr_6)
        F_Calcular_Participacao_Sugestao(lblSugestao_7, lblSugestaoVlr_7)
        F_Calcular_Participacao_Sugestao(lblSugestao_8, lblSugestaoVlr_8)
        F_Calcular_Participacao_Sugestao(lblSugestao_9, lblSugestaoVlr_9)

        F_Calcular_Participacao_Sugestao(lblSugestao_11, lblSugestaoVlr_11)
        F_Calcular_Participacao_Sugestao(lblSugestao_12, lblSugestaoVlr_12)
        F_Calcular_Participacao_Sugestao(lblSugestao_13, lblSugestaoVlr_13)
        F_Calcular_Participacao_Sugestao(lblSugestao_14, lblSugestaoVlr_14)
        F_Calcular_Participacao_Sugestao(lblSugestao_15, lblSugestaoVlr_15)
        F_Calcular_Participacao_Sugestao(lblSugestao_16, lblSugestaoVlr_16)
        F_Calcular_Participacao_Sugestao(lblSugestao_17, lblSugestaoVlr_17)
        F_Calcular_Participacao_Sugestao(lblSugestao_18, lblSugestaoVlr_18)
        F_Calcular_Participacao_Sugestao(lblSugestao_19, lblSugestaoVlr_19)
        F_Calcular_Participacao_Sugestao(lblSugestao_21, lblSugestaoVlr_21)
        F_Calcular_Participacao_Sugestao(lblSugestao_22, lblSugestaoVlr_22)
        F_Calcular_Participacao_Sugestao(lblSugestao_23, lblSugestaoVlr_23)
        F_Calcular_Participacao_Sugestao(lblSugestao_25, lblSugestaoVlr_25)

        F_Calcular_Participacao_Sugestao(lblSugestao_30, lblSugestaoVlr_30)
        F_Calcular_Participacao_Sugestao(lblSugestao_31, lblSugestaoVlr_31)
        F_Calcular_Participacao_Sugestao(lblSugestao_32, lblSugestaoVlr_32)
        F_Calcular_Participacao_Sugestao(lblSugestao_33, lblSugestaoVlr_33)
        F_Calcular_Participacao_Sugestao(lblSugestao_34, lblSugestaoVlr_34)
        F_Calcular_Participacao_Sugestao(lblSugestao_35, lblSugestaoVlr_35)
        F_Calcular_Participacao_Sugestao(lblSugestao_36, lblSugestaoVlr_36)

        F_Calcular_Participacao_Sugestao(lblSugestao_40, lblSugestaoVlr_40)
        F_Calcular_Participacao_Sugestao(lblSugestao_41, lblSugestaoVlr_41)
        F_Calcular_Participacao_Sugestao(lblSugestao_42, lblSugestaoVlr_42)
        F_Calcular_Participacao_Sugestao(lblSugestao_49, lblSugestaoVlr_49)

        F_Calcular_Participacao_Sugestao(lblSugestao_50, lblSugestaoVlr_50)
        F_Calcular_Participacao_Sugestao(lblSugestao_51, lblSugestaoVlr_51)
        F_Calcular_Participacao_Sugestao(lblSugestao_52, lblSugestaoVlr_52)
        F_Calcular_Participacao_Sugestao(lblSugestao_53, lblSugestaoVlr_53)
        F_Calcular_Participacao_Sugestao(lblSugestao_54, lblSugestaoVlr_54)
        F_Calcular_Participacao_Sugestao(lblSugestao_55, lblSugestaoVlr_55)

        F_Calcular_Participacao_Sugestao(lblSugestao_99, lblSugestaoVlr_99)

        'DEPARTAMENTO
        F_Calcular_Participacao_Sugestao(lblSugestao_Depto1, lblSugestaoVlr_Depto1)
        F_Calcular_Participacao_Sugestao(lblSugestao_Depto2, lblSugestaoVlr_Depto2)
        F_Calcular_Participacao_Sugestao(lblSugestao_Depto3, lblSugestaoVlr_Depto3)
        F_Calcular_Participacao_Sugestao(lblSugestao_Depto4, lblSugestaoVlr_Depto4)
        F_Calcular_Participacao_Sugestao(lblSugestao_Depto5, lblSugestaoVlr_Depto5)

        lblSugestao_Total.Text = "100,00"
    End Sub

    Private Sub F_Calcular_Participacao_Sugestao(ByVal percSugestao As Label, ByVal vlrSugestao As Label)
        On Error Resume Next
        percSugestao.Text = (CDec(vlrSugestao.Text) / CDec(lblSugestaoVlr_Total.Text) * 100).ToString("n2")
    End Sub


#End Region

#Region " Diferença"

    Private Sub _calcularDiferencaInicial(ByVal percDiferenca As Label, ByVal percMetaParticipacao As Label, ByVal percSugestao As Label)

        Dim vlrDiferenca = (CDec(percSugestao.Text) - CDec(percMetaParticipacao.Text)).ToString("n0")
        percDiferenca.Text = vlrDiferenca

        FormatarVermelhoSeNegativo(vlrDiferenca, percDiferenca)
    End Sub

    Private Sub _calcularDiferencaInicial_Participacao(ByVal percDiferenca As Label, ByVal percSugestao As Label, ByVal percMetaParticipacao As TextBox)

        Dim vlrDiferenca = (CDec(percMetaParticipacao.Text) - CDec(percSugestao.Text)).ToString("n2")
        percDiferenca.Text = vlrDiferenca

        FormatarVermelhoSeNegativo(vlrDiferenca, percDiferenca)
    End Sub


    Private Sub CalcularDiferencaInicial()

        ' Departamento 1
        _calcularDiferencaInicial(Me.lblDif_1, lblSugestaoVlr_1, Secao_01)
        _calcularDiferencaInicial(Me.lblDif_2, lblSugestaoVlr_2, Secao_02)
        _calcularDiferencaInicial(Me.lblDif_3, lblSugestaoVlr_3, Secao_03)
        _calcularDiferencaInicial(Me.lblDif_4, lblSugestaoVlr_4, Secao_04)
        _calcularDiferencaInicial(Me.lblDif_5, lblSugestaoVlr_5, Secao_05)
        _calcularDiferencaInicial(Me.lblDif_6, lblSugestaoVlr_6, Secao_06)
        _calcularDiferencaInicial(Me.lblDif_7, lblSugestaoVlr_7, Secao_07)
        _calcularDiferencaInicial(Me.lblDif_8, lblSugestaoVlr_8, Secao_08)
        _calcularDiferencaInicial(Me.lblDif_9, lblSugestaoVlr_9, Secao_09)

        ' Departamento 2
        _calcularDiferencaInicial(Me.lblDif_11, lblSugestaoVlr_11, Secao_11)
        _calcularDiferencaInicial(Me.lblDif_12, lblSugestaoVlr_12, Secao_12)
        _calcularDiferencaInicial(Me.lblDif_13, lblSugestaoVlr_13, Secao_13)
        _calcularDiferencaInicial(Me.lblDif_14, lblSugestaoVlr_14, Secao_14)
        _calcularDiferencaInicial(Me.lblDif_15, lblSugestaoVlr_15, Secao_15)
        _calcularDiferencaInicial(Me.lblDif_16, lblSugestaoVlr_16, Secao_16)
        _calcularDiferencaInicial(Me.lblDif_17, lblSugestaoVlr_17, Secao_17)
        _calcularDiferencaInicial(Me.lblDif_18, lblSugestaoVlr_18, Secao_18)
        _calcularDiferencaInicial(Me.lblDif_19, lblSugestaoVlr_19, Secao_19)
        _calcularDiferencaInicial(Me.lblDif_21, lblSugestaoVlr_21, Secao_21)
        _calcularDiferencaInicial(Me.lblDif_22, lblSugestaoVlr_22, Secao_22)
        _calcularDiferencaInicial(Me.lblDif_23, lblSugestaoVlr_23, Secao_23)
        _calcularDiferencaInicial(Me.lblDif_25, lblSugestaoVlr_25, Secao_25)

        ' Departamento 3
        _calcularDiferencaInicial(Me.lblDif_30, lblSugestaoVlr_30, Secao_30)
        _calcularDiferencaInicial(Me.lblDif_31, lblSugestaoVlr_31, Secao_31)
        _calcularDiferencaInicial(Me.lblDif_32, lblSugestaoVlr_32, Secao_32)
        _calcularDiferencaInicial(Me.lblDif_33, lblSugestaoVlr_33, Secao_33)
        _calcularDiferencaInicial(Me.lblDif_34, lblSugestaoVlr_34, Secao_34)
        _calcularDiferencaInicial(Me.lblDif_35, lblSugestaoVlr_35, Secao_35)
        _calcularDiferencaInicial(Me.lblDif_36, lblSugestaoVlr_36, Secao_36)

        ' Departamento 4
        _calcularDiferencaInicial(Me.lblDif_40, lblSugestaoVlr_40, Secao_40)
        _calcularDiferencaInicial(Me.lblDif_41, lblSugestaoVlr_41, Secao_41)
        _calcularDiferencaInicial(Me.lblDif_42, lblSugestaoVlr_42, Secao_42)
        _calcularDiferencaInicial(Me.lblDif_49, lblSugestaoVlr_49, Secao_49)

        ' Departamento 5
        _calcularDiferencaInicial(Me.lblDif_50, lblSugestaoVlr_50, Secao_50)
        _calcularDiferencaInicial(Me.lblDif_51, lblSugestaoVlr_51, Secao_51)
        _calcularDiferencaInicial(Me.lblDif_52, lblSugestaoVlr_52, Secao_52)
        _calcularDiferencaInicial(Me.lblDif_53, lblSugestaoVlr_53, Secao_53)
        _calcularDiferencaInicial(Me.lblDif_54, lblSugestaoVlr_54, Secao_54)
        _calcularDiferencaInicial(Me.lblDif_55, lblSugestaoVlr_55, Secao_55)

        _calcularDiferencaInicial(Me.lblDif_99, lblSugestaoVlr_99, Secao_99)

        ' ---------------------------------------------------------------------------------

        ' Departamento 1
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_1, lblSugestao_1, txtSecao_01)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_2, lblSugestao_2, txtSecao_02)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_3, lblSugestao_3, txtSecao_03)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_4, lblSugestao_4, txtSecao_04)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_5, lblSugestao_5, txtSecao_05)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_6, lblSugestao_6, txtSecao_06)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_7, lblSugestao_7, txtSecao_07)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_8, lblSugestao_8, txtSecao_08)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_9, lblSugestao_9, txtSecao_09)

        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_11, lblSugestao_11, txtSecao_11)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_12, lblSugestao_12, txtSecao_12)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_13, lblSugestao_13, txtSecao_13)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_14, lblSugestao_14, txtSecao_14)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_15, lblSugestao_15, txtSecao_15)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_16, lblSugestao_16, txtSecao_16)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_17, lblSugestao_17, txtSecao_17)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_18, lblSugestao_18, txtSecao_18)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_19, lblSugestao_19, txtSecao_19)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_21, lblSugestao_21, txtSecao_21)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_22, lblSugestao_22, txtSecao_22)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_23, lblSugestao_23, txtSecao_23)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_25, lblSugestao_25, txtSecao_25)

        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_30, lblSugestao_30, txtSecao_30)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_31, lblSugestao_31, txtSecao_31)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_32, lblSugestao_32, txtSecao_32)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_33, lblSugestao_33, txtSecao_33)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_34, lblSugestao_34, txtSecao_34)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_35, lblSugestao_35, txtSecao_35)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_36, lblSugestao_36, txtSecao_36)

        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_40, lblSugestao_40, txtSecao_40)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_41, lblSugestao_41, txtSecao_41)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_42, lblSugestao_42, txtSecao_42)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_49, lblSugestao_49, txtSecao_49)

        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_50, lblSugestao_50, txtSecao_50)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_51, lblSugestao_51, txtSecao_51)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_52, lblSugestao_52, txtSecao_52)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_53, lblSugestao_53, txtSecao_53)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_54, lblSugestao_54, txtSecao_54)
        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_55, lblSugestao_55, txtSecao_55)

        _calcularDiferencaInicial_Participacao(Me.lblDifVlr_99, lblSugestao_99, txtSecao_99)

    End Sub




#End Region

#Region " Titulos e Cabeçalhos"

    Private Sub AlterarCabecalhos()

        lblTitulo_AA.Text = RetornaNomeMes(cboMes.CallMes) & "/" & cboAno.CallAno - 1

        Select Case cboMes.CallMes
            Case 1
                lblTitulo_M3.Text = RetornaNomeMes(10) & "/" & cboAno.CallAno - 1
                lblTitulo_M2.Text = RetornaNomeMes(11) & "/" & cboAno.CallAno - 1
                lblTitulo_M1.Text = RetornaNomeMes(12) & "/" & cboAno.CallAno - 1
            Case 2
                lblTitulo_M3.Text = RetornaNomeMes(11) & "/" & cboAno.CallAno - 1
                lblTitulo_M2.Text = RetornaNomeMes(12) & "/" & cboAno.CallAno - 1
                lblTitulo_M1.Text = RetornaNomeMes(1) & "/" & cboAno.CallAno
            Case 3
                lblTitulo_M3.Text = RetornaNomeMes(12) & "/" & cboAno.CallAno - 1
                lblTitulo_M2.Text = RetornaNomeMes(1) & "/" & cboAno.CallAno
                lblTitulo_M1.Text = RetornaNomeMes(2) & "/" & cboAno.CallAno
            Case Else
                lblTitulo_M3.Text = RetornaNomeMes(cboMes.CallMes - 3) & "/" & cboAno.CallAno
                lblTitulo_M2.Text = RetornaNomeMes(cboMes.CallMes - 2) & "/" & cboAno.CallAno
                lblTitulo_M1.Text = RetornaNomeMes(cboMes.CallMes - 1) & "/" & cboAno.CallAno
        End Select






        Me.lblTitulo_MetaGrupo.Text = "Meta " & RetornaNomeMes(Me.cboMes.CallMes) & "/" & Me.cboAno.CallAno
    End Sub

    Private Function RetornaNomeMes(ByVal Mes As Byte) As String

        Select Case Mes
            Case 1
                RetornaNomeMes = "Jan"
            Case 2
                RetornaNomeMes = "Fev"
            Case 3
                RetornaNomeMes = "Mar"
            Case 4
                RetornaNomeMes = "Abr"
            Case 5
                RetornaNomeMes = "Mai"
            Case 6
                RetornaNomeMes = "Jun"
            Case 7
                RetornaNomeMes = "Jul"
            Case 8
                RetornaNomeMes = "Ago"
            Case 9
                RetornaNomeMes = "Set"
            Case 10
                RetornaNomeMes = "Out"
            Case 11
                RetornaNomeMes = "Nov"
            Case 12
                RetornaNomeMes = "Dez"
            Case Else
                RetornaNomeMes = "Ver"
        End Select

    End Function

#End Region




End Class
