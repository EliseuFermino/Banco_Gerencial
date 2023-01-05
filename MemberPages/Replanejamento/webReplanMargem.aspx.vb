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
        Call BuscarMargemSecao()
        Call CalcularDeptos()
        oVEM.BuscaRevGrupoMes(5, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblMargemReplanejamento.Text = CDbl(oVEM.percRev).ToString("n2")
    End Sub

    Private Sub LimparCamposFunction(myVlrVenda As Label, myPercPartVenda As Label, myVlrMargem As Label, myPercMargem As TextBox)
        myVlrVenda.Text = 0
        myPercPartVenda.Text = 0
        myVlrMargem.Text = 0
        myPercMargem.Text = 0
    End Sub

    Sub LimparCampos()
        'Depto 1 - Mercearia
        Call LimparCamposFunction(Me.Secao_01, Me.SecaoP_01, Me.SecaoM_01, Me.txtSecao_01)
        Call LimparCamposFunction(Me.Secao_02, Me.SecaoP_02, Me.SecaoM_02, Me.txtSecao_02)
        Call LimparCamposFunction(Me.Secao_03, Me.SecaoP_03, Me.SecaoM_03, Me.txtSecao_03)
        Call LimparCamposFunction(Me.Secao_04, Me.SecaoP_04, Me.SecaoM_04, Me.txtSecao_04)
        Call LimparCamposFunction(Me.Secao_05, Me.SecaoP_05, Me.SecaoM_05, Me.txtSecao_05)
        Call LimparCamposFunction(Me.Secao_06, Me.SecaoP_06, Me.SecaoM_06, Me.txtSecao_06)
        Call LimparCamposFunction(Me.Secao_07, Me.SecaoP_07, Me.SecaoM_07, Me.txtSecao_07)
        Call LimparCamposFunction(Me.Secao_08, Me.SecaoP_08, Me.SecaoM_08, Me.txtSecao_08)
        Call LimparCamposFunction(Me.Secao_09, Me.SecaoP_09, Me.SecaoM_09, Me.txtSecao_09)

        'Depto 2 - Pereciveis
        Call LimparCamposFunction(Me.Secao_11, Me.SecaoP_11, Me.SecaoM_11, Me.txtSecao_11)
        Call LimparCamposFunction(Me.Secao_12, Me.SecaoP_12, Me.SecaoM_12, Me.txtSecao_12)
        Call LimparCamposFunction(Me.Secao_13, Me.SecaoP_13, Me.SecaoM_13, Me.txtSecao_13)
        Call LimparCamposFunction(Me.Secao_14, Me.SecaoP_14, Me.SecaoM_14, Me.txtSecao_14)
        Call LimparCamposFunction(Me.Secao_15, Me.SecaoP_15, Me.SecaoM_15, Me.txtSecao_15)
        Call LimparCamposFunction(Me.Secao_16, Me.SecaoP_16, Me.SecaoM_16, Me.txtSecao_16)
        Call LimparCamposFunction(Me.Secao_17, Me.SecaoP_17, Me.SecaoM_17, Me.txtSecao_17)
        Call LimparCamposFunction(Me.Secao_18, Me.SecaoP_18, Me.SecaoM_18, Me.txtSecao_18)
        Call LimparCamposFunction(Me.Secao_19, Me.SecaoP_19, Me.SecaoM_19, Me.txtSecao_19)
        Call LimparCamposFunction(Me.Secao_21, Me.SecaoP_21, Me.SecaoM_21, Me.txtSecao_21)
        Call LimparCamposFunction(Me.Secao_22, Me.SecaoP_22, Me.SecaoM_22, Me.txtSecao_22)
        Call LimparCamposFunction(Me.Secao_23, Me.SecaoP_23, Me.SecaoM_23, Me.txtSecao_23)
        Call LimparCamposFunction(Me.Secao_25, Me.SecaoP_25, Me.SecaoM_25, Me.txtSecao_25)

        'Depto 3 - Bazar
        Call LimparCamposFunction(Me.Secao_30, Me.SecaoP_30, Me.SecaoM_30, Me.txtSecao_30)
        Call LimparCamposFunction(Me.Secao_31, Me.SecaoP_31, Me.SecaoM_31, Me.txtSecao_31)
        Call LimparCamposFunction(Me.Secao_32, Me.SecaoP_32, Me.SecaoM_32, Me.txtSecao_32)
        Call LimparCamposFunction(Me.Secao_33, Me.SecaoP_33, Me.SecaoM_33, Me.txtSecao_33)
        Call LimparCamposFunction(Me.Secao_34, Me.SecaoP_34, Me.SecaoM_34, Me.txtSecao_34)
        Call LimparCamposFunction(Me.Secao_35, Me.SecaoP_35, Me.SecaoM_35, Me.txtSecao_35)
        Call LimparCamposFunction(Me.Secao_36, Me.SecaoP_36, Me.SecaoM_36, Me.txtSecao_36)

        'Depto 4 - Textil
        Call LimparCamposFunction(Me.Secao_40, Me.SecaoP_40, Me.SecaoM_40, Me.txtSecao_40)
        Call LimparCamposFunction(Me.Secao_41, Me.SecaoP_41, Me.SecaoM_41, Me.txtSecao_41)
        Call LimparCamposFunction(Me.Secao_42, Me.SecaoP_42, Me.SecaoM_42, Me.txtSecao_42)
        Call LimparCamposFunction(Me.Secao_49, Me.SecaoP_49, Me.SecaoM_49, Me.txtSecao_49)

        'Depto 5 - Eletrodomésticos
        Call LimparCamposFunction(Me.Secao_50, Me.SecaoP_50, Me.SecaoM_50, Me.txtSecao_50)
        Call LimparCamposFunction(Me.Secao_51, Me.SecaoP_51, Me.SecaoM_51, Me.txtSecao_51)
        Call LimparCamposFunction(Me.Secao_52, Me.SecaoP_52, Me.SecaoM_52, Me.txtSecao_52)
        Call LimparCamposFunction(Me.Secao_53, Me.SecaoP_53, Me.SecaoM_53, Me.txtSecao_53)
        Call LimparCamposFunction(Me.Secao_54, Me.SecaoP_54, Me.SecaoM_54, Me.txtSecao_54)
        Call LimparCamposFunction(Me.Secao_55, Me.SecaoP_55, Me.SecaoM_55, Me.txtSecao_55)

        Call LimparCamposFunction(Me.Secao_99, Me.SecaoP_99, Me.SecaoM_99, Me.txtSecao_99)
        
    End Sub

    Private Sub BuscarVendaSecaoFunction(myVlrVenda As Label, myPercPart As Label, idSecao As Byte)
        oVEM.BuscaRevSecaoMes(1, idSecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        myVlrVenda.Text = oVEM.vlrRev.ToString("n0")
        myPercPart.Text = oVEM.percRev.ToString("n2")
    End Sub

    Sub BuscarVendaSecao()
        'Depto 1 - Mercearia
        Call BuscarVendaSecaoFunction(Me.Secao_01, Me.SecaoP_01, 1)
        Call BuscarVendaSecaoFunction(Me.Secao_02, Me.SecaoP_02, 2)
        Call BuscarVendaSecaoFunction(Me.Secao_03, Me.SecaoP_03, 3)
        Call BuscarVendaSecaoFunction(Me.Secao_04, Me.SecaoP_04, 4)
        Call BuscarVendaSecaoFunction(Me.Secao_05, Me.SecaoP_05, 5)
        Call BuscarVendaSecaoFunction(Me.Secao_06, Me.SecaoP_06, 6)
        Call BuscarVendaSecaoFunction(Me.Secao_07, Me.SecaoP_07, 7)
        Call BuscarVendaSecaoFunction(Me.Secao_08, Me.SecaoP_08, 8)
        Call BuscarVendaSecaoFunction(Me.Secao_09, Me.SecaoP_09, 9)
        
        'Depto 2 - Pereciveis
        Call BuscarVendaSecaoFunction(Me.Secao_11, Me.SecaoP_11, 11)
        Call BuscarVendaSecaoFunction(Me.Secao_12, Me.SecaoP_12, 12)
        Call BuscarVendaSecaoFunction(Me.Secao_13, Me.SecaoP_13, 13)
        Call BuscarVendaSecaoFunction(Me.Secao_14, Me.SecaoP_14, 14)
        Call BuscarVendaSecaoFunction(Me.Secao_15, Me.SecaoP_15, 15)
        Call BuscarVendaSecaoFunction(Me.Secao_16, Me.SecaoP_16, 16)
        Call BuscarVendaSecaoFunction(Me.Secao_17, Me.SecaoP_17, 17)
        Call BuscarVendaSecaoFunction(Me.Secao_18, Me.SecaoP_18, 18)
        Call BuscarVendaSecaoFunction(Me.Secao_19, Me.SecaoP_19, 19)
        Call BuscarVendaSecaoFunction(Me.Secao_21, Me.SecaoP_21, 21)
        Call BuscarVendaSecaoFunction(Me.Secao_22, Me.SecaoP_22, 22)
        Call BuscarVendaSecaoFunction(Me.Secao_23, Me.SecaoP_23, 23)
        Call BuscarVendaSecaoFunction(Me.Secao_25, Me.SecaoP_25, 25)

        'Depto 3 - Bazar
        Call BuscarVendaSecaoFunction(Me.Secao_30, Me.SecaoP_30, 30)
        Call BuscarVendaSecaoFunction(Me.Secao_31, Me.SecaoP_31, 31)
        Call BuscarVendaSecaoFunction(Me.Secao_32, Me.SecaoP_32, 32)
        Call BuscarVendaSecaoFunction(Me.Secao_33, Me.SecaoP_33, 33)
        Call BuscarVendaSecaoFunction(Me.Secao_34, Me.SecaoP_34, 34)
        Call BuscarVendaSecaoFunction(Me.Secao_35, Me.SecaoP_35, 35)
        Call BuscarVendaSecaoFunction(Me.Secao_36, Me.SecaoP_36, 36)

        'Depto 4 - Textil
        Call BuscarVendaSecaoFunction(Me.Secao_40, Me.SecaoP_40, 40)
        Call BuscarVendaSecaoFunction(Me.Secao_41, Me.SecaoP_41, 41)
        Call BuscarVendaSecaoFunction(Me.Secao_42, Me.SecaoP_42, 42)
        Call BuscarVendaSecaoFunction(Me.Secao_49, Me.SecaoP_49, 49)

        'Depto 5 - Eletrodomésticos
        Call BuscarVendaSecaoFunction(Me.Secao_50, Me.SecaoP_50, 50)
        Call BuscarVendaSecaoFunction(Me.Secao_51, Me.SecaoP_51, 51)
        Call BuscarVendaSecaoFunction(Me.Secao_52, Me.SecaoP_52, 52)
        Call BuscarVendaSecaoFunction(Me.Secao_53, Me.SecaoP_53, 53)
        Call BuscarVendaSecaoFunction(Me.Secao_54, Me.SecaoP_54, 54)
        Call BuscarVendaSecaoFunction(Me.Secao_55, Me.SecaoP_55, 55)

        Call BuscarVendaSecaoFunction(Me.Secao_99, Me.SecaoP_99, 99)

    End Sub

    Private Sub BuscarMargemSecaoFunction(myVlrMargem As Label, myPercMargem As TextBox, idSecao As Byte)
        oVEM.BuscaRevSecaoMes(2, idSecao, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        myVlrMargem.Text = oVEM.vlrRev.ToString("n0")
        myPercMargem.Text = oVEM.percRev.ToString("n2")
    End Sub

    Sub BuscarMargemSecao()
        'Depto 1 - Mercearia
        Call BuscarMargemSecaoFunction(Me.SecaoM_01, Me.txtSecao_01, 1)
        Call BuscarMargemSecaoFunction(Me.SecaoM_02, Me.txtSecao_02, 2)
        Call BuscarMargemSecaoFunction(Me.SecaoM_03, Me.txtSecao_03, 3)
        Call BuscarMargemSecaoFunction(Me.SecaoM_04, Me.txtSecao_04, 4)
        Call BuscarMargemSecaoFunction(Me.SecaoM_05, Me.txtSecao_05, 5)
        Call BuscarMargemSecaoFunction(Me.SecaoM_06, Me.txtSecao_06, 6)
        Call BuscarMargemSecaoFunction(Me.SecaoM_07, Me.txtSecao_07, 7)
        Call BuscarMargemSecaoFunction(Me.SecaoM_08, Me.txtSecao_08, 8)
        Call BuscarMargemSecaoFunction(Me.SecaoM_09, Me.txtSecao_09, 9)

        'Depto 2 - Pereciveis
        Call BuscarMargemSecaoFunction(Me.SecaoM_11, Me.txtSecao_11, 11)
        Call BuscarMargemSecaoFunction(Me.SecaoM_12, Me.txtSecao_12, 12)
        Call BuscarMargemSecaoFunction(Me.SecaoM_13, Me.txtSecao_13, 13)
        Call BuscarMargemSecaoFunction(Me.SecaoM_14, Me.txtSecao_14, 14)
        Call BuscarMargemSecaoFunction(Me.SecaoM_15, Me.txtSecao_15, 15)
        Call BuscarMargemSecaoFunction(Me.SecaoM_16, Me.txtSecao_16, 16)
        Call BuscarMargemSecaoFunction(Me.SecaoM_17, Me.txtSecao_17, 17)
        Call BuscarMargemSecaoFunction(Me.SecaoM_18, Me.txtSecao_18, 18)
        Call BuscarMargemSecaoFunction(Me.SecaoM_19, Me.txtSecao_19, 19)
        Call BuscarMargemSecaoFunction(Me.SecaoM_21, Me.txtSecao_21, 21)
        Call BuscarMargemSecaoFunction(Me.SecaoM_22, Me.txtSecao_22, 22)
        Call BuscarMargemSecaoFunction(Me.SecaoM_23, Me.txtSecao_23, 23)
        Call BuscarMargemSecaoFunction(Me.SecaoM_25, Me.txtSecao_25, 25)

        'Depto 3 - Bazar
        Call BuscarMargemSecaoFunction(Me.SecaoM_30, Me.txtSecao_30, 30)
        Call BuscarMargemSecaoFunction(Me.SecaoM_31, Me.txtSecao_31, 31)
        Call BuscarMargemSecaoFunction(Me.SecaoM_32, Me.txtSecao_32, 32)
        Call BuscarMargemSecaoFunction(Me.SecaoM_33, Me.txtSecao_33, 33)
        Call BuscarMargemSecaoFunction(Me.SecaoM_34, Me.txtSecao_34, 34)
        Call BuscarMargemSecaoFunction(Me.SecaoM_35, Me.txtSecao_35, 35)
        Call BuscarMargemSecaoFunction(Me.SecaoM_36, Me.txtSecao_36, 36)

        'Depto 4 - Textil
        Call BuscarMargemSecaoFunction(Me.SecaoM_40, Me.txtSecao_40, 40)
        Call BuscarMargemSecaoFunction(Me.SecaoM_41, Me.txtSecao_41, 41)
        Call BuscarMargemSecaoFunction(Me.SecaoM_42, Me.txtSecao_42, 42)
        Call BuscarMargemSecaoFunction(Me.SecaoM_49, Me.txtSecao_49, 49)

        'Depto 5 - Eletrodomésticos
        Call BuscarMargemSecaoFunction(Me.SecaoM_50, Me.txtSecao_50, 50)
        Call BuscarMargemSecaoFunction(Me.SecaoM_51, Me.txtSecao_51, 51)
        Call BuscarMargemSecaoFunction(Me.SecaoM_52, Me.txtSecao_52, 52)
        Call BuscarMargemSecaoFunction(Me.SecaoM_53, Me.txtSecao_53, 53)
        Call BuscarMargemSecaoFunction(Me.SecaoM_54, Me.txtSecao_54, 54)
        Call BuscarMargemSecaoFunction(Me.SecaoM_55, Me.txtSecao_55, 55)

    End Sub

    Private Sub CalcularDeptos()
        Call CalcularDeptos_Valor()
        Call CalcularDeptos_Percentual()
        Call CalcularDeptosMargem()
    End Sub

    Private Sub CalcularDeptos_Valor()

        Me.Depto_1.Text = (CDbl(Me.Secao_01.Text) + CDbl(Me.Secao_02.Text) + CDbl(Me.Secao_03.Text) + CDbl(Me.Secao_04.Text) + CDbl(Me.Secao_05.Text) + CDbl(Me.Secao_06.Text) + CDbl(Me.Secao_07.Text) + CDbl(Me.Secao_08.Text) + CDbl(Me.Secao_09.Text)).ToString("n0")
        Me.Depto_2.Text = (CDbl(Me.Secao_11.Text) + CDbl(Me.Secao_12.Text) + CDbl(Me.Secao_13.Text) + CDbl(Me.Secao_14.Text) + CDbl(Me.Secao_15.Text) + CDbl(Me.Secao_16.Text) + CDbl(Me.Secao_17.Text) + CDbl(Me.Secao_18.Text) + CDbl(Me.Secao_19.Text) + CDbl(Me.Secao_21.Text) + CDbl(Me.Secao_22.Text) + CDbl(Me.Secao_23.Text) + CDbl(Me.Secao_25.Text)).ToString("n0")
        Me.Depto_3.Text = (CDbl(Me.Secao_30.Text) + CDbl(Me.Secao_31.Text) + CDbl(Me.Secao_32.Text) + CDbl(Me.Secao_33.Text) + CDbl(Me.Secao_34.Text) + CDbl(Me.Secao_35.Text) + CDbl(Me.Secao_36.Text)).ToString("n0")
        Me.Depto_4.Text = (CDbl(Me.Secao_40.Text) + CDbl(Me.Secao_41.Text) + CDbl(Me.Secao_42.Text) + CDbl(Me.Secao_49.Text)).ToString("n0")
        Me.Depto_5.Text = (CDbl(Me.Secao_50.Text) + CDbl(Me.Secao_51.Text) + CDbl(Me.Secao_52.Text) + CDbl(Me.Secao_53.Text) + CDbl(Me.Secao_54.Text) + CDbl(Me.Secao_55.Text)).ToString("n0")
        'Total da Loja
        Me.Total_Venda.Text = (CDbl(Me.Depto_1.Text) + CDbl(Me.Depto_2.Text) + CDbl(Me.Depto_3.Text) + CDbl(Me.Depto_4.Text) + CDbl(Me.Depto_5.Text) + CDbl(Me.Secao_99.Text)).ToString("n0")

    End Sub

    Private Sub CalcularDeptos_Percentual()
        Me.DeptoP_1.Text = (CDbl(Me.SecaoP_01.Text) + CDbl(Me.SecaoP_02.Text) + CDbl(Me.SecaoP_03.Text) + CDbl(Me.SecaoP_04.Text) + CDbl(Me.SecaoP_05.Text) + CDbl(Me.SecaoP_06.Text) + CDbl(Me.SecaoP_07.Text) + CDbl(Me.SecaoP_08.Text) + CDbl(Me.SecaoP_09.Text)).ToString("n2")
        Me.DeptoP_2.Text = (CDbl(Me.SecaoP_11.Text) + CDbl(Me.SecaoP_12.Text) + CDbl(Me.SecaoP_13.Text) + CDbl(Me.SecaoP_14.Text) + CDbl(Me.SecaoP_15.Text) + CDbl(Me.SecaoP_16.Text) + CDbl(Me.SecaoP_17.Text) + CDbl(Me.SecaoP_18.Text) + CDbl(Me.SecaoP_19.Text) + CDbl(Me.SecaoP_21.Text) + CDbl(Me.SecaoP_22.Text) + CDbl(Me.SecaoP_23.Text) + CDbl(Me.SecaoP_25.Text)).ToString("n2")
        Me.DeptoP_3.Text = (CDbl(Me.SecaoP_30.Text) + CDbl(Me.SecaoP_31.Text) + CDbl(Me.SecaoP_32.Text) + CDbl(Me.SecaoP_33.Text) + CDbl(Me.SecaoP_34.Text) + CDbl(Me.SecaoP_35.Text) + CDbl(Me.SecaoP_36.Text)).ToString("n2")
        Me.DeptoP_4.Text = (CDbl(Me.SecaoP_40.Text) + CDbl(Me.SecaoP_41.Text) + CDbl(Me.SecaoP_42.Text) + CDbl(Me.SecaoP_49.Text)).ToString("n2")
        Me.DeptoP_5.Text = (CDbl(Me.SecaoP_50.Text) + CDbl(Me.SecaoP_51.Text) + CDbl(Me.SecaoP_52.Text) + CDbl(Me.SecaoP_53.Text) + CDbl(Me.SecaoP_54.Text) + CDbl(Me.SecaoP_55.Text)).ToString("n2")
        'Total da Loja
        Me.Total_VendaP.Text = (CDbl(Me.DeptoP_1.Text) + CDbl(Me.DeptoP_2.Text) + CDbl(Me.DeptoP_3.Text) + CDbl(Me.DeptoP_4.Text) + CDbl(Me.DeptoP_5.Text) + CDbl(Me.SecaoP_99.Text)).ToString("n2")
    End Sub

    Private Sub CalcularDeptosMargem()
        Call CalcularDeptosMargem_Valor()
        Call CalcularDeptosMargem_Percentual()
    End Sub

    Private Sub CalcularDeptosMargem_Valor()
        'Departamento 1
        If Me.SecaoM_01.Text.Length > 0 AndAlso
           Me.SecaoM_02.Text.Length > 0 AndAlso
           Me.SecaoM_03.Text.Length > 0 AndAlso
           Me.SecaoM_04.Text.Length > 0 AndAlso
           Me.SecaoM_05.Text.Length > 0 AndAlso
           Me.SecaoM_06.Text.Length > 0 AndAlso
           Me.SecaoM_07.Text.Length > 0 AndAlso
           Me.SecaoM_08.Text.Length > 0 AndAlso
           Me.SecaoM_09.Text.Length > 0 Then
            Me.DeptoM_1.Text = (CDbl(Me.SecaoM_01.Text) + CDbl(Me.SecaoM_02.Text) + CDbl(Me.SecaoM_03.Text) + CDbl(Me.SecaoM_04.Text) + CDbl(Me.SecaoM_05.Text) + CDbl(Me.SecaoM_06.Text) + CDbl(Me.SecaoM_07.Text) + CDbl(Me.SecaoM_08.Text) + CDbl(Me.SecaoM_09.Text)).ToString("n0")
        Else
            Me.DeptoM_1.Text = 0
        End If

        'Departamento 2
        If Me.SecaoM_11.Text.Length > 0 AndAlso
           Me.SecaoM_12.Text.Length > 0 AndAlso
           Me.SecaoM_13.Text.Length > 0 AndAlso
           Me.SecaoM_14.Text.Length > 0 AndAlso
           Me.SecaoM_15.Text.Length > 0 AndAlso
           Me.SecaoM_16.Text.Length > 0 AndAlso
           Me.SecaoM_17.Text.Length > 0 AndAlso
           Me.SecaoM_18.Text.Length > 0 AndAlso
           Me.SecaoM_19.Text.Length > 0 AndAlso
           Me.SecaoM_21.Text.Length > 0 AndAlso
           Me.SecaoM_22.Text.Length > 0 AndAlso
           Me.SecaoM_23.Text.Length > 0 AndAlso
           Me.SecaoM_25.Text.Length > 0 Then
            Me.DeptoM_2.Text = (CDbl(Me.SecaoM_11.Text) + CDbl(Me.SecaoM_12.Text) + CDbl(Me.SecaoM_13.Text) + CDbl(Me.SecaoM_14.Text) + CDbl(Me.SecaoM_15.Text) + CDbl(Me.SecaoM_16.Text) + CDbl(Me.SecaoM_17.Text) + CDbl(Me.SecaoM_18.Text) + CDbl(Me.SecaoM_19.Text) + CDbl(Me.SecaoM_21.Text) + CDbl(Me.SecaoM_22.Text) + CDbl(Me.SecaoM_23.Text) + CDbl(Me.SecaoM_25.Text)).ToString("n0")
        Else
            Me.DeptoM_2.Text = 0
        End If

        'Departamento 3
        If Me.SecaoM_30.Text.Length > 0 AndAlso
           Me.SecaoM_31.Text.Length > 0 AndAlso
           Me.SecaoM_32.Text.Length > 0 AndAlso
           Me.SecaoM_33.Text.Length > 0 AndAlso
           Me.SecaoM_34.Text.Length > 0 AndAlso
           Me.SecaoM_35.Text.Length > 0 AndAlso
           Me.SecaoM_36.Text.Length > 0 Then
            Me.DeptoM_3.Text = (CDbl(Me.SecaoM_30.Text) + CDbl(Me.SecaoM_31.Text) + CDbl(Me.SecaoM_32.Text) + CDbl(Me.SecaoM_33.Text) + CDbl(Me.SecaoM_34.Text) + CDbl(Me.SecaoM_35.Text) + CDbl(Me.SecaoM_36.Text)).ToString("n0")
        Else
            Me.DeptoM_3.Text = 0
        End If

        'Departamento 4
        If Me.SecaoM_40.Text.Length > 0 AndAlso
           Me.SecaoM_41.Text.Length > 0 AndAlso
           Me.SecaoM_42.Text.Length > 0 AndAlso
           Me.SecaoM_49.Text.Length > 0 Then
            Me.DeptoM_4.Text = (CDbl(Me.SecaoM_40.Text) + CDbl(Me.SecaoM_41.Text) + CDbl(Me.SecaoM_42.Text) + CDbl(Me.SecaoM_49.Text)).ToString("n0")
        Else
            Me.DeptoM_4.Text = 0
        End If

        'Departamento 5
        If Me.SecaoM_50.Text.Length > 0 AndAlso
           Me.SecaoM_51.Text.Length > 0 AndAlso
           Me.SecaoM_52.Text.Length > 0 AndAlso
           Me.SecaoM_53.Text.Length > 0 AndAlso
           Me.SecaoM_54.Text.Length > 0 AndAlso
           Me.SecaoM_55.Text.Length > 0 Then
            Me.DeptoM_5.Text = (CDbl(Me.SecaoM_50.Text) + CDbl(Me.SecaoM_51.Text) + CDbl(Me.SecaoM_52.Text) + CDbl(Me.SecaoM_53.Text) + CDbl(Me.SecaoM_54.Text) + CDbl(Me.SecaoM_55.Text)).ToString("n0")
        Else
            Me.DeptoM_5.Text = 0
        End If

        'Total da Loja
        Me.Total_VendaM.Text = (CDbl(Me.DeptoM_1.Text) + CDbl(Me.DeptoM_2.Text) + CDbl(Me.DeptoM_3.Text) + CDbl(Me.DeptoM_4.Text) + CDbl(Me.DeptoM_5.Text)).ToString("n0")

    End Sub

    Private Sub CalcularDeptosMargem_Percentual()
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

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            If Not IsPostBack Then
                Dim oMF As New MyFunction

                Me.cboAno.AnoInicial = 2010
                Me.cboAno.AnoFinal = Year(DateAndTime.Now()) + 1

                Me.cboFilial.Visible_cboCorporacao = False

                Me.cboAno.AutoPostBack = True
                Me.cboFilial.AutoPostBack = True
                Me.cboMes.AutoPostBack = True

                oVEM.AtualizarEstatisticaPrograma(21, User.Identity.Name)   '21 - CMV Replanejamento Margem
                Me.cboMes.CallMes = Month(Now())
                Me.cboAno.CallAno = Year(Now())
            End If

        End If
    End Sub

    Private Sub RecalcularMargemFunction(myVlrMargem As Label, myVlrVenda As Label, myPercMargem As TextBox)
        myVlrMargem.Text = ((CDbl(myVlrVenda.Text) * CDbl(myPercMargem.Text)) / 100).ToString("n2")
    End Sub

    Private Sub RecalcularMargem()
        Call RecalcularMargemFunction(Me.SecaoM_01, Me.Secao_01, Me.txtSecao_01)
        Call RecalcularMargemFunction(Me.SecaoM_02, Me.Secao_02, Me.txtSecao_02)
        Call RecalcularMargemFunction(Me.SecaoM_03, Me.Secao_03, Me.txtSecao_03)
        Call RecalcularMargemFunction(Me.SecaoM_04, Me.Secao_04, Me.txtSecao_04)
        Call RecalcularMargemFunction(Me.SecaoM_05, Me.Secao_05, Me.txtSecao_05)
        Call RecalcularMargemFunction(Me.SecaoM_06, Me.Secao_06, Me.txtSecao_06)
        Call RecalcularMargemFunction(Me.SecaoM_07, Me.Secao_07, Me.txtSecao_07)
        Call RecalcularMargemFunction(Me.SecaoM_08, Me.Secao_08, Me.txtSecao_08)
        Call RecalcularMargemFunction(Me.SecaoM_09, Me.Secao_09, Me.txtSecao_09)

        Call RecalcularMargemFunction(Me.SecaoM_11, Me.Secao_11, Me.txtSecao_11)
        Call RecalcularMargemFunction(Me.SecaoM_12, Me.Secao_12, Me.txtSecao_12)
        Call RecalcularMargemFunction(Me.SecaoM_13, Me.Secao_13, Me.txtSecao_13)
        Call RecalcularMargemFunction(Me.SecaoM_14, Me.Secao_14, Me.txtSecao_14)
        Call RecalcularMargemFunction(Me.SecaoM_15, Me.Secao_15, Me.txtSecao_15)
        Call RecalcularMargemFunction(Me.SecaoM_16, Me.Secao_16, Me.txtSecao_16)
        Call RecalcularMargemFunction(Me.SecaoM_17, Me.Secao_17, Me.txtSecao_17)
        Call RecalcularMargemFunction(Me.SecaoM_18, Me.Secao_18, Me.txtSecao_18)
        Call RecalcularMargemFunction(Me.SecaoM_19, Me.Secao_19, Me.txtSecao_19)
        Call RecalcularMargemFunction(Me.SecaoM_21, Me.Secao_21, Me.txtSecao_21)
        Call RecalcularMargemFunction(Me.SecaoM_22, Me.Secao_22, Me.txtSecao_22)
        Call RecalcularMargemFunction(Me.SecaoM_23, Me.Secao_23, Me.txtSecao_23)
        Call RecalcularMargemFunction(Me.SecaoM_25, Me.Secao_25, Me.txtSecao_25)

        Call RecalcularMargemFunction(Me.SecaoM_30, Me.Secao_30, Me.txtSecao_30)
        Call RecalcularMargemFunction(Me.SecaoM_31, Me.Secao_31, Me.txtSecao_31)
        Call RecalcularMargemFunction(Me.SecaoM_32, Me.Secao_32, Me.txtSecao_32)
        Call RecalcularMargemFunction(Me.SecaoM_33, Me.Secao_33, Me.txtSecao_33)
        Call RecalcularMargemFunction(Me.SecaoM_34, Me.Secao_34, Me.txtSecao_34)
        Call RecalcularMargemFunction(Me.SecaoM_35, Me.Secao_35, Me.txtSecao_35)
        Call RecalcularMargemFunction(Me.SecaoM_36, Me.Secao_36, Me.txtSecao_36)

        Call RecalcularMargemFunction(Me.SecaoM_40, Me.Secao_40, Me.txtSecao_40)
        Call RecalcularMargemFunction(Me.SecaoM_41, Me.Secao_41, Me.txtSecao_41)
        Call RecalcularMargemFunction(Me.SecaoM_42, Me.Secao_42, Me.txtSecao_42)
        Call RecalcularMargemFunction(Me.SecaoM_49, Me.Secao_49, Me.txtSecao_49)

        Call RecalcularMargemFunction(Me.SecaoM_50, Me.Secao_50, Me.txtSecao_50)
        Call RecalcularMargemFunction(Me.SecaoM_51, Me.Secao_51, Me.txtSecao_51)
        Call RecalcularMargemFunction(Me.SecaoM_52, Me.Secao_52, Me.txtSecao_52)
        Call RecalcularMargemFunction(Me.SecaoM_53, Me.Secao_53, Me.txtSecao_53)
        Call RecalcularMargemFunction(Me.SecaoM_54, Me.Secao_54, Me.txtSecao_54)
        Call RecalcularMargemFunction(Me.SecaoM_55, Me.Secao_55, Me.txtSecao_55)

        Call RecalcularMargemFunction(Me.SecaoM_99, Me.Secao_99, Me.txtSecao_99)

    End Sub

   

    Private Function Salvar(ByVal idSecao As String, ByVal vlr As String, ByVal perc As String) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strCon)
        Dim comando As New SqlCommand("uspInsertRevSecaoMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idTipoSecao", SqlDbType.TinyInt))
        comando.Parameters("@idTipoSecao").Value = 2    'Margem

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

        comando.Parameters.Add(New SqlParameter("@perc", SqlDbType.SmallMoney))
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
        Call Salvar(9, Me.SecaoM_09.Text, Me.txtSecao_09.Text)

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
        Call Salvar(25, Me.SecaoM_25.Text, Me.txtSecao_25.Text)

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

        Call Salvar(99, Me.SecaoM_99.Text, Me.txtSecao_99.Text)

        'Total - 255
        Call Salvar(255, Me.Total_VendaM.Text, Me.txtTotalVenda.Text)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call LiberarSalvar()
    End Sub

    Private Sub LiberarSalvar()
        oVEM.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        If oVEM.LiberaMargem = True Then
            Me.btnSalvar.Enabled = True
        Else
            Me.btnSalvar.Enabled = False
        End If
    End Sub

    Private Sub AlterarValorMargem(myVlrMargem As Label, myVlrVenda As Label, myPercMargem As TextBox, myPercMargemFocus As TextBox)
        If myPercMargem.Text.Length > 0 Then
            myVlrMargem.Text = ((CDbl(myVlrVenda.Text) * CDbl(myPercMargem.Text)) / 100).ToString("n0")
            Call CalcularDeptosMargem()
            myPercMargemFocus.Focus()
        Else
            myVlrMargem.Text = ""
        End If

    End Sub

    Protected Sub txtSecao_01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_01.TextChanged
        Call AlterarValorMargem(Me.SecaoM_01, Me.Secao_01, Me.txtSecao_01, Me.txtSecao_02)
    End Sub

    Protected Sub txtSecao_02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_02.TextChanged
        Call AlterarValorMargem(Me.SecaoM_02, Me.Secao_02, Me.txtSecao_02, Me.txtSecao_03)
    End Sub

    Protected Sub txtSecao_03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_03.TextChanged
        Call AlterarValorMargem(Me.SecaoM_03, Me.Secao_03, Me.txtSecao_03, Me.txtSecao_04)
    End Sub

    Protected Sub txtSecao_04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_04.TextChanged
        Call AlterarValorMargem(Me.SecaoM_04, Me.Secao_04, Me.txtSecao_04, Me.txtSecao_05)
    End Sub

    Protected Sub txtSecao_05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_05.TextChanged
        Call AlterarValorMargem(Me.SecaoM_05, Me.Secao_05, Me.txtSecao_05, Me.txtSecao_06)
    End Sub

    Protected Sub txtSecao_06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_06.TextChanged
        Call AlterarValorMargem(Me.SecaoM_06, Me.Secao_06, Me.txtSecao_06, Me.txtSecao_07)
    End Sub

    Protected Sub txtSecao_07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_07.TextChanged
        Call AlterarValorMargem(Me.SecaoM_07, Me.Secao_07, Me.txtSecao_07, Me.txtSecao_08)
    End Sub

    Protected Sub txtSecao_08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_08.TextChanged
        Call AlterarValorMargem(Me.SecaoM_08, Me.Secao_08, Me.txtSecao_08, Me.txtSecao_09)
    End Sub

    Protected Sub txtSecao_09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_09.TextChanged
        Call AlterarValorMargem(Me.SecaoM_09, Me.Secao_09, Me.txtSecao_09, Me.txtSecao_11)
    End Sub

    Protected Sub txtSecao_11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_11.TextChanged
        Call AlterarValorMargem(Me.SecaoM_11, Me.Secao_11, Me.txtSecao_11, Me.txtSecao_12)
    End Sub

    Protected Sub txtSecao_12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_12.TextChanged
        Call AlterarValorMargem(Me.SecaoM_12, Me.Secao_12, Me.txtSecao_12, Me.txtSecao_13)
    End Sub

    Protected Sub txtSecao_13_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_13.TextChanged
        Call AlterarValorMargem(Me.SecaoM_13, Me.Secao_13, Me.txtSecao_13, Me.txtSecao_14)
    End Sub

    Protected Sub txtSecao_14_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_14.TextChanged
        Call AlterarValorMargem(Me.SecaoM_14, Me.Secao_14, Me.txtSecao_14, Me.txtSecao_15)
    End Sub

    Protected Sub txtSecao_15_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_15.TextChanged
        Call AlterarValorMargem(Me.SecaoM_15, Me.Secao_15, Me.txtSecao_15, Me.txtSecao_16)
    End Sub

    Protected Sub txtSecao_16_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_16.TextChanged
        Call AlterarValorMargem(Me.SecaoM_16, Me.Secao_16, Me.txtSecao_16, Me.txtSecao_17)
    End Sub

    Protected Sub txtSecao_17_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_17.TextChanged
        Call AlterarValorMargem(Me.SecaoM_17, Me.Secao_17, Me.txtSecao_17, Me.txtSecao_18)
    End Sub

    Protected Sub txtSecao_18_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_18.TextChanged
        Call AlterarValorMargem(Me.SecaoM_18, Me.Secao_18, Me.txtSecao_18, Me.txtSecao_19)
    End Sub

    Protected Sub txtSecao_19_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_19.TextChanged
        Call AlterarValorMargem(Me.SecaoM_19, Me.Secao_19, Me.txtSecao_19, Me.txtSecao_21)
    End Sub

    Protected Sub txtSecao_21_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_21.TextChanged
        Call AlterarValorMargem(Me.SecaoM_21, Me.Secao_21, Me.txtSecao_21, Me.txtSecao_22)
    End Sub

    Protected Sub txtSecao_22_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_22.TextChanged
        Call AlterarValorMargem(Me.SecaoM_22, Me.Secao_22, Me.txtSecao_22, Me.txtSecao_23)
    End Sub

    Protected Sub txtSecao_23_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_23.TextChanged
        Call AlterarValorMargem(Me.SecaoM_23, Me.Secao_23, Me.txtSecao_23, Me.txtSecao_25)
    End Sub

    Protected Sub txtSecao_25_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_25.TextChanged
        Call AlterarValorMargem(Me.SecaoM_25, Me.Secao_25, Me.txtSecao_25, Me.txtSecao_30)
    End Sub

    Protected Sub txtSecao_30_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_30.TextChanged
        Call AlterarValorMargem(Me.SecaoM_30, Me.Secao_30, Me.txtSecao_30, Me.txtSecao_31)
    End Sub

    Protected Sub txtSecao_31_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_31.TextChanged
        Call AlterarValorMargem(Me.SecaoM_31, Me.Secao_31, Me.txtSecao_31, Me.txtSecao_32)
    End Sub

    Protected Sub txtSecao_32_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_32.TextChanged
        Call AlterarValorMargem(Me.SecaoM_32, Me.Secao_32, Me.txtSecao_32, Me.txtSecao_33)
    End Sub

    Protected Sub txtSecao_33_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_33.TextChanged
        Call AlterarValorMargem(Me.SecaoM_33, Me.Secao_33, Me.txtSecao_33, Me.txtSecao_34)
    End Sub

    Protected Sub txtSecao_34_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_34.TextChanged
        Call AlterarValorMargem(Me.SecaoM_34, Me.Secao_34, Me.txtSecao_34, Me.txtSecao_35)
    End Sub

    Protected Sub txtSecao_35_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_35.TextChanged
        Call AlterarValorMargem(Me.SecaoM_35, Me.Secao_35, Me.txtSecao_35, Me.txtSecao_36)
    End Sub

    Protected Sub txtSecao_36_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_36.TextChanged
        Call AlterarValorMargem(Me.SecaoM_36, Me.Secao_36, Me.txtSecao_36, Me.txtSecao_40)
    End Sub

    Protected Sub txtSecao_40_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_40.TextChanged
        Call AlterarValorMargem(Me.SecaoM_40, Me.Secao_40, Me.txtSecao_40, Me.txtSecao_41)
    End Sub

    Protected Sub txtSecao_41_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_41.TextChanged
        Call AlterarValorMargem(Me.SecaoM_41, Me.Secao_41, Me.txtSecao_41, Me.txtSecao_42)
    End Sub

    Protected Sub txtSecao_42_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_42.TextChanged
        Call AlterarValorMargem(Me.SecaoM_42, Me.Secao_42, Me.txtSecao_42, Me.txtSecao_49)
    End Sub

    Protected Sub txtSecao_49_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_49.TextChanged
        Call AlterarValorMargem(Me.SecaoM_49, Me.Secao_49, Me.txtSecao_49, Me.txtSecao_50)
    End Sub

    Protected Sub txtSecao_50_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_50.TextChanged
        Call AlterarValorMargem(Me.SecaoM_50, Me.Secao_50, Me.txtSecao_50, Me.txtSecao_51)
    End Sub

    Protected Sub txtSecao_51_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_51.TextChanged
        Call AlterarValorMargem(Me.SecaoM_51, Me.Secao_51, Me.txtSecao_51, Me.txtSecao_52)
    End Sub

    Protected Sub txtSecao_52_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_52.TextChanged
        Call AlterarValorMargem(Me.SecaoM_52, Me.Secao_52, Me.txtSecao_52, Me.txtSecao_53)
    End Sub

    Protected Sub txtSecao_53_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_53.TextChanged
        Call AlterarValorMargem(Me.SecaoM_53, Me.Secao_53, Me.txtSecao_53, Me.txtSecao_54)
    End Sub

    Protected Sub txtSecao_54_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_54.TextChanged
        Call AlterarValorMargem(Me.SecaoM_54, Me.Secao_54, Me.txtSecao_54, Me.txtSecao_55)
    End Sub

    Protected Sub txtSecao_55_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSecao_55.TextChanged
        Call AlterarValorMargem(Me.SecaoM_55, Me.Secao_55, Me.txtSecao_55, Me.txtSecao_54)
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        oVEM.BuscaRevGrupoMes(5, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.SecaoP_01.Text = oVEM.percRev
        If CDbl(Me.Total_VendaP.Text) <> 100.0 Then
            oVEM.UserMsgBox(Me, "A soma das participações da loja não fecha 100,00%!!!")
            Me.txtSecao_01.Focus()
            Exit Sub
        ElseIf CDbl(Me.txtTotalVenda.Text) <> CDbl(oVEM.percRev) Then
            oVEM.UserMsgBox(Me, "O percentual de margem não esta igual ao Replanejamento.")
            Me.txtSecao_01.Focus()
            Exit Sub
        Else
            Call Salvar()
            oVEM.UserMsgBox(Me, "As Margens foram salvas com sucesso!!!")
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 3 - Margem"
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

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call Atualizar()
            Me.cboFilial.Visible_cboCorporacao = False
            LiberarSalvar()
        End If
    End Sub
End Class
