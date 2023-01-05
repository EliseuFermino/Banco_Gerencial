Imports System.Data
Imports System.Data.SqlClient


Partial Class MemberPages_Replanejamento_webReplanPartic
    Inherits System.Web.UI.Page

    Dim strCon As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim oVEM As New VendaEmpresaMes
    Dim varVendaRevista As Double

    Private Sub Atualizar()
        Call LimparCampos()
        Call BuscarVendaSecao()
        Call BuscarAg23Secao()
        Call CalcularDeptos()
        oVEM.BuscaRevGrupoMes(70, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblMargemReplanejamento.Text = CDbl(oVEM.percRev).ToString("n2")
    End Sub

    Private Sub LimparCampos_Ag23(myAgenda As Label, myPercAgenda As TextBox)
        myAgenda.Text = 0
        myPercAgenda.Text = 0
    End Sub

    Private Sub LimparCampos_Vendas(myVenda As Label, myPercPart As Label)
        myVenda.Text = 0
        myPercPart.Text = 0
    End Sub

    Sub LimparCampos()
        'Depto 1 - Mercearia
        Call LimparCampos_Ag23(Me.Secao_01, Me.txtSecao_01)
        Call LimparCampos_Ag23(Me.Secao_02, Me.txtSecao_02)
        Call LimparCampos_Ag23(Me.Secao_03, Me.txtSecao_03)
        Call LimparCampos_Ag23(Me.Secao_04, Me.txtSecao_04)
        Call LimparCampos_Ag23(Me.Secao_05, Me.txtSecao_05)
        Call LimparCampos_Ag23(Me.Secao_06, Me.txtSecao_06)
        Call LimparCampos_Ag23(Me.Secao_07, Me.txtSecao_07)
        Call LimparCampos_Ag23(Me.Secao_08, Me.txtSecao_08)

        'Depto 2 - Pereciveis
        Call LimparCampos_Ag23(Me.Secao_11, Me.txtSecao_11)
        Call LimparCampos_Ag23(Me.Secao_12, Me.txtSecao_12)
        Call LimparCampos_Ag23(Me.Secao_13, Me.txtSecao_13)
        Call LimparCampos_Ag23(Me.Secao_14, Me.txtSecao_14)
        Call LimparCampos_Ag23(Me.Secao_15, Me.txtSecao_15)
        Call LimparCampos_Ag23(Me.Secao_16, Me.txtSecao_16)
        Call LimparCampos_Ag23(Me.Secao_17, Me.txtSecao_17)
        Call LimparCampos_Ag23(Me.Secao_18, Me.txtSecao_18)
        Call LimparCampos_Ag23(Me.Secao_19, Me.txtSecao_19)
        Call LimparCampos_Ag23(Me.Secao_21, Me.txtSecao_21)
        Call LimparCampos_Ag23(Me.Secao_22, Me.txtSecao_22)
        Call LimparCampos_Ag23(Me.Secao_23, Me.txtSecao_23)

        'Depto 3 - Bazar
        Call LimparCampos_Ag23(Me.Secao_30, Me.txtSecao_30)
        Call LimparCampos_Ag23(Me.Secao_31, Me.txtSecao_31)
        Call LimparCampos_Ag23(Me.Secao_32, Me.txtSecao_32)
        Call LimparCampos_Ag23(Me.Secao_33, Me.txtSecao_33)
        Call LimparCampos_Ag23(Me.Secao_34, Me.txtSecao_34)
        Call LimparCampos_Ag23(Me.Secao_35, Me.txtSecao_35)
        Call LimparCampos_Ag23(Me.Secao_36, Me.txtSecao_36)
      
        'Depto 4 - Textil
        Call LimparCampos_Ag23(Me.Secao_40, Me.txtSecao_40)
        Call LimparCampos_Ag23(Me.Secao_41, Me.txtSecao_41)
        Call LimparCampos_Ag23(Me.Secao_42, Me.txtSecao_42)
        Call LimparCampos_Ag23(Me.Secao_49, Me.txtSecao_49)

        'Depto 5 - Eletrodomésticos
        Call LimparCampos_Ag23(Me.Secao_50, Me.txtSecao_50)
        Call LimparCampos_Ag23(Me.Secao_51, Me.txtSecao_51)
        Call LimparCampos_Ag23(Me.Secao_52, Me.txtSecao_52)
        Call LimparCampos_Ag23(Me.Secao_53, Me.txtSecao_53)
        Call LimparCampos_Ag23(Me.Secao_54, Me.txtSecao_54)
        Call LimparCampos_Ag23(Me.Secao_55, Me.txtSecao_55)

        '----------------------------------------------------------------------------

         'Depto 1 - Mercearia
        Call LimparCampos_Vendas(Me.SecaoM_01, Me.SecaoP_01)
        Call LimparCampos_Vendas(Me.SecaoM_02, Me.SecaoP_02)
        Call LimparCampos_Vendas(Me.SecaoM_03, Me.SecaoP_03)
        Call LimparCampos_Vendas(Me.SecaoM_04, Me.SecaoP_04)
        Call LimparCampos_Vendas(Me.SecaoM_05, Me.SecaoP_05)
        Call LimparCampos_Vendas(Me.SecaoM_06, Me.SecaoP_06)
        Call LimparCampos_Vendas(Me.SecaoM_07, Me.SecaoP_07)
        Call LimparCampos_Vendas(Me.SecaoM_08, Me.SecaoP_08)

        'Depto 2 - Pereciveis
        Call LimparCampos_Vendas(Me.SecaoM_11, Me.SecaoP_11)
        Call LimparCampos_Vendas(Me.SecaoM_12, Me.SecaoP_12)
        Call LimparCampos_Vendas(Me.SecaoM_13, Me.SecaoP_13)
        Call LimparCampos_Vendas(Me.SecaoM_14, Me.SecaoP_14)
        Call LimparCampos_Vendas(Me.SecaoM_15, Me.SecaoP_15)
        Call LimparCampos_Vendas(Me.SecaoM_16, Me.SecaoP_16)
        Call LimparCampos_Vendas(Me.SecaoM_17, Me.SecaoP_17)
        Call LimparCampos_Vendas(Me.SecaoM_18, Me.SecaoP_18)
        Call LimparCampos_Vendas(Me.SecaoM_19, Me.SecaoP_19)
        Call LimparCampos_Vendas(Me.SecaoM_21, Me.SecaoP_21)
        Call LimparCampos_Vendas(Me.SecaoM_22, Me.SecaoP_22)
        Call LimparCampos_Vendas(Me.SecaoM_23, Me.SecaoP_23)

        'Depto 3 - Bazar
        Call LimparCampos_Vendas(Me.SecaoM_30, Me.SecaoP_30)
        Call LimparCampos_Vendas(Me.SecaoM_31, Me.SecaoP_31)
        Call LimparCampos_Vendas(Me.SecaoM_32, Me.SecaoP_32)
        Call LimparCampos_Vendas(Me.SecaoM_33, Me.SecaoP_33)
        Call LimparCampos_Vendas(Me.SecaoM_34, Me.SecaoP_34)
        Call LimparCampos_Vendas(Me.SecaoM_35, Me.SecaoP_35)
        Call LimparCampos_Vendas(Me.SecaoM_36, Me.SecaoP_36)

        'Depto 4 - Textil
        Call LimparCampos_Vendas(Me.SecaoM_40, Me.SecaoP_40)
        Call LimparCampos_Vendas(Me.SecaoM_41, Me.SecaoP_41)
        Call LimparCampos_Vendas(Me.SecaoM_42, Me.SecaoP_42)
        Call LimparCampos_Vendas(Me.SecaoM_49, Me.SecaoP_49)

        'Depto 5 - Eletrodomésticos
        Call LimparCampos_Vendas(Me.SecaoM_50, Me.SecaoP_50)
        Call LimparCampos_Vendas(Me.SecaoM_51, Me.SecaoP_51)
        Call LimparCampos_Vendas(Me.SecaoM_52, Me.SecaoP_52)
        Call LimparCampos_Vendas(Me.SecaoM_53, Me.SecaoP_53)
        Call LimparCampos_Vendas(Me.SecaoM_54, Me.SecaoP_54)
        Call LimparCampos_Vendas(Me.SecaoM_55, Me.SecaoP_55)

    End Sub

    Private Sub BuscarVendaPorSecao(myVenda As Label, myPart As Label, mySecao As Byte)
        oVEM.BuscaRevSecaoMes(1, mySecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        myVenda.Text = oVEM.vlrRev
        myPart.Text = oVEM.percRev
    End Sub

    Sub BuscarVendaSecao()
        'Depto 1 - Mercearia
        Call BuscarVendaPorSecao(Me.Secao_01, Me.SecaoP_01, 1)
        Call BuscarVendaPorSecao(Me.Secao_02, Me.SecaoP_02, 2)
        Call BuscarVendaPorSecao(Me.Secao_03, Me.SecaoP_03, 3)
        Call BuscarVendaPorSecao(Me.Secao_04, Me.SecaoP_04, 4)
        Call BuscarVendaPorSecao(Me.Secao_05, Me.SecaoP_05, 5)
        Call BuscarVendaPorSecao(Me.Secao_06, Me.SecaoP_06, 6)
        Call BuscarVendaPorSecao(Me.Secao_07, Me.SecaoP_07, 7)
        Call BuscarVendaPorSecao(Me.Secao_08, Me.SecaoP_08, 8)

        'Depto 2 - Pereciveis
        Call BuscarVendaPorSecao(Me.Secao_11, Me.SecaoP_11, 11)
        Call BuscarVendaPorSecao(Me.Secao_12, Me.SecaoP_12, 12)
        Call BuscarVendaPorSecao(Me.Secao_13, Me.SecaoP_13, 13)
        Call BuscarVendaPorSecao(Me.Secao_14, Me.SecaoP_14, 14)
        Call BuscarVendaPorSecao(Me.Secao_15, Me.SecaoP_15, 15)
        Call BuscarVendaPorSecao(Me.Secao_16, Me.SecaoP_16, 16)
        Call BuscarVendaPorSecao(Me.Secao_17, Me.SecaoP_17, 17)
        Call BuscarVendaPorSecao(Me.Secao_18, Me.SecaoP_18, 18)
        Call BuscarVendaPorSecao(Me.Secao_19, Me.SecaoP_19, 19)
        Call BuscarVendaPorSecao(Me.Secao_21, Me.SecaoP_21, 21)
        Call BuscarVendaPorSecao(Me.Secao_22, Me.SecaoP_22, 22)
        Call BuscarVendaPorSecao(Me.Secao_23, Me.SecaoP_23, 23)

        'Depto 3 - Bazar
        Call BuscarVendaPorSecao(Me.Secao_30, Me.SecaoP_30, 30)
        Call BuscarVendaPorSecao(Me.Secao_31, Me.SecaoP_31, 31)
        Call BuscarVendaPorSecao(Me.Secao_32, Me.SecaoP_32, 32)
        Call BuscarVendaPorSecao(Me.Secao_33, Me.SecaoP_33, 33)
        Call BuscarVendaPorSecao(Me.Secao_34, Me.SecaoP_34, 34)
        Call BuscarVendaPorSecao(Me.Secao_35, Me.SecaoP_35, 35)
        Call BuscarVendaPorSecao(Me.Secao_36, Me.SecaoP_36, 36)

        'Depto 4 - Textil
        Call BuscarVendaPorSecao(Me.Secao_40, Me.SecaoP_40, 40)
        Call BuscarVendaPorSecao(Me.Secao_41, Me.SecaoP_41, 41)
        Call BuscarVendaPorSecao(Me.Secao_42, Me.SecaoP_42, 42)
        Call BuscarVendaPorSecao(Me.Secao_49, Me.SecaoP_49, 49)

        'Depto 5 - Eletrodomésticos
        Call BuscarVendaPorSecao(Me.Secao_50, Me.SecaoP_50, 50)
        Call BuscarVendaPorSecao(Me.Secao_51, Me.SecaoP_51, 51)
        Call BuscarVendaPorSecao(Me.Secao_52, Me.SecaoP_52, 52)
        Call BuscarVendaPorSecao(Me.Secao_53, Me.SecaoP_53, 53)
        Call BuscarVendaPorSecao(Me.Secao_54, Me.SecaoP_54, 54)
        Call BuscarVendaPorSecao(Me.Secao_55, Me.SecaoP_55, 55)

    End Sub

    Private Sub BuscarAg23(myVenda As Label, myPerc As TextBox, mySecao As Byte)
        oVEM.BuscaRevSecaoMes(4, mySecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        myVenda.Text = Math.Abs(CDbl(oVEM.vlrRev)).ToString("n2")
        myPerc.Text = Math.Abs(CDbl(oVEM.percRev)).ToString("n2")
    End Sub

    Sub BuscarAg23Secao()
        'Depto 1 - Mercearia
        Call BuscarAg23(Me.SecaoM_01, Me.txtSecao_01, 1)
        Call BuscarAg23(Me.SecaoM_02, Me.txtSecao_02, 2)
        Call BuscarAg23(Me.SecaoM_03, Me.txtSecao_03, 3)
        Call BuscarAg23(Me.SecaoM_04, Me.txtSecao_04, 4)
        Call BuscarAg23(Me.SecaoM_05, Me.txtSecao_05, 5)
        Call BuscarAg23(Me.SecaoM_06, Me.txtSecao_06, 6)
        Call BuscarAg23(Me.SecaoM_07, Me.txtSecao_07, 7)
        Call BuscarAg23(Me.SecaoM_08, Me.txtSecao_08, 8)

        'Depto 2 - Pereciveis
        Call BuscarAg23(Me.SecaoM_11, Me.txtSecao_11, 11)
        Call BuscarAg23(Me.SecaoM_12, Me.txtSecao_12, 12)
        Call BuscarAg23(Me.SecaoM_13, Me.txtSecao_13, 13)
        Call BuscarAg23(Me.SecaoM_14, Me.txtSecao_14, 14)
        Call BuscarAg23(Me.SecaoM_15, Me.txtSecao_15, 15)
        Call BuscarAg23(Me.SecaoM_16, Me.txtSecao_16, 16)
        Call BuscarAg23(Me.SecaoM_17, Me.txtSecao_17, 17)
        Call BuscarAg23(Me.SecaoM_18, Me.txtSecao_18, 18)
        Call BuscarAg23(Me.SecaoM_19, Me.txtSecao_19, 19)
        Call BuscarAg23(Me.SecaoM_21, Me.txtSecao_21, 21)
        Call BuscarAg23(Me.SecaoM_22, Me.txtSecao_22, 22)
        Call BuscarAg23(Me.SecaoM_23, Me.txtSecao_23, 23)

        'Depto 3 - Bazar
        Call BuscarAg23(Me.SecaoM_30, Me.txtSecao_30, 30)
        Call BuscarAg23(Me.SecaoM_31, Me.txtSecao_31, 31)
        Call BuscarAg23(Me.SecaoM_32, Me.txtSecao_32, 32)
        Call BuscarAg23(Me.SecaoM_33, Me.txtSecao_33, 33)
        Call BuscarAg23(Me.SecaoM_34, Me.txtSecao_34, 34)
        Call BuscarAg23(Me.SecaoM_35, Me.txtSecao_35, 35)
        Call BuscarAg23(Me.SecaoM_36, Me.txtSecao_36, 36)

        'Depto 4 - Textil
        Call BuscarAg23(Me.SecaoM_40, Me.txtSecao_40, 40)
        Call BuscarAg23(Me.SecaoM_41, Me.txtSecao_41, 41)
        Call BuscarAg23(Me.SecaoM_42, Me.txtSecao_42, 42)
        Call BuscarAg23(Me.SecaoM_49, Me.txtSecao_49, 49)

        'Depto 5 - Eletrodomésticos
        Call BuscarAg23(Me.SecaoM_50, Me.txtSecao_50, 50)
        Call BuscarAg23(Me.SecaoM_51, Me.txtSecao_51, 51)
        Call BuscarAg23(Me.SecaoM_52, Me.txtSecao_52, 52)
        Call BuscarAg23(Me.SecaoM_53, Me.txtSecao_53, 53)
        Call BuscarAg23(Me.SecaoM_54, Me.txtSecao_54, 54)
        Call BuscarAg23(Me.SecaoM_55, Me.txtSecao_55, 55)

    End Sub

    Private Sub CalcularDeptos()
        Call CalcularDeptos_Valor()
        Call CalcularDeptos_Percentual()
        Call CalcularDeptosAg23()
    End Sub

    Private Sub CalcularDeptos_Valor()

        Me.Depto_1.Text = (CDbl(Me.Secao_01.Text) + CDbl(Me.Secao_02.Text) + CDbl(Me.Secao_03.Text) + CDbl(Me.Secao_04.Text) + CDbl(Me.Secao_05.Text) + CDbl(Me.Secao_06.Text) + CDbl(Me.Secao_07.Text) + CDbl(Me.Secao_08.Text)).ToString("n2")
        Me.Depto_2.Text = (CDbl(Me.Secao_11.Text) + CDbl(Me.Secao_12.Text) + CDbl(Me.Secao_13.Text) + CDbl(Me.Secao_14.Text) + CDbl(Me.Secao_15.Text) + CDbl(Me.Secao_16.Text) + CDbl(Me.Secao_17.Text) + CDbl(Me.Secao_18.Text) + CDbl(Me.Secao_19.Text) + CDbl(Me.Secao_21.Text) + CDbl(Me.Secao_22.Text) + CDbl(Me.Secao_23.Text)).ToString("n2")
        Me.Depto_3.Text = (CDbl(Me.Secao_30.Text) + CDbl(Me.Secao_31.Text) + CDbl(Me.Secao_32.Text) + CDbl(Me.Secao_33.Text) + CDbl(Me.Secao_34.Text) + CDbl(Me.Secao_35.Text) + CDbl(Me.Secao_36.Text)).ToString("n2")
        Me.Depto_4.Text = (CDbl(Me.Secao_40.Text) + CDbl(Me.Secao_41.Text) + CDbl(Me.Secao_42.Text) + CDbl(Me.Secao_49.Text)).ToString("n2")
        Me.Depto_5.Text = (CDbl(Me.Secao_50.Text) + CDbl(Me.Secao_51.Text) + CDbl(Me.Secao_52.Text) + CDbl(Me.Secao_53.Text) + CDbl(Me.Secao_54.Text) + CDbl(Me.Secao_55.Text)).ToString("n2")
        'Total da Loja
        Me.Total_Venda.Text = (CDbl(Me.Depto_1.Text) + CDbl(Me.Depto_2.Text) + CDbl(Me.Depto_3.Text) + CDbl(Me.Depto_4.Text) + CDbl(Me.Depto_5.Text)).ToString("n2")

    End Sub

    Private Sub CalcularDeptos_Percentual()
        Me.DeptoP_1.Text = (CDbl(Me.SecaoP_01.Text) + CDbl(Me.SecaoP_02.Text) + CDbl(Me.SecaoP_03.Text) + CDbl(Me.SecaoP_04.Text) + CDbl(Me.SecaoP_05.Text) + CDbl(Me.SecaoP_06.Text) + CDbl(Me.SecaoP_07.Text) + CDbl(Me.SecaoP_08.Text)).ToString("n2")
        Me.DeptoP_2.Text = (CDbl(Me.SecaoP_11.Text) + CDbl(Me.SecaoP_12.Text) + CDbl(Me.SecaoP_13.Text) + CDbl(Me.SecaoP_14.Text) + CDbl(Me.SecaoP_15.Text) + CDbl(Me.SecaoP_16.Text) + CDbl(Me.SecaoP_17.Text) + CDbl(Me.SecaoP_18.Text) + CDbl(Me.SecaoP_19.Text) + CDbl(Me.SecaoP_21.Text) + CDbl(Me.SecaoP_22.Text) + CDbl(Me.SecaoP_23.Text)).ToString("n2")
        Me.DeptoP_3.Text = (CDbl(Me.SecaoP_30.Text) + CDbl(Me.SecaoP_31.Text) + CDbl(Me.SecaoP_32.Text) + CDbl(Me.SecaoP_33.Text) + CDbl(Me.SecaoP_34.Text) + CDbl(Me.SecaoP_35.Text) + CDbl(Me.SecaoP_36.Text)).ToString("n2")
        Me.DeptoP_4.Text = (CDbl(Me.SecaoP_40.Text) + CDbl(Me.SecaoP_41.Text) + CDbl(Me.SecaoP_42.Text) + CDbl(Me.SecaoP_49.Text)).ToString("n2")
        Me.DeptoP_5.Text = (CDbl(Me.SecaoP_50.Text) + CDbl(Me.SecaoP_51.Text) + CDbl(Me.SecaoP_52.Text) + CDbl(Me.SecaoP_53.Text) + CDbl(Me.SecaoP_54.Text) + CDbl(Me.SecaoP_55.Text)).ToString("n2")
        'Total da Loja
        Me.Total_VendaP.Text = (CDbl(Me.DeptoP_1.Text) + CDbl(Me.DeptoP_2.Text) + CDbl(Me.DeptoP_3.Text) + CDbl(Me.DeptoP_4.Text) + CDbl(Me.DeptoP_5.Text)).ToString("n2")
    End Sub

    Private Sub CalcularDeptosAg23()
        Call CalcularDeptosAg23_Valor()
        Call CalcularDeptosAg23_Percentual()
    End Sub

    Private Sub CalcularDeptosAg23_Valor()

        Me.DeptoM_1.Text = (CDbl(Me.SecaoM_01.Text) + CDbl(Me.SecaoM_02.Text) + CDbl(Me.SecaoM_03.Text) + CDbl(Me.SecaoM_04.Text) + CDbl(Me.SecaoM_05.Text) + CDbl(Me.SecaoM_06.Text) + CDbl(Me.SecaoM_07.Text) + CDbl(Me.SecaoM_08.Text)).ToString("n2")
        Me.DeptoM_2.Text = (CDbl(Me.SecaoM_11.Text) + CDbl(Me.SecaoM_12.Text) + CDbl(Me.SecaoM_13.Text) + CDbl(Me.SecaoM_14.Text) + CDbl(Me.SecaoM_15.Text) + CDbl(Me.SecaoM_16.Text) + CDbl(Me.SecaoM_17.Text) + CDbl(Me.SecaoM_18.Text) + CDbl(Me.SecaoM_19.Text) + CDbl(Me.SecaoM_21.Text) + CDbl(Me.SecaoM_22.Text) + CDbl(Me.SecaoM_23.Text)).ToString("n2")
        Me.DeptoM_3.Text = (CDbl(Me.SecaoM_30.Text) + CDbl(Me.SecaoM_31.Text) + CDbl(Me.SecaoM_32.Text) + CDbl(Me.SecaoM_33.Text) + CDbl(Me.SecaoM_34.Text) + CDbl(Me.SecaoM_35.Text) + CDbl(Me.SecaoM_36.Text)).ToString("n2")
        Me.DeptoM_4.Text = (CDbl(Me.SecaoM_40.Text) + CDbl(Me.SecaoM_41.Text) + CDbl(Me.SecaoM_42.Text) + CDbl(Me.SecaoM_49.Text)).ToString("n2")
        Me.DeptoM_5.Text = (CDbl(Me.SecaoM_50.Text) + CDbl(Me.SecaoM_51.Text) + CDbl(Me.SecaoM_52.Text) + CDbl(Me.SecaoM_53.Text) + CDbl(Me.SecaoM_54.Text) + CDbl(Me.SecaoM_55.Text)).ToString("n2")
        'Total da Loja
        Me.Total_VendaM.Text = (CDbl(Me.DeptoM_1.Text) + CDbl(Me.DeptoM_2.Text) + CDbl(Me.DeptoM_3.Text) + CDbl(Me.DeptoM_4.Text) + CDbl(Me.DeptoM_5.Text)).ToString("n2")

    End Sub

    Private Sub CalcularDeptosAg23_Percentual()
        Me.txtDepto_1.Text = ((CDbl((Me.DeptoM_1.Text) / CDbl(Depto_1.Text)) * 100)).ToString("n2")
        Me.txtDepto_2.Text = ((CDbl((Me.DeptoM_2.Text) / CDbl(Depto_2.Text)) * 100)).ToString("n2")
        Me.txtDepto_3.Text = ((CDbl((Me.DeptoM_3.Text) / CDbl(Depto_3.Text)) * 100)).ToString("n2")
        Me.txtDepto_4.Text = ((CDbl((Me.DeptoM_4.Text) / CDbl(Depto_4.Text)) * 100)).ToString("n2")
        If CDbl(Depto_5.Text) <> 0 Then
            Me.txtDepto_5.Text = ((CDbl((Me.DeptoM_5.Text) / CDbl(Depto_5.Text)) * 100)).ToString("n2")
        Else
            Me.txtDepto_5.Text = 0
        End If

        'Total da Loja
        Me.txtTotalVenda.Text = ((CDbl((Me.Total_VendaM.Text) / CDbl(Total_Venda.Text)) * 100)).ToString("n2")
    End Sub


    Private Sub RecalculeMargem(myVlrMargem As Label, myVlrVenda As Label, myPercMargem As TextBox)
        myVlrMargem.Text = ((CDbl(myVlrVenda.Text) * CDbl(myPercMargem.Text)) / 100).ToString("n2")
    End Sub

    Private Sub RecalcularMargem()
        Call RecalculeMargem(Me.SecaoM_01, Me.Secao_01, Me.txtSecao_01)
        Call RecalculeMargem(Me.SecaoM_02, Me.Secao_02, Me.txtSecao_02)
        Call RecalculeMargem(Me.SecaoM_03, Me.Secao_03, Me.txtSecao_03)
        Call RecalculeMargem(Me.SecaoM_04, Me.Secao_04, Me.txtSecao_04)
        Call RecalculeMargem(Me.SecaoM_05, Me.Secao_05, Me.txtSecao_05)
        Call RecalculeMargem(Me.SecaoM_06, Me.Secao_06, Me.txtSecao_06)
        Call RecalculeMargem(Me.SecaoM_07, Me.Secao_07, Me.txtSecao_07)
        Call RecalculeMargem(Me.SecaoM_08, Me.Secao_08, Me.txtSecao_08)

        Call RecalculeMargem(Me.SecaoM_11, Me.Secao_11, Me.txtSecao_11)
        Call RecalculeMargem(Me.SecaoM_12, Me.Secao_12, Me.txtSecao_12)
        Call RecalculeMargem(Me.SecaoM_13, Me.Secao_13, Me.txtSecao_13)
        Call RecalculeMargem(Me.SecaoM_14, Me.Secao_14, Me.txtSecao_14)
        Call RecalculeMargem(Me.SecaoM_15, Me.Secao_15, Me.txtSecao_15)
        Call RecalculeMargem(Me.SecaoM_16, Me.Secao_16, Me.txtSecao_16)
        Call RecalculeMargem(Me.SecaoM_17, Me.Secao_17, Me.txtSecao_17)
        Call RecalculeMargem(Me.SecaoM_18, Me.Secao_18, Me.txtSecao_18)
        Call RecalculeMargem(Me.SecaoM_19, Me.Secao_19, Me.txtSecao_19)
        Call RecalculeMargem(Me.SecaoM_21, Me.Secao_21, Me.txtSecao_21)
        Call RecalculeMargem(Me.SecaoM_22, Me.Secao_22, Me.txtSecao_22)
        Call RecalculeMargem(Me.SecaoM_23, Me.Secao_23, Me.txtSecao_23)

        Call RecalculeMargem(Me.SecaoM_30, Me.Secao_30, Me.txtSecao_30)
        Call RecalculeMargem(Me.SecaoM_31, Me.Secao_31, Me.txtSecao_31)
        Call RecalculeMargem(Me.SecaoM_32, Me.Secao_32, Me.txtSecao_32)
        Call RecalculeMargem(Me.SecaoM_33, Me.Secao_33, Me.txtSecao_33)
        Call RecalculeMargem(Me.SecaoM_34, Me.Secao_34, Me.txtSecao_34)
        Call RecalculeMargem(Me.SecaoM_35, Me.Secao_35, Me.txtSecao_35)
        Call RecalculeMargem(Me.SecaoM_36, Me.Secao_36, Me.txtSecao_36)

        Call RecalculeMargem(Me.SecaoM_40, Me.Secao_40, Me.txtSecao_40)
        Call RecalculeMargem(Me.SecaoM_41, Me.Secao_41, Me.txtSecao_41)
        Call RecalculeMargem(Me.SecaoM_42, Me.Secao_42, Me.txtSecao_42)
        Call RecalculeMargem(Me.SecaoM_49, Me.Secao_49, Me.txtSecao_49)

        Call RecalculeMargem(Me.SecaoM_50, Me.Secao_50, Me.txtSecao_50)
        Call RecalculeMargem(Me.SecaoM_51, Me.Secao_51, Me.txtSecao_51)
        Call RecalculeMargem(Me.SecaoM_52, Me.Secao_52, Me.txtSecao_52)
        Call RecalculeMargem(Me.SecaoM_53, Me.Secao_53, Me.txtSecao_53)
        Call RecalculeMargem(Me.SecaoM_54, Me.Secao_54, Me.txtSecao_54)
        Call RecalculeMargem(Me.SecaoM_55, Me.Secao_55, Me.txtSecao_55)
    End Sub

    Private Function Salvar(ByVal idSecao As Int16, ByVal vlr As Decimal, ByVal perc As Decimal) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspInsertRevSecaoMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = 4    'Agenda 23

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Me.cboMes.CallMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
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

    Private Sub Salvar()
        'Depto 1 - Mercearia - 201
        Call Salvar(1, Me.SecaoM_01.Text, Me.txtSecao_01.Text)
        Call Salvar(2, Me.SecaoM_02.Text, Me.txtSecao_02.Text)
        Call Salvar(3, Me.SecaoM_03.Text, Me.txtSecao_03.Text)
        Call Salvar(4, Me.SecaoM_04.Text, Me.txtSecao_04.Text)
        Call Salvar(5, Me.SecaoM_05.Text, Me.txtSecao_05.Text)
        Call Salvar(6, Me.SecaoM_06.Text, Me.txtSecao_06.Text)
        Call Salvar(7, Me.SecaoM_07.Text, Me.txtSecao_07.Text)
        Call Salvar(8, Me.SecaoM_08.Text, Me.txtSecao_08.Text)

        'Depto 2 - Pereciveis - 202
        Call Salvar(11, Me.SecaoM_11.Text, Me.txtSecao_11.Text)
        Call Salvar(12, Me.SecaoM_12.Text, Me.txtSecao_12.Text)
        Call Salvar(13, Me.SecaoM_13.Text, Me.txtSecao_13.Text)
        Call Salvar(14, Me.SecaoM_14.Text, Me.txtSecao_14.Text)
        Call Salvar(15, Me.SecaoM_15.Text, Me.txtSecao_15.Text)
        Call Salvar(16, Me.SecaoM_16.Text, Me.txtSecao_16.Text)
        Call Salvar(17, Me.SecaoM_17.Text, Me.txtSecao_17.Text)
        Call Salvar(18, Me.SecaoM_18.Text, Me.txtSecao_18.Text)
        Call Salvar(19, Me.SecaoM_19.Text, Me.txtSecao_19.Text)
        Call Salvar(21, Me.SecaoM_21.Text, Me.txtSecao_21.Text)
        Call Salvar(22, Me.SecaoM_22.Text, Me.txtSecao_22.Text)
        Call Salvar(23, Me.SecaoM_23.Text, Me.txtSecao_23.Text)

        'Depto 3 - Bazar - 203
        Call Salvar(30, Me.SecaoM_30.Text, Me.txtSecao_30.Text)
        Call Salvar(31, Me.SecaoM_31.Text, Me.txtSecao_31.Text)
        Call Salvar(32, Me.SecaoM_32.Text, Me.txtSecao_32.Text)
        Call Salvar(33, Me.SecaoM_33.Text, Me.txtSecao_33.Text)
        Call Salvar(34, Me.SecaoM_34.Text, Me.txtSecao_34.Text)
        Call Salvar(35, Me.SecaoM_35.Text, Me.txtSecao_35.Text)
        Call Salvar(36, Me.SecaoM_36.Text, Me.txtSecao_36.Text)

        'Depto 4 - Textil - 204
        Call Salvar(40, Me.SecaoM_40.Text, Me.txtSecao_40.Text)
        Call Salvar(41, Me.SecaoM_41.Text, Me.txtSecao_41.Text)
        Call Salvar(42, Me.SecaoM_42.Text, Me.txtSecao_42.Text)
        Call Salvar(49, Me.SecaoM_49.Text, Me.txtSecao_49.Text)

        'Depto 5 - Eletro - 205
        Call Salvar(50, Me.SecaoM_50.Text, Me.txtSecao_50.Text)
        Call Salvar(51, Me.SecaoM_51.Text, Me.txtSecao_51.Text)
        Call Salvar(52, Me.SecaoM_52.Text, Me.txtSecao_52.Text)
        Call Salvar(53, Me.SecaoM_53.Text, Me.txtSecao_53.Text)
        Call Salvar(54, Me.SecaoM_54.Text, Me.txtSecao_54.Text)
        Call Salvar(55, Me.SecaoM_55.Text, Me.txtSecao_55.Text)

        'Total - 255
        Call Salvar(255, Me.Total_VendaM.Text, Me.txtTotalVenda.Text)

        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not IsPostBack Then

                cboAno.AnoInicial = 2018
                cboAno.AnoFinal = Year(DateAndTime.Now()) + 1
                Me.cboAno.AutoPostBack = False
                Me.cboFilial.AutoPostBack = True
                Me.cboMes.AutoPostBack = True

                oVEM.AtualizarEstatisticaPrograma(21, User.Identity.Name)   '21 - CMV Replanejamento Margem
                Me.cboMes.CallMes = Month(Now())
                Me.cboAno.CallAno = Year(Now())
            End If

        End If
        Call LiberarSalvar()
    End Sub

    Private Sub LiberarSalvar()
        oVEM.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        If User.Identity.Name <> "eliseu" Or LCase(User.Identity.Name) = "eder" Then
            If oVEM.LiberaAgenda23 = True Then
                Me.btnSalvar.Enabled = True
            Else
                Me.btnSalvar.Enabled = False
            End If
        End If
    End Sub

    Protected Sub txtSecao_01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_01.TextChanged
        Me.SecaoM_01.Text = ((CDbl(Me.Secao_01.Text) * CDbl(Me.txtSecao_01.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_02.Focus()
    End Sub

    Protected Sub txtSecao_02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_02.TextChanged
        Me.SecaoM_02.Text = ((CDbl(Me.Secao_02.Text) * CDbl(Me.txtSecao_02.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_03.Focus()
    End Sub

    Protected Sub txtSecao_03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_03.TextChanged
        Me.SecaoM_03.Text = ((CDbl(Me.Secao_03.Text) * CDbl(Me.txtSecao_03.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_04.Focus()
    End Sub

    Protected Sub txtSecao_04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_04.TextChanged
        Me.SecaoM_04.Text = ((CDbl(Me.Secao_04.Text) * CDbl(Me.txtSecao_04.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_05.Focus()
    End Sub

    Protected Sub txtSecao_05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_05.TextChanged
        Me.SecaoM_05.Text = ((CDbl(Me.Secao_05.Text) * CDbl(Me.txtSecao_05.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_06.Focus()
    End Sub

    Protected Sub txtSecao_06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_06.TextChanged
        Me.SecaoM_06.Text = ((CDbl(Me.Secao_06.Text) * CDbl(Me.txtSecao_06.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_07.Focus()
    End Sub

    Protected Sub txtSecao_07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_07.TextChanged
        Me.SecaoM_07.Text = ((CDbl(Me.Secao_07.Text) * CDbl(Me.txtSecao_07.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_08.Focus()
    End Sub

    Protected Sub txtSecao_08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_08.TextChanged
        Me.SecaoM_08.Text = ((CDbl(Me.Secao_08.Text) * CDbl(Me.txtSecao_08.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_11.Focus()
    End Sub

    Protected Sub txtSecao_11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_11.TextChanged
        Me.SecaoM_11.Text = ((CDbl(Me.Secao_11.Text) * CDbl(Me.txtSecao_11.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_12.Focus()
    End Sub

    Protected Sub txtSecao_12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_12.TextChanged
        Me.SecaoM_12.Text = ((CDbl(Me.Secao_12.Text) * CDbl(Me.txtSecao_12.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_13.Focus()
    End Sub

    Protected Sub txtSecao_13_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_13.TextChanged
        Me.SecaoM_13.Text = ((CDbl(Me.Secao_13.Text) * CDbl(Me.txtSecao_13.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_14.Focus()
    End Sub

    Protected Sub txtSecao_14_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_14.TextChanged
        Me.SecaoM_14.Text = ((CDbl(Me.Secao_14.Text) * CDbl(Me.txtSecao_14.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_15.Focus()
    End Sub

    Protected Sub txtSecao_15_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_15.TextChanged
        Me.SecaoM_15.Text = ((CDbl(Me.Secao_15.Text) * CDbl(Me.txtSecao_15.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_16.Focus()
    End Sub

    Protected Sub txtSecao_16_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_16.TextChanged
        Me.SecaoM_16.Text = ((CDbl(Me.Secao_16.Text) * CDbl(Me.txtSecao_16.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_17.Focus()
    End Sub

    Protected Sub txtSecao_17_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_17.TextChanged
        Me.SecaoM_17.Text = ((CDbl(Me.Secao_17.Text) * CDbl(Me.txtSecao_17.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_18.Focus()
    End Sub

    Protected Sub txtSecao_18_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_18.TextChanged
        Me.SecaoM_18.Text = ((CDbl(Me.Secao_18.Text) * CDbl(Me.txtSecao_18.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_19.Focus()
    End Sub

    Protected Sub txtSecao_19_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_19.TextChanged
        Me.SecaoM_19.Text = ((CDbl(Me.Secao_19.Text) * CDbl(Me.txtSecao_19.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_21.Focus()
    End Sub

    Protected Sub txtSecao_21_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_21.TextChanged
        Me.SecaoM_21.Text = ((CDbl(Me.Secao_21.Text) * CDbl(Me.txtSecao_21.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_22.Focus()
    End Sub

    Protected Sub txtSecao_22_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_22.TextChanged
        Me.SecaoM_22.Text = ((CDbl(Me.Secao_22.Text) * CDbl(Me.txtSecao_22.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_23.Focus()
    End Sub

    Protected Sub txtSecao_23_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_23.TextChanged
        Me.SecaoM_23.Text = ((CDbl(Me.Secao_23.Text) * CDbl(Me.txtSecao_23.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_30.Focus()
    End Sub

    Protected Sub txtSecao_30_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_30.TextChanged
        Me.SecaoM_30.Text = ((CDbl(Me.Secao_30.Text) * CDbl(Me.txtSecao_30.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_31.Focus()
    End Sub

    Protected Sub txtSecao_31_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_31.TextChanged
        Me.SecaoM_31.Text = ((CDbl(Me.Secao_31.Text) * CDbl(Me.txtSecao_31.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_32.Focus()
    End Sub

    Protected Sub txtSecao_32_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_32.TextChanged
        Me.SecaoM_32.Text = ((CDbl(Me.Secao_32.Text) * CDbl(Me.txtSecao_32.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_33.Focus()
    End Sub

    Protected Sub txtSecao_33_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_33.TextChanged
        Me.SecaoM_33.Text = ((CDbl(Me.Secao_33.Text) * CDbl(Me.txtSecao_33.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_34.Focus()
    End Sub

    Protected Sub txtSecao_34_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_34.TextChanged
        Me.SecaoM_34.Text = ((CDbl(Me.Secao_34.Text) * CDbl(Me.txtSecao_34.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_35.Focus()
    End Sub

    Protected Sub txtSecao_35_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_35.TextChanged
        Me.SecaoM_35.Text = ((CDbl(Me.Secao_35.Text) * CDbl(Me.txtSecao_35.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_36.Focus()
    End Sub

    Protected Sub txtSecao_36_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_36.TextChanged
        Me.SecaoM_36.Text = ((CDbl(Me.Secao_36.Text) * CDbl(Me.txtSecao_36.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_40.Focus()
    End Sub

    Protected Sub txtSecao_40_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_40.TextChanged
        Me.SecaoM_40.Text = ((CDbl(Me.Secao_40.Text) * CDbl(Me.txtSecao_40.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_41.Focus()
    End Sub

    Protected Sub txtSecao_41_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_41.TextChanged
        Me.SecaoM_41.Text = ((CDbl(Me.Secao_41.Text) * CDbl(Me.txtSecao_41.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_42.Focus()
    End Sub

    Protected Sub txtSecao_42_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_42.TextChanged
        Me.SecaoM_42.Text = ((CDbl(Me.Secao_42.Text) * CDbl(Me.txtSecao_42.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_49.Focus()
    End Sub

    Protected Sub txtSecao_49_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_49.TextChanged
        Me.SecaoM_49.Text = ((CDbl(Me.Secao_49.Text) * CDbl(Me.txtSecao_49.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_50.Focus()
    End Sub

    Protected Sub txtSecao_50_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_50.TextChanged
        Me.SecaoM_50.Text = ((CDbl(Me.Secao_50.Text) * CDbl(Me.txtSecao_50.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_51.Focus()
    End Sub

    Protected Sub txtSecao_51_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_51.TextChanged
        Me.SecaoM_51.Text = ((CDbl(Me.Secao_51.Text) * CDbl(Me.txtSecao_51.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_52.Focus()
    End Sub

    Protected Sub txtSecao_52_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_52.TextChanged
        Me.SecaoM_52.Text = ((CDbl(Me.Secao_52.Text) * CDbl(Me.txtSecao_52.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_53.Focus()
    End Sub

    Protected Sub txtSecao_53_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_53.TextChanged
        Me.SecaoM_53.Text = ((CDbl(Me.Secao_53.Text) * CDbl(Me.txtSecao_53.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_54.Focus()
    End Sub

    Protected Sub txtSecao_54_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_54.TextChanged
        Me.SecaoM_54.Text = ((CDbl(Me.Secao_54.Text) * CDbl(Me.txtSecao_54.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_55.Focus()
    End Sub

    Protected Sub txtSecao_55_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_55.TextChanged
        Me.SecaoM_55.Text = ((CDbl(Me.Secao_55.Text) * CDbl(Me.txtSecao_55.Text)) / 100).ToString("n0")
        Call CalcularDeptosAg23()
        Me.txtSecao_54.Focus()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        oVEM.BuscaRevGrupoMes(70, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblMargemReplanejamento.Text = oVEM.percRev

        If CDbl(Me.txtTotalVenda.Text) <> CDbl(oVEM.percRev) Then
            oVEM.UserMsgBox(Me, "O percentual da AGENDA 23 não esta igual ao definido pelo Diretor Comercial.")
            Me.txtSecao_01.Focus()
            Exit Sub
        Else
            Call Salvar()
            oVEM.UserMsgBox(Me, "A Agenda 23 foi salva com sucesso!!!")
        End If
       
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 4 - Agenda 23"
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            LiberarSalvar()
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            On Error Resume Next
            Call Atualizar()
            Call RecalcularMargem()
            Me.cboFilial.Visible_cboCorporacao = False
            LiberarSalvar()
        End If
    End Sub
End Class
